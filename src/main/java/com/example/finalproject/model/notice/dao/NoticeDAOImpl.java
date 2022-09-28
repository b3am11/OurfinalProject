package com.example.finalproject.model.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(NoticeDTO dto) throws Exception {
		sqlSession.insert("notice.insert", dto);

	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
			sqlSession.update("notice.update", dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<NoticeDTO> listAll(int start, int end) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("notice.listAll", map);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("notice.increaseViewcnt", bno);

	}

	@Override
	public int countArticle() throws Exception {
		return sqlSession.selectOne("notice.countArticle");
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		return sqlSession.selectOne("notice.read", bno);
	}

}
