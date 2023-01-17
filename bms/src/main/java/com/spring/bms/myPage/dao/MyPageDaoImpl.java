package com.spring.bms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.member.dto.MemberDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto selectOneMyInfo(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyInfo" , memberId);
	}

	@Override
	public void updateMyInfo(MemberDto memberDto) throws Exception {
		sqlSession.update("myPage.updateMyInfo" , memberDto);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteMember", memberId);
	}

	@Override
	public void deleteCartListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteCartListByRemoveMember" , memberId);
	}

	@Override
	public void deleteOrderListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteOrderListByRemoveMember" , memberId);
	}

	@Override
	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyOrder", memberId);
	}

	@Override
	public Map<String, Object> selectOneMyOrder(Map<String, Object> orderDetailMap) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyOrder" , orderDetailMap);
	}
	
	
	
}
