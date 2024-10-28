---- Create new categories for siege modules

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_robot_enhancements')
BEGIN
	INSERT INTO categoryFlags (value, name, note, hidden, isunique) VALUES
	(3087, 'cf_robot_enhancements', 'Robot enhancements', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_dreadnought_modules')
BEGIN
	INSERT INTO categoryFlags (value, name, note, hidden, isunique) VALUES
	(68623, 'cf_dreadnought_modules', 'Dreadnought modules', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_robot_enhancements_calibration_programs')
BEGIN
	INSERT INTO categoryFlags (value, name, note, hidden, isunique) VALUES
	(590870, 'cf_robot_enhancements_calibration_programs', 'Robot enhancements CT', 0, 0)
END

GO

---- Add dreadnought modules

DECLARE @categoryFlags INT

-- T1 dreadnought module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_dreadnought_module', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t1', '', 1, 2.5, 2000, 0, 100, 'def_dreadnought_module_desc', 1, 1, 1)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#tier=$tierlevel_t1', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_standard_dreadnought_module'
END

-- T1 dreadnought module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_robot_enhancements_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_dreadnought_module_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t1', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

-- T2 dreadnought module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_dreadnought_module', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t2', '', 1, 2.5, 1500, 0, 100, 'def_dreadnought_module_desc', 1, 1, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#tier=$tierlevel_t2', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_named1_dreadnought_module'
END

-- T2 dreadnought module prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_dreadnought_module_pr', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t2_pr', '', 1, 2.5, 1250, 0, 100, 'def_dreadnought_module_desc', 1, 2, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#ammoCapacity=i2d#tier=$tierlevel_t2_pr', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_named1_dreadnought_module_pr'
END

-- T2 dreadnought module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_robot_enhancements_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_dreadnought_module_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t2', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

-- T3 dreadnought module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_dreadnought_module', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t3', '', 1, 2.5, 1500, 0, 100, 'def_dreadnought_module_desc', 1, 1, 3)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#tier=$tierlevel_t3', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_named2_dreadnought_module'
END

-- T3 dreadnought module prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_dreadnought_module_pr', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t3_pr', '', 1, 2.5, 1250, 0, 100, 'def_dreadnought_module_desc', 1, 2, 3)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#tier=$tierlevel_t3_pr', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_named2_dreadnought_module_pr'
END

-- T3 dreadnought module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_robot_enhancements_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_dreadnought_module_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t3', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

-- T4 dreadnought module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_dreadnought_module', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t4', '', 1, 2.5, 1500, 0, 100, 'def_dreadnought_module_desc', 1, 1, 4)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#tier=$tierlevel_t4', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_named3_dreadnought_module'
END

-- T3 dreadnought module prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_dreadnought_module_pr', 1, 131344, @categoryFlags, '#moduleFlag=i908#tier=$tierlevel_t4_pr', '', 1, 2.5, 1250, 0, 100, 'def_dreadnought_module_desc', 1, 2, 4)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i908#tier=$tierlevel_t4_pr', descriptiontoken = 'def_dreadnought_module_desc', attributeflags = 131344 WHERE definitionname = 'def_named3_dreadnought_module_pr'
END

-- T3 dreadnought module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_robot_enhancements_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_dreadnought_module_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t4', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

---- Set up aggregate fields for dreadnought module

DECLARE @definition INT
DECLARE @field INT

-- T1 dreadnought module

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 450)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 450 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1350)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1350 WHERE definition = @definition AND field = @field
END


-- T2 dreadnought module

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 432)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 432 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1215)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1215 WHERE definition = @definition AND field = @field
END

-- T2 dreadnought module prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 195)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 195 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 414)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 414 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1152)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1152 WHERE definition = @definition AND field = @field
END

-- T3 dreadnought module

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 468)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 468 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

-- T3 dreadnought module prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 240)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 240 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 441)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 441 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1368)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1368 WHERE definition = @definition AND field = @field
END

-- T4 dreadnought module

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 195)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 195 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 495)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 495 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1458)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1458 WHERE definition = @definition AND field = @field
END

-- T4 dreadnought module prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 252)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 252 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 468)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 468 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180000)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1458)
END
ELSE
BEGIN
	UPDATE  aggregatevalues SET value = 1458 WHERE definition = @definition AND field = @field
END

GO

---- Add new effect category

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_robot_enhancements')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_robot_enhancements', 51, 1, 'Robot enhancements')
END

GO

---- Add new effects

DECLARE @effectCategory BIGINT

SET @effectCategory = 1125899906842624 -- 2^50

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_dreadnought')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 180500, 'effect_dreadnought', 'effect_dreadnought_desc', 'Dreadnought effect', 0, 0, 1, 3, 0)
END
ELSE
BEGIN
	UPDATE effects SET duration = 180500 WHERE name = 'effect_dreadnought'
END

GO

