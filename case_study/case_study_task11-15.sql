-- Task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
join  hop_dong_chi_tiet hdct 
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh 
on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk
on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi like "%Vinh%" or kh.dia_chi like "%Quảng Ngãi%");

-- Task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
--  của tất cả các dịch vụ 
--  đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
 hd.ma_hop_dong,
 nv.ho_ten as ho_ten_nhan_vien,
 kh.ho_ten as ho_ten_khach_hang,
 kh.so_dien_thoai,
 dv.ma_dich_vu,
 dv.ten_dich_vu,
 ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem,
 hd.tien_dat_coc
from hop_dong  hd
join nhan_vien  nv
on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang  kh 
on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu  dv 
on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct 
on hd.ma_hop_dong = hdct.ma_hop_dong
where
((quarter(hd.ngay_lam_hop_dong) = 4)
and (year(hd.ngay_lam_hop_dong) = 2020))
and hd.ma_hop_dong not in 
(select ma_hop_dong
from hop_dong 
where (quarter(ngay_lam_hop_dong < 3) 
and year(ngay_lam_hop_dong) = 2021)
)
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

-- Task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view view_so_luong_dich_vu_di_kem as
select
dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct 
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem;
select *
from view_so_luong_dich_vu_di_kem 
where so_luong_dich_vu_di_kem =
(select max(so_luong_dich_vu_di_kem) 
from view_so_luong_dich_vu_di_kem
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hdct.ma_hop_dong,
ldv.ten_loai_dich_vu,
dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where hdct.ma_dich_vu_di_kem in
(
select hdct.ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem)=1
)
group by hdct.ma_dich_vu_di_kem, hd.ma_hop_dong
order by ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
--  mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
nv.ma_nhan_vien,
nv.ho_ten,
td.ten_trinh_do,
bp.ten_bo_phan,
nv.so_dien_thoai,
nv.dia_chi,
count(hd.ma_nhan_vien) as so_luong_hop_dong
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having so_luong_hop_dong <=3;






