create table foodplan_board(
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
 select count(*) from board where subject like '%2%';
 select count(*) from board where subject like '%2%';
 select * from board where subject like '%w%' order by ref desc, re_step asc limit 0,10
create table file(
	fileName varchar(100),
	fileRealName varchar(100)
)
drop table boardupload;

delete from board where num=10
drop table board;
drop table board;
desc board;

select * from foodplan_board;
select * from boardupload;



insert into board(writer,email,subject,passwd,reg_date,members,ref,re_step,re_level,content,ip) values(1,1,1,1,"2019-09-04",1,0,0,1,1,1,222)

insert into board(writer,email,subject,passwd,reg_date,members,ref,re_step,re_level,content,ip,boardfiles) values(1,1,1,1,"2019-09-04",1,0,0,1,1,1,"/2019_JeonJSP/downloadAction?file=블로그2.png")



create table foodplan_boardre(
    glenum int not null primary key auto_increment,  
    num int(11) not null,			     
    lw_id varchar(50) not null,				
    reContent text not null,				
    reg_date datetime default '00-00-00 00:00' not null,				    
    FOREIGN KEY (num) REFERENCES foodplan_board(num) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (lw_id) REFERENCES lw_users(lw_id) ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

drop table boardre;
show tables


select count(*) from questionboardre where num=1
select * from questionboardre where num=1