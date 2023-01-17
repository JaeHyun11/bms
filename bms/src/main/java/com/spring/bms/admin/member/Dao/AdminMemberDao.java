package com.spring.bms.admin.member.Dao;

import java.util.List;

import com.spring.bms.admin.member.dto.AdminDto;
import com.spring.bms.member.dto.MemberDto;

public interface AdminMemberDao {

	public AdminDto selectAdminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> selectListMember() throws Exception;
	
}
