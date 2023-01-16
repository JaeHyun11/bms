package com.spring.bms.admin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.admin.member.Service.AdminMemberService;

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
	

	
}
