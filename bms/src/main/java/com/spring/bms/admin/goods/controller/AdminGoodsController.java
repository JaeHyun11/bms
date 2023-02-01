package com.spring.bms.admin.goods.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.admin.goods.service.AdminGoodsService;
import com.spring.bms.goods.dto.GoodsDto;
import com.spring.bms.goods.service.GoodsService;


@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Autowired
	private GoodsService goodsService;
	
	private final String CURR_IMAGE_REPO_PATH = "C:\\goods_repo";
	private final String SEPERATOR = "\\";			
	
	@RequestMapping(value="/adminGoodsList" , method = RequestMethod.GET)
	public ModelAndView adminGoodsList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/goods/adminGoodsList");
		
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
		
	}

	@RequestMapping(value="/adminGoodsAdd" , method = RequestMethod.GET)
	public ModelAndView addNewGoods() {
		return new ModelAndView("/admin/goods/adminGoodsAdd");
	}
	
	
	@RequestMapping(value="/adminGoodsAdd" , method = RequestMethod.POST)
	public ResponseEntity<Object> addNewGoods(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setGoodsNm(multipartRequest.getParameter("goodsNm"));
		goodsDto.setGoodsGroup(multipartRequest.getParameter("goodsGroup"));
		goodsDto.setGoodsCategory(multipartRequest.getParameter("goodsCategory"));
		goodsDto.setGoodsColor(multipartRequest.getParameter("goodsColor"));
		goodsDto.setSort(multipartRequest.getParameter("sort"));
		goodsDto.setGoodsInfo(multipartRequest.getParameter("goodsInfo"));
		goodsDto.setGoodsDetail(multipartRequest.getParameter("goodsDetail"));
		goodsDto.setGoodsFileName(multipartRequest.getParameter("goodsFileName"));
		goodsDto.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDto.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		goodsDto.setXsStock(Integer.parseInt(multipartRequest.getParameter("xsStock")));
		goodsDto.setSmStock(Integer.parseInt(multipartRequest.getParameter("smStock")));
		goodsDto.setMdStock(Integer.parseInt(multipartRequest.getParameter("mdStock")));
		goodsDto.setLgStock(Integer.parseInt(multipartRequest.getParameter("lgStock")));
		goodsDto.setXlStock(Integer.parseInt(multipartRequest.getParameter("xlStock")));
		goodsDto.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDto.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));		
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(CURR_IMAGE_REPO_PATH + SEPERATOR + uploadFileName);	
				uploadFile.transferTo(f); 
				goodsDto.setGoodsFileName(uploadFileName);
			}
		
		}
		
		adminGoodsService.addNewGoods(goodsDto);
		
		String js= "<script>";
			   js += "alert('상품을 등록하였습니다.');";
			   js += "location.href='adminGoodsList';";
			   js += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(js, responseHeaders, HttpStatus.OK);
		
	}

	
	@RequestMapping(value="/adminGoodsModify" , method=RequestMethod.GET)
	public ModelAndView modifyGoods(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/goods/adminGoodsModify");
		mv.addObject("goodsDto" , goodsService.getGoodsDetail(goodsCd));
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/adminGoodsModify" , method=RequestMethod.POST)
	public ResponseEntity<Object> adminGoodsModify(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setGoodsCd(Integer.parseInt(multipartRequest.getParameter("goodsCd")));
		goodsDto.setGoodsNm(multipartRequest.getParameter("goodsNm"));
		goodsDto.setGoodsGroup(multipartRequest.getParameter("goodsGroup"));
		goodsDto.setGoodsCategory(multipartRequest.getParameter("goodsCategory"));
		goodsDto.setGoodsColor(multipartRequest.getParameter("goodsColor"));
		goodsDto.setSort(multipartRequest.getParameter("sort"));
		goodsDto.setGoodsInfo(multipartRequest.getParameter("goodsInfo"));
		goodsDto.setGoodsDetail(multipartRequest.getParameter("goodsDetail"));
		goodsDto.setGoodsFileName(multipartRequest.getParameter("goodsFileName"));
		goodsDto.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDto.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		goodsDto.setXsStock(Integer.parseInt(multipartRequest.getParameter("xsStock")));
		goodsDto.setSmStock(Integer.parseInt(multipartRequest.getParameter("smStock")));
		goodsDto.setMdStock(Integer.parseInt(multipartRequest.getParameter("mdStock")));
		goodsDto.setLgStock(Integer.parseInt(multipartRequest.getParameter("lgStock")));
		goodsDto.setXlStock(Integer.parseInt(multipartRequest.getParameter("xlStock")));
		goodsDto.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDto.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(CURR_IMAGE_REPO_PATH + SEPERATOR + uploadFileName);	
				uploadFile.transferTo(f); 
				goodsDto.setGoodsFileName(uploadFileName);
				
				new File(CURR_IMAGE_REPO_PATH + SEPERATOR + goodsService.getGoodsDetail(Integer.parseInt(multipartRequest.getParameter("goodsCd"))).getGoodsFileName()).delete();
				
			}
		
		}
		
		adminGoodsService.modifyGoods(goodsDto);
		String js = "<script>";
			   js += " alert('상품정보를 수정하였습니다.');";
			   js +=" location.href='adminGoodsList';";
			   js +="</script>";
			   
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(js, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@RequestMapping(value="/adminGoodsRemove" , method=RequestMethod.GET)
	public ResponseEntity<Object> adminGoodsRemove(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		new File(CURR_IMAGE_REPO_PATH + SEPERATOR + goodsService.getGoodsDetail(goodsCd).getGoodsFileName()).delete();
		adminGoodsService.removeGoods(goodsCd);
		
		String jsScript= "<script>";
			   jsScript += " alert('등록된 상품을 삭제하였습니다.');";
			   jsScript +=" location.href='adminGoodsList';";
			   jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);

	}
}
