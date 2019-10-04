create table bf_board(
    num int not null primary key auto_increment,
    writer varchar(10) not null,
    email varchar(30),
    subject varchar(50) not null,
    passwd varchar(12) not null,
    reg_date datetime not null,
    readcount int default 0,
    ref int not null,
    re_step smallint not null,
    re_level smallint not null,
    content text not null,
    ip varchar(20) not null,
    members int not null,
    img0 text null,
    filename0 varchar(50) null,
    filepath0 varchar(500) null,
    filename1 varchar(50) null,
    filepath1 varchar(500) null
 );
 
 create table boardupload(
    num int not null primary key auto_increment,
    ref int not null,
    re_step smallint not null,
    re_level smallint not null,
    img0 varchar(50) null,
    img1 varchar(50) null,
    img2 varchar(50) null,
    filename0 varchar(50) null,
    filename1 varchar(50) null,
 );
 
create table file(
	fileName varchar(100),
	fileRealName varchar(100)
)
drop table boardupload;

drop table bf_board;
drop table board;
desc bf_board;

select * from bf_board;
select * from boardupload;



insert into board(writer,email,subject,passwd,reg_date,members,ref,re_step,re_level,content,ip) values(1,1,1,1,"2019-09-04",1,0,0,1,1,1)

insert into board(writer,email,subject,passwd,reg_date,members,ref,re_step,re_level,content,ip,boardfiles) values(1,1,1,1,"2019-09-04",1,0,0,1,1,1,"/2019_JeonJSP/downloadAction?file=블로그2.png")


create table bf_boardre(
    glenum int not null primary key auto_increment,  
    num int(11) not null,			     
    lw_id varchar(50) not null,				
    reContent text not null,				
    reg_date datetime default '00-00-00 00:00' not null,				    
    FOREIGN KEY (num) REFERENCES bf_board(num) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (lw_id) REFERENCES lw_users(lw_id) ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


insert into fitness_shop values(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,20190202);

select count(*) from questionboardre where num=1
select * from questionboardre where num=1


select * from fitness_shop;

