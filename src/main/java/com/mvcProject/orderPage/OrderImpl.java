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
			
			// 그냥 임의로 장바구니 리스트 만들어놨음 까먹을까봐
			//List cartList = new ArrayList();
			
			
			this.con = this.dataFactory.getConnection();
			
			String query = "";
				query += " SELECT * FROM product ";
				query += " where product_no IN ( ";
				
			// 장바구니에서 넘어온 상품들의 개수를 모르니까 ?의 개수를 적을 수 없다
			// 그래서 상품들의 개수를 받은 값으로 for문을 돌려서 ?를 찍게 한다
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


	
	// 주문 배송정보, 상품정보 INSERT
	public int addOrder(OrderDTO dto) {
		try {
			con = dataFactory.getConnection();
			
			String query = " INSERT INTO orders ";
			query +=       " (order_no, order_date, order_addr, order_memo, member_no, order_name, order_phone ) ";
			query +=       " VALUES (orders_seq.nextval, sysdate, ?, ?, ?, ?, ?) "; 
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getOrder_addr());
			pstmt.setString(2, dto.getOrder_memo());
			pstmt.setInt(3, dto.getMember_no());
			pstmt.setString(4, dto.getOrder_name());
			pstmt.setString(5, dto.getOrder_phone());
			
			pstmt.executeQuery();
			
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


	public void addProductOrder(OrderProductDTO orderProductDTO) {
		// TODO Auto-generated method stub
		
	}


}
