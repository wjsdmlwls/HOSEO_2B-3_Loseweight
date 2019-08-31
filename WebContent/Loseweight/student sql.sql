create table lw_users(
    lw_id varchar(50) PRIMARY KEY ,
    lw_passwd varchar(50) not null,
    lw_name varchar(50) not null,
    lw_gender varchar(50) not null,
    lw_e_mail1 varchar(50) null,
    lw_e_mail2 varchar(50) null,
    lw_zipcode varchar(50) null,
    lw_addr1 varchar(50) null,
	lw_addr2 varchar(50) null,
	lw_phone varchar(50) null,
    lw_lp int(255) null
);

create table lw_users(
lw_id varchar(50) not null primary key);
select * from lw_users;
desc lw_users;
select lw_id from lw_users where lw_passwd="asd123" and lw_passwd="asd123"
drop table lw_users;

update lw_users set lw_e_mail1="g",lw_e_mail2="naver.com",lw_addr="test" where lw_id="choyk12"
update lw_users set lw_e_mail1=g,lw_e_mail2="naver.com",lw_addr="test" where lw_id=choyk12 and passwd=asd123
insert into lw_users (lw_id, lw_passwd, lw_name, lw_gender, lw_e_mail1, lw_e_mail2, lw_zipcode,lw_addr1,lw_addr2, lw_phone, lw_lp)
values("choyk12","asd123","test",11,11,11,11,11,11,11,11);

select * from lw_users 

GRANT ALL privileges ON basicjsp.* TO 'jspid'@'localhost' IDENTIFIED BY 'jsppass';

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/zipcode.txt' INTO TABLE zipcode

drop table lw_users;

create table users
(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
gender char(2) not null,
e_mail1 varchar(20) not null,
e_mail2 varchar(20) not null,
juminN varchar(20) not null,
addr varchar(50) not null,
phone varchar(20) not null
);



create table users
(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
gender char(2) not null,
e_mail1 varchar(20) not null,
e_mail2 varchar(20) not null,
juminN varchar(20) not null,
addr varchar(50) not null,
phone varchar(20) not null
);

