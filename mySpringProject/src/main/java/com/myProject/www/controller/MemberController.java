package com.myProject.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public void login() {}
	
	
	@PostMapping("login")
	public String postLogin(RedirectAttributes re,HttpServletRequest request) {
		re.addAttribute("email", request.getAttribute("email"));
		re.addAttribute("errMsg", request.getAttribute("errMsg"));
		
		return "redirect:/member/login";
	}
}
