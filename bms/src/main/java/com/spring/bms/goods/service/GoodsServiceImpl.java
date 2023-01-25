package com.spring.bms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.goods.dao.GoodsDao;
import com.spring.bms.goods.dto.GoodsDto;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public List<GoodsDto> getMensGoodsList(Map<String, String> goodsListMap) throws Exception {
		return goodsDao.selectMensGoodsList(goodsListMap);
	}
	
	@Override
	public List<GoodsDto> getWomensGoodsList(Map<String, String> goodsListMap) throws Exception {
		return goodsDao.selectWomensGoodsList(goodsListMap);
	}
	
	@Override
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception {
		return goodsDao.selectOneGoods(goodsCd);
	}

	@Override
	public List<GoodsDto> getRelatedGoodsList(Map<String, Object> goodsMap) throws Exception {
		return goodsDao.selectRelatedGoodsList(goodsMap);
	}

	@Override
	public List<GoodsDto> getSearchGoodsList(Map<String, Object> searchMap) throws Exception {
		return goodsDao.selectListSearchGoods(searchMap);
	}

}
