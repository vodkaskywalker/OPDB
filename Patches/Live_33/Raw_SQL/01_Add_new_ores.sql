---- Add new ores

---- Deeptanium

-- Geoscan document definition

DECLARE @scanDocumentId INT

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_geoscan_document_deeptanium')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_geoscan_document_deeptanium', 1, 2048, 1685, '', '', 1, 0.1, 0.1, 0, 100, 'def_geoscan_document_desc', 0, NULL, NULL)
END

SET @scanDocumentId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_geoscan_document_deeptanium')

-- Ore definition

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_ore')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_deeptanium')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_deeptanium', 1, 2048, @categoryFlags, '', '', 1, 2.5E-05, 0.02, 0, 100, 'def_deeptanium_desc', 1, NULL, NULL)
END

-- Ore type

DECLARE @oreDefinitionId INT

SET @oreDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_deeptanium')

IF NOT EXISTS (SELECT 1 FROM minerals WHERE name = 'deeptanium')
BEGIN
	INSERT INTO minerals (idx, name, definition, amount, extractionType, enablereffectrequired, note, geoscandocument) VALUES
	(17, 'deeptanium', @oreDefinitionId, 1500, 0, 0, 'deeptanium ore', @scanDocumentId)
END

-- Ore config

DECLARE @mineralId INT

SET @mineralId = (SELECT TOP 1 idx FROM minerals WHERE name = 'deeptanium')

DELETE FROM mineralconfigs WHERE materialtype = @mineralId

INSERT INTO mineralconfigs (zoneid, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold) VALUES
(0, @mineralId, 3, 250, 5000000, 0.5),
(1, @mineralId, 7, 500, 45000000, 0.5),
(3, @mineralId, 7, 500, 45000000, 0.5),
(4, @mineralId, 7, 500, 45000000, 0.5),
(5, @mineralId, 7, 500, 45000000, 0.5),
(6, @mineralId, 7, 500, 45000000, 0.5),
(7, @mineralId, 7, 500, 45000000, 0.5),
(8, @mineralId, 3, 250, 5000000, 0.5),
(9, @mineralId, 7, 500, 45000000, 0.5),
(10, @mineralId, 7, 500, 45000000, 0.5),
(11, @mineralId, 7, 500, 45000000, 0.5)
/*
(100, @mineralId, 7, 500, 45000000, 0.5),
(101, @mineralId, 7, 500, 45000000, 0.5),
(102, @mineralId, 7, 500, 45000000, 0.5),
(103, @mineralId, 7, 500, 45000000, 0.5),
(104, @mineralId, 7, 500, 45000000, 0.5),
(105, @mineralId, 7, 500, 45000000, 0.5),
(106, @mineralId, 7, 500, 45000000, 0.5),
(107, @mineralId, 7, 500, 45000000, 0.5),
(108, @mineralId, 7, 500, 45000000, 0.5),
(109, @mineralId, 7, 500, 45000000, 0.5),
(110, @mineralId, 7, 500, 45000000, 0.5),
(111, @mineralId, 7, 500, 45000000, 0.5),
(112, @mineralId, 7, 500, 45000000, 0.5),
(113, @mineralId, 7, 500, 45000000, 0.5),
(114, @mineralId, 7, 500, 45000000, 0.5),
(115, @mineralId, 7, 500, 45000000, 0.5),
(116, @mineralId, 7, 500, 45000000, 0.5),
(117, @mineralId, 7, 500, 45000000, 0.5),
(118, @mineralId, 7, 500, 45000000, 0.5),
(119, @mineralId, 7, 500, 45000000, 0.5),
(120, @mineralId, 7, 500, 45000000, 0.5),
(121, @mineralId, 7, 500, 45000000, 0.5),
(122, @mineralId, 7, 500, 45000000, 0.5),
(123, @mineralId, 7, 500, 45000000, 0.5),
(124, @mineralId, 7, 500, 45000000, 0.5),
(125, @mineralId, 7, 500, 45000000, 0.5),
(126, @mineralId, 7, 500, 45000000, 0.5),
(127, @mineralId, 7, 500, 45000000, 0.5),
(128, @mineralId, 7, 500, 45000000, 0.5),
(129, @mineralId, 7, 500, 45000000, 0.5),
(130, @mineralId, 7, 500, 45000000, 0.5),
(131, @mineralId, 7, 500, 45000000, 0.5),
(132, @mineralId, 7, 500, 45000000, 0.5),
(133, @mineralId, 7, 500, 45000000, 0.5),
(134, @mineralId, 7, 500, 45000000, 0.5),
(135, @mineralId, 7, 500, 45000000, 0.5),
(136, @mineralId, 7, 500, 45000000, 0.5),
(137, @mineralId, 7, 500, 45000000, 0.5),
(138, @mineralId, 7, 500, 45000000, 0.5),
(139, @mineralId, 7, 500, 45000000, 0.5),
(140, @mineralId, 7, 500, 45000000, 0.5)
*/

