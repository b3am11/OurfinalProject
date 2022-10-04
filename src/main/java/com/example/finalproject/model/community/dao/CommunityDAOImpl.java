package com.example.finalproject.model.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.community.dto.CommunityDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CommunityDTO> listPost(int start, int end) {
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("community.post_list", map);
	}
	
	@Override
	public void create(CommunityDTO dto) {
		sqlSession.insert("community.insert", dto);
	}

	@Override
	public void update(CommunityDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int comm_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int comm_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int comm_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void increaseViewcnt(int comm_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public CommunityDTO detailPost(int comm_no) {
		return sqlSession.selectOne("community.detail_post", comm_no);
	}

	@Override
	public int countArticle() {
		return sqlSession.selectOne("community.countArticle");
	}

	@Override
	public List<CommunityDTO> myCmmList(String userId) {
		return sqlSession.selectList("community.myCmmList",userId);
	}

	

}
