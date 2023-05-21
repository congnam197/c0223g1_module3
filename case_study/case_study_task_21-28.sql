use quan_ly_resort_furama;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là 
-- “Đà Nẵng” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với thời gian lập hợp đồng trong năm 2021”.
create view v_nhan_vien as 
select nv.ma_nhan_vien, nv.ho_ten,nv.ngay_sinh, nv.so_cmnd, nv. so_dien_thoai, nv.email, nv.dia_chi 
from nhan_vien nv
join hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like '%Đà Nẵng%' and year(hd.ngay_lam_hop_dong)=2021;
select * 
from v_nhan_vien;

-- Task22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
--          đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien
set dia_chi ="Liên Chiểu"
where dia_chi like "%Đà Nẵng%";

-- Task 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang ( in ma_khach_hang_can_xoa int)
begin
SET SQL_SAFE_UPDATES = 0;
alter table khach_hang
add column delete_status tinyint default "1";
update  khach_hang
set delete_status = 0
where ma_khach_hang = ma_khach_hang_can_xoa;
end //
delimiter ;
 call sp_xoa_khach_hang(5);
 
--  Task 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
--  với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
--  với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong ( hd_ma_hop_dong int, hd_ngay_lam_hop_dong datetime, hd_ngay_ket_thuc datetime,
                                       hd_tien_dat_coc double,  hd_ma_nhan_vien int,  hd_ma_khach_hang int, hd_ma_dich_vu int)	
begin 
if hd_ma_hop_dong  in (select ma_hop_dong from hop_dong) then
signal sqlstate "11111"
set message_text = "mã hợp đồng đã tồn tại";
end if;
if hd_ma_nhan_vien  not in (select ma_nhan_vien from nhan_vien) then
signal sqlstate "55500"
set message_text = "mã nhân viên không tồn tại";
end if;
if hd_ma_khach_hang not in ( select ma_khach_hang from khach_hang) then
signal sqlstate "45000"
set message_text = "mã khách hàng không tồn tại";
end if;
if hd_ma_dich_vu not in (select ma_dich_vu from dich_vu) then
signal sqlstate "55545"
set message_text = "mã dịch vụ không tồn tại";
end if;
insert into hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien,	ma_khach_hang,	ma_dich_vu)
values (hd_ma_hop_dong, hd_ngay_lam_hop_dong, hd_ngay_ket_thuc, hd_tien_dat_coc, hd_ma_nhan_vien, hd_ma_khach_hang, hd_ma_dich_vu);
end // 
delimiter ;

call sp_them_moi_hop_dong (16,'2022-09-08', '2022-09-11', 1000,3,4,5);

-- task 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database
alter table hop_dong
add delete_status tinyint default "1";
create table so_luong_hop_dong (
so_luong_con_lai int
);
delimiter //
create trigger tr_xoa_hop_dong 
after delete on hop_dong
for each row
begin
declare tong_hop_dong int;
(select count(delete_status) from hop_dong where delete_status = 1) 
into tong_hop_dong;
insert into delete_history(so_luong_con_lai)
value (tong_hop_dong);
end //
delimiter ;