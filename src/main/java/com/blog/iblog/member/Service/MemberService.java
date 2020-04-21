package com.blog.iblog.member.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.blog.iblog.member.dao.MemberDAO;
import com.blog.iblog.member.vo.MemberVO;


@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO member) {
		return memberDAO.loginById(member);
	}
}
