package com.mvcProject.orderPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mvcProject.product.ProductDTO;
import com.mvcProject.user.MemberDTO;


public class OrderImpl implements OrderInterface {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;

	public OrderImpl() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			this.dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	

	public MemberDTO selectMemberInfo(int member_no) { // 회원 정보 조회
		MemberDTO memberDTO = new MemberDTO();
		try {
			this.con = this.dataFactory.getConnection();
			String query = " SELECT * FROM member where member_no = ? ";
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setInt(1, member_no);
			ResultSet rs = this.pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMember_no(rs.getInt("member_no"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_add(rs.getString("member_add"));
				dto.setMember_phone(rs.getString("member_phone"));
			}
			
			if (rs != null)
				rs.close();
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.con != null)
				this.con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberDTO;
	}


	@Override
	public List<ProductDTO> selectProductList(List<String> cartList) { // 상품 정보 조회
														// 상품 id 들
		
		List<ProductDTO> list = new ArrayList<>();
		try {
			
			this.con = this.dataFactory.getConnection();
			
			String query = "";
				query += " SELECT * FROM product ";
				query += " where product_no IN ( ";
				
			for(int i=1; i <= cartList.size(); i++) {
				if( i == cartList.size() ) { // 마지막 물음표를 찍을때 괄호 같이 붙여서찍음
					query += " ? ) "; 
				} else {
					query += " ?, ";
				}
			}
			this.pstmt = this.con.prepareStatement(query);
			
			
			for(int i = 0; i < cartList.size(); i++) {
				this.pstmt.setInt(i+1, Integer.parseInt(cartList.get(i).toString()));
			}
			
			ResultSet rs = this.pstmt.executeQuery();
			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProduct_no(rs.getInt("product_no"));
				productDTO.setProduct_name(rs.getString("product_name"));
				productDTO.setProduct_detail(rs.getString("product_detail"));
				productDTO.setProduct_price(rs.getInt("product_price"));
				productDTO.setProduct_stock(rs.getInt("product_stock"));
				productDTO.setProduct_img(rs.getString("product_img"));
				productDTO.setProduct_category_no(rs.getInt("product_category_no"));
				list.add(productDTO);
			}
			System.out.println(list);
			if (rs != null)
				rs.close();
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.con != null)
				this.con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}


	
	// 주문 배송정보, 상품정보를 orders테이블에 INSERT
	public int addOrder(OrderDTO dto) {
		try {
			con = dataFactory.getConnection();
			
			String query = " INSERT INTO orders ";
			query +=       " (order_no, order_date, order_addr, order_memo, member_no, order_name, order_phone, order_final_price ) ";
			query +=       " VALUES (orders_seq.nextval, sysdate, ?, ?, ?, ?, ?, ?) "; 
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getOrder_addr());
			pstmt.setString(2, dto.getOrder_memo());
			pstmt.setInt(3, dto.getMember_no());
			pstmt.setString(4, dto.getOrder_name());
			pstmt.setString(5, dto.getOrder_phone());
			pstmt.setInt(6, dto.getOrderFinalPrice());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				
				if (con != null) con.close(); 
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return 0;
	}

	
	/* 주문상품테이블에 INSERT */
	public int addProductOrder(OrderProductDTO opDTO) {
		
		try {
			con = dataFactory.getConnection();
			
			String query = " INSERT INTO order_product ";
					query +=" (";
					query +=	 "order_product_quantity, ";
					query +=	 "order_no, ";
					query +=	 "product_no, ";
					query +=	 "total_price, ";
					query +=	 "product_name, ";
					query +=	 "product_img";
					query += ") ";
					query += " VALUES "; 
					query += " (?, orders_seq.nextval, product_seq.nextval, ?, ?, ?) "; 
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, opDTO.getOrder_product_quantity());
			pstmt.setInt(2, opDTO.getTotalPrice());
			pstmt.setString(3, opDTO.getProduct_name());
			System.out.println(opDTO.getProduct_name());
			pstmt.setString(4, opDTO.getProduct_img());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				
				if (con != null) con.close(); 
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return 0;
		// insert가 몇 개 되었는지
		
	}

	
	/* 주문번호 생성을 위해 현재 Order테이블의 order_no 최댓값 받아오기 */
	@Override
	public int selectOrderNo_max() {
		int order_no = 0;
		try {
			this.con = this.dataFactory.getConnection();
			String query = " SELECT max(order_no) as max_order_no FROM orders ";
			this.pstmt = this.con.prepareStatement(query);
//			this.pstmt.setInt(1, );
			ResultSet rs = this.pstmt.executeQuery();
			while (rs.next()) {
				order_no = rs.getInt("max_order_no");
			}
			if (rs != null)
				rs.close();
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.con != null)
				this.con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order_no;
	}


}