GO

---- Add geoscanner charges

-- Directional charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_probe_deeptanium_direction')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_probe_deeptanium_direction', 1000, 2048, 395530, '#mineral=$deeptanium', '', 1, 0.5, 0.1, 0, 100, 'def_ammo_mining_probe_direction_desc', 1, NULL, NULL)
END

-- Tile charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_probe_deeptanium_tile')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_probe_deeptanium_tile', 1000, 2048, 133386, '#mineral=$deeptanium #type=n1', '', 1, 0.5, 0.1, 0, 100, 'def_ammo_mining_probe_tile_desc', 1, NULL, NULL)
END

GO

---- Create category flags for deep mining charges

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_deep_mining_ammo' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(4874, 'cf_deep_mining_ammo', 'Deep mining ammo', 0, 0)
END

GO

---- Add deep mining charges

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_deep_mining_ammo')

-- Deeptanium mining charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_deeptanium')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_deeptanium', 1000, 2147485696, @categoryFlags, '#mineral=$deeptanium', '', 1, 0.5, 1, 0, 100, 'def_ammo_mining_desc', 1, NULL, NULL)
END

GO

---- Create category flags for large drillers

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_large_drillers' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(50398735, 'cf_large_drillers', 'Large drillers', 0, 0)
END
ELSE
BEGIN
	UPDATE categoryflags SET value = 50398735 WHERE name = 'cf_large_drillers'
END

GO

---- Add large drillers

DECLARE @categoryFlags INT

DECLARE @ammoType INT

SET @ammoType = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_deep_mining_ammo')

-- T1 large driller

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_large_drillers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_large_driller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_large_driller', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t1'), '', 1, 2.5, 2000, 0, 100, 'def_standard_driller_desc', 1, 1, 1)
END
ELSE
BEGIN
	UPDATE entitydefaults SET categoryflags = @categoryFlags, quantity = 1 WHERE definitionname = 'def_standard_large_driller'
END

-- T1 large driller CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_industry_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_large_driller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_large_driller_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t1', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

-- T2 large driller

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_large_drillers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_large_driller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_large_driller', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t2'), '', 1, 2.5, 1500, 0, 100, 'def_named_driller_desc', 1, 1, 2)
END

-- T2 large driller prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_large_driller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_large_driller_pr', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t2_pr'), '', 1, 2.5, 1250, 0, 100, 'def_named_driller_desc', 1, 2, 2)
END

-- T2 large driller CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_industry_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_large_driller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_large_driller_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t2', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

-- T3 large driller

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_large_drillers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_large_driller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_large_driller', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t3'), '', 1, 2.5, 1500, 0, 100, 'def_named_driller_desc', 1, 1, 3)
END

-- T3 large driller prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_large_driller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_large_driller_pr', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t3_pr'), '', 1, 2.5, 1250, 0, 100, 'def_named_driller_desc', 1, 2, 3)
END

-- T3 large driller CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_industry_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_large_driller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_large_driller_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t3', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

--

-- T4 large driller

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_large_drillers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_large_driller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_large_driller', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t4'), '', 1, 2.5, 1500, 0, 100, 'def_named_driller_desc', 1, 1, 4)
END

-- T3 large driller prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_large_driller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_large_driller_pr', 1, 327696, @categoryFlags, CONCAT('#moduleFlag=i310#ammoCapacity=i2d#ammoType=L', FORMAT(@ammoType, 'X'), '#tier=$tierlevel_t4_pr'), '', 1, 2.5, 1250, 0, 100, 'def_named_driller_desc', 1, 2, 4)
END

