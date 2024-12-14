USE perpetuumsa

GO

---- Add new category for Adaptive Alloys ----

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_adaptive_alloys')
BEGIN
	INSERT INTO categoryFlags (value, name, note, hidden, isunique) VALUES
	(100925711, 'cf_adaptive_alloys', 'Adaptive alloys', 0, 1)
END

GO

---- Add adaptive alloys

DECLARE @categoryFlags INT

-- T1 Adaptive alloy

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_adaptive_alloys')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_adaptive_alloy', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t1', '', 1, 1.5, 500, 0, 100, 'def_adaptive_alloy_desc', 1, 1, 1)
END

-- T1 Adaptive alloy CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_armor_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_adaptive_alloy_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t1', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

-- T2 Adaptive alloy

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_adaptive_alloys')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_adaptive_alloy', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t2', '', 1, 1.5, 460, 0, 100, 'def_adaptive_alloy_desc', 1, 1, 2)
END

-- T2 Adaptive alloy prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_adaptive_alloy_pr', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t2_pr', '', 1, 1.5, 330, 0, 100, 'def_adaptive_alloy_desc', 1, 2, 2)
END

-- T2 Adaptive alloy CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_armor_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_adaptive_alloy_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t2', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

-- T3 Adaptive alloy

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_adaptive_alloys')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_adaptive_alloy', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t3', '', 1, 1.5, 500, 0, 100, 'def_adaptive_alloy_desc', 1, 1, 3)
END

-- T3 Adaptive alloy prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_adaptive_alloy_pr', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t3_pr', '', 1, 1.5, 371.4, 0, 100, 'def_adaptive_alloy_desc', 1, 2, 3)
END

-- T3 Adaptive alloy CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_armor_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_adaptive_alloy_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t3', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

-- T4 Adaptive alloy

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_adaptive_alloys')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_adaptive_alloy', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t4', '', 1, 1.5, 500, 0, 100, 'def_adaptive_alloy_desc', 1, 1, 4)
END

-- T4 Adaptive alloy prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_adaptive_alloy_pr', 1, 524292, @categoryFlags, '#moduleFlag=i20  #tier=$tierlevel_t4_pr', '', 1, 1.5, 371.4, 0, 100, 'def_adaptive_alloy_desc', 1, 2, 4)
END

-- T4 Adaptive alloy CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_armor_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_adaptive_alloy_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t4', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

---- Create new aggregate field

IF NOT EXISTS (SELECT TOP 1 name FROM aggregatefields WHERE name = 'adaptive_resist_points')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('adaptive_resist_points', 1, 'adaptive_resist_points_unit', 1, 0, 2, 0, 1, NULL, NULL)
END

GO

---- Set up aggregate fields for Adaptive alloys

DECLARE @definition INT
DECLARE @field INT

-- T1 Adaptive alloy

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 38)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END

-- T2 Adaptive alloy

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 11)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END

-- T2 Adaptive alloy prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 33)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 11)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END

-- T3 Adaptive alloy

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 40)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

-- T3 Adaptive alloy prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3363)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END

-- T4 Adaptive alloy

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 43)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 14)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- T4 Adaptive alloy prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 41)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 13)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'adaptive_resist_points')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 105)
END

GO

---- Add effect

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_adaptive_alloy')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(8, 0, 'effect_adaptive_alloy', 'effect_adaptive_alloy_desc', 'Adaptive alloy', 0, 0, 1, 1, 0)
END
ELSE
BEGIN
	UPDATE effects SET duration = 0 WHERE name = 'effect_adaptive_alloy'
END

GO

---- Production and prorotyping cost in materials, modulesand components ----

DECLARE @definition INT

DECLARE @titanium INT
DECLARE @plasteosine INT
DECLARE @cryoperine INT

DECLARE @alligior INT
DECLARE @espitium INT
DECLARE @bryochite INT

DECLARE @metachropin INT
DECLARE @prilumium INT

DECLARE @statichnol INT
DECLARE @chollonin INT

DECLARE @isopropentol INT
DECLARE @vitricyl INT

