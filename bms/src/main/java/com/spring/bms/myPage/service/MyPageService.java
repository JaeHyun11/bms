package com.spring.bms.myPage.service;

import java.util.List;
import java.util.Map;

import com.spring.bms.member.dto.MemberDto;

public interface MyPageService {

	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	public void removeMember(String memberId) throws Exception;
	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception;
	
	
}
