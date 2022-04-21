package com.mvcProject.member.model;

public class MemberBean {

    private String name;        // 이름
    private String email;			//이메일
    private String password;     // 비밀번호
    private String address;        // 주소
    private String betterAdr;        // 상세주소
    private String phone;        // 전화


    
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}
    
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
 
    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}
    
    public String getPhone() {return phone;}
    public void setPhone(String phone) {this.phone = phone;}
    
    public String getAddress() {return address;}
    public void setAddress(String address) {this.address = address;}
    public String getBetterAdr() {return betterAdr;}
    public void setBetterAdr(String betterAdr) {this.betterAdr = betterAdr;}


}
