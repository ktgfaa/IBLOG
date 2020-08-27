package com.blog.iblog.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.blog.iblog.mypage.dao.MypageDAO;
import com.blog.iblog.mypage.vo.IblogInfoVO;
import com.blog.iblog.mypage.vo.Iblog_categoryVO;
import com.blog.iblog.mypage.vo.WriteInfoVO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageService {

	@Autowired
	MypageDAO mypageDAO;

	public void addCategory(Iblog_categoryVO iblog_categoryVO) throws Exception {

		mypageDAO.addCategory(iblog_categoryVO);
	}
	
	public void addWrite(WriteInfoVO writeInfoVO) throws Exception {

		mypageDAO.addWrite(writeInfoVO);
	}
	
	public void delCategory(Iblog_categoryVO iblog_categoryVO) throws Exception {
		mypageDAO.delCategory(iblog_categoryVO);
		
	}

	public void deleteWrite(WriteInfoVO writeInfoVO) {
		mypageDAO.deleteWrite(writeInfoVO);
	}
	
	public void delWrite(String iblog_categoryVO,String id) throws Exception {
		mypageDAO.delWrite(iblog_categoryVO,id);
		
	}
	
	public int newIblog(IblogInfoVO iblogInfoVO) throws Exception {

		return mypageDAO.newIblog(iblogInfoVO);
	}
	
	public void updateIblog(IblogInfoVO iblogInfoVO) throws Exception {
		
		mypageDAO.updateIblog(iblogInfoVO);
	}

	public void updateWrite(WriteInfoVO writeInfoVO) throws Exception {
		
		mypageDAO.updateWrite(writeInfoVO);
	}
}
