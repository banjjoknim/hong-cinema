package org.gasan.dao;

import java.util.List;

import org.gasan.domain.MemberVO;
import org.gasan.domain.MovieVO;
import org.gasan.util.PagingVO;

public interface MemberDAO {
	
	//회원 목록
	public List<MemberVO> getUserList() throws Exception;

	//가입과 권한 조인
	public MemberVO read(String userid);
	
	//회원가입
	public void createMember(MemberVO vo) throws Exception;
	public void createMemberAuth(MemberVO vo) throws Exception;
	
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	
	//회원 정보 수정
	public void memberUpdate(MemberVO vo)throws Exception;
	
	
	//아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;

	
	//이메일 인증키
	public void createAuthKey(String userEmail, String authKey) throws Exception;

	//이메일 인증
	public void userAuth(String userEmail) throws Exception;
	
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//패스워드 체크
	public boolean passChk (MemberVO vo) throws Exception;
	
	//이메일 중복 체크
	public int emailChk(MemberVO vo) throws Exception;
	
	//휴대폰 번호 중복 체크
	public int phoneChk(MemberVO vo) throws Exception;

	//회원 상세보기 조회
	public MemberVO viewMember(String userid) throws Exception;
	
	//회원 정보 총 갯수
	public int countMember() throws Exception;

	//페이징 처리 회원리스트 조회
	public List<MemberVO> selectMember(PagingVO po) throws Exception;

}

