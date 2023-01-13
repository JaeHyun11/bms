package com.spring.bms.myPage.service;

import com.spring.bms.member.dto.MemberDto;

public interface MyPageService {

	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	
}
