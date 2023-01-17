package com.spring.bms.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.admin.member.Service.AdminMemberService;
import com.spring.bms.admin.member.dto.AdminDto;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public ModelAndView adminLogin() throws Exception {
		return new ModelAndView("/admin/member/adminLogin");
	}
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)
	public ResponseEntity<Object> login(AdminDto adminDto , HttpServletRequest request) throws Exception {
	
		String js = "";
	
		if (adminMemberService.adminLogin(adminDto)) {
		
			HttpSession session = request.getSession();
			session.setAttribute("memberId", adminDto.getAdminId());
			session.setAttribute("role", "admin");
			session.setMaxInactiveInterval(60 * 30);
			js = "<script>";
			js += "alert('로그인');";
			js += "location.href= '" + request.getContextPath() + "';";
			js += "</script>";
			
		} 
		else {
			
			js = "<script>";
			js += "alert('로그인 실패. 아이디와 비밀번호를 확인하세요.');";
			js += "history.go(-1)";
			js += "</script>";
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(js, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/adminMemberList" , method=RequestMethod.GET)
	public ModelAndView adminMemberList(HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/member/adminMemberList");
		
		HttpSession session = request.getSession();
		session.setAttribute("sideMenu", "adminMode");
		
		mv.addObject("memberList" , adminMemberService.getMemberList());
		
		return mv;
		
	}
	
	
	
	
}