-- Add dreadnought effect fields

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_weapon_cycle_time_modifier', 0, 'effect_dreadnought_weapon_cycle_time_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_weapon_cycle_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_weapon_cycle_time_modifier', 0, 'effect_dreadnought_enhancer_weapon_cycle_time_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_optimal_range_modifier', 0, 'effect_dreadnought_optimal_range_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_optimal_range_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_optimal_range_modifier', 0, 'effect_dreadnought_enhancer_optimal_range_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

/*
IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_mining_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_mining_amount_modifier', 0, 'effect_dreadnought_enhancer_mining_amount_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_harvesting_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_harvesting_amount_modifier', 0, 'effect_dreadnought_enhancer_harvesting_amount_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_mining_cycle_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_mining_cycle_time_modifier', 0, 'effect_dreadnought_enhancer_mining_cycle_time_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_harvesting_cycle_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_harvesting_cycle_time_modifier', 0, 'effect_dreadnought_enhancer_harvesting_cycle_time_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END
*/

----

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_weapon_damage_modifier', 0, 'effect_dreadnought_weapon_damage_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_weapon_damage_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_weapon_damage_modifier', 0, 'effect_dreadnought_enhancer_weapon_damage_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_speed_max_modifier', 0, 'effect_dreadnought_speed_max_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_speed_max_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_speed_max_modifier', 0, 'effect_dreadnought_enhancer_speed_max_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_detection_strength_modifier', 1, 'effect_dreadnought_detection_strength_modifier_unit', 1, 0, 3, 2, 1, 1, NULL)
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1, measurementmultiplier = 1, measurementoffset = 0, category = 3, digits = 2, moreisbetter = 1, usedinconfig = 1, note = NULL
	WHERE name = 'effect_dreadnought_detection_strength_modifier'
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_detection_strength_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_detection_strength_modifier', 0, 'effect_dreadnought_enhancer_detection_strength_modifier_unit', 100, -100, 6, 2, 1, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_stealth_strength_modifier', 1, 'effect_dreadnought_stealth_strength_modifier_unit', 1, 0, 3, 2, 1, 1, NULL)
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1, measurementmultiplier = 1, measurementoffset = 0, category = 3, digits = 2, moreisbetter = 1, usedinconfig = 1, note = NULL
	WHERE name = 'effect_dreadnought_stealth_strength_modifier'
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_stealth_strength_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_stealth_strength_modifier', 1, 'effect_dreadnought_enhancer_stealth_strength_modifier_unit', 1, 0, 3, 2, 1, 1, NULL)
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1, measurementmultiplier = 1, measurementoffset = 0, category = 3, digits = 2, moreisbetter = 1, usedinconfig = 1, note = NULL
	WHERE name = 'effect_dreadnought_enhancer_stealth_strength_modifier'
END

GO

-- Set up aggregate values for dreadnought modules

DECLARE @definition INT
DECLARE @field INT

-- T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.3)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.6)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.9)

-- T2

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.3)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.6)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.9)

-- T2P

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.3)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.6)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.9)

-- T3

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.4)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.8)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.7)

-- T3P

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.4)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.8)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.7)

-- T4

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.5)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.5)

-- T4P

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_pr')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
--INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.01)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, -90)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.5)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2)

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.5)

GO

-- Set up module property modifiers

DECLARE @categoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')

DELETE FROM modulepropertymodifiers WHERE categoryflags = @categoryFlag

/*
SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_speed_max_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_speed_max_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)
*/

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_detection_strength_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_detection_strength_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_stealth_strength_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_stealth_strength_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_damage_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_weapon_damage_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_optimal_range_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_optimal_range_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_weapon_cycle_time_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_weapon_cycle_time_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

GO

-- Add slots to combat destroyers

UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4908,8,8,8,8' WHERE definitionname = 'def_onyx_bot_head'
UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4908,8,8,8,8' WHERE definitionname = 'def_hydra_bot_head'
UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4908,8,8,8,8' WHERE definitionname = 'def_felos_bot_head'

GO

---- Add new effect category

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_robot_reactor_overheat')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_robot_reactor_overheat', 52, 1, 'Robot reactor overheat')
END

GO

---- Add new effects for overheating

DECLARE @effectCategory BIGINT

SET @effectCategory = 2251799813685248 -- 2^51

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_overheat_buildup_low')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'effect_overheat_buildup_low', 'effect_overheat_buildup_low_desc', 'Overheat buildup low', 0, 0, 0, 3, 0)
END
ELSE
BEGIN
	 UPDATE effects SET effectcategory = @effectCategory WHERE name = 'effect_overheat_buildup_low'
END

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_overheat_buildup_medium')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'effect_overheat_buildup_medium', 'effect_overheat_buildup_medium_desc', 'Overheat buildup medium', 0, 0, 0, 3, 0)
END
ELSE
BEGIN
	 UPDATE effects SET effectcategory = @effectCategory WHERE name = 'effect_overheat_buildup_medium'
