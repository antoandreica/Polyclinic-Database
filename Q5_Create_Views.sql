
USE MAGAZIN
GO


--      Vedere care contine produsele de pe o anumita comanda

/*
CREATE VIEW view_Produs_Comanda AS
		  SELECT DISTINCT
		       pr.Id_Produs,
		       pr.Nume_Produs,
			   pr.Pret,
			   dc.Denumire,
			   dc.Discount,
			   co.Numar_Comanda
		  FROM PRODUS pr, DETALII_COMANDA dc, COMANDA co
		  WHERE (dc.Id_Produs=pr.Id_Produs) AND (dc.Id_Comanda=co.Id_Comanda)
GO
*/

--      Vedere care contine produsele comandate de anumiti clienti 

/*
CREATE VIEW view_Produse_Clienti AS
          SELECT DISTINCT
		       pr.Id_Produs,
			   pr.Nume_Produs,
		       dc.Denumire,
		       co.Numar_Comanda,
			   cl.Nume,
			   cl.Prenume
		  FROM PRODUS pr, DETALII_COMANDA dc, COMANDA co, CLIENT cl
		  WHERE (dc.Id_Produs=pr.Id_Produs) AND (dc.Id_Comanda=co.Id_Comanda) AND (co.Id_Client=cl.Id_Client) 
GO
*/

--      Vedere care contine produsele  platite intr-un anumit mod (cash/cheque)

/*
CREATE VIEW view_Produse_Plata AS
       SELECT
	         PL.Mod_plata, PR.Id_Produs, RTRIM(PR.Nume_Produs+' '+PR.Pret) Client
	   FROM PRODUS PR, DETALII_COMANDA DC, COMANDA CO, PLATA PL
	   WHERE (DC.Id_Produs=PR.Id_Produs) AND (DC.Id_Comanda=DC.Id_Comanda) AND (CO.Id_Plata=PL.Id_Plata)
GO

*/
