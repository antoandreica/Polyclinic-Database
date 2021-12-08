
USE MAGAZIN
GO


--		Procedura:	usp_Insert_Comanda  ->  inserare date in tabela Comanda (tabela cu cele mai multe chei straine)
/*
if exists (select *from dbo.sysobjects where [Name]='usp_Insert_Comanda' and Type='P')
		drop procedure dbo.usp_Insert_Comanda
GO

CREATE procedure usp_Insert_Comanda (
		@IdComanda int,
		@IdPlata int,
		@IdClient int,
		@IdExpeditor int,
		@NumarComanda int,
		@Cantitate int,
		@DataComanda date
)
as
		set quoted_identifier off
		set NOCOUNT ON

		--  Validarea datelor folosind coduri de stare
			
		IF @IdComanda=''
		   BEGIN
				RETURN(1)
		   END
		ELSE IF @IdPlata=''
		   BEGIN
				RETURN(2)
		   END
		ELSE IF @IdClient=''
		   BEGIN
				RETURN(3)
		   END
		ELSE IF @IdExpeditor=''
		   BEGIN
				RETURN(4)
		   END
		ELSE IF @NumarComanda=''
		   BEGIN
				RETURN(5)
		   END
		ELSE IF @Cantitate=''
		   BEGIN
				RETURN(6)
		   END
		ELSE IF @DataComanda=''
			BEGIN
				RETURN(7)
			END
		ELSE
		   BEGIN 
		        
		   begin try
			    INSERT INTO [COMANDA] (
				       [Id_Comanda],
					   [Id_Plata],
					   [Id_Client],
					   [Id_Expeditor],
					   [Numar_Comanda],
					   [Cantitate],
					   [Data_comanda]
			     )
				 VALUES (
					  @IdComanda,
					  @IdPlata,
					  @IdClient,
					  @IdExpeditor,
					  @NumarComanda,
					  @Cantitate,
					  @DataComanda
			     )
	       end try
		   begin catch
		        DECLARE @ErrorMessage NVARCHAR(1000);
				DECLARE @ErrorSeverity INT;
				DECLARE @ErrorState INT;
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),
					   @ErrorState = ERROR_STATE();
			    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		   end catch

		   RETURN(0)
		   END
GO

*/

--exec usp_Insert_Comanda  @IdComanda=7,@IdPlata=7,@IdClient=7,@IdExpeditor=7,@NumarComanda=7,@Cantitate=10,@DataComanda='2019/10/10'

/*
--      Procedura:  usp_Update_Comanda    ->  actualizare date din tabela Comanda

if exists (select *from dbo.sysobjects where [Name]='usp_Update_Comanda' and Type='P')
        drop procedure dbo.usp_Update_Comanda
GO

CREATE procedure usp_Update_Comanda (
    @IdComanda int, 
	@IdPlata int=NULL, 
	@IdClient int=NULL, 
	@IdExpeditor int=NULL, 
	@NumarComanda int=NULL,
	@Cantitate int=NULL, 
	@DataComanda date=NULL
)
as

        set quoted_identifier off
		set NOCOUNT ON

		--  Validarea datelor folosind coduri de stare
			
		IF @IdComanda=''
		   BEGIN
				RETURN(1)
		   END
		IF @IdPlata=''
		   BEGIN
				RETURN(2)
		   END
		ELSE IF @IdClient=''
		   BEGIN
				RETURN(3)
		   END
		ELSE IF @IdExpeditor=''
		   BEGIN
				RETURN(4)
		   END
		ELSE IF @NumarComanda=''
		   BEGIN
				RETURN(5)
		   END
		ELSE IF @Cantitate=''
		   BEGIN
				RETURN(6)
		   END
		ELSE IF @DataComanda=''
		   BEGIN
				RETURN(7)
		   END
		ELSE
		   BEGIN 

		   begin try
		        UPDATE [COMANDA] SET
					   [Id_Plata] = COALESCE(@IdPlata, [IdPlata]),
					   [Id_Client] = COALESCE(@IdClient, [IdClient]),
					   [Id_Expeditor] = COALESCE(@IdExpeditor, [IdExpeditor]),
					   [Numar_Comanda] = COALESCE(@NumarComanda, [NumarComanda]),
					   [Cantitate] = COALESCE(@Cantitate, [Cantitate]),
					   [Data_comanda] = COALESCE(@DataComanda, [DataComanda])
				WHERE [Id_Comanda]=@IdComanda
		   end try
		   begin catch
		        DECLARE @ErrorMessage NVARCHAR(1000);
				DECLARE @ErrorSeverity INT;
				DECLARE @ErrorState INT;
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),
					   @ErrorState = ERROR_STATE();
			    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		   end catch

		   RETURN(0)
		   END
GO

*/

