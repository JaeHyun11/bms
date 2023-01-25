package com.spring.bms.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.goods.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GoodsDto> selectMensGoodsList(Map<String, String> goodsListMap) throws Exception {
		return sqlSession.selectList("goods.selectMensListGoods", goodsListMap);
	}
	
	@Override
	public List<GoodsDto> selectWomensGoodsList(Map<String, String> goodsListMap) throws Exception {
		return sqlSession.selectList("goods.selectWomensListGoods", goodsListMap);
	}
	
	@Override
	public GoodsDto selectOneGoods(int goodsCd) throws Exception {
		return sqlSession.selectOne("goods.selectOneGoods" , goodsCd);
	}

	@Override
	public List<GoodsDto> selectRelatedGoodsList(Map<String, Object> goodsMap) throws Exception {
		return sqlSession.selectList("goods.selectListRelatedGoods" , goodsMap);
	}

	@Override
	public List<GoodsDto> selectListSearchGoods(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("goods.selectListSearchGoods" , searchMap);
	}
	
	
	
}
