package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.operations.Mod;

import dao.BoardDAO;
import dto.BoardDTO;
import net.sf.json.JSONObject;

@Controller
public class BoardController {
	@SuppressWarnings("null")
	@RequestMapping(value="newBoard", method=RequestMethod.POST) 
	public @ResponseBody String newBoard(HttpServletRequest req, @RequestParam("category") String category, BoardDTO newBoard) throws Exception{
		JSONObject jsonObj = new JSONObject();
		if(newBoard.getCategory().equals("선택")) {
			jsonObj.put("err", "category_null");
		}
		else if(newBoard.getTitle().equals("")) {
			jsonObj.put("err", "title_null");
		}
		else if(newBoard.getContent().trim().equals("")) {
			jsonObj.put("err", "content_null");
		}
		else {
			newBoard.setCategory(category);
			boolean result = BoardDAO.addBoard(newBoard);
			if(result) {
				jsonObj.put("succ", "write");
			}
			else {
				System.out.println("Insert Error");
			}
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value="boardView", method=RequestMethod.GET) 
	public ModelAndView boardView(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(1);
		String bid = req.getParameter("bid");
		BoardDTO board = BoardDAO.getBoard(bid);
		mv.addObject("board", board);
		mv.setViewName("boardView");
		return mv;
	}
}
