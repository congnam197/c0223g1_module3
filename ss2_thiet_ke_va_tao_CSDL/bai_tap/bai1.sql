create database bai2_bai_tap1;

use bai2_bai_tap1;

create table phieu_xuat(
so_px int not null auto_increment primary key,
ngay_xuat datetime not null
);

create table vat_tu(
ma_vtu int not null auto_increment primary key,
ten_vtu varchar (30)
);

create table phieu_nhap(
so_pn int not null auto_increment primary key,
ngay_nhap datetime not null
);

 create table don_dh(
 so_dh int not null auto_increment primary key,
 ngay_dh datetime,
 ma_ncc int,
 foreign key (ma_ncc) references nha_cc(ma_ncc)
 );
  
  create table nha_cc(
  ma_ncc int not null auto_increment primary key,
  ten_ncc varchar (30) not null,
  dia_chi varchar(40)
  );

  create table chi_tiet_phieu_xuat(
don_gia double not null,
so_luong int,
ma_vtu int,
so_px int,
primary key (ma_vtu,so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key (so_px) references phieu_xuat(so_px)
);

create table chi_tiet_phieu_nhap(
dg_nhap double not null,
sl_nhap int not null,
ma_vtu int,
so_pn int ,
primary key (ma_vtu, so_pn),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
 
 create table chi_tiet_don_dat_hang(
 ma_vtu int,
 so_dh int,
 primary key(ma_vtu,so_dh),
 foreign key (ma_vtu) references vat_tu(ma_vtu),
 foreign key (so_dh) references don_dh(so_dh)
 );
 
create table so_dien_thoai(
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc),
sdt varchar(10) primary key
);