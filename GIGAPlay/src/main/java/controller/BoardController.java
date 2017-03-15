package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDAO;
import dao.CommentDAO;
import dto.BoardDTO;
import dto.CommentDTO;
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
		String bid = req.getParameter("bid");
		String cid = req.getParameter("cid");
		BoardDTO board = BoardDAO.getBoard(cid, bid);
		ArrayList<CommentDTO> comments = CommentDAO.getAllComments(cid, bid);
		mv.addObject("board", board);
		mv.addObject("comments", comments);
		mv.setViewName("boardView");
		return mv;
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="commWrite", method=RequestMethod.POST) 
	public @ResponseBody String commentWrite(HttpServletRequest req, CommentDTO comm) throws Exception{
		JSONObject jsonObj = new JSONObject();
		if(comm.getContent().trim().equals("")) {
			jsonObj.put("err", "content_null");
		}
		else {
			boolean result = CommentDAO.addComment(comm);
			if(result) {
				jsonObj.put("succ", "write");
			} else {
				jsonObj.put("err", "error");
			}

		}
		return jsonObj.toString();
	}
	@SuppressWarnings("null")
	@RequestMapping(value="boardDelete", method=RequestMethod.POST) 
	public @ResponseBody String boardDelete(HttpServletRequest req, BoardDTO board) throws Exception{
		JSONObject jsonObj = new JSONObject();
		int cid = board.getCid();
		int bid = board.getBid();
		boolean result = BoardDAO.deleteBoard(cid, bid);
		if(result) {
			jsonObj.put("succ", "delete");
		} else {
			jsonObj.put("err", "error");
		}
		return jsonObj.toString();
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="commDelete", method=RequestMethod.POST) 
	public @ResponseBody String commentDelete(HttpServletRequest req, CommentDTO comm) throws Exception{
		JSONObject jsonObj = new JSONObject();
		boolean result = CommentDAO.deleteComment(comm.getCommid());
		if(result) {
			jsonObj.put("succ", "delete");
		} else {
			jsonObj.put("err", "error");
		}
		return jsonObj.toString();
	}
}
