
USE MAGAZIN
GO

/*
--Functie scalara care face validarea pentru preturile
CREATE FUNCTION dbo.udfValidPret(@vPret int)
RETURNS BIT
AS
BEGIN
	DECLARE @bValid bit
	SET @bValid = 0
	IF (@vPret>0)
	BEGIN
		SET @bValid = 1
	END
	RETURN (@bValid)
END
GO

ALTER TABLE PRODUS WITH NOCHECK
ADD CONSTRAINT ck_Pret CHECK(dbo.udfValidPret(Pret) = 1)

*/

--  Functie scalara care verifica daca data inregistrarii pentru o comanda este valida


/*
CREATE FUNCTION udfValidDataInregistrare(@vData_inregistrari date)
RETURNS BIT
AS
BEGIN
    DECLARE @bvalid bit
	SET @bvalid=0
	IF(DATEDIFF(dd, GETDATE(), @vData_inregistrari)>0)
	BEGIN
		SET @bvalid=1
	END
	RETURN (@bvalid)
END
GO
--  Se adauga constrangerea la tabela DETALII_COMANDA

ALTER TABLE DETALII_COMANDA WITH NOCHECK
   ADD CONSTRAINT ck_DataInregistrare CHECK (dbo.udfValidDataInregistrare(Data_inregistrari)=1)

 */




--  Functie in-line care returneaza produsele de la fiecare comanda specificata ca si parametru
/*
CREATE FUNCTION udf_produs_comanda (@comanda varchar(50))
RETURNS TABLE
AS
RETURN
    SELECT C.Numar_Comanda, P.Nume_Produs, P.Pret
	    FROM PRODUS P, COMANDA C, DETALII_COMANDA DC
		WHERE (C.Id_Comanda=DC.Id_Comanda) AND (DC.Id_Produs=P.Id_Produs)  AND (C.Numar_Comanda=@comanda)
GO

*/

/*
--  Functie in-line care returneaza clienti care au comandat pe anumite date

CREATE FUNCTION udf_client_data (@data date)
RETURNS TABLE
AS
RETURN 
    SELECT c.Id_Client, cl.Nume, cl.Prenume
	   FROM  COMANDA C INNER JOIN CLIENT cl ON c.Id_Client=cl.Id_Client AND DATEDIFF(dd, @data,c.Data_comanda )=0	
	   GROUP BY c.Id_Client, cl.Nume, cl.Prenume
GO

*/

/*

SELECT *from udf_client_data('2019/10/15')

*/