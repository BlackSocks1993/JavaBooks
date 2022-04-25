package com.mvcProject.cartList.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {

	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public CartDAO() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원 이름
	public String getUserName() {
		String name = null;
		try {
			conn = dataFactory.getConnection();
			String sql = " select member_name from member ";
				   sql += " where member_no = 3 ";

		    pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				name = rs.getString("member_name"); // 컬럼명과 동일하게
			}
			// DB에 commit을 해야해서 close를 써줘야 함 (무한로딩 에러)
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	// 장바구니 List
	public List<CartDTO> getCartList(int member_no) throws Exception {
		List<CartDTO> cartList = null;

		// 카트리스트 부를때 세션으로 담아서 getAttribute 사용해서 담고 넘겨주기
		
		try {
			conn = dataFactory.getConnection();
			String sql = " select p.product_img, p.product_name, p.product_price, c.cart_amount ";
				sql += " from member m, cart c, product p ";
				sql += " where  m.member_no = c.member_no ";
				sql += " and c.product_no = p.product_no ";
				sql += " and m.member_no = " + member_no; 
	
			    // 로그인한 3번 사용자 회원의 장바구니라고 가정하고 리스트에 담기

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			int cnt = 0;
			while (rs.next()) {
				cnt++;
				if (cnt == 1) {
					cartList = new ArrayList<CartDTO>();
				}
				
				// 책 이미지 / 책 이름 / 가격 / 수량
				
				CartDTO dto = new CartDTO();
				dto.setProduct_img(rs.getString("product_img")); 
				dto.setProduct_name(rs.getString("product_name"));
				dto.setCart_amount(rs.getInt("cart_amount"));
				dto.setProduct_price(rs.getInt("product_price"));

				cartList.add(dto);
			}
			close();
		}

		catch (SQLException e) {
			e.printStackTrace();
		}
		return cartList;
	}

}
