package com.spring.bms.myPage.dao;

import com.spring.bms.member.dto.MemberDto;

public interface MyPageDao {

	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	
}
