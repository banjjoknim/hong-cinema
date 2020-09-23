package org.gasan.security;

import org.gasan.dao.MemberDAO;
import org.gasan.domain.CustomUser;
import org.gasan.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired})
	private MemberDAO memberDAO;

//	@Override
//	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
//		// TODO Auto-generated method stub
//		log.warn("Load User By UserName :" + userName);
//		
//		//userName means userid
//		MemberVO vo = memberDAO.read(userName);
//		
//		log.warn("queried by member mapper: " + vo);
//		
//		return vo == null ? null : new CustomUser(vo);
//	}
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		log.warn("Load User By UserName :" + userName);
		
		//userName means userid
		
		MemberVO vo = memberDAO.read(userName);
		
		
		if(vo==null) {
			log.debug("no user :::::::: AuthenticationProvider");
			throw new InternalAuthenticationServiceException("존재하지 않는 아이디입니다. 회원가입을 해주세요.");
		}
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
