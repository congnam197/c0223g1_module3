create database case_study;
use case_study;
create table vi_tri(
ma_vi_tri int not null  primary key auto_increment,
ten_vi_tri varchar(45));

create table trinh_do(
ma_trinh_do int  primary key auto_increment,
ten_trinh_do varchar(45));

create table bo_phan(
ma_bo_phan int  primary key auto_increment,
ten_bo_phan varchar (45));

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach(
ma_khach_hang int primary key auto_increment,
ten_khach_hang varchar(45));

create table khach_hang(
ma_khach_hang int primary key auto_increment,
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_khach_hang),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong  datetime not null,
ngay_ket_thuc datetime  not null,
tien_dat_coc double not null,
ma_nhan_vien int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table  hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int not null
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(45) not null,
trang_thai varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int,
foreign key (ma_loai_dich_vu) references loai_dich_vu( ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi int,
so_tang int
);

insert into vi_tri(ten_vi_tri)
values ("Lễ Tân"),("Phục Vụ"),("Chuyên Viên"),("Giám Sát"),("Quản Lý"),("Giám Đốc");
insert into trinh_do(ten_trinh_do)
value ("Trung Cấp"),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");
insert into bo_phan(ten_bo_phan)
values ("Sale-Marketing"),("Hành Chính"),("Phục Vụ"),("Quản Lý");

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values 
("Nguyễn Huy Hoàng", 19990225,182357910,100000,0976438592,"huyhoang@gmail,com","Đà Nẵng",1,1,2),
("Nguyễn Hữu Tài ", 20001105,182632910,500000,0947138592,"tainguyen@gmail,com","Nghệ An",2,1,2),
("Trần Khang ", 19610216,12332910,4000000,0387138592,"khang1201@gmail,com","Đà Nẵng",6,4,null),
("Lê Bá Đức ", 19900216,16334910,5000000,0389478592,"leduc162@gmail,com","Đà Nẵng",5,3,4),
("Nguyễn Văn An", 19981016,104334910,343400000,0389428545,"an2012@gmail,com","Đà Nẵng",3,3,2),
("Nguyễn Hải Anh", 19980411,185314934,111199323,0689458545,"anh20411@gmail,com","Quảng Nam",4,4,2),
("Trần Thị Hòa", 19991211,18590345,300000011,08694585321,"hoa1112@gmail,com","Quảng Ngai",null,3,1);

insert into loai_khach(ten_khach_hang)
values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");

insert into khach_hang(ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
values 
(1,"Phạm Công Nam",19970202,1,187324321,0979274983,"namhung024@gmail.com","Nghệ An"),
(2,"Kiệt",19960907,1,187324323,0983274912,"tuankiet96@gmail.com","Gia Lai"),
(3,"Tuấn Hưng",19981013,1,187264711,0903326104,"tuanhung98@gmail.com","Đà Nẵng"),
(4,"Phước Tài",20001023,1,1872004723,0906546156,"sieuem2000@gmail.com","Quảng Trị"),
(4,"Đứ Huy",19980612,1,187200856,0906513432,"hduchuy98@gmail.com","Đà Nẵng");

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values
(20200102,20200501,1200000,1,1,1),
(20200202,20200402,1000000,2,2,2),
(20200430,20200506,1100000,2,4,1),
(20210430,20200505,900000,1,4,2);

insert into hop_dong_chi_tiet(ma_hop_dong,ma_dich_vu_di_kem,so_luong)
values
(33,1,2),
(34,2,3),
(33,2,1);

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai)
values
("massage",500000,"giờ","oke"),
("karaoke",1000000,"giờ","oke"),
("Thức ăn",100000,"món ăn",null),
("Nước uống",10000,"món",null),
("Thuê xe tham quan",120000,"giờ","oke");

insert into loai_dich_vu(ten_loai_dich_vu)
values ("Room"),("Villa"),("House");

insert into kieu_thue(ten_kieu_thue)
values ("giờ"),("ngày"),("tháng"),("năm");

insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang)
values
("dịch vụ vip1",100,40000000,10,2,3,"phòng vip","tivi 4k 100 inch,hồ bơi rộng",30,4),
("dịch vụ vip2",250,2250000,8,2,3,null,"hồ bơi", 30,4);

















