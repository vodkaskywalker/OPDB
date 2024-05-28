---- Create category flags for NOX Modules

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_nox_modules' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(2831, 'cf_nox_modules', 'NOX modules', 1, 0)
END
ELSE
BEGIN
	UPDATE categoryflags SET isunique = 0 WHERE name = 'cf_nox_modules'
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_nox_shield_negators' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(68367, 'cf_nox_shield_negators', 'NOX shield negators', 1, 0)
END
ELSE
BEGIN
	UPDATE categoryflags SET isunique = 0 WHERE name = 'cf_nox_shield_negators'
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_nox_repair_negators' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(133903, 'cf_nox_repair_negators', 'NOX repair negators', 1, 0)
END
ELSE
BEGIN
	UPDATE categoryflags SET isunique = 0 WHERE name = 'cf_nox_repair_negators'
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_nox_teleport_negators' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(199439, 'cf_nox_teleport_negators', 'NOX teleport negators', 1, 0)
END
ELSE
BEGIN
	UPDATE categoryflags SET isunique = 0 WHERE name = 'cf_nox_teleport_negators'
END

GO

---- Add new aggregate fields

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_effect_radius')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_effect_radius', 1,'nox_effect_radius_unit', 10, 0, 6, 2, 1, NULL, 'NOX effect radius')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_effect_radius_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_effect_radius_modifier', 0,'nox_effect_radius_modifier_unit', 100, -100, 6, 2, 1, NULL, 'NOX effect radius modifier')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_effect_enhancer_radius_modifier', 0,'nox_effect_enhancer_radius_modifier_unit', 100, 0, 6, 2, 1, 1, 'NOX effect enhancer radius modifier')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_shield_absorbtion_modifier', 0,'nox_shield_absorbtion_modifier_unit', 100, -100, 6, 2, 1, 1, 'NOX shield negation effect')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 0 WHERE name = 'nox_shield_absorbtion_modifier'
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier_enhancer')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_shield_absorbtion_modifier_enhancer', 0,'nox_shield_absorbtion_modifier_enhancer_unit', 100, -100, 6, 2, 1, 1, 'NOX shield negation effect enhancer')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'default_nox_effect_radius')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('default_nox_effect_radius', 1,'default_nox_effect_radius_unit', 1, 0, 6, 2, 1, 1, 'NOX shield negation effect enhancer')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_repair_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_repair_amount_modifier', 0,'nox_repair_amount_modifier_unit', 100, -100, 6, 2, 1, 1, 'NOX repair negation effect')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 0 WHERE name = 'nox_repair_amount_modifier'
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_repair_amount_modifier_enhancer')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_repair_amount_modifier_enhancer', 0,'nox_repair_amount_modifier_enhancer_unit', 100, -100, 6, 2, 1, 1, 'NOX repair negation effect enhancer')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 0 WHERE name = 'nox_repair_amount_modifier_enhancer'
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'default_nox_effect_radius')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('default_nox_effect_radius', 1,'default_nox_effect_radius_unit', 1, 0, 6, 2, 1, 1, 'NOX shield negation effect enhancer')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'nox_teleport_negation')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('nox_teleport_negation', 1,'nox_teleport_negation_unit', 1, 0, 6, 2, 1, 1, 'NOX teleport negation effect')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'nox_teleport_negation'
END

GO

---- Add new effect category

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_nox_effect_shield_negation')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_nox_effect_shield_negation', 47, 1, 'Nox effect shield negation')
END
ELSE
BEGIN
	UPDATE effectcategories SET maxlevel = 1 WHERE name = 'effcat_nox_effect_shield_negation'
END

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_nox_effect_repair_negation')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_nox_effect_repair_negation', 48, 1, 'Nox effect repair negation')
END
ELSE
BEGIN
	UPDATE effectcategories SET maxlevel = 1 WHERE name = 'effcat_nox_effect_repair_negation'
END

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_nox_effect_teleport_negation')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_nox_effect_teleport_negation', 49, 1, 'Nox effect teleport negation')
END
ELSE
BEGIN
	UPDATE effectcategories SET maxlevel = 1 WHERE name = 'effcat_nox_effect_teleport_negation'
END

GO

---- Add new effects

DECLARE @effectCategory BIGINT

SET @effectCategory = 140737488355328

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'nox_effect_shield_negation')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'nox_effect_shield_negation', 'nox_effect_shield_negation_desc', 'NOX shield negation effect', 1, 10, 0, 1, 0)
END
ELSE
BEGIN
	UPDATE effects SET effectcategory = @effectCategory, duration = 0 WHERE name = 'nox_effect_shield_negation'
END

SET @effectCategory = 281474976710656

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'nox_effect_repair_negation')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'nox_effect_repair_negation', 'nox_effect_repair_negation_desc', 'NOX repair negation effect', 1, 10, 0, 1, 0)
END
ELSE
BEGIN
	UPDATE effects SET effectcategory = @effectCategory, duration = 0 WHERE name = 'nox_effect_repair_negation'
END

SET @effectCategory = 562949953421312

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'nox_effect_teleport_negation')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'nox_effect_teleport_negation', 'nox_effect_teleport_negation_desc', 'NOX teleport negation effect', 1, 10, 0, 1, 0)
END
ELSE
BEGIN
	UPDATE effects SET effectcategory = @effectCategory, duration = 0 WHERE name = 'nox_effect_teleport_negation'
END

---- Add new extensions category

