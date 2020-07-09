package com.blog.iblog.member.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.blog.iblog.member.dao.MemberDAO;
import com.blog.iblog.member.vo.AddMemberVO;
import com.blog.iblog.member.vo.MemberVO;


@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO member) {
		return memberDAO.loginById(member);
	}
	
	public int addMember(AddMemberVO memberVO) throws DataAccessException {
		return memberDAO.insertMember(memberVO);
	}
	
	public String idsearch(String useremail) {
		return memberDAO.idsearch(useremail);
	}

	public String pwdsearch(String useremail, String userid) {
		return memberDAO.pwdsearch(useremail, userid);
	}
	
	public int idcheck(String userid) {
		return memberDAO.idcheck(userid);
	}
	
	public void enabledUpdate(String userid) throws Exception {
		
		memberDAO.EnabledUpdate(userid);
	}
	
	public void runblogUpdate(String runblog,String userid) throws Exception {
		
		memberDAO.runblogUpdate(runblog,userid);
	}


}
