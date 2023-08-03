package com.ddww.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddww.dto.JoinDTO;
import com.ddww.dto.LoginDTO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("login.login", dto);
	}

	public int join(JoinDTO joinDTO) {
		return sqlSession.insert("login.join", joinDTO);
	}

	public List<JoinDTO> members() {
		return sqlSession.selectList("login.members");
	}

	public int checkID(String id) {
		
		return sqlSession.selectOne("login.checkID",id);
	}

	public List<Map<String, Object>> boardlist2(int i) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("login.boardList2", i);
	}

	public int totalCount() {
		return sqlSession.selectOne("login.totalCount");
	}
	
	
}
