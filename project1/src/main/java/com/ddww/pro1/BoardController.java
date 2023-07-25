package com.ddww.pro1;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	// user -> Controller -> Service -> DAO -> mybatis -> DB

	// Autowired 말고 Resource로 연결
	@Resource(name = "boardService")
	private BoardService boardService;

	@Autowired
	private Util util;//우리가 만든 숫자변환을 사용하기 위해서 객체 연결했어요.

	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardList());
		return "board";
	}

	// http://localhost:8080/pro1/detail?bno=121
	// 파라미터 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		//String bno = request.getParameter("bno");
		int bno = util.strToInt( request.getParameter("bno"));
		
		// bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
		// System.out.println("bno : " + bno);
		
		//DTO로 변경합니다.
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		//dto.setM_id(null) 글 상세보기에서는 mid가 없어도 됩니다.
		
		BoardDTO result = boardService.deatil(dto);
		model.addAttribute("dto", result);
		System.out.println(util.getIp() + "가 " + bno + "에 들어왔습니다."); // 아이피 추적하기
		return "detail"; 
	}
	// rd는 서블릿에서만 사용합니다.

	@GetMapping("/write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mname") != null) {
			return "write";
		}else {
			return "redirect:/login";
		}
		
	
	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request) {
		// 사용자가 입력한 값 변수에 담기
		// System.out.println(request.getParameter("title"));
		// System.out.println(request.getParameter("content"));
		// System.out.println("===============================");
		BoardDTO dto = new BoardDTO();
		//세션에서 불러오겠습니다.
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null) {
			//로그인 했습니다. = 아래 로직을 여기로 가져오세요.
			dto.setBtitle(request.getParameter("title"));
			dto.setBcontent(request.getParameter("content"));
			
			dto.setM_id((String)session.getAttribute("mid"));// 이건 임시로 넣었습니다. 로그인 추가되면 변경하겠습니다.
			dto.setM_name((String)session.getAttribute("mname"));//세션에서 가져옴.
			// Service -> DAO -> mybatis -> DB로 보내서 저장하기
			boardService.write(dto);
		}else {
			//로그인 안했어요. = 로그인 하세요
			return "redirect:/login";
		}


		return "redirect:board";// 다시 컨트롤러 지나가서 GET방식으로 갑니다.
	}

	// 삭제가 들어온다면 http://localhost/delete?bno=147
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno, HttpSession session) { // HttpServletRequest의
																										// getParameter를
																										// 뜻합니다.
		
		//로그인 여부 확인해주세요.
		System.out.println(session.getAttribute("mid"));
		
		System.out.println("bno : " + bno + "를 " + util.getIp() + "가 삭제했습니다.");
		// dto
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		dto.setM_id((String)session.getAttribute("mid"));
		// dto.setBwrite(null) 사용자 정보
		// 추후 로그인을 하면 사용자의 정보도 담아서 보냅니다.
		
		if(session.getAttribute("mid")==dto.getM_id()) {
			
			boardService.delete(dto);//임시로 막앗습니다.
		}
		
		return "redirect:board";// 삭제를 완료한 후에 컨트롤러를 지나 다시 보드로 갑니다.
	}

	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		//로그인 하지 않으면 로그인 화면으로 던져주세요
		ModelAndView mv = new ModelAndView(); //jsp 값을 비웁니다.
		if(session.getAttribute("mid") != null) {

			
			
			//dto를 하나 만들어서 거기에 담겠습니다. = bno, dto
			BoardDTO dto = new BoardDTO();
			dto.setBno(util.strToInt(request.getParameter("bno")));
			//내글만 수정할 수 있도록 세션에 있는 mid도 보냅니다.
			dto.setM_id((String)session.getAttribute("mid"));
			
			//데이터베이스에 물어봐서 bno를 보내서 dto를 얻어옵니다.
			BoardDTO result = boardService.deatil(dto);
			
			if(result != null) {
				mv.addObject("dto", result);//mv에 실어보냅니다.
				mv.setViewName("edit");//이동할 jsp명을 적어줍니다.
				
			}else {//다른 사람 글이라면 null입니다. 경고창으로 이동합니다.
				mv.setViewName("warning");
				
			}
			

		}
		else {
				//로그인 안 했다. = login 컨트롤러
				mv.setViewName("redirect:/login");
		}
		return mv;
			
		
	}
	
	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
		
		System.out.println(dto.getBtitle());
		System.out.println(dto.getBcontent());
		System.out.println(dto.getBno());
		
		boardService.edit(dto);
		
		return "redirect:detail?bno="+dto.getBno();	//수정을 완료한 후에 컨트롤러를 거쳐 보드로 이동하게 해주세요.
	}

	
}
