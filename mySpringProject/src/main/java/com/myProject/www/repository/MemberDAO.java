package com.myProject.www.repository;

import java.util.List;

import com.myProject.www.security.AuthVO;
import com.myProject.www.security.MemberVO;

public interface MemberDAO {

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	boolean updateLastLogin(String authEmail);

	int registerMember(MemberVO mvo);

	int insertAuthInit(String email);

	MemberVO getDetail(String email);

	int postModify(MemberVO mvo);

	int postModify2(MemberVO mvo);

	void remove(String email);

	int authRemove(String email);

}
