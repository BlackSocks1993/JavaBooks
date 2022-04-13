package com.mvcProject.QnA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class QnADAOImpl implements QnADAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private DataSource dataFactory;
	
	public QnADAOImpl() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<QnADTO> QnAlist() {
		List<QnADTO> list = new ArrayList<>();

		try {
			conn = dataFactory.getConnection();
			String query = " SELECT * FROM qna ";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				QnADTO qnaDto = new QnADTO();
				qnaDto.setQna_no(rs.getInt("qna_no"));
				qnaDto.setQna_parent_no(rs.getInt("qna_parent_no"));
				qnaDto.setQna_type(rs.getString("qna_type"));
				qnaDto.setQna_title(rs.getString("qna_title"));
				qnaDto.setQna_content(rs.getString("qna_content"));
				qnaDto.setQna_date(rs.getDate("qna_date"));
				qnaDto.setQna_views(rs.getInt("qna_views"));
				qnaDto.setMember_no(rs.getInt("member_no"));
				list.add(qnaDto);
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void addQnA(QnADTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modQnA(QnADTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delQnA(QnADTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<QnADTO> searchQnA(QnADTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnADTO selectOneQna(QnADTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
}
