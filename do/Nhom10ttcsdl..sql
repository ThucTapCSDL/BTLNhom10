--create database nhom10_ttcsdl
go

use TTCSDL
go

-- Cac bang nhóm 1
/****** Object:  Table [dbo].[class] -- lớp nào    Script Date: 5/7/2018 10:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO


CREATE TABLE [dbo].[class](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[teachercode] [varchar](20) NULL,
	[facultycode] [varchar](10) NULL,
	[educationlevelcode] [varchar](10) NULL,
	[educationtypecode] [varchar](10) NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[educationlevel] (bậc học -- cao dang -- )   Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[educationlevel](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[codeview] [varchar](10) NULL,
 CONSTRAINT [PK_educationlevel] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[educationtype] (hình thức đào tạo -- chính quy ...)   Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[educationtype](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[codeview] [varchar](10) NULL,
 CONSTRAINT [PK_educationtype] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[faculty] (khoa)   Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[faculty](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[deancode] [varchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_faculty] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[grade] (khóa )    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grade](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[codeview] [varchar](10) NULL,
 CONSTRAINT [PK_grade] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[student]    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

-- bang Sinh viên

CREATE TABLE [dbo].[student](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[dateofbirth] [datetime] NULL,
	[sex] [int] NULL,
	[email] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[folk] [nvarchar](50) NULL,
	[classcode] [varchar](10) NULL,      -- lơp 
	[educationspecializecode] [varchar](10) NULL,  -- chuyen ngành
	[gradecode] [varchar](10) NULL,                -- khóa k..
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-----------------------------------------
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_educationlevel] FOREIGN KEY([educationlevelcode])
REFERENCES [dbo].[educationlevel] ([code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_educationlevel]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_educationtype] FOREIGN KEY([educationtypecode])
REFERENCES [dbo].[educationtype] ([code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_educationtype]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_faculty] FOREIGN KEY([facultycode])
REFERENCES [dbo].[faculty] ([code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_faculty]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_class] FOREIGN KEY([classcode])
REFERENCES [dbo].[class] ([code])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_class]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_grade] FOREIGN KEY([gradecode])
REFERENCES [dbo].[grade] ([code])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_grade]
GO
USE [master]
GO
GO
---------------------------------------------------------------------------------------------------------------------------------------------

--Nhóm  4
--môn học

CREATE TABLE subject(
	code VARCHAR(10) PRIMARY KEY,
	codeview VARCHAR(20),
	name NVARCHAR(80),
	numberofcredit INT,
	numberoflesson INT,
	numberoftheory INT,
	numberofexercise INT,
	numberofdiscussion INT,
	numberofpractive INT,
	examform NVARCHAR(20),
);
GO

--Bảng lớp học phần
GO

--bảng nghành

CREATE TABLE educationfield(
	code VARCHAR(10) PRIMARY KEY,
	name NVARCHAR(80),
	facultycode VARCHAR(10)
);
GO

--Bảng các chuyên ngành

CREATE TABLE educationspecialize(
	code VARCHAR(10) PRIMARY KEY,
	codeview VARCHAR(20),
	name NVARCHAR(80),
	educationfieldcode VARCHAR(10),
);
GO


-- nhom moon
CREATE TABLE  groupsubject(
	code VARCHAR(10) PRIMARY KEY,
	name NVARCHAR(50)  
	-- bắt buộc toàn trường
	-- tự chọn giáo dục thể chất
	-- bắt buộc cơ sở ngành
	-- tự chọn cơ sở ngành
	-- bắt buộc chuyên ngành
	-- tự chọn chuyên ngành
	-- thực tập + đồ án
	);
GO
--chi tiết đào tạo

CREATE TABLE  trainingdetails(
	subjectcode VARCHAR(10),
	educationspecializecode VARCHAR(10) ,
	semester NVARCHAR(20) , -- hojc ki k1...ki 10
	groupsubjectcode  VARCHAR(10) references groupsubject(code)
	-- thuộc loại môn học nào
)
GO
-- nhom moon


-------------------------------------------------------------------------------------------------------------------------------------------
-- nhóm 9 lay bang diem

CREATE TABLE finalscores
(
	studentcode varchar(10) references student(code), -- sinh viên nào
	subjectcode varchar(10) references subject(code), -- môn học nào
	numberscore float,
	wordscore varchar(10),
	fourscore float,
	constraint Stu_sub primary key (studentcode,subjectcode)
)


--dot tot nghiep
create table graduationperiod
(
	code varchar(10) primary key,
	name nvarchar(30)
)
go

go

-- sinhvien_ dottotnghiep
create table graduatestudent
(
	studentcode varchar(10) references student,--masv
	graduationperiodcode varchar(10) references graduationperiod,--dot xet tn
	result nvarchar(250),--kq
	primary key (studentcode, graduationperiodcode)
)
go

--bang tot nghiep
create table graduation
(
	code varchar(10) primary key,
	studentcode varchar(10) references student,--masv
	registernumber int,--so vao so
	classification varchar(20),--xep loai(gioi, kha,..)
	yearofgraduation int ,-- nam tot nghiep
	reciever nvarchar(50),--ng nhan
	recieveridnumber varchar(12), --chung minh thu ng nhan
	recieveddate date,-- ngay nhan
	receiptcode varchar(10)--so trong so ki nhan bang
)
GO

------------------------------------------------------------------------------------------------------------------------------------
--Group 11 tables


-- bảng hạnh kiểm
create table conduct(  
	studentcode varchar(10) references student(code),
	score1 int,
	score2 int,
	score3 int,
	score4 int,
	markconduct int,
	classify varchar(50),
	primary key (studentcode),
)
go

---------------------------------------------------------------------------------------------------------------------------------------
delete student
------------------het-------------hét----------------het-----------------------------------------
--- csdl nhóm 1
declare  @i int =1
while @i<=5
begin
	insert student (code, name,[educationspecializecode]) values (N'SV'+cast(@i as nvarchar(20)), N'Sinh vien '+cast(@i as nvarchar(20)), '001-001') 
	set @i = @i+1
end
go
declare  @i int =1
while @i<=5
begin
	insert conduct(studentcode , classify) values (N'SV'+cast(@i as nvarchar(20)), 'Tốt') 
	set @i = @i+1
end
 go
--- csdl nhóm 10
-- dữ liệu bảng đợt tn
insert into graduationperiod
values
( 'PE000001', '5/2014'),
( 'PE000002', '10/2014'),
( 'PE000003', '5/2015'),
( 'PE000004', '10/2015'),
( 'PE000005', '5/2016'),
( 'PE000006', '10/2016'),
( 'PE000007', '5/2017'),
( 'PE000008', '10/2017'),
( 'PE000009', '5/2018')

---
insert into groupsubject(code,name)
values ('001',N'Quốc Phòng'),
       ('002',N'Thể dục bắt buộc'),
	   ('003',N'Thể dục tự chọn'),
	   ('004',N'Môn chung toàn trường'),
	   ('005',N'Cơ sở ngành bắt buộc'),
	   ('006',N'Cơ sở ngành tự chọn'),
	   ('007',N'Chuyên ngành bắt buộc'),
	   ('008',N'Chuyên ngành tự chọn'),
	   ('009',N'Thực tập + đồ án')

go
insert into subject(code,name,numberofcredit)
values
-- group 004
('004-001',N'Giải tích 1',4),
('004-002',N'Giải tích 2',3),
('004-003',N'Vật lý 1',4),
('004-004',N'Vật lý 2',4),
-- group 001
('001-001',N'Quốc phong 1',2),
('001-002',N'Quốc phong 2',2),
('001-003',N'Quốc phong 3',3),
-- group 002
('002-001',N'Giao duc the chat 1',1),
-- group 003
('003-001',N'Bóng chuyền',1),
('003-002',N'Cầu lông',1),
('003-003',N'Chạy bền',1),
('003-004',N'Bóng bàn',1),
('003-005',N'Nhảy xa',1),
-- group 005
('005-001',N'Ngôn ngữ lập trình 1',3),
('005-002',N'Ngôn ngữ lập trình 2',2),
('005-003',N'Lập trình hướng đối tượng',3),
('005-004',N'Cơ sở dữ liệu',3),
('005-005',N'Đạo đức nghệ nghiệp',3),
('005-006',N'Công nghệ web',3),
-- group 006
('006-001',N'Kinh tế công nghiệp',2),
('006-002',N'Điện tử số',2),
('006-003',N'Kĩ Thuật vử lí',2),
('006-004',N'Mạng viễn thông',2),
-- group 007
('007-001',N'attt-chuyên ngành 1',2),
('007-002',N'attt-chuyên ngành 2',2),
('007-003',N'attt-chuyên ngành 3',2),
('007-004',N'attt-chuyên ngành 4',2),

-- group 008
('008-001',N'attt-tự chọn chuyên ngành 1',2),
('008-002',N'attt-tự chọn chuyên ngành 2',2),
('008-003',N'attt-tự chọn chuyên ngành 3',2),
('008-004',N'attt-tự chọn chuyên ngành 4',2),
-- group 009
('009-001',N'Thực tập KTLT',3),
('009-002',N'Thực tập csdl',3),
('009-003',N'Thực tập nhóm',3),
('009-004',N'thực tập công nghiệp',3),
('009-009',N'đồ án ra trường',6)

go
select * from [faculty]
go

select * from educationfield

-- insert bảng ngành
insert into educationfield (code, name, facultycode)
values
-- khoa 001 cntt
 ('001-001',N'Công nghệ thông tin','001'),
 ('001-002',N'Kĩ thuật phần mềm','001'),
 ('001-003',N'Hệ thống thông tin','001'),
 ('001-004',N'Khoa học máy tính','001'),
 ('001-005',N'Mạng máy tính','001')

 -- insert bảng chuyên ngành

 insert into educationspecialize(code, name, educationfieldcode)
 values
-- khoa 001 cntt
 ('001-001',N'An toàn thông tin','001-001'),
 ('001-002',N'Công nghệ dữ liệu','001-001'),
 ('001-003',N'Chuyên ngành của KTPM','001-002'),
 ('001-004',N'Chuyên ngành của HTTT','001-003'),
 ('001-005',N'Chuyên ngành của KHMT','001-004'),
 ('001-006',N'Chuyên ngành của MMT','001-005')

 select * from student 
 insert into finalscores(studentcode, subjectcode,fourscore)
 values 
 ('SV1','001-001',3.2),
 ('SV1','001-002',3.2),
 ('SV1','001-003',3.2),
 ('SV1','002-001',3.2),
 ('SV1','003-001',3.2),
 ('SV1','003-002',3.2),
 ('SV1','004-001',3.2),
 ('SV1','004-002',3.2),
 ('SV1','004-003',3.2),
 ('SV1','004-004',3.2),
 ('SV1','005-001',3.2),
 ('SV1','005-002',3.2),
 ('SV1','005-003',3.2),
 ('SV1','005-004',3.2),
 ('SV1','005-005',3.2),
 ('SV1','005-006',3.2),
 ('SV1','006-001',3.2),
 ('SV1','006-002',3.2),
 ('SV1','006-003',3.2),
 ('SV1','007-001',3.2),
 ('SV1','007-002',3.2),
 ('SV1','007-003',3.2),
 ('SV1','007-004',3.2),
 ('SV1','008-001',3.2),
 ('SV1','008-002',3.2),
 ('SV1','008-003',3.2),
 ('SV1','009-001',3.2),
 ('SV1','009-002',3.2),
 ('SV1','009-003',3.2)

 insert trainingdetails(educationspecializecode,subjectcode,groupsubjectcode)
  values
-- khoa 001 cntt
 ('001-001','001-001','001'),
 ('001-001','001-002','001'),
 ('001-001','001-003','001'),
 ('001-001','002-001','002'),
 ('001-001','003-001','003'),
 ('001-001','003-002','003'),
 ('001-001','003-003','003'),
 ('001-001','003-004','003'),
 ('001-001','003-005','003'),

 ('001-001','004-001','004'),
 ('001-001','004-002','004'),
 ('001-001','004-003','004'),
 ('001-001','004-004','004'),
 ('001-001','005-001','005'),
 ('001-001','005-002','005'),
 ('001-001','005-003','005'),
 ('001-001','005-004','005'),
 ('001-001','005-005','005'),
 ('001-001','005-006','005'),
 ('001-001','006-001','006'),
 ('001-001','006-002','006'),
 ('001-001','006-003','006'),
 ('001-001','006-004','006'),
 ('001-001','007-001','007'),
 ('001-001','007-002','007'),
 ('001-001','007-003','007'),
 ('001-001','007-004','007'),
 ('001-001','008-001','008'),
 ('001-001','008-002','008'),
 ('001-001','008-003','008'),
  ('001-001','008-004','008'),
 ('001-001','009-001','009'),
 ('001-001','009-002','009'),
 ('001-001','009-003','009'),
 ('001-001','009-004','009'),
 ('001-001','009-009','009')


-- hàm tính điểm trung bình của sinh viên (chi lấy những môn tính vào điểm trung bình)


-- hàm tính tổng số tín chỉ
go
create function TongTinChi(@codestudent varchar(10)) RETURNS int
as begin
	declare @tong int
	select @tong= SUM(sub.numberofcredit) from finalscores fs
						join student stu on stu.code=fs.studentcode
						join subject sub on sub.code=fs.subjectcode
						where stu.code=@codestudent
	return @tong
end
go

print dbo.TongTinChi('SV1')

-- hàm tính tổng số tín tự chọn loại a

go
create function TongTinChiLoaiHP(@codestudent varchar(10),@groupsubjectcode varchar(10)) RETURNS int
as begin
	declare @tong int
	select   @tong= SUM(sub.numberofcredit) from finalscores fs
						join student stu on stu.code=fs.studentcode
						join subject sub on sub.code=fs.subjectcode
						join trainingdetails tra on tra.subjectcode=sub.code
						where stu.code=@codestudent and tra.groupsubjectcode=@groupsubjectcode
	return @tong
end

print dbo.TongTinChiLoaiHP('SV1','001')
-- hàm .....


----------------------------------

-- ham tính điểm trung bình của sinh viên (chỉ tính những môn tính vào điểm trung bình)

select * from trainingdetails
create function DiemTrungBinh(@codestudent varchar(10)) RETURNS float
as begin
	declare @diemTB float
	declare @TongDiem float
	declare @TongTinHP int    -- tông số tín chỉ các học phần đươc tính
	select   @TongTinHP= SUM(sub.numberofcredit) from finalscores fs
						join student stu on stu.code=fs.studentcode
						join subject sub on sub.code=fs.subjectcode
						join trainingdetails tra on tra.subjectcode=sub.code
						where stu.code=@codestudent and (tra.groupsubjectcode  <>'001' or tra.groupsubjectcode <>'002')

	

	select   @Tongdiem= SUM(fs.fourscore * sub.numberofcredit) from finalscores fs
						join student stu on stu.code=fs.studentcode
						join subject sub on sub.code=fs.subjectcode
						join trainingdetails tra on tra.subjectcode=sub.code
						where stu.code=@codestudent and (tra.groupsubjectcode  <>'001' or tra.groupsubjectcode <>'002')

	set @diemTB =@TongDiem / @TongTinHP
	return @diemTB
end

print dbo.DiemTrungBinh('SV1')


go
-- tao view hien thị các tiêu chí xét tốt nghiệp của sinh viên
create view view_ChiTietTieuChiSinhVien
as
select sv.name as code, sv.dateofbirth as dateofbirth ,sv.sex as sex ,
	   khoa.name as gradename,
	   chuyennganh.name as educationspecializename,
	   lop.name as classname,	
	   bachoc.name as educationlevelname,
	   hinhthuc.name as educationtypename,
	   dbo.TongTinChi(sv.code) as TongTinChi,
	   dbo.DiemTrungBinh(sv.code) as DiemTrungBinh,
	   hanhkiem.classify as conductname,
	   dbo.TongTinChiLoaiHP(sv.code,'001') as SoTinQuocPhong,  -- so tin quoc phong
	   dbo.TongTinChiLoaiHP(sv.code,'002') as SoTinTheDuc,  -- so tin chi the duc
	   dbo.TongTinChiLoaiHP(sv.code,'003') as SOTinTheDucTuChon,  -- so tin chi the duc tu chon
	   dbo.TongTinChiLoaiHP(sv.code,'006') as SoTinTuChonCoSoNganh,   -- tong so tin chi so so nganh tự chon  
	   dbo.TongTinChiLoaiHP(sv.code,'008') as SoTinTuChonChuyenNganh



from student sv
	join grade khoa on sv.gradecode=khoa.code
	join educationspecialize chuyennganh on sv.educationspecializecode=chuyennganh.code
	join class lop on sv.classcode= lop.code
	join educationlevel bachoc on bachoc.code= lop.educationlevelcode
	join educationtype hinhthuc on lop.educationtypecode= hinhthuc.code
	join conduct hanhkiem on hanhkiem.studentcode= sv.code

where sv.code= ''



	select * from view_ChiTietTieuChiSinhVien

-- cập nhật kết quả

-- insert bảng bằng 


-- tạo view hiển thị bảng điểm

----------------------------------------------------


-- test

select sv.name as code, sv.dateofbirth as dateofbirth ,sv.sex as sex ,
	   khoa.name as gradename,
	   chuyennganh.name as educationspecializename,
   lop.name as classname,	
	   bachoc.name as educationlevelname,
	   hinhthuc.name as educationtypename,
	   dbo.TongTinChi(sv.code) as TongTinChi,
	   dbo.DiemTrungBinh(sv.code) as DiemTrungBinh,
	   hanhkiem.classify as conductname,
	   dbo.TongTinChiLoaiHP(sv.code,'001') as SoTinQuocPhong,  -- so tin quoc phong
	   dbo.TongTinChiLoaiHP(sv.code,'002') as SoTinTheDuc,  -- so tin chi the duc
	   dbo.TongTinChiLoaiHP(sv.code,'003') as SOTinTheDucTuChon,  -- so tin chi the duc tu chon
	   dbo.TongTinChiLoaiHP(sv.code,'006') as SoTinTuChonCoSoNganh,   -- tong so tin chi so so nganh tự chon  
	   dbo.TongTinChiLoaiHP(sv.code,'008') as SoTinTuChonChuyenNganh



from student sv
	join grade khoa on sv.gradecode=khoa.code
	join educationspecialize chuyennganh on sv.educationspecializecode=chuyennganh.code
	join class lop on sv.classcode= lop.code
	join educationlevel bachoc on bachoc.code= lop.educationlevelcode
	join educationtype hinhthuc on lop.educationtypecode= hinhthuc.code
	join conduct hanhkiem on hanhkiem.studentcode= sv.code

where sv.code= 'SV1'











