
Use  MAGAZIN
GO

--  Populare  tabela  Categorie
INSERT  INTO  CATEGORIE(Nume_Categorie, Descriere)  VALUES  ('Entertaiment', 'Music/Movies');
INSERT  INTO  CATEGORIE(Nume_Categorie, Descriere)  VALUES  ('Communications','Smartphones');
INSERT  INTO  CATEGORIE(Nume_Categorie, Descriere)  VALUES  ('Recreation', 'Games');
INSERT  INTO  CATEGORIE(Nume_Categorie, Descriere)  VALUES  ('Housekeeping', 'Cleaning/Storing');
INSERT  INTO  CATEGORIE(Nume_Categorie, Descriere)  VALUES  ('Electronic_Components', 'semiconductors');
GO

-- Populare tabela Furnizor
INSERT INTO FURNIZOR(Nume_furnizor, Adresa, Oras, Telefon) VALUES ('Pop Aurel','Zorilor, 4A','Cluj-Napoca', '0745668907');
INSERT INTO FURNIZOR(Nume_furnizor, Adresa, Oras, Telefon) VALUES ('Muresan Vasile','Bobalna, 12B','Gherla','0747655242');
INSERT INTO FURNIZOR(Nume_furnizor, Adresa, Oras, Telefon) VALUES ('Hortopan Sabrina','Avram-Iancu, 5','Gherla','0748566737');
INSERT INTO FURNIZOR(Nume_furnizor, Adresa, Oras, Telefon) VALUES ('Beldean Mihai','Pasteur, 21A','Cluj-Napoca','0765242356');
INSERT INTO FURNIZOR(Nume_furnizor, Adresa, Oras, Telefon) VALUES ('Pop Marian','Motilor, 10B','Cluj-Napoca','0767456234');
INSERT INTO FURNIZOR(Nume_furnizor, Adresa, Oras, Telefon) VALUES ('Bordea Catalin','Tusnad, 57B','Cluj-Napoca','0756789098');
GO

--  Populare  tabela  Produs
INSERT  INTO  PRODUS(Id_Furnizor, Id_Categorie, Nume_Produs, Descriere, Cantitate, Culoare, Marime, Discount, Pret, Greutate)
	VALUES (1,2,'Galaxy S20+','smartphone',1,'Black','151.7 x 69.1 x 7.9 mm',30,900,163);
INSERT  INTO  PRODUS(Id_Furnizor, Id_Categorie, Nume_Produs, Descriere, Cantitate, Culoare, Marime, Discount, Pret, Greutate)
	VALUES (2,1,'Televizor LED Smart PHILIPS','smart TV',1,'Gray','146 cm',10,2000,15.3);
INSERT  INTO  PRODUS(Id_Furnizor, Id_Categorie, Nume_Produs, Descriere, Cantitate, Culoare, Marime, Discount, Pret, Greutate)
	VALUES (3,3,'Sony PlayStation','console',1,'White','39cm',0,499,4.5);
INSERT  INTO  PRODUS(Id_Furnizor, Id_Categorie, Nume_Produs, Descriere, Cantitate, Culoare, Marime, Discount, Pret, Greutate)
	VALUES (4,4,'Side by Side Twin Cooling Plus','storing',1,'Black','1780mm',20,5299,118);
INSERT  INTO  PRODUS(Id_Furnizor, Id_Categorie, Nume_Produs, Descriere, Cantitate, Culoare, Marime, Discount, Pret, Greutate)
	VALUES (5,5,'IMPATT diode','semiconductor',3,'black','-',0,48,0);
INSERT  INTO  PRODUS(Id_Furnizor, Id_Categorie, Nume_Produs, Descriere, Cantitate, Culoare, Marime, Discount, Pret, Greutate)
	VALUES (6,5,'RS1M R2','semiconductor',4,'black','-',10,12,0);
GO

-- Populare tabela Plata
INSERT INTO PLATA(Mod_plata, Cheque, Cheque_date, Bank_account) VALUES ('Cheque','Bearer','2021-01-08','GB82-WEST-1234-569887-654-32');
INSERT INTO PLATA(Mod_plata, Cheque, Cheque_date, Bank_account) VALUES ('Cash','-','2020-05-15','-');
INSERT INTO PLATA(Mod_plata, Cheque, Cheque_date, Bank_account) VALUES ('Cheque','Order','2020-07-10','ZB82-WOST-1234-569887-654-12');
INSERT INTO PLATA(Mod_plata, Cheque, Cheque_date, Bank_account) VALUES ('Cheque','Crossed','2020-03-12','PO67-GEST-1289-569887-654-32');
INSERT INTO PLATA(Mod_plata, Cheque, Cheque_date, Bank_account) VALUES ('Cash','-','2021-02-27','-');
INSERT INTO PLATA(Mod_plata, Cheque, Cheque_date, Bank_account) VALUES ('Cheque','Bearer','2020-04-12','SU82-WEST-1234-569887-654-32');
GO

--  Populare  tabela  Client
INSERT  INTO  CLIENT(Nume, Prenume, Telefon, Mail_address, Country, Home_Address) 
    VALUES  ('Modoran','Georgiana',0767456234,'modoran.geo@gmail.com','Romania','Horea, 20');
