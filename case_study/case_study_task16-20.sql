use quan_ly_resort_furama;

-- Task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

SET SQL_SAFE_UPDATES = 0;
alter table nhan_vien
add column delete_status tinyint default "1";

update nhan_vien
set delete_status = 0
where nv.ma_nhan_vien not in (
                             select hd.ma_nhan_vien
                             from hop_dong hd
                             where year(hd.ngay_lam_hop_dong) between 2019 and 2021
);
select * 
from nhan_vien;
SET SQL_SAFE_UPDATES = 1;

-- Task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

SET SQL_SAFE_UPDATES = 0;
update khach_hang
set ma_loai_khach =1
where ma_khach_hang in (
    select * from (
				select kh.ma_khach_hang
				from khach_hang kh 
                join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
                join dich_vu dv on dv. ma_dich_vu = hd.ma_dich_vu
                join hop_dong_chi_tiet hdct on hdct. ma_hop_dong = hd. ma_hop_dong
                join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
				join loai_khach lk  on  lk.ma_loai_khach = kh.ma_loai_khach
                where year(hd.ngay_lam_hop_dong) = 2021 and lk.ten_loai_khach = "Platinium"
			    group by kh.ma_khach_hang, hd.ma_hop_dong
			    having sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) > 10000000) as BT
             );
SET SQL_SAFE_UPDATES = 1;
select * 
from khach_hang
where ma_loai_khach =1;

-- Task 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET SQL_SAFE_UPDATES = 0;
alter table khach_hang
add delete_status tinyint default "1" ;

update khach_hang
set delete_status = 0 
where khach_hang.ma_khach_hang in (
                                select hd.ma_khach_hang
                                from hop_dong hd
                                where year(hd.ngay_lam_hop_dong) <2021
);
SET SQL_SAFE_UPDATES = 1;
 select * 
 from khach_hang;
 
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia = gia*2
where ma_dich_vu_di_kem in (
	     select ma_dich_vu_di_kem
		 from (
               select dvdk.ma_dich_vu_di_kem, sum(hdct.so_luong) as so_lan_su_dung
               from hop_dong_chi_tiet hdct
               join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
               group by hdct.ma_dich_vu_di_kem 
			   having so_lan_su_dung > 10) as T
);


-- Task 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.)
select ma_nhan_vien as id, ho_ten,email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;