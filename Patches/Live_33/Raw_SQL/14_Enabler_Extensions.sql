USE perpetuumsa

GO

DECLARE @extension INT
DECLARE @definition INT

-- Terramotus

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_bot')

DELETE FROM enablerextensions WHERE definition = @definition

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_assault_unit_piloting')

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 4)

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_indy_role_specialist')

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_syndicate_industry_specialist')

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 10)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_bot_pr')

DELETE FROM enablerextensions WHERE definition = @definition

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_assault_unit_piloting')

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 4)

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_indy_role_specialist')

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_syndicate_industry_specialist')

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 10)

-- Large drillers

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_miner')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_large_driller')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_large_driller')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_large_driller_pr')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_large_driller')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_large_driller_pr')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_large_driller')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_large_driller_pr')

DELETE FROM enablerextensions WHERE definition = @definition

INSERT INTO enablerextensions (definition, extensionid, extensionlevel) VALUES
(@definition, @extension, 8)

GO