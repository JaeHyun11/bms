package com.spring.bms.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.member.dto.MemberDto;
import com.spring.bms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public ModelAndView register() throws Exception {
		return new ModelAndView("/member/register");
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public ResponseEntity<Object> register(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		memberDto.setPasswd(bCryptPasswordEncoder.encode(memberDto.getPasswd()));
		
		memberService.addMember(memberDto);
		
		String msg = "<script>";
			   msg += "alert('회원가입 완료.');";
			   msg += "location.href= '" + request.getContextPath() + "';";
			   msg += "</script>";
			   
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(msg, responseHeaders, HttpStatus.OK);

	}
	
	
	
}
