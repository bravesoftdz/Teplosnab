/*
Run this script on:

        (local).Teplosnab_copy    -  This database will be modified

to synchronize it with:

        (local).Teplosnab

You are recommended to back up your database before running this script

Script created by SQL Compare version 8.0.0 from Red Gate Software Ltd at 27.03.2014 12:30:37

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Altering [dbo].[obekt]'
GO
ALTER TABLE [dbo].[obekt] ADD
[qg] [float] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_calc_obk_vk]'
GO
ALTER PROCEDURE sp_calc_obk_vk
	@data datetime
AS
	-- Обновляем все объекы, кроме ЖСК
	UPDATE dataobekt
	SET
    symh=round(b.kybv*a.cenav,0),
		symkk=round(b.kybk*a.cenak,0),
    symhnds=round(b.kybv*a.cenav*c.nds/100,0),
		symknds=round(b.kybk*a.cenak*c.nds/100,0),
    symhs=round((b.kybv*a.cenav)+(b.kybv*a.cenav*c.nds/100),0),
		symks=round((b.kybk*a.cenak)+(b.kybk*a.cenak*c.nds/100),0),
    perhnds=round((b.perh*c.nds/(100+c.nds)),0),
		perknds=round((b.perk*c.nds/(100+c.nds)),0),
    rastarifv=a.cenav,
		rastarifk=a.cenak
	FROM	
		(datatarifv as a join dataobekt as b on (a.datan=b.datan)) join
    obekt as c on(a.kodtv=c.kodtv) and(c.kodobk=b.kodobk) 
  WHERE b.datan=@data and c.kodtv<>3
  
	-- Обновляем все объекы ЖСК
    
    UPDATE dataobekt
	SET    
    symhnds=0, symknds=0, symhs = symh, symks = symkk,
    perhnds=0, perknds=0, rastarifv=a.cenav, rastarifk=a.cenak
	FROM	
		(datatarifv as a join dataobekt as b on (a.datan=b.datan)) join
    obekt as c on(a.kodtv=c.kodtv) and(c.kodobk=b.kodobk)
    WHERE b.datan=@data and c.kodtv=3
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
