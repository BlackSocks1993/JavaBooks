package com.mvcProject.orderPage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class BoardController
 */
@WebServlet("/order/*")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	OrderImpl orderImpl;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		orderImpl = new OrderImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action "+ action);
		
		HttpSession session = request.getSession();
		
		try {
			List<OrderDTO> ordersList = new ArrayList<OrderDTO>();
			OrderDTO orderDTO = new OrderDTO();
			OrderProductDTO orderProductDTO = new OrderProductDTO();

			// 결제하기 버튼을 누르면 오는곳
			if (action.equals("/addOrder.do")) {
				
				
				// 배송 정보
				String order_name = request.getParameter("order_name");
				String order_phone = request.getParameter("order_phone");
				String order_addr = request.getParameter("order_addr");
				String order_memo = request.getParameter("order_memo");
				
				orderDTO.setOrder_name(order_name);
				orderDTO.setOrder_phone(order_phone);
				orderDTO.setOrder_addr(order_addr);
				orderDTO.setOrder_memo(order_memo);
				
				int orderList_size = Integer.parseInt(request.getParameter("orderList_size"));
				
				int order_product_no = orderImpl.addOrder(orderDTO); // 주문 테이블 등록
				
//				for(int i=0; i < orderList_size; i++) { // orderDTO도 넘겨줘야 함
//					// 상품 정보
//					int order_product_quantity = Integer.parseInt(request.getParameter("orders[" + i + "].order_product_quantity"));
//					//String order_no = request.getParameter("order_no");
//					int product_no = Integer.parseInt(request.getParameter("orders[" + i + "].product_no"));
//					
//					
//					orderProductDTO.setOrder_product_quantity(order_product_quantity);
//					orderProductDTO.setOrder_no(order_product_no);
//					orderProductDTO.setProduct_no(product_no);
//					
//					orderImpl.addProductOrder(orderProductDTO); // 주문 상품 테이블 등록
//				}
				
				nextPage = "/orderPage/orderCompleted.jsp";
			
			} else {
				nextPage = "/deny.jsp";
				System.out.println("실행 안됨");
			}
			
			System.out.println("nextPage: "+ nextPage);
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
