create database quan_ly_dich_vu_may_tinh;
use quan_ly_dich_vu_may_tinh;

create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45),
gia double
);

create table may_tinh(
ma_may_tinh int primary key auto_increment,
hang_san_xuat varchar(40),
vi_tri_dat_may varchar(20),
ma_loai_dich_vu int,
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

create table loai_khach_hang(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(40)
);

create table khach_hang (
ma_khach_hang int primary key auto_increment,
ten_khach_hang varchar(40),
email varchar(40),
cccd varchar(15),
so_dien_thoai varchar(10),
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach_hang(ma_loai_khach)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(40),
don_gia double,
don_vi varchar(20)
);

create table hoa_don_chi_tiet (
ma_hoa_don_chi_tiet int primary key auto_increment,
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong_dich_vu_di_kem int
);

create table hoa_don(
ma_hoa_don int primary key auto_increment,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
ma_khach_hang int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
ma_may_tinh int,
foreign key (ma_may_tinh) references may_tinh(ma_may_tinh),
ma_hoa_don_chi_tiet int,
foreign key (ma_hoa_don_chi_tiet) references hoa_don_chi_tiet(ma_hoa_don_chi_tiet)
);


