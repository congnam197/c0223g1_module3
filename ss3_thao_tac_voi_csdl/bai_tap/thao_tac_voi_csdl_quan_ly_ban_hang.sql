use quan_ly_ban_hang;
insert into customer (c_name,c_age)
values 
("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);

insert into `order`(c_id,o_date,o_total_price)
values
(1,'2006-03-21',null),
(2,'2006-03-23',null),
(1,'2006-03-16',null);

insert into product (p_name,p_price)
values 
("May Giat",3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat ",1),
("Bep Dien",2);

insert into order_detail (o_id,p_id,od_qty)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id, o.o_date, p.p_price
from `order`o
join order_detail od on o.o_id = od.o_id
join product p on p.p_id = od.p_id;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_name as "ten_khach_hang", p.p_name as "san_pham"
from customer c
join `order` o on o.c_id = c.c_id
join order_detail od on od.o_id = o.o_id
join product p on p.p_id = od.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.c_id, c.c_name, c.c_age
from customer c 
left join `order` o on o.c_id = c.c_id
where o.o_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select o.o_id as "ma_hoa_don", o.o_date as "ngay_ban", sum(od.od_qty*p.p_price) as "tong_tien"
from `order` o 
join order_detail od on o.o_id = od.o_id
join product p on p.p_id = od.p_id
group by o.o_id;








