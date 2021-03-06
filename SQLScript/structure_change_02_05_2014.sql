/*
Run this script on:

        (local).Teplosnab_copy    -  This database will be modified

to synchronize it with:

        (local).Teplosnab

You are recommended to back up your database before running this script

Script created by SQL Compare version 8.0.0 from Red Gate Software Ltd at 02.05.2014 10:31:34

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
PRINT N'Altering [dbo].[schet]'
GO
ALTER TABLE [dbo].[schet] ALTER COLUMN [usluga] [varchar] (100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[sp_calc_org_idx]'
GO

CREATE       PROCEDURE [dbo].[sp_calc_org_idx]
	@kod  int,
	@data datetime
AS	
    
    UPDATE dataorg 
    SET 
    	ndsidx  = round((symidx*20/(120)),0),
        ndsidxv = round((symidxv*20/(120)),0),
        ndsidxk = round((symidxk*20/(120)),0),
        itog    = symtv + perto, 
        itogv   = sumvv + perho, 
        itogk   = sumkk + perko
	WHERE kodorg=@kod and datan=@data
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
    @idx float,
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

		select @idx = symidx from dataorg where kodorg = @kodorg and datan = @data
		if @idx > 0 
          INSERT INTO schet (usluga, ed_izm, sum_b_nds, nds, sum_s_nds, 
          	kodorg, data_sf, kodusl, period, nazv_org, adres_org, unn_org,
            rs_org, bank_org)        
          SELECT 'Индексация (теплоснаб.)','руб.',                      
            (b.symidx - b.ndsidx), b.ndsidx, b.symidx,
            a.kodorg, GetDate(), 2, null, a.nazv, a.adres, a.unn, a.rschet, c.nazv_bank
                  FROM org a, dataorg b, bank c 
                  WHERE a.kodorg = b.kodorg and a.kodbank = c.kod_bank
                  	and b.datan = @data and a.kodorg = @kodorg
		
        INSERT INTO schet            
  		SELECT 'Отпуск холодной воды','Куб.м.',
					sum(b.kybv+b.pkybv) as kol,
					0 as tarif,
					sum(b.symh+(b.perh-b.perhnds)) as sum_b_nds,@stavka,
          sum(b.symhnds+b.perhnds) as nds,
					sum(b.symhs+b.perh) as sum_s_nds,
					a.kodorg,GetDate(),3,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				FROM org a,dataobekt b,bank c,obekt d
				WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
							and b.datan = @data and a.kodorg = @kodorg
				GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				HAVING sum(b.symh+(b.perh-b.perhnds))<>0
		
        select @idx = symidxv from dataorg where kodorg = @kodorg and datan = @data
		if @idx > 0
          INSERT INTO schet (usluga, ed_izm, sum_b_nds, nds, sum_s_nds, 
          	kodorg, data_sf, kodusl, period, nazv_org, adres_org, unn_org,
            rs_org, bank_org)        
          SELECT 'Индексация (водоснабжение)','руб.',                      
            (b.symidxv - b.ndsidxv), b.ndsidxv, b.symidxv,
            a.kodorg, GetDate(), 4, null, a.nazv, a.adres, a.unn, a.rschet, c.nazv_bank
                  FROM org a, dataorg b, bank c 
                  WHERE a.kodorg = b.kodorg and a.kodbank = c.kod_bank
                  	and b.datan = @data and a.kodorg = @kodorg
        
        INSERT INTO schet
  		SELECT 'Пропуск сточных вод','Куб.м.',
					sum(b.kybk+b.pkybk) as kol,
					0 as tarif,
					sum(b.symkk+(b.perk-b.perknds)) as sum_b_nds,@stavka,
          sum(b.symknds+b.perknds) as nds,
					sum(b.symks+b.perk) as sum_s_nds,
					a.kodorg,GetDate(),5,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				FROM org a,dataobekt b,bank c,obekt d
				WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
							and b.datan = @data and a.kodorg = @kodorg
				GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
				HAVING sum(b.symkk+(b.perk-b.perknds))<>0
                
        select @idx = symidxk from dataorg where kodorg = @kodorg and datan = @data
		if @idx > 0
          INSERT INTO schet (usluga, ed_izm, sum_b_nds, nds, sum_s_nds, 
          	kodorg, data_sf, kodusl, period, nazv_org, adres_org, unn_org,
            rs_org, bank_org)        
          SELECT 'Индексация (водоотведение)','руб.',                      
            (b.symidxk - b.ndsidxk), b.ndsidxk, b.symidxk,
            a.kodorg, GetDate(), 6, null, a.nazv, a.adres, a.unn, a.rschet, c.nazv_bank
                  FROM org a, dataorg b, bank c 
                  WHERE a.kodorg = b.kodorg and a.kodbank = c.kod_bank
                  	and b.datan = @data and a.kodorg = @kodorg        
                
        INSERT INTO schet        
		SELECT 'Вывоз мусора','Куб.м.',
					sum(b.kybg+b.pkybg) as kol,
					0 as tarif,
					sum(b.symg+(b.perg-b.pergnds)) as sum_b_nds,
                    @stavka,
          			sum(b.symgnds+b.pergnds) as nds,
					sum(b.symgs+b.perg) as sum_s_nds,
					a.kodorg,GetDate(),7,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
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
		
        select @idx = symidx from dataorg where kodorg = @kod and datan = @data
		if @idx > 0
          INSERT INTO schet (usluga, ed_izm, sum_b_nds, nds, sum_s_nds, 
          	kodorg, data_sf, kodusl, period, nazv_org, adres_org, unn_org,
            rs_org, bank_org)        
          SELECT 'Индексация (теплоснаб.)','руб.',                      
            (b.symidx - b.ndsidx), b.ndsidx, b.symidx,
            a.kodorg, GetDate(), 2, null, a.nazv, a.adres, a.unn, a.rschet, c.nazv_bank
                  FROM org a, dataorg b, bank c 
                  WHERE a.kodorg = b.kodorg and a.kodbank = c.kod_bank
                  	and b.datan = @data and a.kodorg = @kod
        
		INSERT INTO schet
  		SELECT 'Отпуск холодной воды','Куб.м.',
			sum(b.kybv+b.pkybv) as kol,
			0 as tarif,
			sum(b.symh+(b.perh-b.perhnds)) as sum_b_nds,@stavka,
         	sum(b.symhnds+b.perhnds) as nds,
			sum(b.symhs+b.perh) as sum_s_nds,
			a.kodorg,GetDate(),3,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,dataobekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symh+(b.perh-b.perhnds))<>0
		
        select @idx = symidxv from dataorg where kodorg = @kod and datan = @data
		if @idx > 0
          INSERT INTO schet (usluga, ed_izm, sum_b_nds, nds, sum_s_nds, 
          	kodorg, data_sf, kodusl, period, nazv_org, adres_org, unn_org,
            rs_org, bank_org)        
          SELECT 'Индексация (водоснабжение)','руб.',                      
            (b.symidxv - b.ndsidxv), b.ndsidxv, b.symidxv,
            a.kodorg, GetDate(), 4, null, a.nazv, a.adres, a.unn, a.rschet, c.nazv_bank
                  FROM org a, dataorg b, bank c 
                  WHERE a.kodorg = b.kodorg and a.kodbank = c.kod_bank
                  	and b.datan = @data and a.kodorg = @kod
        
	    INSERT INTO schet
  		SELECT 'Пропуск сточных вод','Куб.м.',
			sum(b.kybk+b.pkybk) as kol,
			0 as tarif,
			sum(b.symkk+(b.perk-b.perknds)) as sum_b_nds,@stavka,
        	sum(b.symknds+b.perknds) as nds,
			sum(b.symks+b.perk) as sum_s_nds,
		  	a.kodorg,GetDate(),5,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			FROM org a,dataobekt b,bank c,obekt d
			WHERE a.kodorg = d.kodorg and d.kodobk = b.kodobk and a.kodbank = c.kod_bank
				and b.datan = @data and a.kodorg = @kod
			GROUP BY a.kodorg,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
			HAVING sum(b.symkk+(b.perk-b.perknds))<>0
    	
        select @idx = symidxk from dataorg where kodorg = @kod and datan = @data
		if @idx > 0
          INSERT INTO schet (usluga, ed_izm, sum_b_nds, nds, sum_s_nds, 
          	kodorg, data_sf, kodusl, period, nazv_org, adres_org, unn_org,
            rs_org, bank_org)        
          SELECT 'Индексация (водоотведение)','руб.',                      
            (b.symidxk - b.ndsidxk), b.ndsidxk, b.symidxk,
            a.kodorg, GetDate(), 6, null, a.nazv, a.adres, a.unn, a.rschet, c.nazv_bank
                  FROM org a, dataorg b, bank c 
                  WHERE a.kodorg = b.kodorg and a.kodbank = c.kod_bank
                  	and b.datan = @data and a.kodorg = @kod
        
	    INSERT INTO schet
  		SELECT 'Вывоз мусора','Куб.м.',
			sum(b.kybg+b.pkybg) as kol,
			0 as tarif,
			sum(b.symg+(b.perg-b.pergnds)) as sum_b_nds,@stavka,
         	sum(b.symgnds+b.pergnds) as nds,
			sum(b.symgs+b.perg) as sum_s_nds,
			a.kodorg,GetDate(),7,null,a.nazv,a.adres,a.unn,a.rschet,c.nazv_bank
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
PRINT N'Altering [dbo].[sp_ras_kot_vk]'
GO
ALTER  PROCEDURE sp_ras_kot_vk 
@data1 datetime, @data2 datetime
AS
	DECLARE @cur_kot CURSOR
	DECLARE @kod int
	-- Создаем таблицу
	IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N'ras_kot_vk' 
	  AND 	 type = 'U')
    DROP TABLE ras_kot_vk
	CREATE TABLE ras_kot_vk 
	(nazv varchar(50),nazv_pot varchar(50),kybv decimal(15,2),
	 sum_nacv decimal(20,0),per_kv	decimal(15,2),sum_perv decimal(20,0),
	 kybk decimal(15,2),sum_nack decimal(20,0),per_kk	decimal(15,2),
	 sum_perk decimal(20,0),tip int)
	-- Объявляем курсор
	SET @cur_kot = CURSOR FOR SELECT kodkot FROM koteln ORDER BY kodkot
	OPEN @cur_kot
	FETCH NEXT FROM @cur_kot INTO @kod
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		-- Данные по населению
		INSERT INTO ras_kot_vk
		SELECT 
			a.nazk,'Население',
			sum(isnull(b.kybv,0)),
			sum(isnull(b.symhs,0)),
			sum(isnull(b.pkybv,0)),
			sum(isnull(b.perh,0)),			
			sum(isnull(b.kybk,0)),
			sum(isnull(b.symks,0)),
			sum(isnull(b.pkybk,0)),
			sum(isnull(b.perk,0)),1
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and c.kodtv in (3,5,7,12,13,18,19) and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybv,0))+
					SUM(ISNULL(b.symhs,0))+
					SUM(ISNULL(b.pkybv,0))+
					SUM(ISNULL(b.perh,0))+
					SUM(ISNULL(b.kybk,0))+
					SUM(ISNULL(b.symks,0))+
					SUM(ISNULL(b.pkybk,0))+
					SUM(ISNULL(b.perk,0))) !=0
		-- Данные по ЖСК
		INSERT INTO ras_kot_vk
		SELECT 
			a.nazk,'в том числе ЖСК + вед.',
			sum(isnull(b.kybv,0)),
			sum(isnull(b.symhs,0)),
			sum(isnull(b.pkybv,0)),
			sum(isnull(b.perh,0)),			
			sum(isnull(b.kybk,0)),
			sum(isnull(b.symks,0)),
			sum(isnull(b.pkybk,0)),
			sum(isnull(b.perk,0)),2
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and c.kodtv in (3,7,12,13,19) and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybv,0))+
					SUM(ISNULL(b.symhs,0))+
					SUM(ISNULL(b.pkybv,0))+
					SUM(ISNULL(b.perh,0))+
					SUM(ISNULL(b.kybk,0))+
					SUM(ISNULL(b.symks,0))+
					SUM(ISNULL(b.pkybk,0))+
					SUM(ISNULL(b.perk,0))) !=0
		-- Данные по организациям
		INSERT INTO ras_kot_vk
		SELECT 
			a.nazk,'Организации',
			sum(isnull(b.kybv,0)),
			sum(isnull(b.symhs,0)),
			sum(isnull(b.pkybv,0)),
			sum(isnull(b.perh,0)),			
			sum(isnull(b.kybk,0)),
			sum(isnull(b.symks,0)),
			sum(isnull(b.pkybk,0)),
			sum(isnull(b.perk,0)),3
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and c.kodtv not in (3,5,7,12,13,18,19) and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybv,0))+
					SUM(ISNULL(b.symhs,0))+
					SUM(ISNULL(b.pkybv,0))+
					SUM(ISNULL(b.perh,0))+
					SUM(ISNULL(b.kybk,0))+
					SUM(ISNULL(b.symks,0))+
					SUM(ISNULL(b.pkybk,0))+
					SUM(ISNULL(b.perk,0))) !=0
		-- Итоги по участку
		INSERT INTO ras_kot_vk
		SELECT 
			a.nazk,'ИТОГО',
			sum(isnull(b.kybv,0)),
			sum(isnull(b.symhs,0)),
			sum(isnull(b.pkybv,0)),
			sum(isnull(b.perh,0)),			
			sum(isnull(b.kybk,0)),
			sum(isnull(b.symks,0)),
			sum(isnull(b.pkybk,0)),
			sum(isnull(b.perk,0)),4
		FROM koteln a, dataobekt b, obekt c
		WHERE a.kodkot = c.kodkot and b.kodobk = c.kodobk
		and a.kodkot = @kod
		and b.datan between @data1 and @data2
		GROUP BY a.nazk
		HAVING (SUM(ISNULL(b.kybv,0))+
					SUM(ISNULL(b.symhs,0))+
					SUM(ISNULL(b.pkybv,0))+
					SUM(ISNULL(b.perh,0))+
					SUM(ISNULL(b.kybk,0))+
					SUM(ISNULL(b.symks,0))+
					SUM(ISNULL(b.pkybk,0))+
					SUM(ISNULL(b.perk,0))) !=0
		-- Следующая запись
		FETCH NEXT FROM @cur_kot INTO @kod
	END
	CLOSE @cur_kot
	DEALLOCATE @cur_kot
	-- ИТОГИ по предприятию
	INSERT INTO ras_kot_vk
	SELECT
		'ВСЕГО','Население',sum(kybv),
	 	sum(sum_nacv),sum(per_kv),sum(sum_perv),
		sum(kybk),sum(sum_nack),sum(per_kk),sum(sum_perk),11
	FROM ras_kot_vk	
	WHERE tip = 1
	INSERT INTO ras_kot_vk
	SELECT
		'ВСЕГО','в том числе ЖСК + вед.',sum(kybv),
	 	sum(sum_nacv),sum(per_kv),sum(sum_perv),
		sum(kybk),sum(sum_nack),sum(per_kk),sum(sum_perk),21
	FROM ras_kot_vk	
	WHERE tip = 2
	INSERT INTO ras_kot_vk
	SELECT
		'ВСЕГО','организации',sum(kybv),
	 	sum(sum_nacv),sum(per_kv),sum(sum_perv),
		sum(kybk),sum(sum_nack),sum(per_kk),sum(sum_perk),31
	FROM ras_kot_vk	
	WHERE tip = 3
	INSERT INTO ras_kot_vk
	SELECT
		'ВСЕГО','ИТОГО',sum(kybv),
	 	sum(sum_nacv),sum(per_kv),sum(sum_perv),
		sum(kybk),sum(sum_nack),sum(per_kk),sum(sum_perk),41
	FROM ras_kot_vk	
	WHERE tip = 4
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
    
	/*UPDATE dataobekt
	SET
    symh=round((((b.kybv*a.cenav)/(c.prj+c.prjl)*c.prj)+((b.kybv*a.cenav)/(c.prj+c.prjl)*c.prjl/2)),0),
    symkk=round((((b.kybk*a.cenak)/(c.prj+c.prjl)*c.prj)+((b.kybk*a.cenak)/(c.prj+c.prjl)*c.prjl/2)),0),
    lsymh=round(b.kybv*a.cenav/(c.prj+c.prjl)*c.prjl/2,0),
		lsymkk=round(b.kybk*a.cenak/(c.prj+c.prjl)*c.prjl/2,0),
    lkybv=round(b.kybv/(c.prj+c.prjl)*c.prjl,2),
		lkybk=round(b.kybk/(c.prj+c.prjl)*c.prjl,2),
    symhnds=0,
		symknds=0,
    symhs=round((((b.kybv*a.cenav)/(c.prj+c.prjl)*c.prj)+((b.kybv*a.cenav)/(c.prj+c.prjl)*c.prjl/2)),0),
    symks=round((((b.kybk*a.cenak)/(c.prj+c.prjl)*c.prj)+((b.kybk*a.cenak)/(c.prj+c.prjl)*c.prjl/2)),0),
    perhnds=0,
		perknds=0,
    rastarifv=a.cenav,
		rastarifk=a.cenak
	FROM	
		(datatarifv as a join dataobekt as b on (a.datan=b.datan)) join
    obekt as c on(a.kodtv=c.kodtv) and(c.kodobk=b.kodobk)
    WHERE b.datan=@data and c.kodtv=3*/
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
    kybg      = round((c.prj+c.prjl) * 0.093, 2),
    symg      = round((c.prj * a.cenag) + (c.prjl * a.cenag / 2),0),
    lsymg     = round((c.prjl * a.cenag / 2),0),
    lkybg     = round(0.093 * c.prjl, 2),
    symgnds   = 0,
    symgs     = round((c.prj * a.cenag) + (c.prjl * a.cenag / 2),0),
    pergnds   = 0,
    rastarifg = a.cenag
	FROM	
		(datatarifg as a join dataobekt as b on (a.datan=b.datan)) join
    obekt as c on(a.kodtg=c.kodtg) and(c.kodobk=b.kodobk)
    WHERE b.datan=@data and c.kodtg=7
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
