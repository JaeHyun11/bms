package com.spring.bms.admin.member.Service;

import java.util.List;

import com.spring.bms.admin.member.dto.AdminDto;
import com.spring.bms.member.dto.MemberDto;

public interface AdminMemberService {

	public boolean adminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> getMemberList() throws Exception;
}
