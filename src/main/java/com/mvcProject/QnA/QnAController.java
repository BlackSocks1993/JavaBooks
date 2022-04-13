package com.mvcProject.QnA;

import java.io.IOException;
import java.util.ArrayList;
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

		HttpSession session = req.getSession();

		try {
			List<QnADTO> qnaList = new ArrayList<>();

			// QnA게시판 전체 게시물을 리스트를 조회
			if(action.equals("/qnalist.do")) {
				int page = 1;

				
				
				nextPage = "/QnA/mainQnA.jsp";
				


			// 사용자가 클릭한 게시물의 번호를 조회하여 상세 페이지로 이동
			} else if(true) {
				



			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
