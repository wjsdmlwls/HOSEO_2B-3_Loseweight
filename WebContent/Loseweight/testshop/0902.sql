/*상품 등록 */
create table Fitness_shop(
lw_salesnum int not null primary key auto_increment, /*상품 게시글번호*/ 

product_code varchar(16) not null, /*상품코드*/
cost int not null,   /*소비자 가격*/ 
selling_price int not null, /*판매가*/
reduced_price int null, /*할인가=소비자가격-판매가  //DAO에서 계산처리함 */

product_name varchar(30) not null, /*제품명*/

product_contents text null, /*제품소개*/ 
quantity int not null,  /*수량*/
big_category varchar(30) not null,
middle_category varchar(30) not null,

small_category varchar(30) not null,  /*부위별*/

brand varchar(30) null,   /*브랜드*/
delivery_charge int default 0, /*배송비*/
pointplus int default 0, /*lwpoint //DAO에서 계산처리함*/
img0 text null,  /*섬네일*/ 
exposure int not null, /*상품노출 : 미등록/개시*/

salestatus int not null, /*판매상태 : 판매중지/ 준비중 /판매중*/ 
productevent int default '0', /*제품 이벤트(무료배송 신규상품 추천상품)*/ 
option1 varchar(30) not null,
option1price int default 0 not null,
option2 varchar(30) null,
option2price int  null,
option3 varchar(30) null,
option3price int  null,
write_date datetime not null, /*게시글 추가 날자 */
passwd varchar(12) not null,
lw_id varchar(12) not null
);

desc Fitness_shop

select * from Fitness_shop where big_category like '%기구%' and middle_category like '%부위별운동기구%' and small_category like '%%'
drop table Fitness_shop
desc bf_board;
insert into Fitness_shop(product_code,cost,selling_price,product_name,quantity,big_category,middle_category,small_category,exposure,salestatus,option1,option1price,write_date,lw_id,passwd) values("test",777,344,"www",3,"1test","2test","3test",0,0,"0",22,"2019-09-05","admin","admin")

create table Fitness_shop_re(
    glenum int not null primary key auto_increment,  
    lw_salesnum int(11) not null,			     
    lw_id varchar(50) not null,				
    reContent text not null,
    star int(5),
    reg_date datetime default '00-00-00 00:00' not null,				    
    FOREIGN KEY (lw_salesnum) REFERENCES Fitness_shop(lw_salesnum) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (lw_id) REFERENCES lw_users(lw_id) ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

drop table Fitness_shop_re;
select * from shopping_basket
<!--shoping cart-->
create table shopping_basket(
    num int not null primary key auto_increment,   
    lw_salesnum int(11) not null, /*상품글번호*/
    lw_id varchar(50) not null,	/*아이디*/	
    reg_date datetime default '00-00-00 00:00' not null,				    
 	quantity int not null,  /*수량*/	    
 	select_quantity int not null,  /*선택한수량*/
    link varchar(300) not null, /*게시글 링크*/
    cost int not null,   /*소비자 가격*/ 
	selling_price int not null, /*판매가*/
	reduced_price int null, /*할인가=소비자가격-판매가  //DAO에서 계산처리함 */
	option1 varchar(30), /*옵션선택*/
	option1price int,	/*옵션선택가격*/
	option2 varchar(30), /*옵션선택*/
	option2price int,	/*옵션선택가격*/
	option3 varchar(30), /*옵션선택*/
	option3price int,	/*옵션선택가격*/
	big_category varchar(30) not null,
	middle_category varchar(30) not null,
	small_category varchar(30) not null,
	product_name varchar(30) not null, /*제품명*/
	pointplus int, /*배송비*/
	delivery_charge int, /*배송비*/
	img0 varchar(300) 
)
drop table shopping_basket
select * from shopping_basket
drop table shopping_basket
drop table shopping_basket
select count(*) from shopping_basket where lw_id ="admin";
select * from shopping_basket where img0 = 'null';
select * from shopping_basket where lw_id like 'choyk12';

create table order_obj(
	ordernum int not null primary key auto_increment,   /*구매 번호*/
	lw_salesnum int(11) not null,						 /*물품 번호*/
	product_name varchar(30) not null,					/*상품 이름*/
	img0 text not null,									/*상품 이미지*/
	total_money int not null,							/*총 가격*/
	pointplus int default 0,							/*적립금*/
	quantity int not null,        						/*수량*/
	option1 varchar(30) null,							/*옵션*/
	option1price int null,
	option2 varchar(30) null,
	option2price int null,
	option3 varchar(30) null,
	option3price int null,

	/*카드 정보*/
	
	cardnum1 int(16) null,
	
	lw_id varchar(50) not null,							/*구매자 아이디*/
	order_time datetime default '00-00-00 00:00' not null /*구매 날짜*/
)
select * from order_obj
select * from Fitness_shop order by lw_salesnum desc where (write_date between '2000-01-01' and '2099-12-31') and (option1 like "빨강")limit 0,5
select * from Fitness_shop where write_date between '2000-01-01' and '2099-12-31' and option1 like "빨강" limit 5,5;
select * from Fitness_shop where write_date between SYSDATETIME(); 
select * from Fitness_shop order by product_name desc
select left(img0,16)from fitness_shop

update fitness_shop set img0 =replace(img0,'localhost','106.10.32.22')
