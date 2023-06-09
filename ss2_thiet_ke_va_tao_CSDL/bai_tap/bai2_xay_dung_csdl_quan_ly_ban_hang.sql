create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
c_id int not null primary key auto_increment,
c_name varchar(45),
c_age int
);

create table `order`(
o_id int  not null primary key auto_increment,
o_date datetime,
o_total_price double,
c_id int,
foreign key (c_id) references customer(c_id)
);

create table product(
p_id int not null primary key auto_increment,
p_name varchar(45),
p_price double
);

create table order_detail(
od_qty varchar(45),
o_id int,
p_id int,
primary key(o_id,p_id),
foreign key(o_id) references `order`(o_id),
foreign key(p_id) references product(p_id)
);
