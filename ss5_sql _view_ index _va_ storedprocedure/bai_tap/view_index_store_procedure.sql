-- Bước 1
create database demo;
use demo;
-- Bước 2:  
create table products (
id int primary key not null auto_increment,
product_code varchar(20),
product_name varchar(45),
product_price double,
product_amount int ,
product_description varchar (50),
product_status boolean default 0
);
-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values
("sp-1","iphone 11"        ,2300 ,5 ,"dung lượng 128G, ram 4G",0),
("sp-2","iphone 11pro max" ,2350 ,0 ,"dung lượng 256G ,ram 4G",1),
("sp-3","iphone 12"        ,2400 ,0 ,"dung lượng 128G,ram 4G",1),
("sp-4","iphone 13pro max" ,2500 ,14,"dung lượng 128G,ram 6G",0),
("sp-5","iphone 14pro max" ,2800 ,20,"dung lượng 256G,ram 6G",0);

-- Bước 3: 
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_code 
on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index composite_index 
on products( product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào;
EXPLAIN SELECT * FROM products;

-- Bước 4: 
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_products as
select product_code, product_name, product_price, product_status
from products;
select * 
from view_products;
 -- Tiến hành sửa đổi view
update view_products
set product_name = "iphone 11 pro"
where product_code= "sp-1";
update view_products
set product_name ="iphone 12 pro max"
where product_code = "sp-3";
-- Tiến hành xoá view
 drop view view_products;
 
 -- Bước 5: 
 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 delimiter //
 create procedure find_products()
 begin
    select * from products;
 end //
 delimiter ;
 call find_products;
 
--  Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product
(`code` varchar(20),`name` varchar(45),price double,
amount int ,`description` varchar (50),`status` boolean)
begin
     insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
     values
     (`code`,`name`,price,amount,`description`,`status`);
 end //  
 delimiter ;
 call add_product("sp-7","iphone 15" ,3300 ,2,"dung lượng 256G,ram 8G",1);
 
 -- Tạo store procedure sửa thông tin sản phẩm theo id
 delimiter //
 create procedure edit_product_by_id(id_input int,`code` varchar(20),`name` varchar(45),price double, amount int ,`description` varchar (50),`status` boolean)
 begin
     update products
     set product_code = `code`, product_name =`name`, product_price = price, product_amount = amount, product_description = `description`, product_status = `status`
     where id = id_input;
 end //
 delimiter ;
 call edit_product_by_id(5,"sp-100","iphone 20",4000,1,"max ping", 1);
 
--  Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id(in id_input int)
begin
delete from products
where id = id_input;
end //
delimiter ;
call delete_product_by_id(1);