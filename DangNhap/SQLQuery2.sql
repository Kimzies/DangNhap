create database MB   
use MB
------------ CREATE TABLE ----------------------------------------------------------
-- 0. TABLE TAI KHOAN
CREATE TABLE TAIKHOAN (
	TenDangNhap VARCHAR(20) UNIQUE NOT NULL,
	MatKhau VARCHAR(20)
	CONSTRAINT PK_TAIKHOAN PRIMARY KEY (TenDangNhap)
)

INSERT INTO TAIKHOAN VALUES 
('VLHKIM', '1234')

-- 1. TABLE CHUYEN BAY
CREATE TABLE CHUYENBAY (
	MaChuyenBay VARCHAR(10)	NOT NULL,
	MaTuyenBay VARCHAR(10),
	NgayGio SMALLDATETIME,
	ThoiGianBay INT,
	SoLuongGheHang1 INT,
	SoLuongGheHang2 INT,
	CONSTRAINT PK_CHUYENBAY PRIMARY KEY (MaChuyenBay)
)

-- 2. TABLE TUYEN BAY
CREATE TABLE TUYENBAY (
	MaTuyenBay VARCHAR(10) NOT NULL,
	SanBayDi VARCHAR(10),
	SanBayDen VARCHAR(10),
	CONSTRAINT PK_TUYENBAY PRIMARY KEY (MaTuyenBay)
)

-- 3. TABLE CHI TIET CHUYEN BAY
CREATE TABLE CTCHUYENBAY (
	MaCTChuyenBay VARCHAR(10) NOT NULL,
	MaChuyenBay VARCHAR(10),
	SanBayTrungGian VARCHAR(10),
	ThoiGianDung INT,
	GhiChu NVARCHAR(100),
	CONSTRAINT PK_CTCHUYENBAY PRIMARY KEY (MaCTChuyenBay)
)


-- 4. TABLE TINH TRANG VE
CREATE TABLE TINHTRANGVE (
	MaTinhTrangVe VARCHAR(10) NOT NULL,
	MaChuyenBay VARCHAR(10),
	MaHangVe VARCHAR(10),
	SoGheTrong INT,
	SoGheDat INT,
	CONSTRAINT PK_TINHTRANGVE PRIMARY KEY (MaTinhTrangVe)
)

-- 5. TABLE DON GIA
CREATE TABLE DONGIA (
	MaDonGia VARCHAR(10) NOT NULL,
	MaChuyenBay VARCHAR(10),
	DonGia FLOAT,
	CONSTRAINT PK_DONGIA PRIMARY KEY (MaDonGia)
)

-- 6. TABLE SAN BAY
CREATE TABLE SANBAY (
	MaSanBay VARCHAR(10) NOT NULL,
	TenSanBay NVARCHAR(50),
	CONSTRAINT PK_SANBAY PRIMARY KEY (MaSanBay)
)

-- 7. TABLE HANH KHACH 
CREATE TABLE HANHKHACH (
	MaHanhKhach VARCHAR(10) NOT NULL,
	TenHanhKhach NVARCHAR(50),
	CMND VARCHAR(12),
	DienThoai VARCHAR(10),
	CONSTRAINT PK_HANHKHACH PRIMARY KEY (MaHanhKhach)
)

-- 8. TABLE VE CHUYEN BAY
CREATE TABLE VECHUYENBAY (
	MaVe VARCHAR(10) NOT NULL,
	MaChuyenBay VARCHAR(10),
	MaHangVe VARCHAR(10),
	MaHanhKhach VARCHAR(10),
	GiaTien FLOAT,
	CONSTRAINT PK_VECHUYENBAY PRIMARY KEY (MaVe)
)

-- 9. TABLE HANG VE
CREATE TABLE HANGVE (
	MaHangVe VARCHAR(10) NOT NULL,
	TenHangVe NVARCHAR(50),
	CONSTRAINT PK_HANGVE PRIMARY KEY (MaHangVe)
)

