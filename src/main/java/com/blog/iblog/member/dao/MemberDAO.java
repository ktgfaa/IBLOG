package com.blog.iblog.member.dao;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.blog.iblog.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public MemberVO loginById(MemberVO member) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById",member);
		return vo;
	}
	
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	public String idsearch(String useremail) throws DataAccessException {
		String email = null;
		email = sqlSession.selectOne("mapper.member.idsearch", useremail);
		return email;
	}

	public String pwdsearch(String useremail, String userid) throws DataAccessException {
		String pwd = "";

			Random rnd = new Random();
			
			for(int i =0 ; i<8;i++) {
			String randompwd = String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
			pwd += randompwd;
		}
			Map<String,String> map = new HashMap<String,String>();
			map.put("pwd", pwd);
			map.put("userid", userid);
			
		sqlSession.update("mapper.member.updatePwd", map);
		String Rpwd = sqlSession.selectOne("mapper.member.selectPwd", userid);
		return Rpwd;
	}
	
	public int idcheck(String userid) throws DataAccessException {
		int count = 0;
		count = sqlSession.selectOne("mapper.member.idcheck", userid);
		return count;
	}
	
	public int emailcheck(String useremail) throws DataAccessException {
		int count = 0;
		count = sqlSession.selectOne("mapper.member.emailcheck", useremail);
		return count;
	}
}
