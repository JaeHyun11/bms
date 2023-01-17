package com.spring.bms.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@RequestMapping(value="/mensGoodsList" , method=RequestMethod.GET)
	public String mensGoodsList() throws Exception {
		
		return "/goods/mensGoodsList";
		
	
	}
	@RequestMapping(value="/womensGoodsList" , method=RequestMethod.GET)
	public String womensGoodsList() throws Exception {
		
		return "/goods/womensGoodsList";
		
	
	}
}
