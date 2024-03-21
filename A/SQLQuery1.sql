use master
go
if DB_ID('QLLUONG') is not null
drop database QLLUONG
go
create database QLLUONG
go
Use QLLuong
go
Create Table DonVi
(
MaDV char(10) Not Null Primary Key,
TenDV nvarchar(50),
DienThoai char(10)
)
go
Create Table ChucVu
(
MaCV char(10) Not Null Primary Key,
TenCV nvarchar(50) ,
PhuCap real
)
go
Create Table NhanVien
(
MaNV char(10) Not Null Primary Key,
HoTen nvarchar(50),
NgaySinh date ,
GioiTinh bit,
HSLuong real,
TrinhDo nvarchar(20),
MaDV char(10) Not Null,
MaCV char(10) Not Null,
Foreign Key(MaDV) References DonVi(MaDV) On Delete Cascade On Update Cascade,
Foreign Key(MaCV) References ChucVu(MaCV) On Delete Cascade On Update Cascade
)
go
insert into DonVi values('dv1',N'Kinh doanh','0912184465')
insert into DonVi values('dv2',N'Tổ chức','0912184435')
go
insert into ChucVu values('cv1',N'trưởng phòng',500000)
insert into ChucVu values('cv2',N'phó phòng',300000)
insert into ChucVu values('cv3',N'nhân viên',100000)
go
insert into NhanVien values('nv1',N'Lê Thu Hà','12/21/2000',0,3.6,N'đại học','dv1','cv1')
insert into NhanVien values('nv2',N'Trần Minh Đại','08/24/2000',1,3.3,N'đại học','dv1','cv2')
insert into NhanVien values('nv3',N'Lê Thị Vân','09/29/2000',0,4.6,N'thạc sỹ','dv2','cv1')
insert into NhanVien values('nv4',N'Trần Hùng Cường','08/16/2000',1,3.6,N'đại học','dv2','cv2')
insert into NhanVien values('nv5',N'Đỗ Minh Đức','07/20/2000',1,4.6,N'thạc sỹ','dv2','cv3')
insert into NhanVien values('nv6',N'Trần Hùng Cường','06/14/2000',1,3.9,N'đại học','dv1','cv3')
go

create Proc INLUONG
@MaNV char(10),@LUONG real output
as
begin
	set @LUONG = (
		select HSLuong*830000 + PhuCap
		from NhanVien,ChucVu
		where NhanVien.MaCV=ChucVu.MaCV and MaNV = @MaNV
		)
		return @LUONG
	end
Declare @IN int
EXEC INLUONG 'nv1' , @IN output 
select @IN  as 'LUONG'
--cau2
drop proc DSSV
create proc DSSV
@MaDV char(10), @HoTen nvarchar(50)
as
begin
select MaNV,HoTen,NgaySinh,TenDV
from NhanVien,DonVi
where NhanVien.MaDV=DonVi.MaDV 
and NhanVien.MaDV=@MaDV and HoTen = @HoTen 
end
exec DSSV 'dv1' ,'Le Thu Ha'