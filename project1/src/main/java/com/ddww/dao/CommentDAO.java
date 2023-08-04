package com.ddww.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
@Autowired
private SqlSession sqlsession;

public int commentInsert(Map<String, Object> map) {
	
	return sqlsession.insert("comment.commentInsert", map);
}
}
