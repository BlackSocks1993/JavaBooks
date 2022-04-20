package com.mvcProject.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDAO {

	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;

	public CategoryDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List selectCategoryList1() {
		List list = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = " SELECT * FROM product WHERE product_category_no = 1";
			pstmt = con.prepareStatement(query);
			ResultSet rs;
			CategoryDTO dto;
			for (rs = pstmt.executeQuery(); rs.next(); list.add(dto)) {
				dto = new CategoryDTO();
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_author(rs.getString("product_author"));
				dto.setProduct_publisher(rs.getString("product_publisher"));
				dto.setProduct_date(rs.getDate("product_date"));
				dto.setProduct_detail(rs.getString("product_detail"));
				dto.setProduct_img(rs.getString("product_img"));
				dto.setProduct_price(rs.getInt("product_price"));
			}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List selectCategoryList2() {
		List list = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = " SELECT * FROM product WHERE product_category_no = 2";
			pstmt = con.prepareStatement(query);
			ResultSet rs;
			CategoryDTO dto;
			for (rs = pstmt.executeQuery(); rs.next(); list.add(dto)) {
				dto = new CategoryDTO();
				dto.setProduct_no(rs.getInt("product_no"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_author(rs.getString("product_author"));
				dto.setProduct_publisher(rs.getString("product_publisher"));
				dto.setProduct_date(rs.getDate("product_date"));
				dto.setProduct_detail(rs.getString("product_detail"));
				dto.setProduct_img(rs.getString("product_img"));
				dto.setProduct_price(rs.getInt("product_price"));
			}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
