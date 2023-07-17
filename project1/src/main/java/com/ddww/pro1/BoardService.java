package com.ddww.pro1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {
	
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	//보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		return boardDAO.boardList();
	}

	public BoardDTO deatil(String bno) {
		return boardDAO.detail(bno);
	}

}
