package com.spring.bms.admin.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.admin.goods.dao.AdminGoodsDao;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {

	@Autowired
	private AdminGoodsDao adminGoodsDao;
	
	@Override
	public List<GoodsDto> getGoodsList() throws Exception {
		return adminGoodsDao.selectListGoods();
	}

}
