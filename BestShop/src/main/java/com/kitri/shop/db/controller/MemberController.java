package com.kitri.shop.db.controller;

import java.security.Principal;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.MemberRole;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.MemberRepository;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	MemberRepository memRepo;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String viewJoin(Model model) throws Exception{
		return "join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String singinComplete(@ModelAttribute Member member) throws Exception {
		MemberRole role = new MemberRole();
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		role.setRoleName("BASIC");
		member.setRoles(Arrays.asList(role));
		memRepo.save(member);
		return "redirect:/";
	}
		
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLoginForm(HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		req.getSession().setAttribute("prevPage", referer);
		return "login";
	}
    
    @RequestMapping(value="/loginFail", method=RequestMethod.GET)
	public String loginFail() {
		return "loginFail";
	}
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
    	return "logout";
	}
    
    @RequestMapping(value="/denied", method=RequestMethod.GET)
    public String accessDenied() {
    	return "accessDenied";
    }
    
    @RequestMapping("/mypage")
	public String myPage(){
		return "mypage";
	}
    
    @RequestMapping(value = "/selfuseredit", method = RequestMethod.GET)
	public String selfUserEdit(@AuthenticationPrincipal SecurityMember secMember, Model model) {
    	Member member = memRepo.findById(secMember.getUsername()).get();
    	model.addAttribute("member", member);
		return "selfuseredit";
	}
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
	public String selfUserEditComplete(@ModelAttribute @Valid Member member) throws Exception{
    	
    	System.out.println("hello=======================================================");
    	System.out.println(member.getId());
    	member.setPwd(passwordEncoder.encode(member.getPwd()));
    	memRepo.updateMember(member);
		return "redirect:/user/mypage";
	}
}

