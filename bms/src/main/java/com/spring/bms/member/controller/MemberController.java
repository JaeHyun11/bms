package com.spring.bms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
			   msg += "location.href= '" + request.getContextPath() + "/';";
			   msg += "</script>";
			   
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(msg, responseHeaders, HttpStatus.OK);

	}
	
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public ModelAndView login() throws Exception {
		return new ModelAndView("/member/login");
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public ResponseEntity<Object> login(MemberDto memberDto, HttpServletRequest request) throws Exception {
		
		String msg = "";
		if (memberService.login(memberDto)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDto.getMemberId());
			session.setAttribute("role", "client");
			session.setAttribute("myOrderCnt", memberService.getMyOrderCnt(memberDto.getMemberId()));
			session.setAttribute("myCartCnt", memberService.getMyCartCnt(memberDto.getMemberId()));
			session.setMaxInactiveInterval(60*30);
			
			msg = "<script>";
			msg += "alert('로그인 완료.');";
			msg += "</script>";
			
		}
		else {
			msg = "<script>";
			msg += "alert('로그인 실패. 아이디와 비밀번호를 확인하세요');";
			msg += "history.go(-1);";
			msg += "</script>";
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; chartset=utf-8");
		
		return new ResponseEntity<Object>(msg, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String js = "<script>";
			   js += "alert('로그아웃 완료.');";
			   js += "location.href ='" + request.getContextPath() + "/';";
			   js += "</script>";
			   
		return new ResponseEntity<Object>(js , responseHeaders , HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/checkDuplicatedId" , method=RequestMethod.GET)
	public ResponseEntity<String> overlapped(@RequestParam("memberId") String memberId) throws Exception {
		return new ResponseEntity<String>(memberService.checkDuplicatedId(memberId), HttpStatus.OK);
	}
	
}