--		Procedura:	usp_Update_Expeditor  ->  actualizare	date din tabela Expeditor	
	
/*if exists (select *from dbo.sysobjects where [Name]='usp_Update_Expeditor' and Type='P')
		drop procedure dbo.usp_Update_Expeditor
GO			

CREATE procedure usp_Update_Expeditor (
	@IdExpeditor int, @Nume varchar(50)=NULL, @Prenume varchar(50)=NULL, @Telefon int=NULL
)
as
		set quoted_identifier off
		set NOCOUNT ON

		--  Validarea datelor folosind coduri de stare

		IF @IdExpeditor=''
		   BEGIN
				RETURN(1)
		   END
		ELSE IF @Nume=''
		   BEGIN
				RETURN(2)
		   END
		ELSE IF @Prenume=''
		   BEGIN
				RETURN(3)
		   END
		ELSE IF @Telefon=''
		   BEGIN
				RETURN(4)
		   END
		ELSE
		   BEGIN 
		        
		   begin try
		        UPDATE [EXPEDITOR] SET
					   [Nume] = COALESCE(@Nume, [Nume]),
					   [Prenume] = COALESCE(@Prenume, [Prenume]),
					   [Telefon] = COALESCE(@Telefon, [Telefon])
				WHERE [Id_Expeditor] = @IdExpeditor
		   end try
		   begin catch
		        DECLARE @ErrorMessage NVARCHAR(1000);
				DECLARE @ErrorSeverity INT;
				DECLARE @ErrorState INT;
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),
					   @ErrorState = ERROR_STATE();
			    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		   end catch

		   RETURN(0)
		   END
GO
*/

--      Procedura: usp_Insert_Comanda_Expeditor  ->  inserare date in tabela Comanda folosind numele unui expeditor

/*if exists (select *from dbo.sysobjects where [Name]='usp_Insert_Comanda_Expeditor' and Type='P')
		drop procedure dbo.usp_Insert_Comanda_Expeditor
GO

CREATE procedure usp_Insert_Comanda_Expeditor (
	@Nume varchar(50),
	@IdPlata int,
	@IdClient int, 
	@NumarComanda int,
	@Cantitate int,
	@DataComanda date
)
as

	set quoted_identifier off
	set NOCOUNT ON

	declare @ExpeditorId int

	--  Validarea datelor folosind coduri de stare

		IF @Nume=''
		   BEGIN
				RETURN(1)
		   END
		ELSE IF @IdPlata=''
		   BEGIN
				RETURN(2)
		   END
		ELSE IF @IdClient=''
		   BEGIN
				RETURN(3)
		   END
		ELSE IF @NumarComanda=''
		   BEGIN
				RETURN(4)
		   END
		ELSE IF @Cantitate=''
		   BEGIN
				RETURN(5)
		   END
		ELSE IF @DataComanda=''
		   BEGIN
				RETURN(6)
		   END
		ELSE
		   BEGIN 
		        
	       begin try
			    select @ExpeditorId=Id_Expeditor from EXPEDITOR where Nume=@Nume
			    IF @ExpeditorId IS NULL
			    BEGIN
				   RAISERROR('Numele de expeditor este inexistent.', 11, 1)
				   RETURN
			     END
			
			    --apeleaza PS usp_Insert_Comanda
			    exec usp_Insert_Comanda
				   @IdPlata=@IdPlata,
				   @IdClient=@IdClient,
				   @IdExpeditor=@ExpeditorId,
				   @NumarComanda=@NumarComanda,
				   @Cantitate=@Cantitate,
				   @DataComanda=@DataComanda
	       end try
	       begin catch
			       DECLARE @ErrorMessage NVARCHAR(1000);
			       DECLARE @ErrorSeverity INT;
			       DECLARE @ErrorState INT;
			       SELECT @ErrorMessage=ERROR_MESSAGE(),
				   @ErrorSeverity=ERROR_SEVERITY(),
				   @ErrorState=ERROR_STATE();
		           RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	       end catch
	
	       RETURN(0)
		   END
GO
*/

