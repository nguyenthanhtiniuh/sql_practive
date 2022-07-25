USE NTT_PRAC
GO

-- BT03-SQL
-- CREATE TABLE DmNv(
--     Ma_Nv VARCHAR(16),
--     Ten_Nv NVARCHAR(128)
-- )

-- Lập một số chứng từ hoá đơn bán các mặt hàng theo dõi theo
-- doanh.(lập nhiều phiếu nhiều ngày và nhiều đối tượng khác nhau ).

-- 1. Liệt kê ra các mặt hàng thuộc nhóm Hàng Hoá
-- SELECT * FROM MatHang
-- WHERE GROUPTYPE ='HANGHOA'

-- 2. Liệt kê ra các hoá đơn trong tháng 9/2010 (Ngay_Ct, So_Ct, Dien_Giai0, Doanh thu,
-- tiền thuế, Tổng tiền).
-- SELECT * FROM HoaDon 
-- WHERE MONTH(Ngay) = 9 AND YEAR(Ngay) = 2010

-- 3. Liệt kê ra các hoá đơn do NV kinh doanh Nguyễn Văn A bán vào tháng 9/2010.
-- (Ngay_Ct, So_Ct, Ma_CbNv, Ten_CbNv, Tong_Tien)
-- SELECT *
-- FROM HoaDon hd
--     LEFT JOIN DmNv nv
--     ON hd.Manhanvien=nv.Ma_Nv
-- WHERE Ten_Nv='NGUYEN VAN A'
--     AND MONTH(Ngay) = 9 AND YEAR(Ngay)=2010

-- 4. Liệt kê ra 3 mặt hàng bán chạy nhất trong tháng 9/2010. ( nhiều người mua nhất;
-- Ma_Vt, Ten_Vt, Sl_Ban, Tong_Tien).
-- SELECT TOP 3
--     *
-- FROM BanHang
-- WHERE MONTH(Ngay_Ct) = 9 AND YEAR(Ngay_Ct)=2010
-- ORDER BY So_Luong DESC

-- 5. Thống kê doanh số bán hàng của từng nhân viên kinh doanh trong tháng 9/2010 và
-- tổng doanh số của phòng kinh doanh là bao nhiêu. ( 1.5% trên tổng số tiền kí hoá đơn
-- của từng nhân viên).


--THONG KE DOANH SO BAN HANG CUA TUNG NHAN VIEN
-- SELECT MA_NV, SUM(Tien)AS SUMTIEN
-- FROM BanHang
-- WHERE MONTH(Ngay_Ct) = 9 AND YEAR(Ngay_Ct)=2010
-- GROUP BY MA_NV


-- SELECT 0.15*SUM(TIEN) AS TONGDOANHSO_PHONGKINHDOANH
-- FROM BanHang
-- WHERE MONTH(Ngay_Ct) = 9 AND YEAR(Ngay_Ct)=2010



-- 6. Liệt kê các mặt hàng không có người mua trong tháng 9/2010.
--SELECT * FROM BanHang WHERE ISNULL(So_Luong,0)=0

-- 7. Liệt kê ra các nhân viên chờ nghỉ hưu ( nam >=55 và nữ >=50).


-- 8. Tạo một TABLE tạm #tblCt bằng câu lệnh CREATE gồm các field : Ma_Ct,
-- Ngay_ct, So_Ct, Ma_Vt, So_Luong, Don_Gia, Thanh_tien, Ma_Kho, Ma_Dt,
-- Ma_Nx, Ma_Tte kiểu dữ liệu giống như chương trình BRAVO.
DROP TABLE IF EXISTS #TBLCT
CREATE TABLE #tblCt(
    Ma_Ct NVARCHAR(24),
    Ngay_Ct Date,
    So_Ct NVARCHAR(24),
    Ma_Vt NVARCHAR(24),
    So_Luong int,
    Don_Gia NUMERIC(18,2),
    Thanh_Tien NUMERIC(18,2),
    Ma_Kho NVARCHAR(24),
    Ma_Dt NVARCHAR(24),
    Ma_Nx NVARCHAR(24),
    Ma_Tte NVARCHAR(24),
    Ten_Vt NVARCHAR(192),
Ten_Kho NVARCHAR(192),
Ten_Dt NVARCHAR(192)
)
-- 9. INSERT dữ liệu của các chứng từ hoá đơn, chứng từ nhập mua và chi phí vào bản
-- tạm #tblCt.

INSERT into #tblCt(
[Ma_Ct],
[Ngay_Ct],
[Ma_Dt],
Thanh_Tien,
So_Ct,
Ma_Vt,
So_Luong
)
SELECT 
[HoaDon].[Sohd] AS Ma_Ct,
[HoaDon].[Ngay] AS Ngay_Ct,
[HoaDon].[Makhachhang] as Ma_Dt,
[HoaDon].[Tong_Tien] as Thanh_Tien,
[HoaDonChiTiet].[Sohd] as So_Ct,
[HoaDonChiTiet].[MaMatHang] as Ma_Vt,
[HoaDonChiTiet].[SoLuong] as So_Luong
from HoaDon
left JOIN HoaDonChiTiet
on HoaDon.Sohd=HoaDonChiTiet.Sohd


-- 10. Dùng câu truy vấn SQL thêm vào bảng #tblCt các filed Ten_Vt, Ten_Kho, Ten_Dt.
-- ALTER TABLE #tblCt
-- ADD Ten_Vt NVARCHAR(192),
-- Ten_Kho NVARCHAR(192),
-- Ten_Dt NVARCHAR(192)


-- 11. Update dữ liệu cho các field Ten_Vt, Ten_Kho, Ten_Dt của bảng #tblCt.
UPDATE #tblCt
set Ten_Vt =vt.TenMatHang
FROM #tblCt ct
INNER JOIN  MatHang VT
ON ct.Ma_Vt=vt.MaMathang


-- 12. Copy dữ liệu của #tblCt qua #CtHdCopy rồi xoá hết dữ liệu của #tblCt.
DROP TABLE IF EXISTS #cthdcopy
SELECT * into #CtHdCopy
FROM #tblCt

TRUNCATE TABLE #tblCt
-- 13. Thêm vào bảng #tblCt các filed Tk_No, Tk_Co.
ALTER TABLE #CtHdCopy
add CreditAccount NVARCHAR(24) ,
DebitAccount NVARCHAR(24)

-- 14. INSERT dữ liệu của các chứng từ phiếu chi, phiếu thu, báo nợ, báo có vào #tblCt.


-- 15. Xem dữ liệu của 2 bảng và xoá đi 2 bảng tạm.
TRUNCATE TABLE #tblCt
go

TRUNCATE TABLE #CtHdCopy