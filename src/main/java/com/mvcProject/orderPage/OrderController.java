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

import com.mvcProject.product.ProductDTO;



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
				
				System.out.println("--배송정보--");
				System.out.println(order_name);
				System.out.println(order_phone);
				System.out.println(order_addr);
				System.out.println(order_memo);
				
				orderDTO.setOrder_name(order_name);
				orderDTO.setOrder_phone(order_phone);
				orderDTO.setOrder_addr(order_addr);
				orderDTO.setOrder_memo(order_memo);
				
				/* productsList의 사이즈 값을 int로 담음 */
				int productsList_size = Integer.parseInt(request.getParameter("productsList_size"));
				System.out.println("productsList_size : " + productsList_size);
				
				/* 주문 테이블 등록 (insert한 상태) */
				int order_product_no = orderImpl.addOrder(orderDTO);
				System.out.println("order_product_no(insert결과) : " + order_product_no);
				
				/* order테이블에서 order_no의 max값을 select */
				int order_no = orderImpl.selectOrderNo_max(); 
				System.out.println("order_no max값 : " + order_no);
				request.setAttribute("order_no", order_no);
				System.out.println("request.getAttribute(\"order_no\") : " + request.getAttribute("order_no"));
				
				
				// 제품 목록만큼 주문_상품테이블 insert
				
				String[] arr_product_price = request.getParameterValues("product_price");
				String[] arr_product_name = request.getParameterValues("product_name");
				String[] arr_product_img = request.getParameterValues("product_img");
				String[] arr_order_product_quantity = request.getParameterValues("order_product_quantity");
				 
				
				
				/* 콘솔 출력을 위한 */
				for(int i=0; i < arr_product_price.length; i++) {
					System.out.println("arr_product_price[" + i + "] : " + arr_product_price[i]);
					System.out.println("arr_product_name[" + i + "] : " + arr_product_name[i]);
					System.out.println("arr_product_img[" + i + "] : " + arr_product_img[i]);
					System.out.println("arr_order_product_quantity[" + i + "] : " + arr_order_product_quantity[i]);
				}
				/* 콘솔 출력을 위한 */
				

				
				
				/* 배열을 리스트로 담는다 */
				List productsList = new ArrayList();
				for(int i=0; i < arr_product_price.length; i++){
						// 대표로 arr_product_price 배열의 length로 조건 작성
					OrderProductDTO opDTO = new OrderProductDTO();
					opDTO.setTotalPrice(Integer.parseInt(arr_product_price[i]));
					opDTO.setProduct_name(arr_product_name[i]);
					opDTO.setProduct_img(arr_product_img[i]);
					opDTO.setOrder_product_quantity(Integer.parseInt(arr_order_product_quantity[i]));

					/* insert 메서드 실행 -> 제품 목록만큼 주문_상품테이블 insert */
					orderImpl.addProductOrder(opDTO);
				}
				
				
				/* 다음 페이지로 전송 */
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
