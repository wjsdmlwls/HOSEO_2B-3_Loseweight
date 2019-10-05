create table Fitness_shop(
lw_salesnum int not null primary key auto_increment, 
product_code varchar(16) not null, 
cost int not null,  
selling_price int not null, 
reduced_price int null,
product_name varchar(30) not null, 
product_contents text null, 
quantity int not null,
big_category varchar(30) not null,
middle_category varchar(30) not null,
small_category varchar(30) not null,  
brand varchar(30) null,  
delivery_charge int default 0,
pointplus int default 0,
img0 text null,  
exposure int not null, 
salestatus int not null, 
productevent int default '0', 
option1 varchar(30) not null,
option1price int not null,
write_date datetime not null
);

passwd varchar(12) not null,
lw_id varchar(12) not null
);

desc Fitness_shop
insert into Fitness_shop(lw_salesnum,product_code,cost,selling_price,product_name,quantity,big_category,middle_category,small_category,exposure,salestatus,option1,option1price,write_date) values(12,"test",777,344,"www",3,"1test","2test","3test",0,0,"0",22,"2019-09-05")

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