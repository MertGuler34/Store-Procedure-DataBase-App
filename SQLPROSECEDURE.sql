CREATE OR ALTER PROC SP_Musteri_KayitDuzenle
(
    @MusteriID int,
    @Isim nvarchar(50),
    @SoyIsim nvarchar(50),
    @EmailAdres nvarchar(100)
)
AS
BEGIN 

    UPDATE Musteriler
	SET
	Isim=@Isim,
	SoyIsim=@SoyIsim,
	EmailAdres=@EmailAdres
    WHERE MusteriID=@MusteriID
END



 CREATE OR ALTER PROC SP_MusteriGiris_KayitDuzenle
(
    @MID int,
    @KullaniciAdi nvarchar(50),
    @Sifre nvarchar(50) 
)
AS
BEGIN 

    UPDATE MusteriGiris
	SET
	KullaniciAdi=@KullaniciAdi
	
    WHERE MID=@MID
END


CREATE OR ALTER PROC SP_Musteri_KayitSil(@MusteriID int )
AS
BEGIN   
        DELETE MusteriGiris WHERE MID=@MusteriID
        DELETE Musteriler WHERE MusteriID=@MusteriID
END



CREATE OR ALTER  PROCEDURE SP_Musteri_KayitlariGoruntulee
AS
BEGIN
    SELECT * FROM Musteriler
END



CREATE OR ALTER PROCEDURE SP_Musteri_KayitGörüntülee
     @MusteriID int 
AS
BEGIN
    SELECT * FROM Musteriler WHERE MusteriID = @MusteriID
END


CREATE OR ALTER PROCEDURE SP_Urun_YeniKayit
(
    @Isim nvarchar(50),
    @Adet int
)
AS
BEGIN
    SET NOCOUNT ON; -- Etkilenen satýr sayýsýný döndürmeyi kapat

    INSERT INTO Urunler (Isim, Adet) VALUES (@Isim, @Adet);
END;


	CREATE OR ALTER PROCEDURE SP_Urun_KayitDuzenle
(
    @UrunID int,
    @Isim nvarchar(50),
    @Adet int
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Urunler
    SET
        Isim = @Isim,
        Adet = @Adet
    WHERE UrunID = @UrunID;
END;


CREATE PROC SP_Urun_KayitSil(@UrunID int)
AS
BEGIN
DELETE Urunler Where UrunID=@UrunID
END

CREATE PROC SP_Urun_KayitlariGoruntule
AS 
BEGIN 
SELECT*FROM Urunler
END

CREATE OR ALTER PROC SP_Urun_KayitGoruntule(@UrunID int)
AS
SELECT*FROM Urunler WHERE UrunID=@UrunID


CREATE OR ALTER PROCEDURE SP_Satis_KayitEkle(@MID int, @UID int, @SatisAdeti int)
AS
INSERT INTO Satislar(MID,UID,SatisAdeti) VALUES (@MID,@UID,@SatisAdeti)


CREATE PROCEDURE SP_Satis_KayitDuzenle(@SatisID int,@MID int, @UID int, @SatisAdeti int)
AS
UPDATE Satislar 
SET
MID=@MID,
UID=@UID,
SatisAdeti=@SatisAdeti
WHERE SatisID=@SatisID


CREATE PROC SP_Satis_KayitSil(@SatisID int)
AS
DELETE Satislar WHERE SatisID=@SatisID


CREATE PROC SP_Satis_KayitlariGoruntule
AS
SELECT*FROM Satislar


CREATE OR ALTER PROC SP_Satis_KayitGoruntule(@SatisID int)
AS
SELECT*FROM Satislar WHERE SatisID=@SatisID






Select*from Urunler
Select*from Satislar
Select*from Musteriler