-- T3 large driller CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_industry_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_large_driller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_large_driller_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t4', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

---- Create entity defaults for Terramotus

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walker_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_chassis', 1, 1024, @category, '#height=f2#slotFlags=4310,0,310,310,0,310', 1, 100, 78000, 1, 100, 'def_terramotus_chassis_desc', 0, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#height=f2#slotFlags=4310,0,310,310,0,310' WHERE definitionname = 'def_terramotus_chassis'
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walker_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_head', 1, 1024, @category, '#slotFlags=48,8,8,8  #height=f0.10', 1, 3, 3000, 1, 100, 'def_terramotus_head_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walker_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_leg', 1, 1024, @category, '#slotFlags=420,20,20,20  #height=f1.10', 1, 20, 18000, 1, 100, 'def_terramotus_leg_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_robot_inventory_terramotus')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_robot_inventory_terramotus', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_terramotus')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walkers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_bot')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_bot', 1, 0, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 123, 0, 0, 100, 'def_terramotus_bot_desc', 1, 1, 3)
END

GO

---- Create robot template and link it with definition

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_terramotus')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'terramotus_empty')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('terramotus_empty', CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X')), 'Terramotus')
END
ELSE
BEGIN
	UPDATE robottemplates SET description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X')) WHERE name = 'terramotus_empty'
END

DECLARE @template INT

SET @template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'terramotus_empty')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @robot AND templateid = @template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@robot, @template, 0, 0, 'def_terramotus_bot')
END

GO

---- Set up aggregate fields for Terramotus

DECLARE @definition INT
DECLARE @field INT

-- Legs

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_leg')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.5)
END

-- Head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_head')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2300)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 21)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 95)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 50)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 500)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 95)
END

-- Chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1200)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

GO

---- Create entity defaults for Terramotus prototype

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walker_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_chassis_pr', 1, 1024, @category, '#height=f2#slotFlags=4310,0,310,310,0,310', 1, 100, 78000, 1, 100, 'def_terramotus_chassis_pr_desc', 0, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#height=f2#slotFlags=4310,0,310,310,0,310' WHERE definitionname = 'def_terramotus_chassis_pr'
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walker_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_head_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_head_pr', 1, 1024, @category, '#slotFlags=48,8,8,8  #height=f0.10', 1, 3, 3000, 1, 100, 'def_terramotus_head_pr_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walker_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_leg_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_leg_pr', 1, 1024, @category, '#slotFlags=420,20,20,20  #height=f1.10', 1, 20, 18000, 1, 100, 'def_terramotus_leg_pr_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_robot_inventory_terramotus_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_robot_inventory_terramotus_pr', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_head_pr')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis_pr')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_leg_pr')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_terramotus_pr')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_walkers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_terramotus_bot_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_terramotus_bot_pr', 1, 0, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo, '#tier=$tierlevel_pr'), 1, 123, 0, 0, 100, 'def_terramotus_bot_pr_desc', 1, 2, NULL)
END

GO

---- Create robot template and link it with definition

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_bot_pr')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_head_pr')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis_pr')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_leg_pr')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_terramotus_pr')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'terramotus_pr_empty')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('terramotus_pr_empty', CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X')), 'Terramotus prototype')
END
ELSE
BEGIN
	UPDATE robottemplates SET description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X')) WHERE name = 'terramotus_pr_empty'
END

DECLARE @template INT

SET @template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'terramotus_pr_empty')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @robot AND templateid = @template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@robot, @template, 0, 0, 'def_terramotus_bot_pr')
END

GO

---- Set up aggregate fields for Terramotus prototype

DECLARE @definition INT
DECLARE @field INT

-- Legs

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_leg_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.5)
END

-- Head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_head_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2300)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 21)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 95)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 50)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 500)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 95)
END

-- Chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_terramotus_chassis_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1200)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

GO

---- Assign beams to ammo

DECLARE @ammoDefinition INT
DECLARE @beamDefinition INT

SET @ammoDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_mining_deeptanium')
SET @beamDefinition = (SELECT TOP 1 id FROM beams WHERE name = 'medium_laser')

