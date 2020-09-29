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
			throw new InternalAuthenticationServiceException("입력한 아이디가 존재하지 않습니다. 아이디를 다시 한번 입력해 주세요.");
			
			  } else if(vo.isUserCertification() == false) {
			  log.debug("no user :::::::: AuthenticationProvider"); throw new
			  InternalAuthenticationServiceException("이메일 인증을 하지 않은 아이디입니다. 인증 후 이용이 가능합니다."
			  );
			  
		}
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
