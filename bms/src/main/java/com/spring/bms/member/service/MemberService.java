package com.spring.bms.member.service;

import com.spring.bms.member.dto.MemberDto;

public interface MemberService {

	public void addMember(MemberDto memberDto) throws Exception;
	public boolean login(MemberDto memberDto) throws Exception;
	public int getMyOrderCnt(String memberId) throws Exception;
	public int getMyCartCnt(String memberId) throws Exception;
	public String checkDuplicatedId(String memberId) throws Exception;
}