DECLARE @common_basic_components INT
DECLARE @common_advanced_components INT
DECLARE @common_expert_components INT

DECLARE @t1_adaptive_alloy INT
DECLARE @t2_adaptive_alloy INT
DECLARE @t3_adaptive_alloy INT

SET @titanium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_titanium')
SET @plasteosine = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_plasteosine')
SET @cryoperine = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_axicol') -- axicoline Y U NO cryoperine

SET @alligior = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_alligior')
SET @espitium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_espitium')
SET @bryochite = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_unimetal') -- unimetal Y U NO bryochite

SET @espitium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_espitium')
SET @bryochite = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_unimetal') -- unimetal Y U NO bryochite

SET @metachropin = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_metachropin')
SET @prilumium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_prilumium')

SET @statichnol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_statichnol')
SET @chollonin = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_chollonin')

SET @isopropentol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_isopropentol')
SET @vitricyl = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vitricyl')

SET @common_basic_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
SET @common_advanced_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
SET @common_expert_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')

SET @t1_adaptive_alloy = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')
SET @t2_adaptive_alloy = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy')
SET @t3_adaptive_alloy = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy')

DECLARE @tempTable TABLE (definition INT, componentdefinition INT, componentamount INT)

-- Modules --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 500),
(@definition, @cryoperine, 200),
(@definition, @metachropin, 65),
(@definition, @prilumium, 25),
(@definition, @statichnol, 65),
(@definition, @chollonin, 25),
(@definition, @isopropentol, 65),
(@definition, @vitricyl, 25)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 500),
(@definition, @cryoperine, 200),
(@definition, @metachropin, 65),
(@definition, @prilumium, 25),
(@definition, @statichnol, 65),
(@definition, @chollonin, 25),
(@definition, @isopropentol, 65),
(@definition, @vitricyl, 25),
(@definition, @t1_adaptive_alloy, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 250),
(@definition, @cryoperine, 100),
(@definition, @metachropin, 65),
(@definition, @prilumium, 25),
(@definition, @statichnol, 65),
(@definition, @chollonin, 25),
(@definition, @isopropentol, 65),
(@definition, @vitricyl, 25),
(@definition, @alligior, 250),
(@definition, @espitium, 100),
(@definition, @t2_adaptive_alloy, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 2500),
(@definition, @cryoperine, 100),
(@definition, @metachropin, 125),
(@definition, @prilumium, 50),
(@definition, @statichnol, 125),
(@definition, @chollonin, 50),
(@definition, @isopropentol, 125),
(@definition, @vitricyl, 50),
(@definition, @alligior, 500),
(@definition, @espitium, 200),
(@definition, @t3_adaptive_alloy, 1)

-- Prototypes --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 500),
(@definition, @cryoperine, 200),
(@definition, @metachropin, 65),
(@definition, @prilumium, 25),
(@definition, @statichnol, 65),
(@definition, @chollonin, 25),
(@definition, @isopropentol, 65),
(@definition, @vitricyl, 25),
(@definition, @t1_adaptive_alloy, 1),
(@definition, @common_basic_components, 30)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 250),
(@definition, @cryoperine, 100),
(@definition, @metachropin, 65),
(@definition, @prilumium, 25),
(@definition, @statichnol, 65),
(@definition, @chollonin, 25),
(@definition, @isopropentol, 65),
(@definition, @vitricyl, 25),
(@definition, @alligior, 250),
(@definition, @espitium, 100),
(@definition, @t2_adaptive_alloy, 1),
(@definition, @common_basic_components, 20),
(@definition, @common_advanced_components, 20)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @plasteosine, 2500),
(@definition, @cryoperine, 100),
(@definition, @metachropin, 125),
(@definition, @prilumium, 50),
(@definition, @statichnol, 125),
(@definition, @chollonin, 50),
(@definition, @isopropentol, 125),
(@definition, @vitricyl, 50),
(@definition, @alligior, 500),
(@definition, @espitium, 200),
(@definition, @t3_adaptive_alloy, 1),
(@definition, @common_basic_components, 15),
(@definition, @common_advanced_components, 30),
(@definition, @common_expert_components, 45)

