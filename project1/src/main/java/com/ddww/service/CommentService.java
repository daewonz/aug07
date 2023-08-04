package com.ddww.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddww.dao.CommentDAO;

@Service
public class CommentService {
	@Autowired
	private CommentDAO commentDAO;

	public int commentInsert(Map<String, Object> map) {
		
		return commentDAO.commentInsert(map);
	}
}
