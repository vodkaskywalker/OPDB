---- Create category flags for Scorchers

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_scorchers' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(853775, 'cf_scorchers', 'Scorchers', 1, 0)
END
ELSE
BEGIN
	UPDATE categoryflags SET isunique = 0 WHERE name = 'cf_scorchers'
END

GO

---- Add new aggregate fields

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'electric_damage')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('electric_damage', 1,'electric_damage_unit', 1, 0, 6, 0, 1, 1, 'Electric damage')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'electric_damage_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('electric_damage_modifier', 0,'electric_damage_modifier_unit', 100, -100, 6, 0, 1, 1, 'Electric damage modifier')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 0 WHERE name = 'electric_damage_modifier'
END

GO

---- Add new extensions

DECLARE @extensionsCategory INT
DECLARE @targetProperty INT

SET @targetProperty = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')
SET @extensionsCategory = (SELECT TOP 1 extensioncategoryid FROM extensioncategories WHERE categoryname = 'extcat_engineering')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_electric_damage')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetPropertyID, effectenhancer, hidden, freezelimit) VALUES
	(375, 'ext_electric_damage', @extensionsCategory, 9, 'attributeA', 0.1, 'Increases Scorcher electric damage', 405000, 1, 'ext_electric_damage_desc', @targetProperty, 0, 0, 7)
END
ELSE
BEGIN
	UPDATE extensions SET category = @extensionsCategory, targetPropertyID = @targetProperty WHERE extensionname = 'ext_electric_damage'
END

GO

---- Create entity defaults for Scorchers

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_scorchers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_elite2_cultist_scorcher', 1, 66256, @categoryFlag, '#moduleFlag=i490  #ammoCapacity=i0  #powergrid_usage=f200.00  #cpu_usage=f35.00  #cycle_time=f10.00  #energy_neutralized_amount=f300.00  #optimal_range=f25.00  #core_usage=f225.00  #falloff=f0.00  #tier=$tierlevel_t2+', 1, 1, 500, 0, 100, 'def_elite2_cultist_scorcher_desc', 1, 3, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET categoryflags = @categoryFlag, options='#moduleFlag=i490  #ammoCapacity=i0  #powergrid_usage=f200.00  #cpu_usage=f35.00  #cycle_time=f10.00  #energy_neutralized_amount=f300.00  #optimal_range=f25.00  #core_usage=f225.00  #falloff=f0.00  #tier=$tierlevel_t2+', mass=500, hidden = 0 WHERE definitionname = 'def_elite2_cultist_scorcher'
END

GO

---- Set up aggregate fields for Scorchers

DECLARE @definition INT
DECLARE @field INT

---- Core usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 225)
END

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Energy neutralized amount

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 250)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END

---- Powergrid usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 200)
END

---- Energy dispersion

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

GO

---- Set up aggregate modifiers for Scorchers

DECLARE @destinationCategoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_scorchers')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_medium_energy_neutralizer_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage_energy_neutralizers_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_neutralizer_optimal_range_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_engineering_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

GO

---- Set up module property modifiers for Scorchers

DECLARE @destinationCategoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_scorchers')

DELETE FROM modulepropertymodifiers WHERE categoryflags = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_engineering_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_engineering_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'engineering_optimal_range_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_neutralizer_optimal_range_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_dispersion_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

GO

-- Assign beams to scorchers

DECLARE @moduleId INT
DECLARE @beamId INT

SET @beamId = (SELECT TOP 1 id FROM beams WHERE name = 'medium_e_nezt_beam')

-- standard

SET @moduleId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')

IF NOT EXISTS (SELECT 1 FROM beamassignment WHERE definition = @moduleId AND beam = @beamId)
BEGIN
	INSERT INTO beamassignment (definition, beam) VALUES (@moduleId, @beamId)
END

GO