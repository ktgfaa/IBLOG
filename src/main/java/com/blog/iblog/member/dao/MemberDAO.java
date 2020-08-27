package com.blog.iblog.member.dao;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.dao.DataAccessException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.blog.iblog.member.vo.AddMemberVO;
import com.blog.iblog.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}
	
	public int emailcheck(String useremail) throws DataAccessException {
		int count = 0;
		count = sqlSession.selectOne("mapper.member.emailcheck", useremail);
		return count;
	}
	
	public String emailsearch(String id) throws DataAccessException {
		String email = null;
		email = sqlSession.selectOne("mapper.member.selectEmail", id);
		return email;
	}
	
	public void EnabledUpdate(String userid) throws Exception {
		
		sqlSession.update("mapper.member.updateEnabled",userid);
	}
	
	
	public MemberVO getuserID(String id) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		MemberVO vo = sqlSession.selectOne("mapper.member.selectUserById",map);
		return vo;
	}
	
	public int idcheck(String userid) throws DataAccessException {
		int count = 0;
		count = sqlSession.selectOne("mapper.member.idcheck", userid);
		return count;
	}
	
	public String idsearch(String useremail) throws DataAccessException {
		String id = null;
		id = sqlSession.selectOne("mapper.member.idsearch", useremail);
		return id;
	}
	
	public int insertMember(AddMemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	public MemberVO loginById(MemberVO member) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById",member);
		return vo;
	}
	
	public void meminfoUpdate(MemberVO member) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", member.getUsername());
		map.put("name", member.getName());
		sqlSession.update("mapper.member.updateMember", map);
	}
	
	@Bean
	BCryptPasswordEncoder passwordEncoder() {

	    return new BCryptPasswordEncoder();
	}
	
	public void passwordUpdate(String userid,String pwd) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("pwd", pwd);
		map.put("userid", userid);
		
		sqlSession.update("mapper.member.updatePwd", map);
	}
	
	public String pwdsearch(String id) throws DataAccessException {
		String pwd = null;
		pwd = sqlSession.selectOne("mapper.member.selectPwd", id);
		return pwd;
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
		//String Rpwd = sqlSession.selectOne("mapper.member.selectPwd", userid);
		return pwd;
	}
	
	public void runblogUpdate(String runblog, String userid) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("runblog", runblog);
		map.put("id", userid);
		sqlSession.update("mapper.member.updateRunblog", map);
		
	}

	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
}