--      Procedura: usp_Update_Comanda_Client  ->  actualizeaza datele din tabela Comanda folosind denumirea unui client

/*if exists (select *from dbo.sysobjects where [Name]='usp_Update_Comanda_Client' and Type='P')
		drop procedure dbo.usp_Update_Comanda_Client
GO

CREATE procedure usp_Update_Comanda_Client (
    @IdComanda int,
    @Client varchar(50),
	@IdPlata int,
	@IdExpeditor int,
	@NumarComanda int,
	@Cantitate int,
	@DataComanda date
)
as

    set quoted_identifier off
	set NOCOUNT ON

	declare @ClientId int

	--  Validarea datelor folosind coduri de stare

		IF @IdComanda=''
		   BEGIN
				RETURN(1)
		   END
		ELSE IF @Client=''
		   BEGIN
				RETURN(2)
		   END
		ELSE IF @IdPlata=''
		   BEGIN
				RETURN(3)
		   END
		ELSE IF @IdExpeditor=''
		   BEGIN
				RETURN(4)
		   END
		ELSE IF @NumarComanda=''
		   BEGIN
				RETURN(5)
		   END
		ELSE IF @Cantitate=''
		   BEGIN
				RETURN(6)
		   END
		ELSE IF @DataComanda=''
		   BEGIN
				RETURN(7)
		   END
		ELSE
		   BEGIN 
		       
	       begin try
	           select @ClientId=Id_Client from CLIENT where Nume=@Client
			   IF @ClientId = NULL
			   BEGIN
			       RAISERROR('Clientul este inexistent.', 11, 1)
				   RETURN
			   END

			   --apeleaza PS usp_Update_Comanda
			   exec usp_Update_Comanda
			        @IdComanda=@IdComanda,
			        @IdPlata=@IdPlata,
				    @IdClient=@ClientId,
				    @IdExpeditor=@IdExpeditor,
				    @NumarComanda=@NumarComanda,
				    @Cantitate=@Cantitate,
				    @DataComanda=@DataComanda
	       end try
	       begin catch
			   DECLARE @ErrorMessage NVARCHAR(1000);
			   DECLARE @ErrorSeverity INT;
			   DECLARE @ErrorState INT;
			   SELECT @ErrorMessage=ERROR_MESSAGE(),
				      @ErrorSeverity=ERROR_SEVERITY(),
				      @ErrorState=ERROR_STATE();
		       RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	       end catch

	       RETURN(0)
		   END
GO
*/
 

--Procedura: usp_Insert_Detalii_Comanda  ->  detalierea unei comenzi folosind tranzactii

