use quan_ly_resort_furama;
-- Task 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang ( in ma_khach_hang_can_xoa int)
begin
delete from khach_hang
where ma_khach_hang = ma_khach_hang_can_xoa;
end //
delimiter ;
 call sp_xoa_khach_hang(5);
 
--  Task 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
--  với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
--  với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong (
 in hd_ngay_lam_hop_dong datetime, in hd_ngay_ket_thuc datetime,
in tien_dat_coc double, in ma_nhan_vien int,in ma_khach_hang int,in ma_dich_vu int)	
begin 
insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,ma_nhan_vien,	ma_khach_hang,	ma_dich_vu)
values 
