package org.gasan.service;

import java.util.List;

import org.gasan.domain.MemberVO;
import org.gasan.domain.MovieVO;
import org.gasan.util.PagingVO;

public interface CommonService {

	public List<MemberVO> getUserList() throws Exception;
	
	public MemberVO read(String userid);

	//회원가입
	public void customSignup(MemberVO vo) throws Exception;
	
	//회원정보수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//아이디 체크
	public int idChk(MemberVO vo) throws Exception;
	
	//이메일 유저 인증
	public void userAuth(String userEmail) throws Exception;
	
	//패스워드 체크
	public boolean passChk(MemberVO vo) throws Exception;

	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//이메일 중복체크
	public int emailChk(MemberVO vo) throws Exception;
	
	//휴대폰 번호 중복체크
	public int phoneChk(MemberVO vo) throws Exception;
	
	//회원 상세보기 조회
	public MemberVO viewMember(String userid) throws Exception;
	
	//회원 정보 총 갯수
	public int countMember() throws Exception;

	//페이징 처리 회원리스트 조회
	public List<MemberVO> selectMember(PagingVO po) throws Exception;
}
