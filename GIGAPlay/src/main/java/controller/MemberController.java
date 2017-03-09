package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public @ResponseBody String signup(HttpServletRequest req, HttpServletResponse res, MemberDTO newMember) throws Exception{
		JSONObject jsonObj = new JSONObject();
		System.out.println(newMember.getMid());
		System.out.println(newMember.getPw());
		System.out.println("11");
		if(newMember.getMid().equals("")) {
			System.out.println("13");
			jsonObj.put("err", "mid_null");
			return jsonObj.toString();
		}
		if(newMember.getPw().equals("")) {
			System.out.println("22");
			jsonObj.put("err", "pw_null");
			return jsonObj.toString();
		}
		if(newMember.getName().equals("")) {
			jsonObj.put("err", "name_null");
			return jsonObj.toString();
		}
		if(MemberDAO.getMembers(newMember.getMid()) == null) {
			//MemberDAO.addMember(newMember);
		}
		else {
		
		}
		return jsonObj.toString();
	}
	
	@ExceptionHandler(Exception.class)
	public void exceptionProcess(Exception e){
		e.printStackTrace();
	}
}
	