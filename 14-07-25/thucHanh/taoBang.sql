create database QuanLyDiemThi;

use QuanLyDiemThi;

create table HocSinh(
	MaHS varchar(20) PRIMARY KEY,
    TenHS varchar(50),
    NgaySinh Datetime,
    Lop varchar(20),
    GT varchar(20)
);

create table MonHoc(
	MaMH varchar(20),
    TenMH varchar(50),
    MaGV varchar(20)
);

alter table MonHoc
	add primary key(MaMH);

create table BangDiem(
	MaHS varchar(20),
    MaMH varchar(20),
    DiemThi int,
    NgayKT datetime,
    primary key(MaHS, MaMH),
    foreign key(MaHS) references HocSinh(MaHS),
    foreign key(MaMH) references MonHoc(MaMH)
);

create table GiaoVien(
	MaGV varchar(20) primary key,
    TenGV varchar(50),
    SDT varchar(10)
);

alter table MonHoc add constraint FK_MaGV foreign key (MaGV) references GiaoVien(MaGV);