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
		String type = req.getParameter("ctype");
		String p = req.getParameter("pageNo");
		int startPage = 0;
		int endPage = 0;
		int nowPage = 0;
		int offset = 0;
		
		if(p == null || p.equals("")) {
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
		
		ArrayList<ClubDTO> allPlays = ClubDAO.getClub(type, offset);
		mv.addObject("cNum", allPlays.size());
		mv.addObject("allPlays", allPlays);
		mv.addObject("pNo", nowPage);
			
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	public void exceptionProcess(Exception e){
		e.printStackTrace();
	}
}
