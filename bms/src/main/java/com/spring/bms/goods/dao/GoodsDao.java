package com.spring.bms.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.bms.goods.dto.GoodsDto;

public interface GoodsDao {

	public List<GoodsDto> selectMensGoodsList(Map<String,String> goodsListMap) throws Exception;
	public List<GoodsDto> selectWomensGoodsList(Map<String,String> goodsListMap) throws Exception;
	public GoodsDto selectOneGoods(int goodsCd) throws Exception;
	public List<GoodsDto> selectRelatedGoodsList(Map<String,Object> goodsMap) throws Exception;
	public List<GoodsDto> selectListSearchGoods(Map<String,Object> searchMap) throws Exception;
	
	
}