/*if exists (select *from dbo.sysobjects where [Name]='usp_Insert_Detalii_Comanda' and Type='P')
	   drop procedure dbo.usp_Insert_Detalii_Comanda
GO

CREATE procedure usp_Insert_Detalii_Comanda (
	@NumeFurnizor varchar(50),
	@NumeCategorie varchar(30),
	@NumeProdus varchar(30),
	@Descriere varchar(30),
	@Cantitate int,
	@Culoare varchar(30),
	@Marime varchar(30),
	@Discount int,
	@Pret int,
	@Greutate int,
	@Denumire varchar(50),
	@IdPlata int,
	@IdClient int,
	@IdExpeditor int,
	@NumarComanda int,
	@Total int,
	@DataInregistrari date,
	@DataReturnarii date,
	@DataComanda date
)
as
	set quoted_identifier off
	set NOCOUNT ON
	DECLARE @IdProdus int, @IdFurnizor int, @IdComanda int;
	DECLARE @n int;
	DECLARE @ErrorMessage NVARCHAR(1000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;

	begin try
			select @IdFurnizor=@IdFurnizor from FURNIZOR
					where Nume_furnizor=@NumeFurnizor
			IF @IdFurnizor IS NULL
			BEGIN
				RAISERROR('Furnizor inexistent', 11, 1)
				RETURN
			END

			select @IdComanda=c.Id_Comanda, @n=c.Data_comanda from COMANDA c
			       where (c.Id_Plata=@IdPlata) and (c.Id_Client=@IdClient) and (c.Id_Expeditor=@IdExpeditor) and (c.Numar_Comanda=@NumarComanda)
			IF @IdComanda IS NULL
			BEGIN 
				RAISERROR('Client inexistent.', 11, 1)
				RETURN
			END

			IF @n IS NULL OR @n<@DataComanda
			BEGIN
			    RAISERROR('Data comenzii a expirat', 11, 1)
				RETURN 
			END

			begin try
			        BEGIN TRAN
					--Insereaza date in tabela Produs
					INSERT INTO [PRODUS] (
					       [Id_Furnizor],
						   [Id_Categorie],
						   [Nume_Produs],
						   [Descriere],
						   [Cantitate],
						   [Culoare],
						   [Marime],
						   [Discount],
						   [Pret],
						   [Greutate]
					)
					VALUES (
							@NumeFurnizor,
							@NumeCategorie,
							@NumeProdus,
							@Descriere,
							@Cantitate,
							@Culoare,
							@Marime,
							@Discount,
							@Pret,
							@Greutate
					)

					select @IdProdus=@IdProdus from PRODUS
					      where (Id_Furnizor=@NumeFurnizor) and (Id_Categorie=@NumeCategorie) and (Nume_Produs=@NumeProdus) and 
					      (Descriere=@Descriere) and (Cantitate=@Cantitate) and (Culoare=@Culoare) and
					      (Marime=@Marime) and (Discount=@Discount) and (Pret=@Pret) and (Greutate=@Greutate) 
			         IF @IdProdus IS NULL
			         BEGIN 
				         RAISERROR('Produs inexistent.', 11, 1)
				         RETURN
			         END

					--Insereaza date in tabela Detalii Comanda
					INSERT INTO [DETALII_COMANDA] (
						   [Id_Comanda],
						   [Id_Produs],
						   [Denumire],
						   [Pret],
						   [Cantitate],
						   [Culoare],
						   [Total],
						   [Discount],
						   [Data_inregistrari],
						   [Data_returnarii]
					)
					VALUES (
							@IdComanda,
							@IdProdus,
							@Denumire,
							@Pret,
							@Cantitate,
							@Culoare,
							@Total,
							@Discount,
							@DataInregistrari,
							@DataReturnarii
					)

					--Actualizeaza date in Comanda
					UPDATE COMANDA SET
					     [Data_comanda]=[Data_comanda]-@DataComanda
						 WHERE Id_Comanda=@IdComanda
					COMMIT TRAN
		   end try
		   begin catch
					SELECT @ErrorMessage=ERROR_MESSAGE(),
						   @ErrorSeverity=ERROR_SEVERITY(),
						   @ErrorState=ERROR_STATE();
					ROLLBACK
					RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
			end catch
	end try	
	begin catch
			SELECT @ErrorMessage=ERROR_MESSAGE(),
				   @ErrorSeverity=ERROR_SEVERITY(),
				   @ErrorState=ERROR_STATE();
				   RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	end catch
GO
*/




