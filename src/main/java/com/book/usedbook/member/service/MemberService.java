package com.book.usedbook.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.book.usedbook.member.dto.MemberDTO;

public interface MemberService {
	public MemberDTO getUserSessionId(String sid);	// 사용자 세션아이디 불러오기
	public int userCheck(HttpServletRequest req);	// 사용자 정보 불러오고 로그인 처리
	public int register(MemberDTO dto);				// 회원가입
	public void getMember(Model model, String id);	// id로 사용자 정보 불러오기
	public void keepLogin(String sessionId, Date limitDate, String id); // 자동로그인-세션 유지
	public int checkOvr(String id);					// jquery//회원가입 시 아이디 중복체크
	public int lenCheck(String str, int len);		// jquery//아이디, 학번 길이체크
	public int modifyCheck(String pw, String id);	// 회원정보 수정-패스워드 확인
	public void modify(MemberDTO dto);				// 회원정보 수정
	public int delete(MemberDTO dto, String id);	// 회원탈퇴
	public void getMyList(Model model, String id, int num);	// 내 판매내역
}
