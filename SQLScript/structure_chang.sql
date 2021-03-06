/*
Run this script on:

        (local).Teplosnab_copy    -  This database will be modified

to synchronize it with:

        (local).Teplosnab

You are recommended to back up your database before running this script

Script created by SQL Compare version 8.0.0 from Red Gate Software Ltd at 18.09.2013 16:45:54

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
PRINT N'Creating [dbo].[datatarifg]'
GO
CREATE TABLE [dbo].[datatarifg]
(
[KODTG] [int] NOT NULL,
[CENAG] [float] NULL,
[DATAN] [datetime] NULL,
[DATAK] [datetime] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tarifg]'
GO
CREATE TABLE [dbo].[tarifg]
(
[kodtg] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[nazt] [varchar] (15) COLLATE Cyrillic_General_CI_AS NOT NULL,
[data_per] [datetime] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [tarifg UNIQUE _kodtg_] on [dbo].[tarifg]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [tarifg UNIQUE _kodtg_] ON [dbo].[tarifg] ([kodtg])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[obekt]'
GO
ALTER TABLE [dbo].[obekt] ADD
[kodtg] [int] NULL,
[podklg] [int] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[TPlanG]'
GO
CREATE TABLE [dbo].[TPlanG]
(
[nazv] [varchar] (100) COLLATE Cyrillic_General_CI_AS NOT NULL,
[tarif] [decimal] (15, 2) NULL,
[gk] [float] NULL,
[summa] [float] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[tPredoplata]'
GO
ALTER TABLE [dbo].[tPredoplata] ADD
[sum_g] [decimal] (20, 0) NULL,
[fsum_g] [decimal] (20, 0) NULL,
[psum_g] [decimal] (6, 2) NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gen_report_g]'
GO
CREATE TABLE [dbo].[gen_report_g]
(
[kod] [int] NULL,
[nazv] [char] (100) COLLATE Cyrillic_General_CI_AS NULL,
[kg] [decimal] (15, 2) NULL,
[tarifg] [decimal] (15, 2) NULL,
[kod_tarifg] [int] NULL,
[sum_nacg] [decimal] (20, 0) NULL,
[sum_ndsg] [decimal] (20, 0) NULL,
[per_kg] [decimal] (15, 2) NULL,
[sum_perg] [decimal] (20, 0) NULL,
[razng] [decimal] (20, 0) NULL,
[tip] [int] NULL
)
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
            @p_g decimal(20,0)
	SELECT @p_t = fsum_t, @p_v = fsum_v, @p_k = fsum_k, @p_g = fsum_g
		FROM tPredoplata
	IF (ISNULL(@p_t,0)+ISNULL(@p_v,0)+ISNULL(@p_k,0)+ISNULL(@p_g,0)) != 0
		UPDATE tPredoplata
			SET psum_t = round(fsum_t/sum_t,2),
					psum_v = round(fsum_v/sum_v,2),
					psum_k = round(fsum_k/sum_k,2),
                    psum_g = round(fsum_g/sum_g,2)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[ras_kot_g]'
GO
CREATE TABLE [dbo].[ras_kot_g]
(
[nazv] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL,
[nazv_pot] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL,
[kybg] [decimal] (15, 2) NULL,
[sum_nacg] [decimal] (20, 0) NULL,
[per_kg] [decimal] (15, 2) NULL,
[sum_perg] [decimal] (20, 0) NULL,
[tip] [int] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[ras_nac_g]'
GO
CREATE TABLE [dbo].[ras_nac_g]
(
[nazv] [char] (50) COLLATE Cyrillic_General_CI_AS NULL,
[tarifg] [decimal] (15, 2) NULL,
[kod_tarif] [int] NULL,
[kybg] [decimal] (15, 2) NULL,
[sum_nacg] [decimal] (20, 0) NULL,
[per_kg] [decimal] (15, 2) NULL,
[sum_perg] [decimal] (20, 0) NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[dataobekt]'
GO
ALTER TABLE [dbo].[dataobekt] ADD
[rastarifg] [float] NULL CONSTRAINT [DF_dataobekt_rastarifg] DEFAULT (0),
[kybg] [float] NULL CONSTRAINT [DF_dataobekt_kybg] DEFAULT (0),
[symg] [float] NULL CONSTRAINT [DF_dataobekt_symg] DEFAULT (0),
[symgnds] [float] NULL CONSTRAINT [DF_dataobekt_symgnds] DEFAULT (0),
[symgs] [float] NULL CONSTRAINT [DF_dataobekt_symgs] DEFAULT (0),
[perg] [float] NULL CONSTRAINT [DF_dataobekt_perg] DEFAULT (0),
[pkybg] [float] NULL CONSTRAINT [DF_dataobekt_pkybg] DEFAULT (0),
[pergnds] [float] NULL CONSTRAINT [DF_dataobekt_pergnds] DEFAULT (0),
[pg] [int] NULL,
[lsymg] [float] NULL CONSTRAINT [DF_dataobekt_lsymg] DEFAULT (0),
[lkybg] [float] NULL CONSTRAINT [DF_dataobekt_lkybg] DEFAULT (0)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[dataorg]'
GO
ALTER TABLE [dbo].[dataorg] ADD
[SUMG] [float] NULL CONSTRAINT [DF_dataorg_SUMG] DEFAULT (0),
[SUMGNDS] [float] NULL CONSTRAINT [DF_dataorg_SUMGNDS] DEFAULT (0),
[SUMGG] [float] NULL CONSTRAINT [DF_dataorg_SUMGG] DEFAULT (0),
[PERGO] [float] NULL CONSTRAINT [DF_dataorg_PERGO] DEFAULT (0),
[PERGONDS] [float] NULL CONSTRAINT [DF_dataorg_PERGONDS] DEFAULT (0),
[SYMIDXG] [float] NULL CONSTRAINT [DF_dataorg_SYMIDXG] DEFAULT (0),
[NDSIDXG] [float] NULL CONSTRAINT [DF_dataorg_NDSIDXG] DEFAULT (0),
[PKYBGO] [float] NULL CONSTRAINT [DF_dataorg_PKYBGO] DEFAULT (0),
[ITOGG] [float] NULL CONSTRAINT [DF_dataorg_ITOGG] DEFAULT (0),
[skybg] [float] NULL CONSTRAINT [DF_dataorg_skybg] DEFAULT (0),
[lsumg] [float] NULL CONSTRAINT [DF_dataorg_lsumg] DEFAULT (0),
[lskybg] [float] NULL CONSTRAINT [DF_dataorg_lskybg] DEFAULT (0)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_create_plan]'
GO
ALTER    PROCEDURE sp_create_plan
	@tip1 int, @tip2 int, @tip3 int, @tip4 int,
	@v1 int, @v2 int, @v3 int, @v4 int,
	@k1 decimal(15,2), @k2 decimal(15,2), @k3 decimal(15,2), @k4 decimal(15,2),
	@data datetime
AS
	
	
	IF (@tip1 >= 0 and @k1 > 0)
	BEGIN
		-- Формируем данные по теплу
		IF @v1 = 0 
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanTeplo'
				AND type = 'U')
				DROP TABLE tPlanTeplo
			SELECT c.nazv,
				avg(a.rastarift) as tarif,
				sum(ISNULL(a.gkt,0)+ISNULL(a.gkv,0))*@k1 as gk,
				sum(ISNULL(a.symk,0)+ISNULL(a.symgv,0))*@k1 as summa
			INTO TPlanTeplo
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip1-1 and a.datan = @data and b.kodtt = 1
			group by c.nazv
			order by c.nazv
		END
		IF @v1 = 1 
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanTeplo'
				AND type = 'U')
				DROP TABLE tPlanTeplo
			SELECT c.nazv,
				@k1 as tarif,
				sum(ISNULL(a.gkt,0)+ISNULL(a.gkv,0)) as gk,
				sum(ISNULL(a.gkt,0)+ISNULL(a.gkv,0))*@k1 as summa
			INTO TPlanTeplo
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip1-1 and a.datan = @data and b.kodtt = 1
			group by c.nazv
			order by c.nazv
		END
	END
	IF @tip2 >= 0 and @k2 > 0
	BEGIN
		-- Формируем данные по воде
		IF @v2 = 0 
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanVoda'
				AND type = 'U')
				DROP TABLE tPlanVoda
			SELECT c.nazv,
				avg(a.rastarifv)  as tarif,
				sum(ISNULL(a.kybv,0))*@k2 as gk,
				sum(ISNULL(a.symhs,0))*@k2 as summa
			INTO TPlanVoda
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip2-1 and a.datan = @data and b.kodtv = 1
			group by c.nazv
			order by c.nazv
		END
		IF @v2 = 1 
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanVoda'
				AND type = 'U')
				DROP TABLE tPlanVoda
			SELECT c.nazv,
				@k2  as tarif,
				sum(ISNULL(a.kybv,0)) as gk,
				sum(ISNULL(a.symhs,0))*@k2 as summa
			INTO TPlanVoda
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip2-1 and a.datan = @data and b.kodtv= 1 
			group by c.nazv
			order by c.nazv
		END
	END
	IF @tip3 >= 0 and @k3 > 0
	BEGIN
		-- Формируем данные по стокам	
		IF @v3 = 0
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanStok'
				AND type = 'U')
				DROP TABLE tPlanStok	
			SELECT c.nazv,
				avg(a.rastarifk) as tarif,
				sum(ISNULL(a.kybk,0))*@k3 as gk,
				sum(ISNULL(a.symkk,0))*@k3 as summa
			INTO TPlanStok
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip3-1 and a.datan = @data and b.kodtv = 1
			group by c.nazv
			order by c.nazv
		END
		IF @v3 = 1
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanStok'
				AND type = 'U')
				DROP TABLE tPlanStok	
			SELECT c.nazv,
				@k3 as tarif,
				sum(ISNULL(a.kybk,0)) as gk,
				sum(ISNULL(a.symkk,0))*@k3 as summa
			INTO TPlanStok
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip3-1 and a.datan = @data and b.kodtv = 1
			group by c.nazv
			order by c.nazv
		END
	END
    -- Формируем данные по мусору
    IF @tip4 >= 0 and @k4 > 0
	BEGIN			
		IF @v4 = 0
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanG'
				AND type = 'U')
				DROP TABLE tPlanG	
			SELECT c.nazv,
				avg(a.rastarifg) as tarif,
				sum(ISNULL(a.kybg,0))*@k3 as gk,
				sum(ISNULL(a.symgs,0))*@k3 as summa
			INTO TPlanG
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip4-1 and a.datan = @data and b.kodtg = 1
			group by c.nazv
			order by c.nazv
		END
		IF @v4 = 1
		BEGIN
			IF EXISTS (SELECT name FROM sysobjects
				WHERE name = 'tPlanG'
				AND type = 'U')
				DROP TABLE tPlanG	
			SELECT c.nazv,
				@k4 as tarif,
				sum(ISNULL(a.kybg,0)) as gk,
				sum(ISNULL(a.symgs,0))*@k3 as summa
			INTO TPlanStok
			FROM dataobekt a, obekt b, org c
			WHERE a.kodobk = b.kodobk and b.kodorg = c.kodorg
			and c.tipbud = @tip4-1 and a.datan = @data and b.kodtg = 1
			group by c.nazv
			order by c.nazv
		END
	END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[up_datatarif]'
GO
ALTER       PROCEDURE up_datatarif
	@kod int, @cena1 decimal(15,2), @cena2 decimal(15,2), @data datetime, @oper int
AS
	DECLARE @cnt int
	IF @oper = 1 
	BEGIN
		-- Проверяем наличие записи
		SELECT @cnt = count(*) FROM datatarif 
			WHERE kodtt = @kod and datan = @data
		IF @cnt <> 0
			UPDATE datatarif SET cena = @cena1 
			WHERE kodtt = @kod and datan = @data
	END
	IF @oper = 11 -- Режим обновления цены добавленной записи
	BEGIN
		-- Проверяем наличие записи
		SELECT @cnt = count(*) FROM datatarif 
			WHERE cena Is Null and datan Is Null
		IF @cnt <> 0
			UPDATE datatarif 
				SET cena = @cena1, 
				datan = @data, 
				datak = teplosnab.dbo.end_of_month(@data)
			WHERE cena Is Null and datan Is Null
	END
	IF @oper = 2 -- Режим обновления цены (вода)
	BEGIN
		-- Проверяем наличие записи
		SELECT @cnt = count(*) FROM datatarifv
			WHERE kodtv = @kod and datan = @data
		IF @cnt <> 0
			UPDATE datatarifv SET cenav = @cena1, cenak = @cena2
			WHERE kodtv = @kod and datan = @data		
	END
	IF @oper = 22 -- Режим обновления цены добавленной записи (вода)
	BEGIN
		-- Проверяем наличие записи
		SELECT @cnt = count(*) FROM datatarifv
			WHERE cenav Is Null and datan Is Null
		IF @cnt <> 0
			UPDATE datatarifv 
				SET cenav = @cena1,
				cenak = @cena2, 
				datan = @data, 
				datak = teplosnab.dbo.end_of_month(@data)
			WHERE cenav Is Null and datan Is Null					
	END
    -- Обновление записей по мусору
    IF @oper = 3 
	BEGIN
		-- Проверяем наличие записи
		SELECT @cnt = count(*) FROM datatarifg 
			WHERE kodtg = @kod and datan = @data
		IF @cnt <> 0
			UPDATE datatarifg SET cenag = @cena1 
			WHERE kodtg = @kod and datan = @data
	END
	IF @oper = 31 -- Режим обновления цены добавленной записи
	BEGIN
		-- Проверяем наличие записи
		SELECT @cnt = count(*) FROM datatarifg 
			WHERE cenag Is Null and datan Is Null
		IF @cnt <> 0
			UPDATE datatarifg 
				SET cenag = @cena1, 
				datan = @data, 
				datak = teplosnab.dbo.end_of_month(@data)
			WHERE cenag Is Null and datan Is Null
	END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] ADD
[rastarifg] [float] NULL CONSTRAINT [DF_pr_obekt_rastarifg] DEFAULT (0),
[kybg] [float] NULL CONSTRAINT [DF_pr_obekt_kybg] DEFAULT (0),
[symg] [float] NULL CONSTRAINT [DF_pr_obekt_symg] DEFAULT (0),
[symgnds] [float] NULL CONSTRAINT [DF_pr_obekt_symgnds] DEFAULT (0),
[symgs] [float] NULL CONSTRAINT [DF_pr_obekt_symgs] DEFAULT (0),
[perg] [float] NULL CONSTRAINT [DF_pr_obekt_perg] DEFAULT (0),
[pkybg] [float] NULL CONSTRAINT [DF_pr_obekt_pkybg] DEFAULT (0),
[pergnds] [float] NULL CONSTRAINT [DF_pr_obekt_pergnds] DEFAULT (0),
[pg] [int] NULL,
[lsymg] [float] NULL CONSTRAINT [DF_pr_obekt_lsymg] DEFAULT (0),
[lkybg] [float] NULL CONSTRAINT [DF_pr_obekt_lkybg] DEFAULT (0)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
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
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[sp_calc_obk_g]'
GO
CREATE PROCEDURE [dbo].[sp_calc_obk_g]
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
  WHERE b.datan=@data and c.kodtg<>3
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
    WHERE b.datan=@data and c.kodtv=3
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[sp_calc_org_g]'
GO
CREATE  PROCEDURE [dbo].[sp_calc_org_g]
	@data datetime
AS
	DECLARE @id_org integer,
            @symg decimal(15),
			@symgnds decimal(15),
            @symgs decimal(15),
            @perg decimal(15),
		    @pkybg decimal(15,2),
			@pergnds decimal(15),
			@skybg decimal(15,2),
			@lsumg decimal(15),
            @lskybg decimal(15,2)
-- Декларируем курсор            
	DECLARE cur_org CURSOR FOR
	SELECT a.kodorg,
		SUM(symg),
        SUM(symgnds),
    	SUM(symgs),
	    SUM(perg),
    	SUM(kybg),
    	SUM(pkybg),
        SUM(pergnds),
	    SUM(lkybg),
        SUM(lsymg)
    FROM obekt as a join dataobekt as b on a.kodobk=b.kodobk
    WHERE b.datan=@data
    GROUP BY a.kodorg
	OPEN cur_org
	FETCH NEXT FROM cur_org INTO @id_org,
		@symg,
        @symgnds,
		@symgs,
		@perg,
		@skybg,
		@pkybg,
        @pergnds,
        @lskybg,
		@lsumg
	WHILE (@@FETCH_STATUS <> -1)
	BEGIN
		UPDATE dataorg SET sumg=@symg,sumgnds=@symgnds,sumgg=@symgs,
    pergo=@perg,pkybgo=@pkybg,pergonds=@pergnds,
		itogg=@symgs+@perg,
    skybg=@skybg,lsumg=@lsumg,lskybg=@lskybg
    WHERE kodorg=@id_org and datan=@data
		FETCH NEXT FROM cur_org INTO @id_org,
		@symg,
        @symgnds,
		@symgs,
		@perg,
		@skybg,
		@pkybg,
        @pergnds,
        @lskybg,
		@lsumg
	END
	DEALLOCATE cur_org
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_create_sf]'
GO
ALTER   PROCEDURE sp_create_sf
	@kod int = -1, @data datetime
AS
	declare @cnt integer,
  @stavka decimal(2),
	@kodorg int,
	@cur_org CURSOR
	delete from schet
	IF @kod=-1
	BEGIN
		SET @cur_org = CURSOR FOR
			SELECT kodorg FROM org
		OPEN @cur_org
		FETCH NEXT FROM @cur_org INTO @kodorg
		WHILE @@FETCH_STATUS=0
		BEGIN 
	  	select @cnt = tiporg from org where kodorg=@kodorg
  		if @cnt<2 
        	if YEAR(@data) < 2010
	            set @stavka = 18
            else
                set @stavka = 20    
  		else 
            set @stavka=0
  		delete from schet where kodorg=@kodorg
		-- Добавляем записи в таблицу SCHET
		INSERT INTO schet
		SELECT 'Отпуск тепловой энергии','Гкал',
					sum(b.gkt+b.gkv+b.pgkt+b.pgkv) as kol,
					0 as tarif,
					sum(b.symt+b.symv+(b.pert-b.pertnds)+(b.perv-b.pervnds)) as sum_b_nds,
					@stavka,
          sum(b.symtnds+b.symvnds+b.pertnds+b.pervnds) as nds,
					sum(b.symk+b.symgv+b.pert+b.perv) as sum_s_nds,
					a.kodorg,GetDate(),1,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				FROM org a,dataobekt b,bank c,obekt d
				WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
							and b.datan = @data and a.kodorg = @kodorg
				GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				HAVING sum(b.symt+b.symv+(b.pert-b.pertnds)+(b.perv-b.pervnds))<>0
			INSERT INTO schet
  		SELECT 'Отпуск холодной воды','Куб.м.',
					sum(b.kybv+b.pkybv) as kol,
					0 as tarif,
					sum(b.symh+(b.perh-b.perhnds)) as sum_b_nds,@stavka,
          sum(b.symhnds+b.perhnds) as nds,
					sum(b.symhs+b.perh) as sum_s_nds,
					a.kodorg,GetDate(),2,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				FROM org a,dataobekt b,bank c,obekt d
				WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
							and b.datan = @data and a.kodorg = @kodorg
				GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				HAVING sum(b.symh+(b.perh-b.perhnds))<>0
			INSERT INTO schet
  		SELECT 'Пропуск сточных вод','Куб.м.',
					sum(b.kybk+b.pkybk) as kol,
					0 as tarif,
					sum(b.symkk+(b.perk-b.perknds)) as sum_b_nds,@stavka,
          sum(b.symknds+b.perknds) as nds,
					sum(b.symks+b.perk) as sum_s_nds,
					a.kodorg,GetDate(),3,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				FROM org a,dataobekt b,bank c,obekt d
				WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
							and b.datan = @data and a.kodorg = @kodorg
				GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				HAVING sum(b.symkk+(b.perk-b.perknds))<>0
        INSERT INTO schet        
		SELECT 'Вывоз мусора','Куб.м.',
					sum(b.kybg+b.pkybg) as kol,
					0 as tarif,
					sum(b.symg+(b.perg-b.pergnds)) as sum_b_nds,
                    @stavka,
          			sum(b.symgnds+b.pergnds) as nds,
					sum(b.symgs+b.perg) as sum_s_nds,
					a.kodorg,GetDate(),4,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				FROM org a,dataobekt b,bank c,obekt d
				WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
							and b.datan = @data and a.kodorg = @kodorg
				GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				HAVING sum(b.symg+(b.perg-b.pergnds))<>0
                
        	-- Следующая запись
			FETCH NEXT FROM @cur_org INTO @kodorg
  	END
		CLOSE @cur_org
		DEALLOCATE @cur_org
	END
	IF @kod > 0
	BEGIN
		select @cnt = tiporg from org where kodorg=@kod
  		if @cnt<2 
        	if YEAR(@data) < 2010
	            set @stavka = 18
            else
                set @stavka = 20    
  		else 
            set @stavka=0
  		delete from schet where kodorg=@kod
		
        -- Добавляем записи в таблицу SCHET        
        
		INSERT INTO schet
		SELECT 'Отпуск тепловой энергии','Гкал',
			sum(b.gkt+b.gkv+b.pgkt+b.pgkv) as kol,
			0 as tarif,
			sum(b.symt+b.symv+(b.pert-b.pertnds)+(b.perv-b.pervnds)) as sum_b_nds,
			@stavka,
        	sum(b.symtnds+b.symvnds+b.pertnds+b.pervnds) as nds,
			sum(b.symk+b.symgv+b.pert+b.perv) as sum_s_nds,
			a.kodorg,GetDate(),1,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,dataobekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symt+b.symv+(b.pert-b.pertnds)+(b.perv-b.pervnds))<>0
	
		INSERT INTO schet
  		SELECT 'Отпуск холодной воды','Куб.м.',
			sum(b.kybv+b.pkybv) as kol,
			0 as tarif,
			sum(b.symh+(b.perh-b.perhnds)) as sum_b_nds,@stavka,
         	sum(b.symhnds+b.perhnds) as nds,
			sum(b.symhs+b.perh) as sum_s_nds,
			a.kodorg,GetDate(),2,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,dataobekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symh+(b.perh-b.perhnds))<>0
	
	    INSERT INTO schet
  		SELECT 'Пропуск сточных вод','Куб.м.',
			sum(b.kybk+b.pkybk) as kol,
			0 as tarif,
			sum(b.symkk+(b.perk-b.perknds)) as sum_b_nds,@stavka,
        	sum(b.symknds+b.perknds) as nds,
			sum(b.symks+b.perk) as sum_s_nds,
		  	a.kodorg,GetDate(),3,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,dataobekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symkk+(b.perk-b.perknds))<>0
    
	    INSERT INTO schet
  		SELECT 'Вывоз мусора','Куб.м.',
			sum(b.kybg+b.pkybg) as kol,
			0 as tarif,
			sum(b.symg+(b.perg-b.pergnds)) as sum_b_nds,@stavka,
         	sum(b.symgnds+b.pergnds) as nds,
			sum(b.symgs+b.perg) as sum_s_nds,
			a.kodorg,GetDate(),4,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,dataobekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symg+(b.perg-b.pergnds))<>0 
                
                           
	END
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
		SELECT kodorg, symtv+symgvs, sumvv, sumkk, sumgg
		FROM dataorg
		WHERE datan = @data and kodorg = @kod
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[sp_create_sf_pred]'
GO
ALTER       PROCEDURE sp_create_sf_pred
	@kod int = -1, @data datetime
AS
	declare @cnt integer,
  @stavka decimal(2),
	@kodorg int,
	@cur_org CURSOR
	IF @kod > 0
	BEGIN
		select @cnt = tiporg from org where kodorg=@kod
  	if @cnt<2 
        	if YEAR(@data) < 2010
	            set @stavka = 18
            else
                set @stavka = 20    
  		else 
            set @stavka=0
		-- Создаем таблицу для предоплаты		
		IF EXISTS (SELECT name FROM sysobjects
			WHERE  name = N'pr_obekt' 
	  	AND 	 type = 'U')
    DROP TABLE pr_obekt 
		SELECT a.* INTO pr_obekt FROM dataobekt a, obekt b
			WHERE a.kodobk = b.kodobk and a.datan = @data and b.kodorg = @kod
		-- Обновляем ее
		UPDATE pr_obekt 
			SET 
				-- Тепло
				gkt = round(gkt*psum_t,2),
				gkv = round(gkv*psum_t,2),
				symt = round(symt*psum_t,0),
				symv = round(symv*psum_t,0),
				symtnds = round(symtnds*psum_t,0),
				symvnds = round(symvnds*psum_t,0),
				symk = round(symk*psum_t,0),
				symgv = round(symgv*psum_t,0),
				pert = 0, pertnds =0, perv = 0, pervnds = 0,pgkt = 0,pgkv = 0,
				-- Вода
				kybv = round(kybv*psum_v,2),
				kybk = round(kybk*psum_k,2),
				symh = round(symh*psum_v,0),
				symkk = round(symkk*psum_k,0),
				symhnds = round(symhnds*psum_v,0),
				symknds = round(symknds*psum_k,0),
				symhs = round(symhs*psum_v,0),
				symks = round(symks*psum_k,0),
				perh = 0, perk = 0, perhnds = 0, perknds = 0, pkybv = 0, pkybk = 0,
                -- Мусор
				kybg = round(kybg*psum_g,2),
				symg = round(symg*psum_g,0),
				symgnds = round(symgnds*psum_g,0),
				symgs = round(symgs*psum_g,0),
				perg = 0, pergnds = 0, pkybg = 0
		FROM tPredoplata
		
  	delete from schet
		-- Добавляем записи в таблицу SCHET
		INSERT INTO schet
		SELECT 'Отпуск тепловой энергии','Гкал',
				sum(b.gkt+b.gkv) as kol,
				0 as tarif,
				sum(b.symt+b.symv) as sum_b_nds,
				@stavka,
        sum(b.symtnds+b.symvnds) as nds,
				sum(b.symk+b.symgv) as sum_s_nds,
				a.kodorg,GetDate(),1,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,pr_obekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
						and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symt+b.symv)<>0
		INSERT INTO schet
  	SELECT 'Отпуск холодной воды','Куб.м.',
				sum(b.kybv) as kol,
				0 as tarif,
				sum(b.symh) as sum_b_nds,@stavka,
         sum(b.symhnds) as nds,
				sum(b.symhs) as sum_s_nds,
				a.kodorg,GetDate(),2,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,pr_obekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
						and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symh)<>0
		INSERT INTO schet
  	SELECT 'Пропуск сточных вод','Куб.м.',
				sum(b.kybk) as kol,
				0 as tarif,
				sum(b.symkk) as sum_b_nds,@stavka,
        sum(b.symknds) as nds,
				sum(b.symks) as sum_s_nds,
		  	a.kodorg,GetDate(),3,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,pr_obekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
						and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symkk)<>0
            
    INSERT INTO schet
  		SELECT 'Вывоз мусора','Куб.м.',
			sum(b.kybg) as kol,
			0 as tarif,
			sum(b.symg) as sum_b_nds,@stavka,
         	sum(b.symgnds) as nds,
			sum(b.symgs) as sum_s_nds,
			a.kodorg,GetDate(),4,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,pr_obekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symg)<>0        
	END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[sp_ob_svod_g]'
GO
CREATE PROCEDURE [dbo].[sp_ob_svod_g]
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
		WHERE kodtg = 8 and datan between @data1 and @data2
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
			WHERE kod_tarifg = 7 and tip = @i+10 and kod = @kod
			
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
PRINT N'Creating [dbo].[sp_ras_kot_g]'
GO
CREATE  PROCEDURE [dbo].[sp_ras_kot_g] 
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
		and c.kodtg in (3,5,12,15,16,17) and a.kodkot = @kod
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
		and c.kodtg in (3,12,15,16,17,7,19) and a.kodkot = @kod
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
		and c.kodtg not in (3,5,12,15,16,17,7,19) and a.kodkot = @kod
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
PRINT N'Creating [dbo].[sp_ras_nac_g]'
GO
CREATE  PROCEDURE [dbo].[sp_ras_nac_g]
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
	WHERE kod_tarif = 5
	-- Добавляем итог по ЖСК
	INSERT INTO ras_nac_g
	SELECT
		'ИТОГО ЖСК + вед.',Null,Null,
		SUM(kybg),SUM(sum_nacg),SUM(per_kg),SUM(sum_perg)
	FROM ras_nac_g
	WHERE kod_tarif in (3,12,15,16,17,7,19)
	-- Добавляем итог по организациям
	INSERT INTO ras_nac_g
	SELECT
		'ИТОГО организации',Null,Null,
		SUM(kybg),SUM(sum_nacg),SUM(per_kg),SUM(sum_perg)
	FROM ras_nac_g
	WHERE kod_tarif NOT IN (3,5,12,15,16,17,7,19)
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
PRINT N'Adding constraints to [dbo].[pr_obekt]'
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_GKT] DEFAULT (0) FOR [GKT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_GKV] DEFAULT (0) FOR [GKV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_SYMT] DEFAULT (0) FOR [SYMT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_SYMV] DEFAULT (0) FOR [SYMV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_PERT] DEFAULT (0) FOR [PERT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_PERV] DEFAULT (0) FOR [PERV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_PGKT] DEFAULT (0) FOR [PGKT]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_PGKV] DEFAULT (0) FOR [PGKV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_SYMK] DEFAULT (0) FOR [SYMK]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_SYMGV] DEFAULT (0) FOR [SYMGV]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symtnds] DEFAULT (0) FOR [symtnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symvnds] DEFAULT (0) FOR [symvnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_rastarift] DEFAULT (0) FOR [rastarift]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_rastarifv] DEFAULT (0) FOR [rastarifv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_kybv] DEFAULT (0) FOR [kybv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_kybk] DEFAULT (0) FOR [kybk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symh] DEFAULT (0) FOR [symh]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symkk] DEFAULT (0) FOR [symkk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symhnds] DEFAULT (0) FOR [symhnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symknds] DEFAULT (0) FOR [symknds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symhs] DEFAULT (0) FOR [symhs]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_symks] DEFAULT (0) FOR [symks]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_perh] DEFAULT (0) FOR [perh]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_perk] DEFAULT (0) FOR [perk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_pkybv] DEFAULT (0) FOR [pkybv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_pkybk] DEFAULT (0) FOR [pkybk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_rastarifk] DEFAULT (0) FOR [rastarifk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_pertnds] DEFAULT (0) FOR [pertnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_pervnds] DEFAULT (0) FOR [pervnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_perhnds] DEFAULT (0) FOR [perhnds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_perknds] DEFAULT (0) FOR [perknds]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lsymt] DEFAULT (0) FOR [lsymt]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lgkt] DEFAULT (0) FOR [lgkt]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lsymv] DEFAULT (0) FOR [lsymv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lgkv] DEFAULT (0) FOR [lgkv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lsymh] DEFAULT (0) FOR [lsymh]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lkybv] DEFAULT (0) FOR [lkybv]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lsymkk] DEFAULT (0) FOR [lsymkk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[pr_obekt] ADD CONSTRAINT [DF_pr_obekt_lkybk] DEFAULT (0) FOR [lkybk]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating trigger [dbo].[ins_tarif_g] on [dbo].[tarifg]'
GO


CREATE TRIGGER [ins_tarif_g] ON [tarifg]
FOR INSERT
AS
BEGIN
	INSERT INTO datatarifg (kodtg)
	SELECT ins.kodtg
	FROM inserted ins
END
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
