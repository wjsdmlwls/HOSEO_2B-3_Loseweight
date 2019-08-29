create table lw_zipcode(
	NEW_ADDR varchar(300) null,
    NEW_ZIPCODE varchar(300) null,
    OLD_ZIPCODE varchar(100) not null,
    OLD_SIDO varchar(100) not null,
    OLD_GUGUN varchar(200) not null,
    OLD_DONG varchar(200) not null,
    OLD_RI varchar(500) null,
    OLD_BUNJI varchar(300) null,
    SEQ int null
);

UPDATE lw_zipcode SET NEW_ZIPCODE = CONCAT('0',NEW_ZIPCODE) WHERE zipcode
/*텍스트에는 앞자리 0이 빠져있어서 신우편주소인데도 4자리가 들어가있어서 5자리로 수정 */

UPDATE zipcode SET NEW_ZIPCODE = CONCAT('0',NEW_ZIPCODE);
/*이게 맞는거*/

select * from lw_zipcode


create table lw_users1(
lw_id varchar(50) not null primary key);


desc lw_users;
drop table zipcode;

insert into lw_users (lw_id, lw_passwd, lw_name, lw_gender, lw_e_mail1, lw_e_mail2, lw_juminN, lw_addr, lw_phone, lw_lp)
values("choyk","asd123","test",11,11,11,11,11,11,11);

select * from lw_zipcode;

GRANT ALL privileges ON basicjsp.* TO 'jspid'@'localhost' IDENTIFIED BY 'jsppass';

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/zipcode_new.txt' INTO TABLE lw_zipcode

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