-- 10. TABLE CT_DOANHTHUTHANG
CREATE TABLE CT_DOANHTHUTHANG (
	MaCTDTThang VARCHAR(10) NOT NULL,
	MaDoanhThuThang VARCHAR(10),
	MaChuyenBay VARCHAR(10),
	SoVe INT,
	TyLe FLOAT,
	DoanhThu FLOAT,
	CONSTRAINT PK_CTDOANHTHUTHANG PRIMARY KEY (MaCTDTThang)
)

-- 11. TABLE DOANH THU THANG
CREATE TABLE DOANHTHUTHANG (
	MaDoanhThuThang VARCHAR(10) NOT NULL,
	Thang INT,
	MaDoanhThuNam VARCHAR(10),
	SoChuyenBay INT,
	TyLe FLOAT,
	TongDoanhThuThang FLOAT,
	CONSTRAINT PK_DOANHTHUTHANG PRIMARY KEY (MaDoanhThuThang)
)

-- 12. TABLE DOANH THU NAM
CREATE TABLE DOANHTHUNAM (
	MaDoanhThuNam VARCHAR(10) NOT NULL,
	Nam	INT,
	TongDoanhThuNam FLOAT,
	CONSTRAINT PK_DOANHTHUNAM PRIMARY KEY (MaDoanhThuNam)
)

-- 13. TABLE PHIEU DAT CHO
CREATE TABLE PHIEUDATCHO (
	MaPhieuDat VARCHAR(10) NOT NULL,
	MaChuyenBay VARCHAR(10),
	MaHanhKhach VARCHAR(10),
	MaHangVe VARCHAR(10),
	GiaTien FLOAT,
	NgayDat SMALLDATETIME,
	CONSTRAINT PK_PHIEUDATCHO PRIMARY KEY (MaPhieuDat)
)

-- 14. TABLE THAM SO
CREATE TABLE THAMSO (
	TGBayToiThieu INT,
	SoSanBayTrungGianToiDa INT,
	TGDungToiThieu INT,
	TGDungToiDa INT,
	TGChamNhatDatVe INT,
	TGChamNhatHuyVe INT
)

-------------------- CREATE FOREIGN KEY ----------------------------------------------
ALTER TABLE TINHTRANGVE ADD CONSTRAINT FK_TINHTRANGVE_CHUYENBAY FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE VECHUYENBAY ADD CONSTRAINT FK_VECHUYENBAY_CHUYENBAY FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PHIEUDATCHO_CHUYENBAY FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE CT_DOANHTHUTHANG ADD CONSTRAINT FK_CTDOANHTHUTHANG_CHUYENBAY FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE CTCHUYENBAY ADD CONSTRAINT FK_CTCHUYENBAY_CHUYENBAY FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)

ALTER TABLE TUYENBAY ADD CONSTRAINT FK_TUYENBAYSANBAYDI_SANBAY FOREIGN KEY (SanBayDi) REFERENCES SANBAY(MaSanBay)
ALTER TABLE TUYENBAY ADD CONSTRAINT FK_TUYENBAYSANBAYDEN_SANBAY FOREIGN KEY (SanBayDen) REFERENCES SANBAY(MaSanBay)

ALTER TABLE CHUYENBAY ADD CONSTRAINT FK_CHUYENBAY_TUYENBAY FOREIGN KEY (MaTuyenBay) REFERENCES TUYENBAY(MaTuyenBay)
ALTER TABLE DONGIA ADD CONSTRAINT FK_DONGIA_CHUYENBAY FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)




ALTER TABLE TINHTRANGVE ADD CONSTRAINT FK_TINHTRANGVE_HANGVE FOREIGN KEY (MaHangVe) REFERENCES HANGVE(MaHangVe)
ALTER TABLE VECHUYENBAY ADD CONSTRAINT FK_VECHUYENBAY_HANGVE FOREIGN KEY (MaHangVe) REFERENCES HANGVE(MaHangVe)
ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PHIEUDATCHO_HANGVE FOREIGN KEY (MaHangVe) REFERENCES HANGVE(MaHangVe)

