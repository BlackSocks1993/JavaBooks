package com.mvcProject.user;

public interface userInterface {

	// 회원가입
	void insertUserInfo(MemberDTO memberDTO); 
	
	// 로그인체크
	MemberDTO loginCheck(String member_email, String member_pw); 
	
}
