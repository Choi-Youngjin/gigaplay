package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ClubDAO;
import dto.ClubDTO;

@Controller
public class PlayController {
	
	// 정기, 번개, 멘토 타입에 따라 그 동호회들을 얻어오는 메소드
	// 페이징도 여기서 해주기
	@RequestMapping(value="getAllPlays", method=RequestMethod.GET) 
	public ModelAndView getAllPlays(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		String type = req.getParameter("plays");
		String p = req.getParameter("pageNo");
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
		ArrayList<ClubDTO> allPlays = ClubDAO.getClub(type, offset);
		int playNum = ClubDAO.getClubNum(type);
		int temp = playNum/9 + 1;
		if(playNum%9 == 0) {
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
	
	@ExceptionHandler(Exception.class)
	public void exceptionProcess(Exception e){
		e.printStackTrace();
	}
}
