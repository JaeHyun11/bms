package com.spring.bms.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.bms.goods.dto.GoodsDto;
import com.spring.bms.member.dto.MemberDto;
import com.spring.bms.order.dao.OrderDao;
import com.spring.bms.order.dto.OrderDto;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public MemberDto getOrdererDetail(String memberId) throws Exception {
		return orderDao.selectOneOrderer(memberId);
	}

	@Override
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception {
		return orderDao.selectOneCartGoods(goodsCd);
	}

	@Override
	public void addOrder(OrderDto orderDto, int point) throws Exception {
		
		Map<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("point", point);
		orderMap.put("orderGoodsQty", orderDto.getXsOrderGoodsQty());
		orderMap.put("orderGoodsQty", orderDto.getSmOrderGoodsQty());
		orderMap.put("orderGoodsQty", orderDto.getMdOrderGoodsQty());
		orderMap.put("orderGoodsQty", orderDto.getLgOrderGoodsQty());
		orderMap.put("orderGoodsQty", orderDto.getXlOrderGoodsQty());
		orderMap.put("goodsCd", orderDto.getGoodsCd());
		orderMap.put("memberId", orderDto.getMemberId());
		
		orderDao.updateGoodsStockCnt(orderMap);
		orderDao.updateMemberPoint(orderMap);
		orderDao.insertOrder(orderDto);
		
	}

	@Override
	public List<GoodsDto> getGoodsListByCart(int[] goodsCdList) throws Exception {
		return orderDao.selectListCartGoods(goodsCdList);
	}

	@Override
	@Transactional
	public void addOrderByCart(Map<String, String> orderListMap) throws Exception {
		
		List<OrderDto> orderList = new ArrayList<OrderDto>();
		
		String[] temp1 = orderListMap.get("goodsCdList").split(","); 
		int[] goodsCdList = new int[temp1.length];
		for (int i = 0; i < temp1.length; i++) {
			goodsCdList[i] = Integer.parseInt(temp1[i]);
		}
		
		String[] temp2 = orderListMap.get("orderGoodsQtyList").split(",");
		int[] orderGoodsQtyList = new int[temp2.length];
		for (int i = 0; i < temp2.length; i++) {
			orderGoodsQtyList[i] = Integer.parseInt(temp2[i]);
		}
		
		String[] temp3 = orderListMap.get("paymentAmtList").split(",");
		int[] paymentAmtList = new int[temp3.length];
		for (int i = 0; i < temp3.length; i++) {
			paymentAmtList[i] = Integer.parseInt(temp3[i]);
		}
		
		
		
		
		
	}

}
