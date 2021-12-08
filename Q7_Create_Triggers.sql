
USE MAGAZIN
GO

--      Jurnalizarea operatiilor de inserare/actualizare a tabelei Comanda
/*
CREATE TABLE Jurn_Comanda (
  LogID int IDENTITY NOT NULL,
  ActionType char(1) NOT NULL,
  ActionDate datetime NOT NULL,
  ActionBy varchar(30),
  IDComanda int,
  NumarComanda varchar(20)
);
GO

CREATE TRIGGER trg_Insert_Comanda ON COMANDA
FOR INSERT
AS
      INSERT INTO Jurn_Comanda
	      (ActionType, ActionDate, ActionBy, IDComanda, NumarComanda)
	  SELECT 'I', GETDATE(), USER_NAME(), ins.Id_Comanda, ins.Numar_Comanda
	  FROM inserted ins
GO

CREATE TRIGGER trg_Update_Comanda ON COMANDA
AFTER UPDATE
AS
      INSERT INTO Jurn_Comanda
	       (ActionType, ActionDate, ActionBy, IDComanda, NumarComanda)
	  SELECT 'U', GETDATE(), USER_NAME(), ins.Id_Comanda, ins.Numar_Comanda
	  FROM inserted ins
GO 

*/

--      Jurnalizarea operatiilor de actualizare a tabelei Client

/*
CREATE TABLE Jurn_Client (
  LogID int IDENTITY NOT NULL,
  ActionType char(1) NOT NULL,
  ActionDate datetime NOT NULL,
  ActionBy varchar(30),
  IDClient int,
  Nume varchar(50)
);
GO

CREATE TRIGGER trg_Update_Client ON Client
AFTER UPDATE
AS
      INSERT INTO Jurn_Client
	       (ActionType, ActionDate, ActionBy, IDClient, Nume)
	  SELECT 'U', GETDATE(), USER_NAME(), ins.Id_Client, ins.Nume
	  FROM inserted ins
GO
*/

--      Formatarea datelor in tabela Curse folosind triggeri

/*
CREATE TRIGGER trg_Update_Numar_Comanda ON Comanda
FOR INSERT, UPDATE
AS
  UPDATE COMANDA SET Comanda.Numar_Comanda=UPPER(Inserted.Numar_Comanda)
       FROM COMANDA, Inserted
	   WHERE COMANDA.Id_Comanda=INSERTED.Id_Comanda
GO

*/


--      Formatarea datelor in tabela Clienti folosind triggeri

CREATE TRIGGER trg_Update_Nume ON Client
FOR INSERT, UPDATE	
AS
  UPDATE Client SET Client.Nume=UPPER(Inserted.Nume)
       FROM Client, Inserted
	   WHERE Client.Id_Client=INSERTED.Id_Client
GO
