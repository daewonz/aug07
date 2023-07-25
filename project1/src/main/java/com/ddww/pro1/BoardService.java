package com.ddww.pro1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {
	
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	@Autowired
	private Util util;
	
	//보드 리스트 불러오는 메소드
	public List<BoardDTO> boardList(){
		return boardDAO.boardList();
	}
	
	public BoardDTO deatil(BoardDTO dto2) {
		//좋아요 수 +1하기 기능을 넣어주겠습니다.
		boardDAO.likeUp(dto2);  //bno 값을 가져오기 위해 dto2를 넣어주었습니다.
		
		
		
		BoardDTO dto = boardDAO.detail(dto2);
		//System.out.println(dto);
		//System.out.println(dto.getBno());
		//System.out.println(dto.getBip());
		if(dto != null) {//내 글이 아닐 때는 null이 들어옵니다. 즉 null 이 아닐때라고 검사해주세요.
			
			if(dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
				
				String sip[] = dto.getBip().split("\\.");
				String sip2 = sip[1].substring(0, sip[1].length()-1);
				sip2 = sip2.replace(sip2, "♡");
				sip[1] = sip2;
				sip2 = String.join(".", sip);
				dto.setBip(sip2);
			}
		}
		return dto;
		
	}

	public void write(BoardDTO dto) {
		
		String btitle = dto.getBtitle();
		//btitle을 꺼내줍니다.
		dto.setBtitle(util.exchange(btitle));
		//값을 변경하겠습니다. replace() <-> &lt; 랑 &gt;로 바꿔줍니다.
		dto.setBip(util.getIp()); //얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.
		
		//다시 저장해줍니다.
		boardDAO.write(dto);//실행만 시키고 결과를 받지 않습니다.
		//select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다.
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
		
	}

	public void edit(BoardDTO dto) {

		boardDAO.edit(dto);
	}

}
