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
