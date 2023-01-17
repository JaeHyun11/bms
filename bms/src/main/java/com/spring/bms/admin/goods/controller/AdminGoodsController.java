package com.spring.bms.admin.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.admin.goods.service.AdminGoodsService;

public class AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Autowired
	private GoodsService goodsService;
	
	private final String CURR_IMAGE_REPO_PATH = "C:\\img_repo";
	private final String SEPERATOR = "\\";
	
	@RequestMapping(value="/adminGoodsList" , method=RequestMethod.GET)
	public ModelAndView adminGoodsList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/goods/adminGoodsList");
		
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
	}
	
	@RequestMapping(value="/adminGoodsAdd" , method=RequestMethod.GET)
	public ModelAndView addNewGoods() {
		return new ModelAndView("/admin/goods/adminGoodsAdd");
	}
	
}
