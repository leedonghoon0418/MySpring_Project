package com.myProject.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myProject.www.repository.MemberDAO;
import com.myProject.www.security.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO mdao;

	@Override
	public boolean updateLastLogin(String authEmail) {
		// TODO Auto-generated method stub
		return mdao.updateLastLogin(authEmail);
	}

	@Override
	public int register(MemberVO mvo) {
		int isOk =  mdao.registerMember(mvo);
		
		
		return mdao.insertAuthInit(mvo.getEmail());
	}

	@Override
	public MemberVO getDetail(String email) {
		// TODO Auto-generated method stub
		return mdao.getDetail(email);
	}

	@Override
	public int postModify(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.postModify(mvo);
	}

	@Override
	public int postModify2(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.postModify2(mvo);
	}

	@Override
	public int remove(String email) {
		mdao.remove(email);
		
		return mdao.authRemove(email);
	}
}
