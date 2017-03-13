package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dto.MemberDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MemberController {
	
	@SuppressWarnings("null")
	@RequestMapping(value="signup", method=RequestMethod.POST) 
	public @ResponseBody String signup(HttpServletRequest req, HttpServletResponse res, @RequestParam("groups") String groups, MemberDTO newMember) throws Exception{
		JSONObject jsonObj = new JSONObject();
		if(MemberDAO.getMembers(newMember.getMid()) != null) {
			jsonObj.put("err", "redun");
			return jsonObj.toString();
		}
		
		if(newMember.getMid().equals("")) {
			jsonObj.put("err", "mid_null");
		}
		else if(newMember.getPw().equals("")) {
			jsonObj.put("err", "pw_null");
		}
		else if(newMember.getName().equals("")) {
			jsonObj.put("err", "name_null");
		}
		else if(newMember.getEmail().equals("")) {
			jsonObj.put("err", "email_null");
		}
		else if(MemberDAO.getMembers(newMember.getMid()) == null) {
			newMember.setGroup(groups);
			MemberDAO.addMember(newMember);
			jsonObj.put("succ", "signup");
		}
		else {
			jsonObj.put("err", "fail");
		}
		return jsonObj.toString();
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="login", method=RequestMethod.POST) 
	public @ResponseBody String login(HttpServletRequest req, HttpServletResponse res, MemberDTO newMember) throws Exception{
		JSONObject jsonObj = new JSONObject();
		System.out.println(newMember.getMid());
		System.out.println(newMember.getPw());
		
		if(newMember.getMid().equals("")) {
			System.out.println("사번 입력하지 않음");
			jsonObj.put("err", "mid_null");
		}
		else if(newMember.getPw().equals("")) {
			System.out.println("비밀번호 입력하지 않음");
			jsonObj.put("err", "pw_null");
		}
		else if(MemberDAO.getMembers(newMember.getMid()) == null) {
			jsonObj.put("err", "mid_novalue");
		}
		else if(!(newMember.getPw().equals(MemberDAO.getMembers(newMember.getMid()).getPw()))) {
			jsonObj.put("err", "loginfail");
		}
		// 로그인 성공
		else {
			HttpSession s = req.getSession();
			s.setAttribute("session_mid", newMember.getMid());
			s.setAttribute("session_name", MemberDAO.getMembers(newMember.getMid()).getName());
			jsonObj.put("succ", "login");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value="logout", method=RequestMethod.POST) 
	public @ResponseBody String logout(HttpServletRequest req) throws Exception{
		JSONObject jsonObj = new JSONObject();
		HttpSession session = req.getSession();
		session.invalidate();
		session = null;
		jsonObj.put("session", "true");
		return jsonObj.toString();
	}
	
	
	@ExceptionHandler(Exception.class)
	public void exceptionProcess(Exception e){
		e.printStackTrace();
	}
}
	