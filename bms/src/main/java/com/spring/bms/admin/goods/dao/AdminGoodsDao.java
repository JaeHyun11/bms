package com.spring.bms.admin.goods.dao;

import java.util.List;

public interface AdminGoodsDao {

	public List<GoodsDto>selectListGoods() throws Exception;
	
}