ALTER TABLE VECHUYENBAY ADD CONSTRAINT FK_VECHUYENBAY_HANHKHACH FOREIGN KEY (MaHanhKhach) REFERENCES HANHKHACH(MaHanhKhach)
ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PHIEUDATCHO_HANHKHACH FOREIGN KEY (MaHanhKhach) REFERENCES HANHKHACH(MaHanhKhach)

ALTER TABLE DOANHTHUTHANG ADD CONSTRAINT FK_DOANHTHUTHANG_DOANHTHUNAM FOREIGN KEY (MaDoanhThuNam) REFERENCES DOANHTHUNAM(MaDoanhThuNam)
ALTER TABLE CT_DOANHTHUTHANG ADD CONSTRAINT FK_CTDOANHTHUTHANG_DOANHTHUTHANG FOREIGN KEY (MaDoanhThuThang) REFERENCES DOANHTHUTHANG(MaDoanhThuThang)


-------- CREATE TRIGGER ------------------
---- QD1: 
-- THOI GIAN BAY TOI THIEU 30P
IF OBJECT_ID('UTR_TGBayToiThieu') IS NOT NULL
	DROP TRIGGER UTR_TGBayToiThieu

CREATE TRIGGER UTR_TGBayToiThieu ON CHUYENBAY
FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE(ThoiGianBay)
	IF NOT EXISTS (SELECT * FROM inserted WHERE ThoiGianBay >= 30)
			BEGIN
				PRINT N'L?i th�m, s?a kh�ng h?p l?.'
				ROLLBACK TRANSACTION
			END
END
GO 
-- CO TOI DA 2 SAN BAY TRUNG GIAN
IF OBJECT_ID('UTR_SoSanBayTrungGianToiDa') IS NOT NULL
	DROP TRIGGER UTR_SoSanBayTrungGianToiDa

CREATE TRIGGER UTR_SoSanBayTrungGianToiDa ON CTCHUYENBAY
FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE(SanBayTrungGian)
	IF EXISTS (SELECT MaChuyenBay FROM inserted 
		GROUP BY MaChuyenBay
		HAVING COUNT(SanBayTrungGian) > 2)
			BEGIN
				PRINT N'L?i th�m, s?a kh�ng h?p l?.'
				ROLLBACK TRANSACTION
			END
END
GO 
-- THOI GIAN DUNG TOI THIEU 10P
IF OBJECT_ID('UTR_TGDungToiThieu') IS NOT NULL
	DROP TRIGGER UTR_TGDungToiThieu

CREATE TRIGGER UTR_TGDungToiThieu ON CTCHUYENBAY
FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE(ThoiGianDung)
	IF EXISTS (SELECT * FROM inserted WHERE ThoiGianDung < 10)
	BEGIN
		PRINT N'L?i th�m, s?a kh�ng h?p l?.'
		ROLLBACK TRANSACTION
	END
END
GO 
-- THOI GIAN DUNG TOI DA 20P
IF OBJECT_ID('UTR_TGDungToiDa') IS NOT NULL
	DROP TRIGGER UTR_TGDungToiDa

CREATE TRIGGER UTR_TGDungToiDa ON CTCHUYENBAY
FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE(ThoiGianDung)
	IF EXISTS (SELECT * FROM inserted WHERE ThoiGianDung > 20)
	BEGIN
		PRINT N'L?i th�m, s?a kh�ng h?p l?.'
		ROLLBACK TRANSACTION
	END
END
GO 

---- QD2: 
-- CHI BAN VE KHI CON CHO
IF OBJECT_ID('UTR_BanVeKhiConCho') IS NOT NULL
	DROP TRIGGER UTR_BanVeKhiConCho

CREATE TRIGGER UTR_BanVeKhiConCho ON TINHTRANGVE
FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE(SoGheTrong)
	IF EXISTS (SELECT * FROM inserted
				WHERE SoGheTrong = 0)
	BEGIN
		PRINT N'?� h?t gh?.'
		ROLLBACK TRANSACTION
	END
END
GO 
---- QD3: 
-- CHI CHO DAT VE CHAM NHAT 1 NGAY TRUOC KHI KHOI HANH
IF OBJECT_ID('UTR_DatVeHopLe') IS NOT NULL
	DROP TRIGGER UTR_DatVeHopLe

