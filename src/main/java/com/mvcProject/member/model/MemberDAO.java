package com.mvcProject.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;
 
import DB.DBConnection;
 


public class MemberDAO {
	 private static MemberDAO instance;
	    
	    // DAO 객체의 갯수를 제한
	    private MemberDAO(){}
	    public static MemberDAO getInstance(){
	        if(instance==null)
	            instance=new MemberDAO();
	        return instance;
	    }
	    
	    
	    // 회원정보를 DB의 Member 테이블에 저장한다.
	    public void insertMember(MemberBean member) throws SQLException
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {

	            conn = DBConnection.getConnection();
	            
	            // 자동으로 커밋하지 않도록 한다.
	            conn.setAutoCommit(false);
	            
	            StringBuffer sql = new StringBuffer();
	            sql.append("insert into MEMBER values");
	            sql.append("(?, ?, ?, ?, ?,?)");        

	            pstmt = conn.prepareStatement(sql.toString());
	            pstmt.setString(1, member.getName());
	            pstmt.setString(2, member.getEmail());
	            pstmt.setString(3, member.getPassword());
	            pstmt.setString(4, member.getAddress());
	            pstmt.setString(5, member.getPhone());
	            pstmt.setString(6, member.getBetterAdr());
	            

	            pstmt.executeUpdate();
	            conn.commit(); 
	            
	        } catch (SQLException sqle) {
	            conn.rollback(); 
	            
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        } 
	    } 

	    //로그인을 체크한다.
	    public int loginCheck(String email, String password) 
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	 
	        String dbPassword = ""; 
	        int x = -1;
	 
	        try {
	     
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT PASSWORD FROM MEMBER WHERE email=?");
	 
	            conn = DBConnection.getConnection();
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, email);
	            rs = pstmt.executeQuery();
	 
	            if (rs.next()) 
	            {
	                dbPassword = rs.getString("password"); 
	 
	                if (dbPassword.equals(password)) 
	                    x = 1; //성공시 1반환
	                else                  
	                    x = 0; // 실패시 0
	                
	            } else {
	                x = -1; // 아이디 없을경우
	            }
	 
	            return x;
	 
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } 
	    
}
