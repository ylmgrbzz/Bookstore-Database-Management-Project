-- Kitaplar Tablosu
CREATE TABLE Kitaplar (
    kitapno INT PRIMARY KEY,
    isbn VARCHAR(20),
    adi VARCHAR(255),
    onsöz TEXT,
    url VARCHAR(255),
    satis_fiyati DECIMAL(10, 2),
    basim_yili INT
);

-- Müşteriler Tablosu
CREATE TABLE Musteriler (
    musterino INT PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    tlfno VARCHAR(15),
    e_posta VARCHAR(50),
    adres VARCHAR(255),
    adres_ili VARCHAR(50),
    adres_ilcesi VARCHAR(50)
);

-- Kitap Siparişleri Tablosu
CREATE TABLE KitapSiparis (
    siparis_id INT PRIMARY KEY,
    musterino INT,
    kitapno INT,
    FOREIGN KEY (musterino) REFERENCES Musteriler(musterino),
    FOREIGN KEY (kitapno) REFERENCES Kitaplar(kitapno)
);

-- Yayınevleri Tablosu
CREATE TABLE Yayinevleri (
    yayinevino INT PRIMARY KEY,
    ad VARCHAR(100),
    url VARCHAR(255),
    adres VARCHAR(255),
    adres_ili VARCHAR(50),
    adres_ilcesi VARCHAR(50)
);

-- Kitap Yayınları Tablosu
CREATE TABLE KitapYayin (
    kitapno INT,
    yayinevino INT,
    PRIMARY KEY (kitapno, yayinevino),
    FOREIGN KEY (kitapno) REFERENCES Kitaplar(kitapno),
    FOREIGN KEY (yayinevino) REFERENCES Yayinevleri(yayinevino)
);

-- Yazarlar Tablosu
CREATE TABLE Yazarlar (
    yazarno INT PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    url VARCHAR(255),
    adres VARCHAR(255),
    adres_ili VARCHAR(50),
    adres_ilcesi VARCHAR(50)
);

-- Kitap Yazarları Tablosu
CREATE TABLE KitapYazar (
    kitapno INT,
    yazarno INT,
    PRIMARY KEY (kitapno, yazarno),
    FOREIGN KEY (kitapno) REFERENCES Kitaplar(kitapno),
    FOREIGN KEY (yazarno) REFERENCES Yazarlar(yazarno)
);

-- Resimler Tablosu
CREATE TABLE Resimler (
    resimno INT PRIMARY KEY,
    dosya_adi VARCHAR(255),
    dosya_konumu VARCHAR(255)
);

-- Kitap Resimleri Tablosu
CREATE TABLE KitapResim (
    kitapno INT,
    resimno INT,
    PRIMARY KEY (kitapno, resimno),
    FOREIGN KEY (kitapno) REFERENCES Kitaplar(kitapno),
    FOREIGN KEY (resimno) REFERENCES Resimler(resimno)
);


-- Kitaplar Tablosu
INSERT INTO Kitaplar (kitapno, isbn, adi, onsöz, url, satis_fiyati, basim_yili)
VALUES (1, '1234567890123', 'Kitap 1', 'Önsöz 1', 'http://example.com/1', 29.99, 2022);

-- Müşteriler Tablosu
INSERT INTO Musteriler (musterino, ad, soyad, tlfno, e_posta, adres, adres_ili, adres_ilcesi)
VALUES (1, 'Ahmet', 'Yılmaz', '5551234567', 'ahmet@example.com', 'İstanbul', 'İstanbul', 'Beşiktaş');

-- Kitap Siparişleri Tablosu
INSERT INTO KitapSiparis (siparis_id, musterino, kitapno)
VALUES (1, 1, 1);

-- Yayınevleri Tablosu
INSERT INTO Yayinevleri (yayinevino, ad, url, adres, adres_ili, adres_ilcesi)
VALUES (1, 'Yayınevi 1', 'http://yayinevi1.com', 'İstanbul', 'İstanbul', 'Kadıköy');

-- Kitap Yayınları Tablosu
INSERT INTO KitapYayin (kitapno, yayinevino)
VALUES (1, 1);

-- Yazarlar Tablosu
INSERT INTO Yazarlar (yazarno, ad, soyad, url, adres, adres_ili, adres_ilcesi)
VALUES (1, 'Yazar 1', 'Soyad 1', 'http://yazar1.com', 'İstanbul', 'İstanbul', 'Üsküdar');

-- Kitap Yazarları Tablosu
INSERT INTO KitapYazar (kitapno, yazarno)
VALUES (1, 1);

-- Resimler Tablosu
INSERT INTO Resimler (resimno, dosya_adi, dosya_konumu)
VALUES (1, 'resim1.jpg', '/resimler/');

-- Kitap Resimleri Tablosu
INSERT INTO KitapResim (kitapno, resimno)
VALUES (1, 1);

-- SEQUENCE 
CREATE SEQUENCE kitap_no_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 10;