CREATE TRIGGER UTR_DatVeHopLe ON PHIEUDATCHO
FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE(NgayDat)
	IF EXISTS (SELECT I.* FROM inserted I INNER JOIN CHUYENBAY CB
				ON CB.MaChuyenBay = I.MaChuyenBay
				WHERE DATEDIFF(DAY,I.NgayDat,CB.NgayGio) < 1)
	BEGIN
		PRINT N'Th?i gian ??t v� kh�ng h?p l?.'
		ROLLBACK TRANSACTION
	END
END
GO 
-- VE HANG 1 = 105% DON GIA, VE HANG 2 = DON GIA
-- VAO NGAY KHOI HANH TAT CA VE SE BI HUY
IF OBJECT_ID('UTR_HuyVe') IS NOT NULL
	DROP TRIGGER UTR_HuyVe

CREATE TRIGGER UTR_HuyVe ON PHIEUDATCHO
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @NgayHienTai DATETIME;
    SET @NgayHienTai = GETDATE();
	IF EXISTS (SELECT I.* FROM inserted I INNER JOIN CHUYENBAY CB
				ON CB.MaChuyenBay = I.MaChuyenBay
				WHERE DATEDIFF(DAY,@NgayHienTai,CB.NgayGio) <= 1)
	BEGIN
		PRINT N'T?t c? v� ?� b? h?y.'
		ROLLBACK TRANSACTION
	END
END
GO 

CREATE PROC [dbo].[USP_DangNhap]
@TenDangNhap varchar(20), @MatKhau varchar(20)
AS
BEGIN
	SELECT * FROM TAIKHOAN WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau
END
GO

create procedure [dbo].[DoiMK]
	@TenDangNhap varchar(20),
	@MatKhauMoi varchar(20)
AS
BEGIN
	UPDATE TAIKHOAN
	SET MatKhau = @MatKhauMoi 
	WHERE TenDangNhap = @TenDangNhap 
END
GO




---- QD6:
-- THAY DOI SO LUONG SAN BAY, THOI GIAN BAY TOI THIEU, SO SAN BAY TRUNG GIAN TOI DA, THOI GIAN DUNG TOI THIEU/TOI DA

-- THAY DOI SO LUONG CAC HANG VE

-- THAY DOI THOI GIAN CHAM NHAT DAT VE, THOI GIAN HUY DAT VE

-- KHI 1 VE DUOC DAT THI TU CAP NHAT DOANH THU
/*CREATE TRIGGER TRG_DOANHTHU ON VECHUYENBAY
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE @MaCTDTThang VARCHAR(10), @MaDTThang VARCHAR(10), @MaChuyenBay VARCHAR(10), @NgayDat SMALLDATETIME, @GiaTien FLOAT, @TyLe FLOAT, @TongTien FLOAT, @DoanhThu FLOAT
	SELECT @MaChuyenBay = MaChuyenBay, @GiaTien = GiaTien
	FROM inserted
	SELECT @NgayDat = NgayGio FROM CHUYENBAY
	WHERE MaChuyenBay = @MaChuyenBay
	IF (NOT EXISTS (SELECT * FROM CT_DOANHTHUTHANG CT INNER JOIN DOANHTHUTHANG DT
	ON CT.MaDTThang = DT.MaDoanhThuThang
	WHERE Thang = MONTH(@NgayDat)))
	BEGIN
		INSERT INTO CT_DOANHTHUTHANG(MaCTDTThang, MaDTThang, MaChuyenBay, SoVe, TyLe, DoanhThu) VALUES (@MaCTDTThang,@MaDTThang,@MaChuyenBay,1,100,@GiaTien)
	END
END*/

-- CAP NHAT DOANH THU THANG KHI CAP NHAT CHI TIET DTT
CREATE TRIGGER UD_DTT ON CT_DOANHTHUTHANG
FOR UPDATE
AS
BEGIN
	DECLARE @Thang INT = (SELECT 