DELETE FROM beamassignment WHERE definition = @ammoDefinition AND beam = @beamDefinition
INSERT INTO beamassignment (definition, beam) VALUES (@ammoDefinition, @beamDefinition)

---- Set up aggregate fields for large drillers

DECLARE @definition INT
DECLARE @field INT

-- T1 Large Driller

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_large_driller')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

-- T2 Large Driller

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_large_driller')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

-- T2 Large Driller prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_large_driller_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

-- T3 Large Driller

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_large_driller')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

-- T3 Large Driller prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_large_driller_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

-- T4 Large Driller

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_large_driller')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

-- T4 Large Driller prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_large_driller_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 110)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18000)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

GO

---- Deepriton

-- Geoscan document definition

DECLARE @scanDocumentId INT

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_geoscan_document_deepriton')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_geoscan_document_deepriton', 1, 2048, 1685, '', '', 1, 0.1, 0.1, 0, 100, 'def_geoscan_document_desc', 0, NULL, NULL)
END

SET @scanDocumentId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_geoscan_document_deepriton')

-- Ore definition

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_liquid')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_deepriton')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_deepriton', 1, 2048, @categoryFlags, '', '', 1, 2.5E-05, 0.02, 0, 100, 'def_deepriton_desc', 1, NULL, NULL)
END

-- Ore type

DECLARE @oreDefinitionId INT

SET @oreDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_deepriton')

IF NOT EXISTS (SELECT 1 FROM minerals WHERE name = 'deepriton')
BEGIN
	INSERT INTO minerals (idx, name, definition, amount, extractionType, enablereffectrequired, note, geoscandocument) VALUES
	(18, 'deepriton', @oreDefinitionId, 450, 1, 0, 'deepriton ore', @scanDocumentId)
END

-- Ore config

DECLARE @mineralId INT

SET @mineralId = (SELECT TOP 1 idx FROM minerals WHERE name = 'deepriton')

DELETE FROM mineralconfigs WHERE materialtype = @mineralId

INSERT INTO mineralconfigs (zoneid, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold) VALUES
(3, @mineralId, 3, 125, 45000000, 0.5),
(4, @mineralId, 3, 125, 45000000, 0.5),
(5, @mineralId, 3, 125, 45000000, 0.5),
(8, @mineralId, 3, 125, 45000000, 0.5),
(9, @mineralId, 3, 125, 45000000, 0.5),
(10, @mineralId, 3, 125, 45000000, 0.5)
/*
(100, @mineralId, 7, 500, 45000000, 0.5),
(101, @mineralId, 7, 500, 45000000, 0.5),
(102, @mineralId, 7, 500, 45000000, 0.5),
(103, @mineralId, 7, 500, 45000000, 0.5),
(104, @mineralId, 7, 500, 45000000, 0.5),
(105, @mineralId, 7, 500, 45000000, 0.5),
(106, @mineralId, 7, 500, 45000000, 0.5),
(107, @mineralId, 7, 500, 45000000, 0.5),
(108, @mineralId, 7, 500, 45000000, 0.5),
(109, @mineralId, 7, 500, 45000000, 0.5),
(110, @mineralId, 7, 500, 45000000, 0.5),
(111, @mineralId, 7, 500, 45000000, 0.5),
(112, @mineralId, 7, 500, 45000000, 0.5),
(113, @mineralId, 7, 500, 45000000, 0.5),
(114, @mineralId, 7, 500, 45000000, 0.5),
(115, @mineralId, 7, 500, 45000000, 0.5),
(116, @mineralId, 7, 500, 45000000, 0.5),
(117, @mineralId, 7, 500, 45000000, 0.5),
(118, @mineralId, 7, 500, 45000000, 0.5),
(119, @mineralId, 7, 500, 45000000, 0.5),
(120, @mineralId, 7, 500, 45000000, 0.5),
(121, @mineralId, 7, 500, 45000000, 0.5),
(122, @mineralId, 7, 500, 45000000, 0.5),
(123, @mineralId, 7, 500, 45000000, 0.5),
(124, @mineralId, 7, 500, 45000000, 0.5),
(125, @mineralId, 7, 500, 45000000, 0.5),
(126, @mineralId, 7, 500, 45000000, 0.5),
(127, @mineralId, 7, 500, 45000000, 0.5),
(128, @mineralId, 7, 500, 45000000, 0.5),
(129, @mineralId, 7, 500, 45000000, 0.5),
(130, @mineralId, 7, 500, 45000000, 0.5),
(131, @mineralId, 7, 500, 45000000, 0.5),
(132, @mineralId, 7, 500, 45000000, 0.5),
(133, @mineralId, 7, 500, 45000000, 0.5),
(134, @mineralId, 7, 500, 45000000, 0.5),
(135, @mineralId, 7, 500, 45000000, 0.5),
(136, @mineralId, 7, 500, 45000000, 0.5),
(137, @mineralId, 7, 500, 45000000, 0.5),
(138, @mineralId, 7, 500, 45000000, 0.5),
(139, @mineralId, 7, 500, 45000000, 0.5),
(140, @mineralId, 7, 500, 45000000, 0.5)
*/

