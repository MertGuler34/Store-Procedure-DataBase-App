USE [StoreProcedure]
GO

/****** Object: StoredProcedure [dbo].[SP_Satis_KayitDuzenle] Script Date: 19.06.2024 19:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_Satis_KayitDuzenle]
    @SatisID int,
    @MID int,
    @UID int,
    @SatisAdeti int
AS
BEGIN
    DECLARE @SuankiUrunAdeti int, @OncedenSatilmisAdet int;

    -- Belirli bir satış ID için mevcut ürün adedini al
    SELECT @SuankiUrunAdeti = Adet FROM Urunler WHERE UrunID = @UID;

    -- Belirli bir satış ID için önceden satılmış adedi al
    SELECT @OncedenSatilmisAdet = SatisAdeti FROM Satislar WHERE SatisID = @SatisID;

    IF @SatisAdeti > @OncedenSatilmisAdet
    BEGIN
        -- Satış adedi artırıldığında stoktan düşme işlemi
        UPDATE Urunler
        SET Adet = Adet - (@SatisAdeti - @OncedenSatilmisAdet)
        WHERE UrunID = @UID;
    END
    ELSE
    BEGIN
        -- Satış adedi azaltıldığında stoka ekleme işlemi
        UPDATE Urunler
        SET Adet = Adet + (@OncedenSatilmisAdet - @SatisAdeti)
        WHERE UrunID = @UID;
    END

    -- Satışlar tablosunu güncelle
    UPDATE Satislar
    SET
        MID = @MID,
        UID = @UID,
        SatisAdeti = @SatisAdeti
    WHERE SatisID = @SatisID;
END
