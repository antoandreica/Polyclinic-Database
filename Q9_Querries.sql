USE MAGAZIN
GO

/*
-- Interogare1 - Care sunt cele mai utilizate adresa de mail de catre Clienti ?
SELECT 
    C.Nume,C.Prenume, C.Mail_address,
    SUBSTRING(C.Mail_address, CHARINDEX('@', Mail_address)+1, LEN(C.Mail_address)-CHARINDEX('@', C.Mail_address)) Domain,COUNT(Mail_address) domain_count
FROM 
    CLIENT C
GROUP BY
	 C.Nume,C.Prenume, C.Mail_address
ORDER BY 
    C.Mail_address;
*/


/*
---------------------------------------------------------------------------------------------------------------------------------
-- Interogare2 - Ce tipuri de platforme sunt folosite pentru adresele de mail (si numarul de platforme utilizate) ?
SELECT 
    SUBSTRING(Mail_address, CHARINDEX('@', Mail_address)+1, LEN(Mail_address)-CHARINDEX('@', Mail_address)) Domain,COUNT(Mail_address) Domain_count
FROM 
    CLIENT
GROUP BY 
     SUBSTRING(Mail_address, CHARINDEX('@', Mail_address)+1, LEN(Mail_address)-CHARINDEX('@', Mail_address));
*/


----------------------------------------------------------------------------------------------------------------------------------
/*
-- Interogare3 - Care sunt persoanele care au cumparat Galaxy S20+ si a caror nume incepe cu litera M ?
SELECT COUNT(C.Nume) AS Names_with_M
FROM view_Produse_Clienti C
WHERE (C.Nume LIKE 'M%') AND (C.Nume_Produs='Galaxy S20+')

*/


----------------------------------------------------------------------------------------------------------------------------------
/*
--Interogare4 - Care este cel mai ieftin produs si care este tipul de tranzactie efectuata ?

SELECT C.Nume_Produs , MIN(C.Pret), C.Denumire
FROM view_Produs_Comanda C
GROUP BY C.Nume_Produs,C.Denumire

*/


----------------------------------------------------------------------------------------------------------------------------------
/*
-- Interogare5 - Care este numarul de produse cumparate de fiecare client si care este pretul acestora afisate in ordine crescatoare ? 

SELECT C.Nume_Produs , SUM(C.Pret), COUNT(C.Pret)
FROM view_Produs_Comanda C
GROUP BY C.Nume_Produs
ORDER BY SUM(C.Pret) DESC

*/
----------------------------------------------------------------------------------------------------------------------------------
/*
-- Interogare6 - Care sunt persoanele care au comandat un anumit produs inainte o anumita data ?

DECLARE @produs varchar(30)
SET @produs='Galaxy S20+'
DECLARE @data DATETIME
SET @data='2021-01-08'

SELECT C.Nume,C.Prenume, C.Mail_address
FROM CLIENT C, COMANDA Co,PRODUS P, DETALII_COMANDA DC
WHERE (C.Id_Client=Co.Id_Client) AND (DC.Id_Comanda=P.Id_Produs) AND (P.Nume_Produs=@produs) AND (Co.Data_comanda<@data)
GROUP BY C.Nume,C.Prenume, C.Mail_address
*/
----------------------------------------------------------------------------------------------------------------------------------
/*
-- Interogare7 - Care este stocul total, cate bucati avem din fiecare si care este valoarea acestora astfel incat pretul sa fie unitar ?

DECLARE @produs varchar(30)
SET @produs='Sony PlayStation'
DECLARE @data DATETIME
SET @data='2020-07-10'

SELECT P.Nume_Produs, SUM(P.Cantitate+DC.Cantitate) AS Bucata, (SUM(P.Cantitate+DC.Cantitate)*P.Pret) AS Valoarea, P.Pret AS Pret_Unitar
FROM CLIENT C, COMANDA Co,PRODUS P, DETALII_COMANDA DC
WHERE (C.Id_Client=Co.Id_Client) AND (DC.Id_Produs=P.Id_Produs) AND (DC.Id_Comanda=Co.Id_Comanda) 
GROUP BY P.Nume_Produs, P.Pret
ORDER BY 3 DESC
*/

----------------------------------------------------------------------------------------------------------------------------------

-- Interogare8 - Care dintre produse sunt exprirate sau se apropie data de expirare ?
/*
DECLARE @expirare int
SET @expirare=300


SELECT P.Nume_Produs, P.Cantitate
FROM CLIENT C, COMANDA Co,PRODUS P, DETALII_COMANDA DC
WHERE (C.Id_Client=Co.Id_Client) AND (DC.Id_Produs=P.Id_Produs) AND ((DATEDIFF(dd,DC.Data_returnarii,GETDATE())<@expirare) OR ((DATEDIFF(dd,DC.Data_returnarii,GETDATE())<0)))
GROUP BY P.Nume_Produs, P.Cantitate
*/



----------------------------------------------------------------------------------------------------------------------------------
/* -- doesn't work well
-- Interogare9 - Care sunt clientii care au cumparat un anumit produs avand valoarea peste o anumita cantitate si pret ?

DECLARE @produs varchar(30)
SET @produs='IMAPATT diode'
DECLARE @cant int
SET @cant=1
DECLARE @pret int
SET @pret=10

SELECT C.Nume,C.Prenume, P.Nume_produs
FROM CLIENT C, COMANDA Co,PRODUS P, DETALII_COMANDA DC
WHERE (C.Id_Client=Co.Id_Client) AND (DC.Id_Produs=P.Id_Produs) AND (DC.Id_Comanda=Co.Id_Comanda)
		AND (P.Nume_Produs=@produs) 
GROUP BY C.Nume,C.Prenume,P.Nume_Produs,P.Pret
HAVING (SUM(Co.Cantitate)>@cant) AND (SUM(Co.Cantitate)*P.Pret>@pret)
ORDER BY 2 DESC
*/