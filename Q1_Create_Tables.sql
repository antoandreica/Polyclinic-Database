
CREATE  DATABASE  MAGAZIN
GO


USE  MAGAZIN
GO

-- TABELE 

--  Tabela  CATEGORIE
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[CATEGORIE]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[CATEGORIE]
GO

CREATE  TABLE  CATEGORIE  (
        Id_Categorie        int					PRIMARY  KEY  IDENTITY,
        Nume_Categorie		varchar(30)			NOT  NULL,
		Descriere			varchar(30)			NOT  NULL
)
GO


--  Tabela  PRODUS
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[PRODUS]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[PRODUS]
GO

CREATE  TABLE  PRODUS  (
        Id_Produs           int					PRIMARY  KEY  IDENTITY,
		Id_Furnizor         int                 NOT NULL,
		Id_Categorie        int                 NOT NULL,
		Nume_Produs			varchar(30)			NOT NULL,
        Descriere       	varchar(30)			NOT  NULL,
		Cantitate			int					NOT NULL CHECK (Cantitate>0),
		Culoare             varchar(30)         NOT NULL,
		Marime              varchar(30)         NOT NULL, 
		Discount            int                 NOT NULL, 
		Pret                int                 NOT NULL, 
		Greutate            int                 NOT NULL
)
GO


--  Tabela  FURNIZOR
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[FURNIZOR]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[FURNIZOR]
GO

CREATE  TABLE  FURNIZOR  (
        Id_Furnizor				int              PRIMARY  KEY  IDENTITY,
        Nume_furnizor           varchar(50)      NOT  NULL,
		Adresa					varchar(50)      NOT  NULL,
		Oras					varchar(50)      NOT  NULL,
		Telefon   				varchar(50)      NOT  NULL
)
GO


--  Tabela  DETALII_COMANDA
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[DETALII_COMANDA]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[DETALII_COMANDA]
GO

CREATE  TABLE  DETALII_COMANDA  (		
        Id_Detalii				int             PRIMARY  KEY  IDENTITY,
		Id_Comanda              int             NOT NULL,
		Id_Produs               int             NOT NULL,
		Denumire				varchar(50)		NOT NULL,
		Pret                    int             NOT NULL,
		Cantitate               int             NOT NULL,
		Culoare                 varchar(50)     NOT NULL,
		Total                   int             NOT NULL,
		Discount                int             NOT NULL,
		Data_inregistrari		date			NOT NULL,
		Data_returnarii         date            NOT NULL
)
GO



--  Tabela  COMANDA
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[COMANDA]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[COMANDA]
GO

CREATE  TABLE  COMANDA  (
        Id_Comanda          int				PRIMARY  KEY  IDENTITY,
		Id_Plata            int             NOT NULL,
		Id_Client           int             NOT NULL,
		Id_Expeditor        int             NOT NULL,
		Numar_Comanda       int             NOT NULL,
		Cantitate			int				NOT NULL CHECK (Cantitate>0),
		Data_comanda		date			NOT NULL
)
GO

--  Tabela  PLATA
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[PLATA]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[PLATA]
GO

CREATE  TABLE  PLATA  (
        Id_Plata			int					PRIMARY  KEY  IDENTITY,
        Mod_plata			varchar(10)				NOT  NULL
								CHECK  (Mod_plata  IN  ('Cash',  'Cheque')),
		Cheque				varchar(50),			
		Cheque_date			date,				
		Bank_account		varchar(50)         
)
GO

--  Tabela  CLIENT
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[CLIENT]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[CLIENT]
GO

CREATE  TABLE  CLIENT  (
        Id_Client   		int					PRIMARY KEY IDENTITY,
		Nume				varchar(50)			NOT NULL,
		Prenume			    varchar(50)			NOT NULL,
		Telefon			    int					NOT NULL,
		Mail_address        varchar(50)         NOT NULL, 
		Country             varchar(50)         NOT NULL, 
		Home_Address        varchar(50)         NOT NULL
)

GO



--  Tabela  EXPEDITOR
if  exists  (select  *  from  dbo.sysobjects  where  id  =  object_id(N'[dbo].[EXPEDITOR]')  and  OBJECTPROPERTY(id,  N'IsUserTable')  =  1)
drop  table  [dbo].[EXPEDITOR]
GO

CREATE  TABLE  EXPEDITOR  (
        Id_Expeditor		int					PRIMARY KEY IDENTITY,
		Nume				varchar(50)			NOT NULL,
		Prenume			    varchar(50)			NOT NULL,
		Telefon			    int					NOT NULL
)

GO



