package com.blog.iblog.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.blog.iblog.mypage.vo.IblogInfoVO;
import com.blog.iblog.mypage.vo.Iblog_categoryVO;
import com.blog.iblog.mypage.vo.WriteInfoVO;

@Repository("mypageDAO")
public class MypageDAO {

	@Autowired
	private SqlSession sqlSession;

	public void addCategory(Iblog_categoryVO iblog_categoryVO) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", iblog_categoryVO.getId());
		for (int i = 0; i < iblog_categoryVO.getCategory_num().size(); i++) {
			map.put("category_num", iblog_categoryVO.getCategory_num().get(i));
			map.put("category_value", iblog_categoryVO.getCategory_value().get(i));
			map.put("category_kind", iblog_categoryVO.getCategory_kind().get(i));
			sqlSession.insert("mapper.mypage.insertaddCategory", map);
		}
	}

	public void addWrite(WriteInfoVO writeInfoVO) {
		sqlSession.insert("mapper.mypage.insertWrite", writeInfoVO);
	}

	public void delCategory(Iblog_categoryVO iblog_categoryVO) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", iblog_categoryVO.getId());
		for (int i = 0; i < iblog_categoryVO.getCategory_num().size(); i++) {
			map.put("category_num", iblog_categoryVO.getCategory_num().get(i));
			sqlSession.delete("mapper.mypage.delCategory", map);
		}

	}

	public void deleteWrite(WriteInfoVO writeInfoVO) {
		sqlSession.delete("mapper.mypage.delWriteB", writeInfoVO);
	}

	public void delWrite(String iblog_categoryVO, String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		System.out.println("iblog_categoryVO.getCategory_value().get(i) : " + iblog_categoryVO);
		map.put("category_value", iblog_categoryVO);
		sqlSession.delete("mapper.mypage.delWrite", map);

	}

	public IblogInfoVO iblogInfo(String id) throws DataAccessException {
		IblogInfoVO vo = sqlSession.selectOne("mapper.mypage.selectbyblog", id);
		return vo;
	}

	public IblogInfoVO iblogInfobyaddress(String blogAddress) throws DataAccessException {
		IblogInfoVO vo = sqlSession.selectOne("mapper.mypage.selectbyaddress", blogAddress);
		return vo;
	}

	public int newIblog(IblogInfoVO iblogInfoVO) {
		int result = sqlSession.insert("mapper.mypage.insertnewIblog", iblogInfoVO);
		return result;
	}

	public List<IblogInfoVO> selectbyblogcount_desc() throws DataAccessException {
		List<IblogInfoVO> vo = sqlSession.selectList("mapper.mypage.selectbyblogcount_desc");
		return vo;
	}

	public List<Map<String, String>> selectbyMainCategory(String id) throws DataAccessException {
		List<Map<String, String>> list = sqlSession.selectList("mapper.mypage.selectbyMainCategory", id);

		return list;
	}

	public List<Map<String, String>> selectbySubCategory(String id) throws DataAccessException {
		List<Map<String, String>> list = sqlSession.selectList("mapper.mypage.selectbySubCategory", id);

		return list;
	}

	public List<Map<String, String>> selectbySubCategory_write(String id, String cat_num) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("cat_num", cat_num);
		map.put("category_kind", "sub");

		List<Map<String, String>> list = sqlSession.selectList("mapper.mypage.selectbySubCategory_write", map);

		return list;
	}

	public String selectbySubCategoryNUm(Iblog_categoryVO iblog_categoryVO) {
		Map<String, String> map = new HashMap<String, String>();
		String result = "";
		map.put("id", iblog_categoryVO.getId());
		for (int i = 0; i < iblog_categoryVO.getCategory_num().size(); i++) {
			map.put("category_num", iblog_categoryVO.getCategory_num().get(i));
			result = sqlSession.selectOne("mapper.mypage.selectbySubCategoryNUm", map);
		}

		return result;
	}

	public String selectbySubCategoryNum_write(String id, String cat_value) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("cat_value", cat_value);
		String result = sqlSession.selectOne("mapper.mypage.selectbySubCategoryNum_write", map);

		return result;
	}

	public int selectbyWriteAdr(String id) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		int result = sqlSession.selectOne("mapper.mypage.selectbyWriteAdr", map);

		return result;
	}

	public List<WriteInfoVO> selectbyWriteAsc(String id) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<WriteInfoVO> result = sqlSession.selectList("mapper.mypage.selectbyWriteAsc", map);

		return result;
	}

	public int selectbyWriteCount(String id, String address) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("write_address", address);
		int result = sqlSession.selectOne("mapper.mypage.selectbyWriteCount", map);

		return result;
	}

	public List<WriteInfoVO> selectbyWriteLast(String id) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<WriteInfoVO> result = sqlSession.selectList("mapper.mypage.selectbyWriteLast", map);

		return result;
	}

	public List<WriteInfoVO> selectbyWriteTitle(String id) throws DataAccessException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<WriteInfoVO> result = sqlSession.selectList("mapper.mypage.selectbyWriteTitle", map);

		return result;
	}

	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	public void updateIblog(IblogInfoVO iblogInfoVO) {
		sqlSession.update("mapper.mypage.updateIblog", iblogInfoVO);

	}

	public void updateIblogCount(IblogInfoVO iblogInfoVO) {
		sqlSession.update("mapper.mypage.updateIblogCount", iblogInfoVO);

	}

	public void updateWrite(WriteInfoVO writeInfoVO) {
		sqlSession.update("mapper.mypage.updateWrite", writeInfoVO);
	}

	public void updateWriteCount(String id, String address, int count) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("write_address", address);
		map.put("write_count", Integer.toString(count));
		sqlSession.update("mapper.mypage.updateWriteCount", map);

	}

}