MERGE components AS Target
USING (SELECT definition, componentdefinition, componentamount FROM @tempTable) AS Source
ON (Target.definition = Source.definition AND Target.componentdefinition = Source.componentdefinition)
WHEN MATCHED THEN
    UPDATE SET Target.componentamount = Source.componentamount
WHEN NOT MATCHED BY TARGET THEN
    INSERT (definition, componentdefinition, componentamount)
    VALUES (Source.definition, Source.componentdefinition, Source.componentamount);

GO

---- Research levels ----

DECLARE @definition INT
DECLARE @calibration INT
DECLARE @tempTable TABLE (definition INT, researchlevel INT, calibrationprogram INT, enabled BIT)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 3, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 4, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

MERGE itemresearchlevels AS Target
USING (SELECT definition, researchlevel, calibrationprogram, enabled FROM @tempTable) AS Source
ON (Target.definition = Source.definition)
WHEN MATCHED THEN
    UPDATE SET 
		Target.researchlevel = Source.researchlevel,
		Target.calibrationprogram = Source.calibrationprogram,
		Target.enabled = Source.enabled
WHEN NOT MATCHED BY TARGET THEN
    INSERT (definition, researchlevel, calibrationprogram, enabled)
    VALUES (Source.definition, Source.researchlevel, Source.calibrationprogram, Source.enabled);

GO

---- Position in tech tree ----

DECLARE @parent INT
DECLARE @t1 INT
DECLARE @t2 INT
DECLARE @t3 INT
DECLARE @t4 INT
DECLARE @group INT
DECLARE @tempTable TABLE (parentdefinition INT, childdefinition INT, groupID INT, x INT, y INT, enablerextensionid INT)

SET @parent = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_chm_armor_hardener')
SET @t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')
SET @t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy')
SET @t3 = (SELECT TOP 1 definition definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy')
SET @t4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy')
SET @group = (SELECT TOP 1 id FROM [techtreegroups] WHERE name = 'common1')

INSERT INTO @tempTable (parentdefinition, childdefinition, groupID, x, y, enablerextensionid) VALUES
(@parent, @t1, @group, 4, 12, NULL),
(@t1, @t2, @group, 5, 12, NULL),
(@t2, @t3, @group, 6, 12, NULL),
(@t3, @t4, @group, 7, 12, NULL)

MERGE techtree AS Target
USING (SELECT parentdefinition, childdefinition, groupID, x, y, enablerextensionid FROM @tempTable) AS Source
ON (Target.childdefinition = Source.childdefinition AND Target.groupID = Source.groupID)
WHEN MATCHED THEN
    UPDATE SET 
		Target.parentdefinition = Source.parentdefinition,
		Target.x = Source.x,
		Target.y = Source.y,
		Target.enablerextensionid = Source.enablerextensionid
WHEN NOT MATCHED BY TARGET THEN
    INSERT (parentdefinition, childdefinition, groupID, x, y, enablerextensionid)
    VALUES (Source.parentdefinition, Source.childdefinition, Source.groupID, Source.x, Source.y, Source.enablerextensionid);

GO

----Research cost ----

DECLARE @definition INT
DECLARE @common INT
DECLARE @hightech INT

SET @common = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'common')
SET @hightech = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'hitech')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_adaptive_alloy')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 75000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_adaptive_alloy')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 129600)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_adaptive_alloy')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 205800)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_adaptive_alloy')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 76800)
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 153600)

GO

---- Link modules and their prototypes----

DECLARE @module int
DECLARE @prototype int
DECLARE @tempTable TABLE (definition INT, prototype INT)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named1_adaptive_alloy')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named1_adaptive_alloy_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named2_adaptive_alloy')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named2_adaptive_alloy_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named3_adaptive_alloy')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named3_adaptive_alloy_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

MERGE prototypes AS Target
USING (SELECT definition, prototype FROM @tempTable) AS Source
ON (Target.definition = Source.definition)
WHEN MATCHED THEN
    UPDATE SET 
		Target.prototype = Source.prototype
WHEN NOT MATCHED BY TARGET THEN
    INSERT (definition, prototype)
    VALUES (Source.definition, Source.prototype);

GO