GO

---- Add geoscanner charges

-- Directional charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_probe_deepriton_direction')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_probe_deepriton_direction', 1000, 2048, 395530, '#mineral=$deepriton', '', 1, 0.5, 0.1, 0, 100, 'def_ammo_mining_probe_direction_desc', 1, NULL, NULL)
END

-- Tile charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_probe_deepriton_tile')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_probe_deepriton_tile', 1000, 2048, 133386, '#mineral=$deepriton #type=n1', '', 1, 0.5, 0.1, 0, 100, 'def_ammo_mining_probe_tile_desc', 1, NULL, NULL)
END

GO

---- Add deep mining charges

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_deep_mining_ammo')

-- Deepriton mining charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_deepriton')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_deepriton', 1000, 2147485696, @categoryFlags, '#mineral=$deepriton', '', 1, 0.5, 1, 0, 100, 'def_ammo_mining_desc', 1, NULL, NULL)
END

GO

---- Assign beams to ammo

DECLARE @ammoDefinition INT
DECLARE @beamDefinition INT

SET @ammoDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_mining_deepriton')
SET @beamDefinition = (SELECT TOP 1 id FROM beams WHERE name = 'volcano_medium_laser')

DELETE FROM beamassignment WHERE definition = @ammoDefinition AND beam = @beamDefinition
INSERT INTO beamassignment (definition, beam) VALUES (@ammoDefinition, @beamDefinition)

---- DHDT

-- Geoscan document definition

DECLARE @scanDocumentId INT

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_geoscan_document_dhdt')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_geoscan_document_dhdt', 1, 2048, 1685, '', '', 1, 0.1, 0.1, 0, 100, 'def_geoscan_document_desc', 0, NULL, NULL)
END

SET @scanDocumentId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_geoscan_document_dhdt')

-- Ore definition

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_liquid')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_dhdt')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_dhdt', 1, 2048, @categoryFlags, '', '', 1, 2.5E-05, 0.02, 0, 100, 'def_dhdt_desc', 1, NULL, NULL)
END

-- Ore type

DECLARE @oreDefinitionId INT

SET @oreDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_dhdt')

IF NOT EXISTS (SELECT 1 FROM minerals WHERE name = 'dhdt')
BEGIN
	INSERT INTO minerals (idx, name, definition, amount, extractionType, enablereffectrequired, note, geoscandocument) VALUES
	(19, 'dhdt', @oreDefinitionId, 450, 1, 0, 'dhdt ore', @scanDocumentId)
END

-- Ore config

DECLARE @mineralId INT

SET @mineralId = (SELECT TOP 1 idx FROM minerals WHERE name = 'dhdt')

DELETE FROM mineralconfigs WHERE materialtype = @mineralId

