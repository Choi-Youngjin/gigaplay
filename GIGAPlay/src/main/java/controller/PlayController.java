package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.ClubDAO;
import dao.MemberDAO;
import dto.ClubDTO;
import dto.MemberDTO;
import net.sf.json.JSONObject;

@Controller
public class PlayController {
	
	// 정기, 번개, 멘토 타입에 따라 그 동호회들을 얻어오는 메소드
	// 페이징도 여기서 해주기
	@RequestMapping(value="getAllPlays", method=RequestMethod.GET) 
	public ModelAndView getAllPlays(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		String type = req.getParameter("plays");
		String p = req.getParameter("pageNo");
		String category = req.getParameter("category");
		int startPage = 0;
		int endPage = 0;
		int nowPage = 0;
		int offset = 0;
		if(p == null || p.equals("") || p.equals("0")) {
			nowPage = 1;
		}
		else {
			nowPage = (Integer.parseInt(p));
			// 첫페이지가 아닐경우
			if(!p.equals("1")) {
				offset = (nowPage - 1) * 9;
			}
		}
		
		startPage = (nowPage - 1)/5 * 5 + 1;
		endPage = startPage + 4;
		
		mv.setViewName("plays");
		mv.addObject("plays", req.getParameter(type));
		
		if(type.equals("regular")) {
			type = "정기";
		} else if(type.equals("temp")) {
			type = "번개";
		} else {
			type = "멘토";
		}
		ArrayList<ClubDTO> allPlays = null;
		int playNum = 0;
		// 카테고리 아니고 전체일 경우
		if(category == null || category.equals("") || category.equals("all")) {
			allPlays = ClubDAO.getClub(type, 9, offset);
			playNum = ClubDAO.getClubNum(type);
		}
		else {
			allPlays = ClubDAO.getClubByCategory(type, category, 9, offset);
			playNum = ClubDAO.getClubNumByCategory(type, category);
			mv.addObject("category", category);
		}
		int temp = playNum/9 + 1;
		if(playNum % 9 == 0) {
			temp--;
		}
		if(endPage > temp) {
			endPage = temp;
		}
		mv.addObject("cNum", playNum);
		mv.addObject("allPlays", allPlays);
		mv.addObject("nowPage", nowPage);
		mv.addObject("endPage", endPage);
		mv.addObject("startPage", startPage);
		mv.addObject("totalPage", temp);
		System.out.println("nowPage: " + nowPage + " , startPage: " + startPage + " , endPage: " + endPage + " , totalPage: " + temp);
		return mv;
	}
	

	// 번개 등록!!!!!
	@SuppressWarnings("null")
	@RequestMapping(value="tempplay-add", method=RequestMethod.POST) 
	public @ResponseBody String tempAdd(HttpServletRequest req, HttpServletResponse res, @RequestParam("category1") String category1, @RequestParam("cgroup") String cgroup, ClubDTO newTempClub) throws Exception{
		JSONObject jsonObj = new JSONObject();
		
		if(newTempClub.getName().equals("")) {
			jsonObj.put("err", "name_null");
		}
		else {
			newTempClub.setCategory(category1);
			newTempClub.setCgroup(cgroup);
			newTempClub.setCtype("번개");
			
			switch(newTempClub.getCategory()){
			case "sports":
				newTempClub.setCategory("스포츠");
				break;
			case "art":
				newTempClub.setCategory("문화/예술");
				break;
			case "food":
				newTempClub.setCategory("요리/음식");
				break;
			case "volunteer":
				newTempClub.setCategory("봉사/나눔");
				break;
			default:
				newTempClub.setCategory("게임/레저");
				break;
			}
			
			ClubDAO.addClub(newTempClub);
			jsonObj.put("succ", "clubadd");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value="clubDetail", method=RequestMethod.GET) 
	public ModelAndView clubDetail(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		String cid = req.getParameter("cid");
		ClubDTO club = ClubDAO.getClubByCid(Integer.parseInt(cid));
		mv.addObject("club", club);
		if(req.getParameter("tab") == null) {
			mv.setViewName("clubDetail");
			mv.addObject("tab", "intro");
			return mv;
		}
		else if(req.getParameter("tab").equals("board")) {
			mv.setViewName("clubDetail");
			mv.addObject("tab", "board");
		}
		else if(req.getParameter("tab").equals("list")) {
			ArrayList<MemberDTO> member = MemberDAO.getAllMemberOfClub(Integer.parseInt(cid));
			mv.setViewName("clubDetail");
			mv.addObject("member", member);
			mv.addObject("tab", "list");
		} else {
			mv.setViewName("clubDetail");
			mv.addObject("tab", "intro");
		}
		return mv;
	}
	@ExceptionHandler(Exception.class)
	public void exceptionProcess(Exception e){
		e.printStackTrace();
	}
}
