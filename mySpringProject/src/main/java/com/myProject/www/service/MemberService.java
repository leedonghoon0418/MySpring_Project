package com.myProject.www.service;

import com.myProject.www.security.MemberVO;

public interface MemberService {

	boolean updateLastLogin(String authEmail);

	int register(MemberVO mvo);

	MemberVO getDetail(String email);

	int postModify(MemberVO mvo);

	int postModify2(MemberVO mvo);

	int remove(String email);

}
