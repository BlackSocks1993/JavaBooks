package com.mvcProject.member.model;

public class MemberBean {

	private String member_no;        // 회원번호
	private String member_email;			//이메일
	private String member_pw;     // 비밀번호
    private String member_name;        // 이름
    private String member_add;        // 주소
    private String member_phone;        // 전화


    
    public String getNo() {return member_no;}
    public void setNo(String member_no) {this.member_no = member_no;}

    
    public String getPassword() {return member_pw;}
    public void setPassword(String member_pw) {this.member_pw = member_pw;}
    
    public String getName() {return member_name;}
    public void setName(String member_name) {this.member_name = member_name;}
 
    public String getEmail() {return member_email;}
    public void setEmail(String member_email) {this.member_email = member_email;}
    
    public String getPhone() {return member_phone;}
    public void setPhone(String member_phone) {this.member_phone =member_phone;}
    
    public String getAddress() {return member_add;}
    public void setAddress(String member_add) {this.member_add = member_add;}

}
