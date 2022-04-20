package com.mvcProject.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class userImpl {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";

	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;

	// 기본 설정
	public userImpl() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// 회원가입
	public void insertUserInfo(MemberDTO dto) {
		try {
			con = dataFactory.getConnection();
			System.out.println("커넥션풀 성공");

			String query = "";
			query += " INSERT INTO member ";
			query += " ( member_no, member_email, member_pw, member_name, member_add, member_phone ) ";
			query += " VALUES (?, ?, ?, ?, ?) ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dto.getMember_no());
			pstmt.setString(2, dto.getMember_email());
			pstmt.setString(3, dto.getMember_pw());
			pstmt.setString(4, dto.getMember_name());
			pstmt.setString(5, dto.getMember_add());
			pstmt.setString(6, dto.getMember_phone());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// 로그인
	// 사용자가 입력한 email값을 조건으로 member정보 조회함
	public MemberDTO loginCheck(String member_email, String member_pw) { 
		MemberDTO dto = new MemberDTO();
		try {
			this.con = this.dataFactory.getConnection();
			String query = " SELECT * FROM member ";
			query 		+= " WHERE member_email = ? ";
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, member_email);
			ResultSet rs = this.pstmt.executeQuery();
			while (rs.next()) {
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_pw(rs.getString("member_pw"));
			}
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.con != null)
				this.con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
