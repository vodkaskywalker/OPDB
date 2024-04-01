USE [perpetuumsa]
GO

--------------------------------------
-- Maroon Dark paint
--
-- Date Modified:
--      2024/03/26 - Initial commit
--------------------------------------

PRINT N'INSERT def_paint_maroon_dark DEFINITION';
INSERT INTO [dbo].[entitydefaults]
    ([definitionname],
     [quantity],
     [attributeflags],
     [categoryflags],
     [options],
     [note],
     [enabled],
     [volume],
     [mass],
     [hidden],
     [health],
     [descriptiontoken],
     [purchasable],
     [tiertype],
     [tierlevel])
VALUES
    ('def_paint_maroon_dark',1,2052,132251,'','Paint',1,0.000001,0.000001,0,100,'def_paint_maroon_dark_desc',1,NULL,NULL);

PRINT N'INSERT INTO definitionconfig TO CONFIGURE COLOR OF PAINT';
DECLARE	@paintDef int;
SET @paintDef = (SELECT TOP 1 definition from entitydefaults where definitionname='def_paint_maroon_dark');

INSERT INTO [dbo].[definitionconfig]
    ([definition],[tint],[note])
VALUES
    (@paintDef,'#330101','Paint Color');

PRINT N'INSERT SYNDICATE SHOP ORDERS';
DECLARE @alphaTM  int;
DECLARE @alphaASI int;
DECLARE @alphaICS int;

DECLARE @betaTM   int;
DECLARE @betaASI  int;
DECLARE @betaICS  int;

SET @alphaTM  = (SELECT TOP 1 id FROM itemshoppresets WHERE name LIKE 'tm_preset_pve');
SET @alphaASI = (SELECT TOP 1 id FROM itemshoppresets WHERE name LIKE 'asi_preset_pve');
SET @alphaICS = (SELECT TOP 1 id FROM itemshoppresets WHERE name LIKE 'ics_preset_pve');

SET @betaTM   = (SELECT TOP 1 id FROM itemshoppresets WHERE name LIKE 'tm_preset_pvp');
SET @betaASI  = (SELECT TOP 1 id FROM itemshoppresets WHERE name LIKE 'asi_preset_pvp');
SET @betaICS  = (SELECT TOP 1 id FROM itemshoppresets WHERE name LIKE 'ics_preset_pvp');

DECLARE @price int;
SET @price = 3000000;

INSERT INTO [dbo].[itemshop]
    ([presetid],
     [targetdefinition],
     [targetamount],
     [tmcoin],
     [icscoin],
     [asicoin],
     [credit],
     [unicoin],
     [globallimit],
     [purchasecount],
     [standing])
VALUES
    (@alphaTM,  @paintDef, 1, NULL, NULL, NULL, @price, NULL, NULL, 0, NULL),
    (@alphaASI, @paintDef, 1, NULL, NULL, NULL, @price, NULL, NULL, 0, NULL),
    (@alphaICS, @paintDef, 1, NULL, NULL, NULL, @price, NULL, NULL, 0, NULL),
	(@betaTM,   @paintDef, 1, NULL, NULL, NULL, @price, NULL, NULL, 0, NULL),
	(@betaASI,  @paintDef, 1, NULL, NULL, NULL, @price, NULL, NULL, 0, NULL),
	(@betaICS,  @paintDef, 1, NULL, NULL, NULL, @price, NULL, NULL, 0, NULL);
GO