INSERT INTO mineralconfigs (zoneid, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold) VALUES
(0, @mineralId, 3, 125, 5000000, 0.5),
(1, @mineralId, 3, 125, 45000000, 0.5),
(3, @mineralId, 3, 125, 45000000, 0.5),
(4, @mineralId, 3, 125, 45000000, 0.5),
(5, @mineralId, 3, 125, 45000000, 0.5),
(6, @mineralId, 3, 125, 45000000, 0.5),
(7, @mineralId, 3, 125, 45000000, 0.5),
(8, @mineralId, 3, 125, 5000000, 0.5),
(9, @mineralId, 3, 125, 45000000, 0.5),
(10, @mineralId, 3, 125, 45000000, 0.5),
(11, @mineralId, 3, 125, 45000000, 0.5)
/*
(100, @mineralId, 7, 500, 45000000, 0.5),
(101, @mineralId, 7, 500, 45000000, 0.5),
(102, @mineralId, 7, 500, 45000000, 0.5),
(103, @mineralId, 7, 500, 45000000, 0.5),
(104, @mineralId, 7, 500, 45000000, 0.5),
(105, @mineralId, 7, 500, 45000000, 0.5),
(106, @mineralId, 7, 500, 45000000, 0.5),
(107, @mineralId, 7, 500, 45000000, 0.5),
(108, @mineralId, 7, 500, 45000000, 0.5),
(109, @mineralId, 7, 500, 45000000, 0.5),
(110, @mineralId, 7, 500, 45000000, 0.5),
(111, @mineralId, 7, 500, 45000000, 0.5),
(112, @mineralId, 7, 500, 45000000, 0.5),
(113, @mineralId, 7, 500, 45000000, 0.5),
(114, @mineralId, 7, 500, 45000000, 0.5),
(115, @mineralId, 7, 500, 45000000, 0.5),
(116, @mineralId, 7, 500, 45000000, 0.5),
(117, @mineralId, 7, 500, 45000000, 0.5),
(118, @mineralId, 7, 500, 45000000, 0.5),
(119, @mineralId, 7, 500, 45000000, 0.5),
(120, @mineralId, 7, 500, 45000000, 0.5),
(121, @mineralId, 7, 500, 45000000, 0.5),
(122, @mineralId, 7, 500, 45000000, 0.5),
(123, @mineralId, 7, 500, 45000000, 0.5),
(124, @mineralId, 7, 500, 45000000, 0.5),
(125, @mineralId, 7, 500, 45000000, 0.5),
(126, @mineralId, 7, 500, 45000000, 0.5),
(127, @mineralId, 7, 500, 45000000, 0.5),
(128, @mineralId, 7, 500, 45000000, 0.5),
(129, @mineralId, 7, 500, 45000000, 0.5),
(130, @mineralId, 7, 500, 45000000, 0.5),
(131, @mineralId, 7, 500, 45000000, 0.5),
(132, @mineralId, 7, 500, 45000000, 0.5),
(133, @mineralId, 7, 500, 45000000, 0.5),
(134, @mineralId, 7, 500, 45000000, 0.5),
(135, @mineralId, 7, 500, 45000000, 0.5),
(136, @mineralId, 7, 500, 45000000, 0.5),
(137, @mineralId, 7, 500, 45000000, 0.5),
(138, @mineralId, 7, 500, 45000000, 0.5),
(139, @mineralId, 7, 500, 45000000, 0.5),
(140, @mineralId, 7, 500, 45000000, 0.5)
*/

GO

---- Add geoscanner charges

-- Directional charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_probe_dhdt_direction')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_probe_dhdt_direction', 1000, 2048, 395530, '#mineral=$dhdt', '', 1, 0.5, 0.1, 0, 100, 'def_ammo_mining_probe_direction_desc', 1, NULL, NULL)
END

-- Tile charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_probe_dhdt_tile')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_probe_dhdt_tile', 1000, 2048, 133386, '#mineral=$dhdt #type=n1', '', 1, 0.5, 0.1, 0, 100, 'def_ammo_mining_probe_tile_desc', 1, NULL, NULL)
END

GO

---- Add deep mining charges

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_deep_mining_ammo')

-- DHDT mining charge

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_ammo_mining_dhdt')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_ammo_mining_dhdt', 1000, 2147485696, @categoryFlags, '#mineral=$dhdt', '', 1, 0.5, 1, 0, 100, 'def_ammo_mining_desc', 1, NULL, NULL)
END

GO

---- Assign beams to ammo

DECLARE @ammoDefinition INT
DECLARE @beamDefinition INT

SET @ammoDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_mining_dhdt')
SET @beamDefinition = (SELECT TOP 1 id FROM beams WHERE name = 'crypto_medium_laser')

DELETE FROM beamassignment WHERE definition = @ammoDefinition AND beam = @beamDefinition
INSERT INTO beamassignment (definition, beam) VALUES (@ammoDefinition, @beamDefinition)