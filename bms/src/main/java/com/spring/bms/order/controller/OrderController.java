package com.spring.bms.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.member.service.MemberService;
import com.spring.bms.order.dto.OrderDto;
import com.spring.bms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/orderGoods", method=RequestMethod.GET)				// 종류(xsstock,s,m)					수량(1,3)
	public ModelAndView orderGoods(@RequestParam("goodsCd") int goodsCd , @RequestParam("sizeStock") String sizeStock, @RequestParam("orderGoodsQty") int orderGoodsQty,
									HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/order/orderGoods");
		
		HttpSession session = request.getSession();
		
		mv.addObject("orderer" , orderService.getOrdererDetail((String)session.getAttribute("memberId")));  // service로
		mv.addObject("goodsDto" , orderService.getGoodsDetail(goodsCd));
		mv.addObject("orderGoodsQty" , orderGoodsQty);
		mv.addObject("sizeStock" , sizeStock);
		
		return mv;
	}
	
	@RequestMapping(value="/orderGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> orderGoods(OrderDto orderDto, @RequestParam("point") int point , HttpServletRequest request) throws Exception {
		
		orderService.addOrder(orderDto, point);
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt", memberService.getMyOrderCnt(orderDto.getMemberId()));
		
		String js = "<script>";
			   js += "alert('상품 주문 완료');";
			   js += "location.href='" + request.getContextPath() + "/goods/goodsDetail?goodsCd=" + orderDto.getGoodsCd() +"';";
			   js += "</script>";
			   
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(js , responseHeaders, HttpStatus.OK);
		
	}
	
	
	
}
