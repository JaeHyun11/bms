package com.spring.bms.goods.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.goods.dto.GoodsDto;
import com.spring.bms.goods.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="/mensGoodsList" , method=RequestMethod.GET)
	public ModelAndView mensGoodsList(@RequestParam Map<String,String> goodsListMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/mensGoodsList");
		mv.addObject("mensGoodsList", goodsService.getMensGoodsList(goodsListMap));
		
		return mv;
	
	}
	
	@RequestMapping(value="/womensGoodsList" , method=RequestMethod.GET)
	public ModelAndView womensGoodsList(@RequestParam Map<String,String> goodsListMap) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/womensGoodsList");
		mv.addObject("womensGoodsList", goodsService.getWomensGoodsList(goodsListMap));
		mv.addObject("goodsGroup", "womens");
		
		return mv;
	
	}
	
	@RequestMapping(value="/goodsDetail" , method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		GoodsDto goodsDto = goodsService.getGoodsDetail(goodsCd);
		
		mv.setViewName("/goods/goodsDetail");
		mv.addObject("goodsDto" , goodsDto);

		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("sort" , goodsDto.getSort());
		goodsMap.put("goodsCd" , goodsCd);
		
		mv.addObject("relatedGoodsList" , goodsService.getRelatedGoodsList(goodsMap));
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/searchGoods" , method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam Map<String,Object> searchMap)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsList");
		mv.addObject("goodsList" , goodsService.getSearchGoodsList(searchMap));
		
		return mv;
		
	}
	
}
