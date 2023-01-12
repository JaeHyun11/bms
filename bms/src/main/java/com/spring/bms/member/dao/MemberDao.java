package com.spring.bms.member.dao;

import com.spring.bms.member.dto.MemberDto;

public interface MemberDao {

	public void insertMember(MemberDto memberDto) throws Exception;
	
}
