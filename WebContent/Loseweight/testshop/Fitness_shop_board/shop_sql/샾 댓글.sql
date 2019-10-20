

select * from Fitness_shop where big_category like '%기구%' 
and middle_category like '%부위별운동기구%' and small_category like '%%'
insert into Fitness_shop(product_code,cost,selling_price,product_name,
quantity,big_category,middle_category,small_category,exposure,salestatus,
option1,option1price,write_date,lw_id,passwd) values("test",777,344,"www",3,
"1test","2test","3test",0,0,"0",22,"2019-09-05","admin","admin")

/*상품평 테이블*/

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


select count(*) from shopping_basket where lw_id ="admin";
select * from shopping_basket where img0 = 'null';
select * from shopping_basket where lw_id like 'choyk12';

select * from Fitness_shop order by lw_salesnum desc where (write_date between '2000-01-01' and '2099-12-31') and (option1 like "빨강")limit 0,5
select * from Fitness_shop where write_date between '2000-01-01' and '2099-12-31' and option1 like "빨강" limit 5,5;
select * from Fitness_shop where write_date between SYSDATETIME(); 
select * from Fitness_shop order by product_name desc