INSERT  INTO  CLIENT(Nume, Prenume, Telefon, Mail_address, Country, Home_Address) 
    VALUES  ('Pop','George',0745234123,'pop_george@yahoo.com','Romania','Tusnad, 12');
INSERT  INTO  CLIENT(Nume, Prenume, Telefon, Mail_address, Country, Home_Address) 
    VALUES  ('Vasiliu','Florin',0741234567,'vas.flo97@gmail.com','Germania','Heizball, 21');
INSERT  INTO  CLIENT(Nume, Prenume, Telefon, Mail_address, Country, Home_Address) 
    VALUES  ('Coroian','Alex',0745678123,'coro_alex@gmail.com','Romania','Fierarilor, 3A');
INSERT  INTO  CLIENT(Nume, Prenume, Telefon, Mail_address, Country, Home_Address) 
    VALUES  ('Çosma','Vlad',0743556782,'cosma.vlad@yahoo.com','Italia','Bulio, 56');
INSERT  INTO  CLIENT(Nume, Prenume, Telefon, Mail_address, Country, Home_Address) 
    VALUES  ('Beldean','Ana',0745678932,'bel_ana@gmail.com','Romania','Motilor, 34');
GO

-- Populare tabela Expeditor
INSERT INTO EXPEDITOR(Nume, Prenume, Telefon) VALUES ('Andreica','Tudor',0745633123);
INSERT INTO EXPEDITOR(Nume, Prenume, Telefon) VALUES ('Cortea','Ioan',0745678903);
INSERT INTO EXPEDITOR(Nume, Prenume, Telefon) VALUES ('Pop','Vasile',0745633321);
INSERT INTO EXPEDITOR(Nume, Prenume, Telefon) VALUES ('Moldovan','Vlad',0745633789);
INSERT INTO EXPEDITOR(Nume, Prenume, Telefon) VALUES ('Chirila','Adrian',0747655242);
INSERT INTO EXPEDITOR(Nume, Prenume, Telefon) VALUES ('Despot','Luca',0748675234);
GO

-- Populare tabela COMANDA
INSERT INTO COMANDA(Id_Plata, Id_Client, Id_Expeditor, Numar_Comanda, Cantitate, Data_comanda)
	VALUES (1, 1, 1, 234, 1, '2019/10/15');
INSERT INTO COMANDA(Id_Plata, Id_Client, Id_Expeditor, Numar_Comanda, Cantitate, Data_comanda)
	VALUES (2, 2, 2, 123, 1, '2020/11/10');
INSERT INTO COMANDA(Id_Plata, Id_Client, Id_Expeditor, Numar_Comanda, Cantitate, Data_comanda)
	VALUES (3, 3, 3, 189, 1, '2021/01/10');
INSERT INTO COMANDA(Id_Plata, Id_Client, Id_Expeditor, Numar_Comanda, Cantitate, Data_comanda)
	VALUES (4, 4, 4, 987, 1, '2019/05/10');
INSERT INTO COMANDA(Id_Plata, Id_Client, Id_Expeditor, Numar_Comanda, Cantitate, Data_comanda)
	VALUES (5, 5, 5, 1890, 1, '2019/02/15');
INSERT INTO COMANDA(Id_Plata, Id_Client, Id_Expeditor, Numar_Comanda, Cantitate, Data_comanda)
	VALUES (6, 6, 6, 980, 1, '2020/04/20');

GO


-- Populare tabela DETALII COMANDA
INSERT INTO DETALII_COMANDA(Id_Comanda, Id_Produs, Denumire, Pret, Cantitate, Culoare, Total, Discount, Data_inregistrari, Data_returnarii)
	VALUES (1, 1, 'Rapida',1000, 1,'Black', 1, 20, '2019/06/09','2019/06/14');
INSERT INTO DETALII_COMANDA(Id_Comanda, Id_Produs, Denumire, Pret, Cantitate, Culoare, Total, Discount, Data_inregistrari, Data_returnarii)
	VALUES (2, 2, 'Normala', 2400, 1,'Black', 1, 10, '2020/08/11','2020/08/29');
INSERT INTO DETALII_COMANDA(Id_Comanda, Id_Produs, Denumire, Pret, Cantitate, Culoare, Total, Discount, Data_inregistrari, Data_returnarii)
	VALUES (3, 3, 'Rapida', 600, 1,'Black', 1, 0, '2019/04/10','2019/04/12');
INSERT INTO DETALII_COMANDA(Id_Comanda, Id_Produs, Denumire, Pret, Cantitate, Culoare, Total, Discount, Data_inregistrari, Data_returnarii)
	VALUES (4, 4, 'Rapida', 7600, 1,'Black', 1, 30, '2019/10/10','2019/10/12');
INSERT INTO DETALII_COMANDA(Id_Comanda, Id_Produs, Denumire, Pret, Cantitate, Culoare, Total, Discount, Data_inregistrari, Data_returnarii)
	VALUES (5, 5, 'Normala', 60, 1,'-', 3, 0, '2021/01/04','2021/01/20');
INSERT INTO DETALII_COMANDA(Id_Comanda, Id_Produs, Denumire, Pret, Cantitate, Culoare, Total, Discount, Data_inregistrari, Data_returnarii)
	VALUES (6, 6,'Rapida', 20, 1,'Black', 4, 0, '2019/12/03','2019/12/05');
GO











