package com.mvcProject.cartList.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvcProject.cartList.model.CartDAO;
import com.mvcProject.cartList.model.CartDTO;

//controller에서 해야하는 일은 명령 - (model) DAO/DTO에서 cartList를 가져오고 메모리에 담아서 jsp에 전달(view)

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHanddle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHanddle(request, response);

	}

	protected void doHanddle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getPathInfo();
		String nextPage = "";

		CartDAO dao = new CartDAO();

		if (action.equals("/list.do")) {
			List<CartDTO> cartlist = new ArrayList<>();

			try {
				String str = dao.getUserName();
				request.setAttribute("userName", str);
				
				cartlist = dao.getCartList(3);
				request.setAttribute("cartList", cartlist);
				
			//	 request.setAttribute("name", dao.getUserName());
			// 	 request.setAttribute("name", dao.getUserName());
				
				nextPage = "/cartlist/cartList.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("3번 회원의 장바구니:" +cartlist.size());
		} else {
			System.out.println("잘못된 경로");
			response.getWriter().println("action check");
			return;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}