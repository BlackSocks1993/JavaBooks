package com.mvcProject.QnA;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/qna/*")
public class QnAController extends HttpServlet {
	QnAService qnaService;
	QnADTO qnaDto;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		qnaService = new QnAService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String nextPage = "";
		String action = req.getPathInfo();
		boolean isForward = true;

		try {
			// QnA게시판 전체 게시물을 리스트를 조회
			if("/qnalist.do".equals(action)) {
				System.out.println(action + "으로 들어옴");
				List<QnADTO> qnaList = qnaService.selectQnAList();

				String strPage = req.getParameter("page");
				int page = 1;
				if(strPage != "" && strPage != null) {
					page = Integer.parseInt(strPage) > 0 ?
							Integer.parseInt(strPage) : 1;
				}

				Paging paging = new Paging(qnaList.size());
				paging.paging(page);

				req.setAttribute("paging", paging);
				req.setAttribute("qnaList", qnaList);

				nextPage = "/QnA/mainQnA.jsp";
			// end
				


			// 사용자가 클릭한 게시물의 번호를 조회하여 상세 페이지로 이동 (로그인 체크, 작성자와 관리자만 접근할 수 있도록 처리)
			} else if("/detailQna.do".equals(action)) {
				System.out.println(action + "으로 들어옴");
				String strQnaNo = req.getParameter("qna_no");
				QnADTO dto = null;

				if(strQnaNo != "" && strQnaNo != null) {
					int qnaId = Integer.parseInt(strQnaNo);
					dto = qnaService.selectOneQna(qnaId);
				}

				req.setAttribute("qnaDto", dto);
				nextPage = "/QnA/detailQnA.jsp";
			// end



			// 문의 사항 작성 페이지로 이동 (로그인 체크)
			} else if("/writingForm.do".equals(action)) {
				nextPage = "/QnA/writingFormQnA.jsp";
			// end



			// 작성된 게시물 등록 후 게시판 목록으로 이동 (세션에 바인딩된 member_id 가져오기)
			} else if("/post.do".equals(action)) {
				System.out.println(action + "으로 들어옴");
				QnADTO dto = new QnADTO();
				java.util.Date date = new java.util.Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

				// HttpSession session = req.getSession();
				// String member_no = (String) session.getAttribute("member_no");

				String cType = req.getParameter("cType");
				switch (cType) {
				case "order":
					cType = "주문/배송";
					break;
				case "return":
					cType = "반품/교환";
					break;
				case "refund":
					cType = "환불";
					break;
				default:
					cType = "기타";
				}
				dto.setQna_type(cType);
				dto.setQna_title(req.getParameter("title"));
				StringBuffer sbContent = new StringBuffer(req.getParameter("content"));
				dto.setQna_content(
						sbContent.insert(0, "<p>")
						.insert(sbContent.length(), "</p>")
						.toString()
						.replaceAll("\\r\\n", "</p><p>")
				);
				dto.setQna_date(java.sql.Date.valueOf(format.format(date)));
				dto.setMember_no(1);

				qnaService.addQnA(dto);

				isForward = false;
				resp.sendRedirect("listqna.do");
			// end


			// 작성된 게시물을 수정하기 (사용자 정보를 체크한 뒤 수정 결정)
			} else if("/modQna.do".equals(action)) {
				String strQnaNo = req.getParameter("qna_no");
				int qnaNO = 0;
				if(strQnaNo != null && !("".equals(strQnaNo))) qnaNO = Integer.parseInt(strQnaNo);

				req.setAttribute("dto", qnaService.selectOneQna(qnaNO));

				nextPage = "/QnA/writingFormQnA.jsp";



			// 수정된 게시물을 DB에 반영
			} else if("/edit.do".equals(action)) {
				System.out.println(action + "으로 들어옴");
				QnADTO dto = new QnADTO();

				
				int qnaNo = Integer.parseInt(req.getParameter("qna_no"));
				
				String cType = req.getParameter("cType");
				switch (cType) {
				case "order":
					cType = "주문/배송";
					break;
				case "return":
					cType = "반품/교환";
					break;
				case "refund":
					cType = "환불";
					break;
				default:
					cType = "기타";
				}

				dto.setQna_no(qnaNo);
				dto.setQna_type(cType);
				dto.setQna_title(req.getParameter("title"));
				StringBuffer sbContent = new StringBuffer(req.getParameter("content"));
				dto.setQna_content(
						sbContent.insert(0, "<p>")
						.insert(sbContent.length(), "</p>")
						.toString()
						.replaceAll("\\r\\n", "</p><p>")
				);

				qnaService.modQnA(dto);

				isForward = false;
				resp.sendRedirect("listqna.do");



			// 작성된 게시물 삭제하기 (사용자 정보를 체크한 뒤 삭제 결정)
			} else if("/delQna.do".equals(action)) {
				int qna_no = Integer.parseInt(req.getParameter("qna_no"));

				qnaService.delQnA(qna_no);

				isForward = false;
				resp.sendRedirect("listqna.do");


			} else {
				List<QnADTO> qnaList = qnaService.selectQnAList();

				String strPage = req.getParameter("page");
				int page = 1;
				if(strPage != "" && strPage != null) {
					page = Integer.parseInt(strPage) > 0 ?
							Integer.parseInt(strPage) : 1;
				}

				Paging paging = new Paging(qnaList.size());
				paging.paging(page);

				req.setAttribute("paging", paging);
				req.setAttribute("qnaList", qnaList);

				nextPage = "/QnA/mainQnA.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(isForward)req.getRequestDispatcher(nextPage).forward(req, resp);
	}
}
