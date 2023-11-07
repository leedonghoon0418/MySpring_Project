package com.myProject.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myProject.www.security.MemberVO;
import com.myProject.www.service.MemberService;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/**")
@Slf4j
public class MemberController {
	
	@Inject
	private BCryptPasswordEncoder bcEncoder;

	@Inject
	private MemberService msv;
	
	@GetMapping("register")
	public String signUp() {
		
		return "/member/register";
	}
	
	
	@PostMapping("register")
	public String signUp(MemberVO mvo) {
		mvo.setPwd(bcEncoder.encode(mvo.getPwd()));
		int isOk = msv.register(mvo);
		
		return "index";
	}
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
	
	
	@PostMapping("login")
	public String postLogin(RedirectAttributes re,HttpServletRequest request) {
		re.addAttribute("email", request.getAttribute("email"));
		re.addAttribute("errMsg", request.getAttribute("errMsg"));
		
		return "redirect:/member/login";
	}
	
	@GetMapping("detail")
	public String memberDetail(@RequestParam("email") String email, Model m) {
		MemberVO mvo = msv.getDetail(email);
		m.addAttribute("mvo",mvo);
		
		return "/member/detail";
	}
	@GetMapping("modify")
	public String memberModify(@RequestParam("email") String email, Model m) {
		MemberVO mvo = msv.getDetail(email);
		m.addAttribute("mvo",mvo);
		
		return "/member/modify";
	}
	@PostMapping("modify")
	public String postModify(MemberVO mvo, HttpServletRequest request, HttpServletResponse response) {
		if(mvo.getPwd() == null || mvo.getPwd().equals("")) {
			int isOk = msv.postModify(mvo);
			return "index";
		}else {
			mvo.setPwd(bcEncoder.encode(mvo.getPwd()));
			int isOk2 = msv.postModify2(mvo);
			return "index";
		}
	}
	@GetMapping("remove")
	public String removeMember(@RequestParam("email") String email , HttpServletRequest request, HttpServletResponse response) {
		int isOk = msv.remove(email);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        new SecurityContextLogoutHandler().logout(request, response, auth);
		
		return "index";
	}
	
}
