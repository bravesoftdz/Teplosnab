/*
Run this script on:

        (local).Teplosnab_copy    -  This database will be modified

to synchronize it with:

        (local).Teplosnab

You are recommended to back up your database before running this script

Script created by SQL Compare version 8.0.0 from Red Gate Software Ltd at 03.10.2013 23:18:21

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
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_GKT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_GKV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_SYMT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_SYMV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_PERT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_PERV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_PGKT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_PGKV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_SYMK]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_SYMGV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symtnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symvnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_rastarift]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_rastarifv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_kybv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_kybk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symh]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symkk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symhnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symknds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symhs]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symks]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_perh]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_perk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_pkybv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_pkybk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_rastarifk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_pertnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_pervnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_perhnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_perknds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lsymt]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lgkt]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lsymv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lgkv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lsymh]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lkybv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lsymkk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lkybk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_rastarifg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_kybg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symgnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_symgs]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_perg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_pkybg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_pergnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lsymg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] DROP CONSTRAINT [DF_pr_obekt_lkybg]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
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
PRINT N'Altering [dbo].[tarifg]'
GO
ALTER TABLE [dbo].[tarifg] ALTER COLUMN [nazt] [varchar] (30) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[tarifv]'
GO
ALTER TABLE [dbo].[tarifv] ALTER COLUMN [nazt] [varchar] (30) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[TPlanStok]'
GO
ALTER TABLE [dbo].[TPlanStok] ALTER COLUMN [tarif] [float] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[TPlanG]'
GO
ALTER TABLE [dbo].[TPlanG] ALTER COLUMN [tarif] [float] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[TPlanVoda]'
GO
ALTER TABLE [dbo].[TPlanVoda] ALTER COLUMN [tarif] [float] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[TPlanTeplo]'
GO
ALTER TABLE [dbo].[TPlanTeplo] ALTER COLUMN [tarif] [float] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [GKT] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [GKV] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [SYMT] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [SYMV] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [PERT] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [PERV] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [PGKT] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [PGKV] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [SYMK] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [SYMGV] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symtnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symvnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [rastarift] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [rastarifv] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [kybv] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [kybk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symh] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symkk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symhnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symknds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symhs] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symks] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [perh] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [perk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [pkybv] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [pkybk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [rastarifk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [pertnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [pervnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [perhnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [perknds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lsymt] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lgkt] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lsymv] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lgkv] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lsymh] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lkybv] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lsymkk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lkybk] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [rastarifg] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [kybg] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symg] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symgnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [symgs] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [perg] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [pkybg] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [pergnds] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lsymg] [float] NULL
ALTER TABLE [dbo].[pr_obekt] ALTER COLUMN [lkybg] [float] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[tarift]'
GO
ALTER TABLE [dbo].[tarift] ALTER COLUMN [nazt] [varchar] (30) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_update_tPredoplata]'
GO
ALTER  PROCEDURE sp_update_tPredoplata
AS
	DECLARE @p_t decimal(20,0), 
    		@p_v decimal(20,0), 
            @p_k decimal(20,0),
            @p_g decimal(20,0),
            @s_t decimal(20,0), 
    		@s_v decimal(20,0), 
            @s_k decimal(20,0),
            @s_g decimal(20,0)
	SELECT 
    	@p_t = fsum_t, @p_v = fsum_v, @p_k = fsum_k, @p_g = fsum_g,
        @s_t = sum_t, @s_v = sum_v, @s_k = sum_k, @s_g = sum_g
	FROM tPredoplata

    if (@s_t=0) set @s_t=1;
    if (@s_v=0) set @s_v=1;
    if (@s_k=0) set @s_k=1;
    if (@s_g=0) set @s_g=1;
    
	IF (ISNULL(@p_t,0)+ISNULL(@p_v,0)+ISNULL(@p_k,0)+ISNULL(@p_g,0)) != 0
		UPDATE tPredoplata
        SET psum_t = round(fsum_t/@s_t,2),
          	psum_v = round(fsum_v/@s_v,2),
          	psum_k = round(fsum_k/@s_k,2),
          	psum_g = round(fsum_g/@s_g,2)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_ras_kot_g]'
GO
ALTER  PROCEDURE [dbo].[sp_ras_kot_g] 
@data1 datetime, @data2 datetime
AS
	DECLARE @cur_kot CURSOR
	DECLARE @kod int
	-- Создаем таблицу
	IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N'ras_kot_g' 
	  AND 	 type = 'U')
    DROP TABLE ras_kot_g
    
	CREATE TABLE ras_kot_g 
	(nazv varchar(50),nazv_pot varchar(50),kybg decimal(15,2),
	 sum_nacg decimal(20,0),per_kg	decimal(15,2),sum_perg decimal(20,0),tip int)
     
	-- Объявляем курсор
	SET @cur_kot = CURSOR FOR SELECT kodkot FROM koteln ORDER BY kodkot
	OPEN @cur_kot
	FETCH NEXT FROM @cur_kot INTO @kod
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		-- Данные по населению
		INSERT INTO ras_kot_g
		SELECT 
			a.nazk,'Население',
			sum(isnull(b.kybg,0)),
			sum(isnull(b.symg,0)),
			sum(isnull(b.pkybg,0)),
			sum(isnull(b.perg,0)),1
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and c.kodtg in (3,6,7,8) and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybg,0))+
					SUM(ISNULL(b.symgs,0))+
					SUM(ISNULL(b.pkybg,0))+
					SUM(ISNULL(b.perg,0))) !=0
		
        -- Данные по ЖСК
		INSERT INTO ras_kot_g
		SELECT 
			a.nazk,'в том числе ЖСК + вед.',
			sum(isnull(b.kybg,0)),
			sum(isnull(b.symg,0)),
			sum(isnull(b.pkybg,0)),
			sum(isnull(b.perg,0)),2
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and c.kodtg in (3,6,7) and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybg,0))+
					SUM(ISNULL(b.symgs,0))+
					SUM(ISNULL(b.pkybg,0))+
					SUM(ISNULL(b.perg,0))) !=0
		
        -- Данные по организациям
		INSERT INTO ras_kot_g
		SELECT 
			a.nazk,'Организации',
			sum(isnull(b.kybg,0)),
			sum(isnull(b.symg,0)),
			sum(isnull(b.pkybg,0)),
			sum(isnull(b.perg,0)),3
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and c.kodtg not in (3,6,7,8) and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybg,0))+
					SUM(ISNULL(b.symgs,0))+
					SUM(ISNULL(b.pkybg,0))+
					SUM(ISNULL(b.perg,0))) !=0
		
        -- Итоги по участку
		INSERT INTO ras_kot_g
		SELECT 
			a.nazk,'ИТОГО',
			sum(isnull(b.kybg,0)),
			sum(isnull(b.symg,0)),
			sum(isnull(b.pkybg,0)),
			sum(isnull(b.perg,0)),4
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybg,0))+
					SUM(ISNULL(b.symgs,0))+
					SUM(ISNULL(b.pkybg,0))+
					SUM(ISNULL(b.perg,0))) !=0
		-- Следующая запись
		FETCH NEXT FROM @cur_kot INTO @kod
	END
	CLOSE @cur_kot
	DEALLOCATE @cur_kot
	-- ИТОГИ по предприятию
	INSERT INTO ras_kot_g
	SELECT
		'ВСЕГО','Население',sum(kybg),
	 	sum(sum_nacg),sum(per_kg),sum(sum_perg),11
	FROM ras_kot_g	
	WHERE tip = 1
	INSERT INTO ras_kot_g
	SELECT
		'ВСЕГО','в том числе ЖСК + вед.',sum(kybg),
	 	sum(sum_nacg),sum(per_kg),sum(sum_perg),21
	FROM ras_kot_g	
	WHERE tip = 2
	INSERT INTO ras_kot_g
	SELECT
		'ВСЕГО','организации',sum(kybg),
	 	sum(sum_nacg),sum(per_kg),sum(sum_perg),31
	FROM ras_kot_g	
	WHERE tip = 3
	INSERT INTO ras_kot_g
	SELECT
		'ВСЕГО','ИТОГО',sum(kybg),
	 	sum(sum_nacg),sum(per_kg),sum(sum_perg),41
	FROM ras_kot_g	
	WHERE tip = 4
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_ras_nac_g]'
GO
ALTER  PROCEDURE [dbo].[sp_ras_nac_g]
@data1 datetime, @data2 datetime
AS
	IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N'ras_nac_g' 
	  AND 	 type = 'U')
    DROP TABLE ras_nac_g
    
	CREATE TABLE ras_nac_g
	(nazv char(50),tarifg decimal(15,2),kod_tarif int,kybg decimal(15,2),
	 sum_nacg decimal(20,0),per_kg	decimal(15,2),sum_perg decimal(20,0))
	
    INSERT INTO ras_nac_g
	SELECT
		a.nazt,AVG(b.cenag),a.kodtg,
		SUM(ISNULL(c.kybg,0)),
		SUM(ISNULL(c.symgs,0)),
		SUM(ISNULL(c.pkybg,0)),
		SUM(ISNULL(c.perg,0))
	FROM tarifg a, datatarifg b, dataobekt c, obekt d
	WHERE a.kodtg = b.kodtg and a.kodtg = d.kodtg and
				b.datan = c.datan and c.kodobk = d.kodobk
				and b.datan between @data1 and @data2
	GROUP BY a.nazt, a.kodtg
	HAVING (SUM(ISNULL(c.kybg,0))+
					SUM(ISNULL(c.symgs,0))+
					SUM(ISNULL(c.pkybg,0))+
					SUM(ISNULL(c.perg,0))) !=0
	ORDER BY a.kodtg
	
    -- Добавляем итог по населению
	INSERT INTO ras_nac_g
	SELECT
		'ИТОГО население',Null,Null,
		SUM(kybg),SUM(sum_nacg),SUM(per_kg),SUM(sum_perg)
	FROM ras_nac_g
	WHERE kod_tarif = 8
    
	-- Добавляем итог по ЖСК
	INSERT INTO ras_nac_g
	SELECT
		'ИТОГО ЖСК + вед.',Null,Null,
		SUM(kybg),SUM(sum_nacg),SUM(per_kg),SUM(sum_perg)
	FROM ras_nac_g
	WHERE kod_tarif in (3,6,7)
    
	-- Добавляем итог по организациям
	INSERT INTO ras_nac_g
	SELECT
		'ИТОГО организации',Null,Null,
		SUM(kybg),SUM(sum_nacg),SUM(per_kg),SUM(sum_perg)
	FROM ras_nac_g
	WHERE kod_tarif NOT IN (3,6,7,8)
	-- Добавляем итог
	INSERT INTO ras_nac_g
	SELECT
		'ВСЕГО:',Null,Null,
		SUM(kybg),SUM(sum_nacg),SUM(per_kg),SUM(sum_perg)
	FROM ras_nac_g
	WHERE kod_tarif Is Not Null
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_perexod]'
GO
ALTER           PROCEDURE sp_perexod
	@oper int, @data datetime -- Начало текущего периода	
AS
	DECLARE @add_rec int
	IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N't_upnewmonth' 
	  AND 	 type = 'U')
    DROP TABLE t_upnewmonth
		CREATE TABLE t_upnewmonth
		(nazv char(100),cnt_rec int,cnt_uprec int)
	
	IF @oper = 2 -- Обновление нового месяца
	BEGIN
		-- Организации
		SELECT @add_rec = count(*) FROM org
			 	WHERE kodorg NOT IN 
				(SELECT kodorg FROM dataorg WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по организациям',count(*),@add_rec
				FROM org
		INSERT INTO dataorg (kodorg,datan,datak)
				SELECT kodorg,@data,teplosnab.dbo.end_of_month(@data) FROM org
				WHERE kodorg NOT IN (SELECT kodorg FROM dataorg WHERE datan=@data)		
		-- Объекты
		SELECT @add_rec = count(*) FROM obekt
			 	WHERE kodobk NOT IN 
				(SELECT kodobk FROM dataobekt WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по объектам',count(*),@add_rec
				FROM obekt
		INSERT INTO dataobekt (kodobk,kybv,kybk,kybg,datan,datak)
				SELECT kodobk,qv,qk,qg,@data,teplosnab.dbo.end_of_month(@data) FROM obekt
				WHERE kodobk NOT IN (SELECT kodobk FROM dataobekt WHERE datan=@data)
		-- Дома
		SELECT @add_rec = count(*) FROM doma
			 	WHERE koddom NOT IN 
				(SELECT koddom FROM datadoma WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по домам',count(*),@add_rec
				FROM doma
		INSERT INTO datadoma (koddom,datan,datak)
				SELECT koddom,@data,teplosnab.dbo.end_of_month(@data) FROM doma
				WHERE koddom NOT IN (SELECT koddom FROM datadoma WHERE datan=@data)	
		-- Участки
		SELECT @add_rec = count(*) FROM koteln
			 	WHERE kodkot NOT IN 
				(SELECT kodkot FROM datakoteln WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по участкам',count(*),@add_rec
				FROM koteln
		INSERT INTO datakoteln (kodkot,datan,datak)
				SELECT kodkot,@data,teplosnab.dbo.end_of_month(@data) FROM koteln
				WHERE kodkot NOT IN (SELECT kodkot FROM datakoteln WHERE datan=@data)
		-- Приборы
		SELECT @add_rec = count(*) FROM pribor
			 	WHERE kod NOT IN 
				(SELECT kodpr FROM dataprib WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по приборам',count(*),@add_rec
				FROM pribor
		INSERT INTO dataprib (kodpr,datan,datak)
				SELECT kod,@data,teplosnab.dbo.end_of_month(@data) FROM pribor
				WHERE kod NOT IN (SELECT kodpr FROM dataprib WHERE datan=@data)
		-- Тарифы тепло
		SELECT @add_rec = count(*) FROM tarift
			 	WHERE kodtt NOT IN 
				(SELECT kodtt FROM datatarif WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по тарифам (тепло)',count(*),@add_rec
				FROM tarift
		INSERT INTO datatarif (kodtt,datan,datak)
				SELECT kodtt,@data,teplosnab.dbo.end_of_month(@data) FROM tarift
				WHERE kodtt NOT IN (SELECT kodtt FROM datatarif WHERE datan=@data)
		-- Тарифы вода
		SELECT @add_rec = count(*) FROM tarifv
			 	WHERE kodtv NOT IN 
				(SELECT kodtv FROM datatarifv WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по тарифам (вода)',count(*),@add_rec
				FROM tarifv
		INSERT INTO datatarifv (kodtv,datan,datak)
				SELECT kodtv,@data,teplosnab.dbo.end_of_month(@data) FROM tarifv
				WHERE kodtv NOT IN (SELECT kodtv FROM datatarifv WHERE datan=@data)
        -- Тарифы мусор
		SELECT @add_rec = count(*) FROM tarifg
			 	WHERE kodtg NOT IN 
				(SELECT kodtg FROM datatarifg WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Обновление данных по тарифам (мусор)',count(*),@add_rec
				FROM tarifg
		INSERT INTO datatarifg (kodtg,datan,datak)
				SELECT kodtg,@data,teplosnab.dbo.end_of_month(@data) FROM tarifg
				WHERE kodtg NOT IN (SELECT kodtg FROM datatarifg WHERE datan=@data)        
	END
	IF @oper = 1 -- Переход на новый месяц
	BEGIN
		-- Проверяем дату и если это начало года, 
		-- тогда сбрасываем начисления в архив
		DECLARE @s_year datetime, @l_data datetime -- Прошлый месяц
		SET @l_data = dateadd(month,-1,@data)
		SET @s_year = convert(datetime,'1/1/'+convert(char(4),year(@data)),101)
		
		-- Организации
		SELECT @add_rec = count(*) FROM org
			 	WHERE kodorg NOT IN 
				(SELECT kodorg FROM dataorg WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по организациям',count(*),@add_rec
				FROM org
		INSERT INTO dataorg (kodorg,datan,datak)
				SELECT kodorg,@data,teplosnab.dbo.end_of_month(@data) FROM org
				WHERE kodorg NOT IN (SELECT kodorg FROM dataorg WHERE datan=@data)		
		-- Объекты
		SELECT @add_rec = count(*) FROM obekt
			 	WHERE kodobk NOT IN 
				(SELECT kodobk FROM dataobekt WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по объектам',count(*),@add_rec
				FROM obekt
		INSERT INTO dataobekt (kodobk,kybv,kybk,kybg,datan,datak)
				SELECT kodobk,qv,qk,qg,@data,teplosnab.dbo.end_of_month(@data) FROM obekt
				WHERE kodobk NOT IN (SELECT kodobk FROM dataobekt WHERE datan=@data)
		-- Дома
		SELECT @add_rec = count(*) FROM doma
			 	WHERE koddom NOT IN 
				(SELECT koddom FROM datadoma WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по домам',count(*),@add_rec
				FROM doma
		INSERT INTO datadoma (koddom,datan,datak)
				SELECT koddom,@data,teplosnab.dbo.end_of_month(@data) FROM doma
				WHERE koddom NOT IN (SELECT koddom FROM datadoma WHERE datan=@data)	
		-- Участки
		SELECT @add_rec = count(*) FROM koteln
			 	WHERE kodkot NOT IN 
				(SELECT kodkot FROM datakoteln WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по участкам',count(*),@add_rec
				FROM koteln
		INSERT INTO datakoteln (kodkot,datan,datak)
				SELECT kodkot,@data,teplosnab.dbo.end_of_month(@data) FROM koteln
				WHERE kodkot NOT IN (SELECT kodkot FROM datakoteln WHERE datan=@data)
		-- Приборы
		SELECT @add_rec = count(*) FROM pribor
			 	WHERE kod NOT IN 
				(SELECT kodpr FROM dataprib WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по приборам',count(*),@add_rec
				FROM pribor
		INSERT INTO dataprib (kodpr,datan,datak)
				SELECT kod,@data,teplosnab.dbo.end_of_month(@data) FROM pribor
				WHERE kod NOT IN (SELECT kodpr FROM dataprib WHERE datan=@data)
		-- Тарифы тепло
		SELECT @add_rec = count(*) FROM tarift
			 	WHERE kodtt NOT IN 
				(SELECT kodtt FROM datatarif WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по тарифам (тепло)',count(*),@add_rec
				FROM tarift
		INSERT INTO datatarif (kodtt,cena,datan,datak)
				SELECT kodtt,cena,@data,teplosnab.dbo.end_of_month(@data) FROM datatarif
				WHERE kodtt NOT IN (SELECT kodtt FROM datatarif WHERE datan=@data)
				and datan = @l_data
		-- Тарифы вода
		SELECT @add_rec = count(*) FROM tarifv
			 	WHERE kodtv NOT IN 
				(SELECT kodtv FROM datatarifv WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по тарифам (вода)',count(*),@add_rec
				FROM tarifv
		INSERT INTO datatarifv (kodtv,cenav,cenak,datan,datak)
				SELECT kodtv,cenav,cenak,@data,teplosnab.dbo.end_of_month(@data) FROM datatarifv
				WHERE kodtv NOT IN (SELECT kodtv FROM datatarifv WHERE datan=@data)
				and datan = @l_data
        -- Тарифы мусор
		SELECT @add_rec = count(*) FROM tarifg
			 	WHERE kodtg NOT IN 
				(SELECT kodtg FROM datatarifg WHERE datan = @data)
		INSERT INTO t_upnewmonth
				SELECT 'Добавление данных по тарифам (мусор)',count(*),@add_rec
				FROM tarifg
		INSERT INTO datatarifg (kodtg,cenag,datan,datak)
				SELECT kodtg,cenag,@data,teplosnab.dbo.end_of_month(@data) FROM datatarifg
				WHERE kodtg NOT IN (SELECT kodtg FROM datatarifg WHERE datan=@data)
				and datan = @l_data        
	END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[sp_ras_g]'
GO
CREATE  PROCEDURE [dbo].[sp_ras_g] 
	@data1 datetime, @data2 datetime
AS
	IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N'ras_vk' 
	  AND 	 type = 'U')
    DROP TABLE ras_vk
	CREATE TABLE ras_vk (kod int,nazv varchar(50),nazv_par varchar(100),
	f1 decimal(15,2),f2 decimal(15,2),f3 decimal(15,2),
	f4 decimal(15,2),f5 decimal(15,2),f6 decimal(15,2),
	f7 decimal(15,2),f8 decimal(15,2),f9 decimal(15,2),
	f10 decimal(15,2),f11 decimal(15,2),f12 decimal(15,2),
	f13 decimal(15,2),f14 decimal(15,2),f15 decimal(15,2),
	f16 decimal(15,2),f17 decimal(15,2),f18 decimal(15,2),
	kol_usl decimal(15,2),ps decimal(15,2), tip int)
	
	DECLARE @str_sql nvarchar(1000)
	DECLARE @cur_kot CURSOR -- Объявляем курсор
	DECLARE @kod int, @nazv varchar(100)
	DECLARE @cur_tt CURSOR -- Объявляем курсор
	DECLARE @kodtt int 
	DECLARE @gk decimal(15,2), @def nvarchar(1000)
	SET @cur_kot = CURSOR FOR 
		SELECT kodkot, nazk FROM koteln ORDER BY kodkot
	OPEN @cur_kot
	FETCH NEXT FROM @cur_kot INTO @kod, @nazv	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	-- 1. ВОДА
		INSERT INTO ras_vk (kod, nazv, nazv_par, tip)
			VALUES (@kod, @nazv, 'Хол.вода', 
			cast(cast(@kod as varchar(2))+cast(1 as varchar(1)) as integer))
		-- Внутренний цикл по тарифу
		SET @cur_tt = CURSOR FOR 
		SELECT kodtv FROM tarifv ORDER BY kodtv		
		OPEN @cur_tt
		FETCH NEXT FROM @cur_tt INTO @kodtt
		WHILE @@FETCH_STATUS = 0
		BEGIN			
			SELECT @gk = SUM(ISNULL(b.kybv,0))
				FROM obekt a, dataobekt b
				WHERE a.kodobk = b.kodobk and a.kodtv = @kodtt and a.kodkot = @kod
				and b.datan between @data1 and @data2
			IF @gk IS NULL SET @gk = 0
			-- Пишем внешний запрос	
			SET @str_sql = 'UPDATE ras_vk SET '+
			'f'+cast(@kodtt as varchar(2))+'=@gkt where tip = '+
			cast(@kod as varchar(2))+cast(1 as varchar(1))
			SET @def = '@gkt decimal(15,2)'
			EXEC sp_executesql @str_sql, @def, @gkt=@gk
			-- Обновляем реализацию
			SELECT @gk = SUM(ISNULL(b.kybv,0))
				FROM obekt a, dataobekt b
				WHERE a.kodobk = b.kodobk and a.kodkot = @kod
				and b.datan between @data1 and @data2
			IF @gk IS NULL SET @gk = 0
			SET @str_sql = 'UPDATE ras_vk SET '+
			'kol_usl=@gkt where tip = '+
			cast(@kod as varchar(2))+cast(1 as varchar(1))
			SET @def = '@gkt decimal(15,2)'
			EXEC sp_executesql @str_sql, @def, @gkt=@gk

			FETCH NEXT FROM @cur_tt INTO @kodtt
		END
		CLOSE @cur_tt
		DEALLOCATE @cur_tt
		-- Конец цикла	
	-- 2. Стоки
		INSERT INTO ras_vk (kod, nazv, nazv_par, tip)
			VALUES (@kod, @nazv, 'Стоки', 
			cast(cast(@kod as varchar(2))+cast(2 as varchar(1)) as integer))
		-- Внутренний цикл по тарифу		
		SET @cur_tt = CURSOR FOR 
		SELECT kodtv FROM tarifv ORDER BY kodtv		
		OPEN @cur_tt
		FETCH NEXT FROM @cur_tt INTO @kodtt
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @gk = SUM(ISNULL(b.kybk,0))
				FROM obekt a, dataobekt b
				WHERE a.kodobk = b.kodobk and a.kodtv = @kodtt and a.kodkot = @kod
				and b.datan between @data1 and @data2
			IF @gk IS NULL SET @gk = 0
			-- Пишем внешний запрос	
			SET @str_sql = 'UPDATE ras_vk SET '+
			'f'+cast(@kodtt as varchar(2))+'=@gkt where tip = '+
			cast(@kod as varchar(2))+cast(2 as varchar(1))
			SET @def = '@gkt decimal(15,2)'
			EXEC sp_executesql @str_sql, @def, @gkt=@gk
			-- Обновляем реализацию
			SELECT @gk = SUM(ISNULL(b.kybk,0))
				FROM obekt a, dataobekt b
				WHERE a.kodobk = b.kodobk and a.kodkot = @kod
				and b.datan between @data1 and @data2
			IF @gk IS NULL SET @gk = 0
			SET @str_sql = 'UPDATE ras_vk SET '+
			'kol_usl=@gkt where tip = '+
			cast(@kod as varchar(2))+cast(2 as varchar(1))
			SET @def = '@gkt decimal(15,2)'
			EXEC sp_executesql @str_sql, @def, @gkt=@gk
			
			FETCH NEXT FROM @cur_tt INTO @kodtt
		END
		CLOSE @cur_tt
		DEALLOCATE @cur_tt
		-- Конец Цикла						
		FETCH NEXT FROM @cur_kot INTO @kod, @nazv 
	END
	CLOSE @cur_kot
	DEALLOCATE @cur_kot

	-- Общие итоги
	INSERT INTO ras_vk
	SELECT 	
		NULL,'ВСЕГО:','Хол. вода',
		sum(ISNULL(f1,0)),sum(ISNULL(f2,0)),sum(ISNULL(f3,0)),
		sum(ISNULL(f4,0)),sum(ISNULL(f5,0)),sum(ISNULL(f6,0)),
		sum(ISNULL(f7,0)),sum(ISNULL(f8,0)),sum(ISNULL(f9,0)),
		sum(ISNULL(f10,0)),sum(ISNULL(f11,0)),sum(ISNULL(f12,0)),
		sum(ISNULL(f13,0)),sum(ISNULL(f14,0)),sum(ISNULL(f15,0)),
		sum(ISNULL(f16,0)),sum(ISNULL(f17,0)),sum(ISNULL(f18,0)),
		sum(ISNULL(kol_usl,0)),sum(ISNULL(ps,0)), tip = 1001
	FROM ras_vk
	WHERE SUBSTRING(CAST(tip as varchar(10)),LEN(CAST(tip as varchar(10))),1) = 1
	INSERT INTO ras_vk
	SELECT 	
		NULL,'ВСЕГО:','Стоки',
		sum(ISNULL(f1,0)),sum(ISNULL(f2,0)),sum(ISNULL(f3,0)),
		sum(ISNULL(f4,0)),sum(ISNULL(f5,0)),sum(ISNULL(f6,0)),
		sum(ISNULL(f7,0)),sum(ISNULL(f8,0)),sum(ISNULL(f9,0)),
		sum(ISNULL(f10,0)),sum(ISNULL(f11,0)),sum(ISNULL(f12,0)),
		sum(ISNULL(f13,0)),sum(ISNULL(f14,0)),sum(ISNULL(f15,0)),
		sum(ISNULL(f16,0)),sum(ISNULL(f17,0)),sum(ISNULL(f18,0)),
		sum(ISNULL(kol_usl,0)),sum(ISNULL(ps,0)), tip = 1002
	FROM ras_vk
	WHERE SUBSTRING(CAST(tip as varchar(10)),LEN(CAST(tip as varchar(10))),1) = 2
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_predoplata]'
GO
ALTER  PROCEDURE sp_predoplata
	@kod int, @data datetime
AS
	IF EXISTS (SELECT name
			FROM sysobjects
			WHERE name = N'tPredoplata'
			AND type = 'U')
		DROP TABLE tPredoplata
	CREATE TABLE tPredoplata
		(kodorg int, 
		 sum_t decimal(20,0), sum_v decimal(20,0), sum_k decimal(20,0), sum_g decimal(20,0),
		 fsum_t decimal(20,0), fsum_v decimal(20,0), fsum_k decimal(20,0), fsum_g decimal(20,0),
		 psum_t decimal(6,2), psum_v decimal(6,2), psum_k decimal(6,2), psum_g decimal(6,2))
	-- Выбираем данные по начислениям
	INSERT INTO tPredoplata (kodorg, sum_t, sum_v, sum_k, sum_g)
		SELECT kodorg, isnull(symtv+symgvs,0), isnull(sumvv,0), isnull(sumkk,0), isnull(sumgg,0)
		FROM dataorg
		WHERE datan = @data and kodorg = @kod
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_calc_obk_g]'
GO
ALTER PROCEDURE [dbo].[sp_calc_obk_g]
	@data datetime
AS
	-- Обновляем все объекы, кроме ЖСК
	UPDATE dataobekt
	SET
    symg=round(b.kybg*a.cenag,0),
    symgnds=round(b.kybg*a.cenag*c.nds/100,0),
    symgs=round((b.kybg*a.cenag)+(b.kybg*a.cenag*c.nds/100),0),
    pergnds=round((b.perg*c.nds/(100+c.nds)),0),
    rastarifg=a.cenag
	FROM	
		(datatarifg as a join dataobekt as b on (a.datan=b.datan)) join
    obekt as c on(a.kodtg=c.kodtg) and(c.kodobk=b.kodobk) 
  WHERE b.datan=@data and c.kodtg<>7
	-- Обновляем все объекы ЖСК
	UPDATE dataobekt
	SET
    symg=round((((b.kybg*a.cenag)/(c.prj+c.prjl)*c.prj)+((b.kybg*a.cenag)/(c.prj+c.prjl)*c.prjl/2)),0),
    lsymg=round(b.kybg*a.cenag/(c.prj+c.prjl)*c.prjl/2,0),
    lkybg=round(b.kybg/(c.prj+c.prjl)*c.prjl,2),
    symgnds=0,
    symgs=round((((b.kybg*a.cenag)/(c.prj+c.prjl)*c.prj)+((b.kybg*a.cenag)/(c.prj+c.prjl)*c.prjl/2)),0),
    pergnds=0,
    rastarifg=a.cenag
	FROM	
		(datatarifg as a join dataobekt as b on (a.datan=b.datan)) join
    obekt as c on(a.kodtg=c.kodtg) and(c.kodobk=b.kodobk)
    WHERE b.datan=@data and c.kodtg=7
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_ob_svod_g]'
GO
ALTER PROCEDURE [dbo].[sp_ob_svod_g]
	@data1 datetime, @data2 datetime
AS
	IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N'gen_report_g' 
	  AND 	 type = 'U')
    DROP TABLE gen_report_g
    print 'Удалили таблу'
	CREATE TABLE gen_report_g 
	(kod int, nazv char(100), kg decimal(15,2),tarifg decimal(15,2),kod_tarifg int,
	 sum_nacg decimal(20,0),sum_ndsg decimal(20,0),
	 per_kg	decimal(15,2),sum_perg decimal(20,0),razng decimal(20,0),
	 tip int)
    print 'Создали таблу' 
	-- Собираем сведения
	DECLARE @i integer
	DECLARE @kod int, @nazv varchar(100),@kg decimal(15,2),@tarifg decimal(15,2),
	@kod_tarifg int,@sum_nacg decimal(20,0),@sum_ndsg decimal(20,0),
	@per_kg decimal(15,2),@sum_perg decimal(20,0),@razng decimal(20,0),
	@cena_g decimal(15,2)
	DECLARE @cur_org CURSOR
	-- Выбираем тариф по вед. жилью
	SELECT @cena_g = AVG(cenag) FROM datatarifg
		WHERE kodtg = 3 and datan between @data1 and @data2
    print 'Выбрали тариф'    
	SET @i=0
	WHILE @i<4 -- цикл по типам организаций
	BEGIN 
		SET @cur_org = CURSOR FOR 
			SELECT a.kodorg,a.nazv,
				sum(ISNULL(b.skybg,0)),				
				sum(b.itogg),
				sum(ISNULL(b.sumgnds,0)+ISNULL(b.PERGONDS,0)),
				sum(ISNULL(b.PKYBGO,0)),
				sum(ISNULL(b.pergo,0))
				FROM org a,dataorg b 
				WHERE a.kodorg=b.kodorg and a.tiporg = @i 
				and b.datan between @data1 and @data2
				GROUP BY a.kodorg, a.nazv
				HAVING sum(ISNULL(b.skybg,0))+sum(ISNULL(b.pergo,0)) !=0
				ORDER BY a.nazv 				
		OPEN @cur_org		
		FETCH NEXT FROM @cur_org INTO 
		@kod,@nazv,@kg,@sum_nacg,@sum_ndsg,@per_kg,@sum_perg
        
		print 'Заполняем данные по организации '+cast(@kod as varchar(5))
		
        WHILE (@@FETCH_STATUS=0)
		BEGIN
            print 'Пытаюсь вставить'
			INSERT INTO gen_report_g (kod, nazv, kg, sum_nacg, sum_ndsg, per_kg, sum_perg, tip)
			VALUES (@kod, @nazv, @kg, @sum_nacg, @sum_ndsg, @per_kg, @sum_perg, @i)
			print 'Заполняем данные по объектам'
			INSERT INTO gen_report_g (kod, nazv,
									kg,tarifg,kod_tarifg,
									sum_nacg,sum_ndsg,
									per_kg,sum_perg,
									tip)
			SELECT @kod, a.nazt,
						 SUM(ISNULL(b.kybg,0)),c.cenag, a.kodtg,
						 SUM(ISNULL(b.symgs,0)),SUM(ISNULL(b.symgnds,0)+ISNULL(b.pergnds,0)),
						 SUM(ISNULL(b.pkybg,0)),SUM(ISNULL(b.perg,0)),	
						 @i+10						 								 
			FROM tarifg a, dataobekt b, datatarifg c, obekt d
			WHERE a.kodtg = d.kodtg and b.datan = c.datan and
						a.kodtg = c.kodtg and b.kodobk = d.kodobk and d.kodorg = @kod
						and b.datan between @data1 and @data2
			GROUP BY a.nazt,c.cenag, a.kodtg
			ORDER BY a.kodtg
            print 'Заполнили по организации '+cast(@kod as varchar(5))
			-- Обновляем разницу
			/*SELECT @raznv = ROUND(@cena_v*SUM(ISNULL(b.kybv,0))
						 -SUM(ISNULL(b.symhs,0)),0),
						 @raznv = ROUND(@cena_k*SUM(ISNULL(b.kybk,0))
						 -SUM(ISNULL(b.symks,0)),0)
			FROM obekt a,dataobekt b WHERE a.kodobk = b.kodobk and a.kodtv = 7
					 and b.datan between @data1 and @data2 and a.kodorg = @kod*/
			print 'Обновляем по объектам'                     
			UPDATE gen_report_g 
			SET razng = round((@cena_g-tarifg)*kg,0)
			WHERE kod_tarifg = 3 and tip = @i+10 and kod = @kod
			
            FETCH NEXT FROM @cur_org INTO 
			@kod,@nazv,@kg,@sum_nacg,@sum_ndsg,@per_kg,@sum_perg
			print 'Следующая '+cast(@kod as varchar(5))
		END
		CLOSE @cur_org
		DEALLOCATE @cur_org		
		-- Заполняем итоги
		IF @i = 0
			SET @nazv = 'ИТОГО ПО БЮДЖЕТУ:'
		IF @i = 1
			SET @nazv = 'ИТОГО ПО ХОЗРАСЧЕТУ:'
		IF @i = 2
			SET @nazv = 'ИТОГО ПО ЖСК:'
		IF @i = 3
			SET @nazv = 'ИТОГО ПО ЖСК - БСХА:'
		INSERT INTO gen_report_g (nazv,kg,sum_nacg,sum_ndsg,per_kg,sum_perg,tip)
		SELECT @nazv,SUM(kg),SUM(sum_nacg),SUM(sum_ndsg),SUM(per_kg),SUM(sum_perg),@i+20
		FROM gen_report_g WHERE tip = @i
	  SELECT @razng = SUM(razng)
		FROM gen_report_g WHERE tip = @i+10		
		UPDATE gen_report_g SET razng = @razng WHERE tip = @i+20
		SET @i = @i+1
	END
	SET @nazv = 'ИТОГО ПО ПРЕДПРИЯТИЮ:'
	INSERT INTO gen_report_g (nazv,kg,sum_nacg,sum_ndsg,per_kg,sum_perg,tip)
		SELECT @nazv,SUM(kg),SUM(sum_nacg),SUM(sum_ndsg),SUM(per_kg),SUM(sum_perg),30
	FROM gen_report_g
	WHERE (tip < 4)
    
	SELECT @razng = SUM(razng)
	FROM gen_report_g 
	WHERE (tip > 19) and (tip < 30)
	UPDATE gen_report_g SET razng = @razng WHERE tip = 30
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
