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
option1price int not null,
write_date datetime not null /*게시글 추가 날자 */
);

desc Fitness_shop

select * from Fitness_shop
drop table Fitness_shop
desc bf_board;

create table Fitness_shop_re(
    glenum int not null primary key auto_increment,  
    lw_salesnum int(11) not null,			     
    lw_id varchar(50) not null,				
    reContent text not null,				
    reg_date datetime default '00-00-00 00:00' not null,				    
    FOREIGN KEY (lw_salesnum) REFERENCES Fitness_shop(lw_salesnum) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (lw_id) REFERENCES lw_users(lw_id) ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;