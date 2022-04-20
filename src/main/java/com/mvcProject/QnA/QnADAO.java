package com.mvcProject.QnA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class QnADAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private DataSource dataFactory;
	
	public QnADAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public List<QnADTO> selectQnAlist() {
		List<QnADTO> list = new ArrayList<>();

		try {
			conn = dataFactory.getConnection();
			String query = " SELECT "
					+ "    level "
					+ "    ,qna_no "
					+ "    ,qna_parent_no "
					+ "    ,qna_type "
					+ "    ,qna_title AS title "
					+ "    ,qna_content "
					+ "    ,qna_date "
					+ "    ,m.member_id "
					+ " FROM qna q, member m "
					+ " WHERE q.member_no = m.member_no "
					+ " START WITH qna_parent_no = 0 "
					+ " CONNECT BY PRIOR qna_no = qna_parent_no "
					+ " ORDER SIBLINGS BY qna_date desc ";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				QnADTO qnaDto = new QnADTO();
				qnaDto.setQna_no(rs.getInt("qna_no"));
				qnaDto.setQna_parent_no(rs.getInt("qna_parent_no"));
				qnaDto.setQna_type(rs.getString("qna_type"));
				qnaDto.setQna_title(rs.getString("title"));
				qnaDto.setQna_content(rs.getString("qna_content"));
				qnaDto.setQna_date(rs.getDate("qna_date"));
				qnaDto.setMember_id(rs.getString("member_id"));
				list.add(qnaDto);
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void addQnA(QnADTO dto) {
		try {
			conn = dataFactory.getConnection();
			String query = " INSERT INTO qna"
					+ " VALUES("
					+ " 	 QnA_seq.NEXTVAL "
					// parent_no
					+ " 	,? "
					// type, title, content
					+ "		,? ,? ,? "
					// date, view, memeber_no
					+ " 	,? ,0 ,? "
					+ " ) ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, 0);
			pstmt.setString(2, dto.getQna_type());
			pstmt.setString(3, dto.getQna_title());
			pstmt.setString(4, dto.getQna_content());
			pstmt.setDate(5, dto.getQna_date());
			pstmt.setInt(6, dto.getMember_no());
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modQnA(QnADTO dto) {
		try {
			conn = dataFactory.getConnection();
			String query = " UPDATE qna "
					+ " SET  qna_type = ? "
					+ "		,qna_title = ? "
					+ "		,qna_content = ? "
					+ " WHERE qna_no = ? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getQna_type());
			pstmt.setString(2, dto.getQna_title());
			pstmt.setString(3, dto.getQna_content());
			pstmt.setInt(4, dto.getQna_no());
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delQnA(int qna_no) {
		try {
			conn = dataFactory.getConnection();
			String query = " DELETE FROM qna WHERE qna_no = ? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qna_no);
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<QnADTO> searchQnA(QnADTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	public QnADTO selectOneQna(int qnaId) {
		QnADTO dto = new QnADTO();

		try {
			conn = dataFactory.getConnection();
			String query = " SELECT "
					+ "			 qna_no "
					+ "			,qna_type "
					+ "			,qna_title AS title "
					+ "			,qna_content "
					+ "			,qna_date "
					+ "			,m.member_id "
					+ " FROM qna q, member m "
					+ " WHERE qna_no = ? "
					+ " AND q.member_no = m.member_no ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnaId);
			pstmt.executeQuery();
			ResultSet rs = pstmt.getResultSet();
			rs.next();
			dto.setQna_no(rs.getInt("qna_no"));
			dto.setQna_type(rs.getString("qna_type"));
			dto.setQna_title(rs.getString("title"));
			dto.setQna_content(rs.getString("qna_content"));
			dto.setQna_date(rs.getDate("qna_date"));
			dto.setMember_id(rs.getString("member_id"));
			
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
