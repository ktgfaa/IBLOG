package com.blog.iblog.member.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.blog.iblog.member.controller.MemberController;
import com.blog.iblog.member.dao.MemberDAO;
import com.blog.iblog.member.vo.MemberVO;

public class UserDetailsServiceImp implements UserDetailsService {
    private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImp.class);
    @Autowired
    private MemberDAO memberDAO;
    
    private PasswordEncoder passwordEncoder;
 
    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		System.out.println("----------------- userDetail 실행 --------------");
		logger.info("loadUserByUsername()");
    	//BCryptPasswordEncoder encoder = passwordEncoder();
    	try {
			setUp();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	MemberVO memberVO = memberDAO.getuserID(id);
        if(memberVO==null) {
            throw new UsernameNotFoundException(id);
        }
        return new org.springframework.security.core.userdetails.User(memberVO.getUsername(),passwordEncoder.encode(memberVO.getPassword()),memberVO.getAuthorities());
    }

	public void setUp() throws Exception {
    	 passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
	 

}

