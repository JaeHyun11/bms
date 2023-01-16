package com.spring.bms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.spring.bms.member.dto.MemberDto;

public interface MyPageDao {

	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public void deleteCartListByRemoveMember(String memberId) throws Exception;
	public void deleteOrderListByRemoveMember(String memberId) throws Exception;
	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception;
	
	
}
