USE [StoreProcedure ]
GO
/****** Object:  StoredProcedure [dbo].[SP_Satis_KayitEkle]    Script Date: 18.06.2024 16:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SP_Satis_KayitEkle](@MID int, @UID int, @SatisAdeti int)
AS
BEGIN
INSERT INTO Satislar(MID,UID,SatisAdeti) VALUES (@MID,@UID,@SatisAdeti)
UPDATE Urunler
SET
Adet=adet - @SatisAdeti
WHERE UrunID=@UID
END