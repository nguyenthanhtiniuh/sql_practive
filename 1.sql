USE NTT_PRAC
GO

-- 1. Tạo các bảng dữ liệu sau:
-- 1.1 DmVt(Ma_Vt VARCHAR(16), Ten_Vt NVARCHAR(128)
-- 1.2 DmDt(Ma_Dt VARCHAR(16), Ten_Dt NVARCHAR(128)
-- 1.3 BanHang(Ngay_Ct SmallDateTime, So_Ct VARCHAR(20), Ma_Dt
-- VARCHAR(16), Ma_Vt VARCHAR(16), So_Luong NUMERIC(18,2),
-- Tien NUMERIC(18))
-- 2. Truy vấn các câu sau:
-- 2.1 Tìm các khách hàng có số lượng mua hàng nhiều nhất trong
-- khoảng thời gian từ ‘01/01/2013’ đến ‘31/01/2013’
UPDATE BanHang 
SET 
--DON_GIA =10000,
Tien =So_Luong*DON_GIA

SELECT * FROM BANHANG
WHERE So_Luong = (SELECT MAX(So_Luong) FROM BanHang WHERE Ngay_Ct BETWEEN '20130101' AND '20130131')


-- 2.2 Tìm 10 khách hàng có doanh số bán nhiều nhất trong khoảng
-- thời gian từ ‘01/01/2013’ đến ‘31/01/2013’
SELECT TOP 10 * FROM BanHang
ORDER BY TIEN DESC
--WHERE Tien = (SELECT MAX(TIEN) FROM BanHang WHERE Ngay_Ct BETWEEN '20130101' AND '20130131')
-- 2.3 Tìm mặt hàng nào bán chạy nhất trong khoảng thời gian từ
-- ‘01/01/2013’ đến ‘31/01/2013’
SELECT Ma_Vt FROM BanHang
WHERE So_Luong = (SELECT MAX(So_Luong) FROM BanHang WHERE Ngay_Ct BETWEEN '20130101' AND '20130131')



-- CREATE TABLE DmVt(
--     Ma_Vt VARCHAR(16),
--     Ten_Vt NVARCHAR(128)
-- )

-- CREATE TABLE DmDt(
--     Ma_Dt VARCHAR(16),
--     Ten_Dt NVARCHAR(128)
-- )

-- CREATE TABLE BanHang(
--     Ngay_Ct DATE,
--     So_Ct VARCHAR(20),
--     Ma_Dt VARCHAR(16),
--     Ma_Vt VARCHAR(16),
--     So_Luong NUMERIC(18,2),
--     Tien NUMERIC(18,2)    
-- )

-- UPDATE BANHANG
-- SET Ngay_Ct = '20130102'




