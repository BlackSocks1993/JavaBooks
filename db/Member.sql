create table member(
name varchar2(10) not null,
email varchar2(45) not null,
pw varchar2(45) not null,
add varchar2(255) not null,
phone varchar2(11) not null,
constraint member_pk primary key(email)
);