IF NOT EXISTS (SELECT 1 FROM extensioncategories WHERE categoryname = 'extcat_nox_management')
BEGIN
	INSERT INTO extensioncategories (extensioncategoryid, categoryname, hidden) VALUES
	(7, 'extcat_nox_management', 0)
END

GO

---- Add new extensions

DECLARE @extensionsCategory INT
DECLARE @targetProperty INT

SET @extensionsCategory = (SELECT TOP 1 extensioncategoryid FROM extensioncategories WHERE categoryname = 'extcat_nox_management')

SET @targetProperty = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_nox_management_basic')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetPropertyID, effectenhancer, hidden, freezelimit) VALUES
	(376, 'ext_nox_management_basic', @extensionsCategory, 2, 'attributeA', 0.1, 'Increases NOX modules radius', 20000, 1, 'ext_nox_management_basic_desc', @targetProperty, 1, 0, 7)
END

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_nox_management_advanced')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetPropertyID, effectenhancer, hidden, freezelimit) VALUES
	(377, 'ext_nox_management_advanced', @extensionsCategory, 5, 'attributeA', 0.2, 'Increases NOX modules radius', 125000, 1, 'ext_nox_management_advanced_desc', @targetProperty, 0, 0, 7)
END

SET @targetProperty = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier_enhancer')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_nox_shield_negation')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetPropertyID, effectenhancer, hidden, freezelimit) VALUES
	(378, 'ext_nox_shield_negation', @extensionsCategory, 5, 'attributeA', -0.05, 'Increases NOX shield negation effect', 125000, 1, 'ext_nox_shield_negation_desc', @targetProperty, 1, 0, 7)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.05 WHERE extensionname = 'ext_nox_shield_negation'
END

SET @targetProperty = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier_enhancer')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_nox_repair_negation')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetPropertyID, effectenhancer, hidden, freezelimit) VALUES
	(379, 'ext_nox_repair_negation', @extensionsCategory, 5, 'attributeA', -0.05, 'Increases NOX repair negation effect', 125000, 1, 'ext_nox_repair_negation_desc', @targetProperty, 1, 0, 7)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.05 WHERE extensionname = 'ext_nox_repair_negation'
END

---- Create entity defaults for NOX modules

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_nox_shield_negators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_shield_negator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_elite2_cultist_nox_shield_negator', 1, 1052948, @categoryFlag, '#moduleFlag=i8 #plasmaDefinition=icca #plasmaConsumption=i3e8  #tier=$tierlevel_t2+', 1, 0.2, 50, 0, 100, 'def_elite2_cultist_nox_shield_negator_desc', 1, 3, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i8 #plasmaDefinition=icca #plasmaConsumption=i3e8  #tier=$tierlevel_t1' WHERE definitionname = 'def_elite2_cultist_nox_shield_negator'
END

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_nox_repair_negators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_repair_negator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_elite2_cultist_nox_repair_negator', 1, 1052948, @categoryFlag, '#moduleFlag=i8 #plasmaDefinition=icc9 #plasmaConsumption=i3e8 #tier=$tierlevel_t2+', 1, 0.2, 50, 0, 100, 'def_elite2_cultist_nox_repair_negator_desc', 1, 3, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i8 #plasmaDefinition=icc9 #plasmaConsumption=i3e8  #tier=$tierlevel_t1' WHERE definitionname = 'def_elite2_cultist_nox_repair_negator'
END

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_nox_teleport_negators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_teleport_negator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_elite2_cultist_nox_teleport_negator', 1, 1052948, @categoryFlag, '#moduleFlag=i8 #plasmaDefinition=icc8 #plasmaConsumption=i3e8 #tier=$tierlevel_t2+', 1, 0.2, 50, 0, 100, 'def_elite2_cultist_nox_teleport_negator_desc', 1, 3, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i8 #plasmaDefinition=icc8 #plasmaConsumption=i3e8  #tier=$tierlevel_t1' WHERE definitionname = 'def_elite2_cultist_nox_teleport_negator'
END

GO

---- Set up aggregate fields for NOX modules

DECLARE @definition INT
DECLARE @field INT

-- NOX shield negator

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_shield_negator')

---- Core usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Powergrid usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Default NOX effect radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'default_nox_effect_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

---- NOX shield absorbtion modifier

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.9)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @definition AND field = @field
END

-- NOX repair negator

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_repair_negator')

---- Core usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Powergrid usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Default NOX effect radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'default_nox_effect_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

---- NOX repair amount modifier

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.9)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @definition AND field = @field
END

-- NOX teleport negator

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_teleport_negator')

---- Core usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Powergrid usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Default NOX effect radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'default_nox_effect_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

---- NOX teleport negation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_teleport_negation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @definition AND field = @field
END

GO

---- Set up aggregate modifiers for NOX modules

DECLARE @destinationCategoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

-- NOX modules radius

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_nox_modules')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- NOX shield

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_nox_shield_negators')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier_enhancer')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- NOX repair

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_nox_repair_negators')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier_enhancer')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- NOX teleport

GO

---- Set up module property modifiers for NOX modules

DECLARE @destinationCategoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

-- NOX modules

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_nox_modules')

DELETE FROM modulepropertymodifiers WHERE categoryflags = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- NOX shield

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_nox_shield_negators')

DELETE FROM modulepropertymodifiers WHERE categoryflags = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier_enhancer')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- NOX repair

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_nox_repair_negators')

DELETE FROM modulepropertymodifiers WHERE categoryflags = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier_enhancer')

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

GO