package com.mvcProject.QnA;

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
		// TODO Auto-generated method stub

	}

	public void modQnA(QnADTO dto) {
		// TODO Auto-generated method stub

	}

	public void delQnA(QnADTO dto) {
		// TODO Auto-generated method stub

	}

	public List<QnADTO> searchQnA(QnADTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	public QnADTO selectOneQna(int qnaId) {
		QnADTO dto = new QnADTO();

		try {
			conn = dataFactory.getConnection();
			String query = " SELECT * FROM qna "
					+ " WHERE qna_no = ? ";
			pstmt.executeQuery();
			pstmt.setInt(1, qnaId);
			ResultSet rs = pstmt.getResultSet();
			rs.next();
			dto.setQna_no(rs.getInt("qna_no"));
			dto.setQna_parent_no(rs.getInt("qna_parent_no"));
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