END

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_overheat_buildup_high')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'effect_overheat_buildup_high', 'effect_overheat_buildup_high_desc', 'Overheat buildup high', 0, 0, 0, 3, 0)
END
ELSE
BEGIN
	 UPDATE effects SET effectcategory = @effectCategory WHERE name = 'effect_overheat_buildup_high'
END

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_overheat_buildup_critical')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'effect_overheat_buildup_critical', 'effect_overheat_buildup_critical_desc', 'Overheat buildup critical', 0, 0, 0, 3, 0)
END
ELSE
BEGIN
	 UPDATE effects SET effectcategory = @effectCategory WHERE name = 'effect_overheat_buildup_critical'
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

DECLARE @flux INT

DECLARE @axicoline INT
DECLARE @polynitrocol INT
DECLARE @polynucleit INT
DECLARE @phlobotil INT

DECLARE @statichnol INT
DECLARE @metachropin INT
DECLARE @isopropentol INT

DECLARE @hydrobenol INT

DECLARE @common_basic_components INT
DECLARE @common_advanced_components INT
DECLARE @common_expert_components INT

DECLARE @t1_dreadnought_module INT
DECLARE @t2_dreadnought_module INT
DECLARE @t3_dreadnought_module INT

SET @titanium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_titanium')
SET @plasteosine = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_plasteosine')
SET @cryoperine = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_axicol') -- axicoline Y U NO cryoperine

SET @alligior = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_alligior')
SET @espitium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_espitium')
SET @bryochite = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_unimetal') -- unimetal Y U NO bryochite

SET @espitium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_espitium')

SET @flux = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_specimen_sap_item_flux')

SET @axicoline = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_axicoline')
SET @polynitrocol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_polynitrocol')
SET @polynucleit = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_polynucleit')
SET @phlobotil = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_phlobotil')

SET @statichnol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_statichnol')
SET @metachropin = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_metachropin')
SET @isopropentol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_isopropentol')

SET @hydrobenol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_hydrobenol')

SET @common_basic_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
SET @common_advanced_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
SET @common_expert_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')

SET @t1_dreadnought_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')
SET @t2_dreadnought_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')
SET @t3_dreadnought_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')

DECLARE @tempTable TABLE (definition INT, componentdefinition INT, componentamount INT)

-- Modules --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 1600)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 600),
(@definition, @t1_dreadnought_module, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 400),
(@definition, @espitium, 400),
(@definition, @t2_dreadnought_module, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 800),
(@definition, @bryochite, 2400),
(@definition, @espitium, 800),
(@definition, @t3_dreadnought_module, 1)

-- Prototypes --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 1600),
(@definition, @t1_dreadnought_module, 1),
(@definition, @common_basic_components, 120)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 400),
(@definition, @espitium, 400),
(@definition, @t2_dreadnought_module, 1),
(@definition, @common_basic_components, 80),
(@definition, @common_advanced_components, 80)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2400),
(@definition, @cryoperine, 800),
(@definition, @bryochite, 2400),
(@definition, @espitium, 800),
(@definition, @t3_dreadnought_module, 1),
(@definition, @common_basic_components, 60),
(@definition, @common_advanced_components, 120),
(@definition, @common_expert_components, 180)

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 7, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 8, @calibration, 1)

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

DECLARE @robot INT
DECLARE @t1 INT
DECLARE @t2 INT
DECLARE @t3 INT
DECLARE @t4 INT
DECLARE @titan INT
DECLARE @stermonit INT
DECLARE @silgium INT
DECLARE @imentium INT
DECLARE @flux INT
DECLARE @gammaterial INT
DECLARE @group INT
DECLARE @tempTable TABLE (parentdefinition INT, childdefinition INT, groupID INT, x INT, y INT, enablerextensionid INT)

SET @t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')
SET @t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')
SET @t3 = (SELECT TOP 1 definition definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')
SET @t4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')
SET @group = (SELECT TOP 1 id FROM [techtreegroups] WHERE name = 'common2')

INSERT INTO @tempTable (parentdefinition, childdefinition, groupID, x, y, enablerextensionid) VALUES
(0, @t1, @group, 6, 20, NULL),
(@t1, @t2, @group, 7, 20, NULL),
(@t2, @t3, @group, 8, 20, NULL),
(@t3, @t4, @group, 9, 20, NULL)

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 34300),
(@definition, @hightech, 34300)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 51200),
(@definition, @hightech, 51200)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 72900),
(@definition, @hightech, 72900)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 150000)

GO

---- Link modules and their prototypes----

DECLARE @module int
DECLARE @prototype int
DECLARE @tempTable TABLE (definition INT, prototype INT)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named1_dreadnought_module')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named1_dreadnought_module_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named2_dreadnought_module')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named2_dreadnought_module_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named3_dreadnought_module')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named3_dreadnought_module_pr')

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