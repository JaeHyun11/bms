package com.spring.bms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.bms.member.dao.MemberDao;
import com.spring.bms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		if (memberDto.getEmailstsYn() == null) memberDto.setEmailstsYn("N");
		if (memberDto.getSmsstsYn() == null) memberDto.setSmsstsYn("N");
		memberDao.insertMember(memberDto);
	}

}
