package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDAO;
import dto.MemberDTO;

@Controller
public class MemberController {
	
	@RequestMapping(value="signup", method=RequestMethod.POST) 
	public String signup(HttpServletRequest req, @ModelAttribute("newMember") MemberDTO newMember,
											@RequestParam("groups") String groups) throws Exception{
		//System.out.println("1");
		String url = "/index.jsp";
		if(MemberDAO.getMembers(newMember.getMid()) == null) {
			newMember.setGroup(groups);
			MemberDAO.addMember(newMember);
		}
		else {
			url = "/index.jsp?error=yes";
			System.out.println("중복됨");
		}
		return "redirect:/"+url;
	}
	
	@ExceptionHandler(Exception.class)
	public void exceptionProcess(Exception e){
		System.out.println("우선 콘솔 에러 처리" + e.getMessage()); 
	}
}
	