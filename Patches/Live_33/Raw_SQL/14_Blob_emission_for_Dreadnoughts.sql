-- Add dreadnought effect fields

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_blob_emission_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_blob_emission_modifier', 0, 'effect_dreadnought_blob_emission_modifier_unit', 100, -100, 3, 2, 0, 1, NULL)
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_blob_emission_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note)
	VALUES ('effect_dreadnought_enhancer_blob_emission_modifier', 0, 'effect_dreadnought_enhancer_blob_emission_modifier_unit', 100, -100, 3, 2, 0, 1, NULL)
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 0, measurementmultiplier = 100, measurementoffset = -100, category = 3, digits = 2, moreisbetter = 0, usedinconfig = 1, note = NULL
	WHERE name = 'effect_dreadnought_enhancer_blob_emission_modifier'
END

GO

-- Set up aggregate values for dreadnought modules

DECLARE @definition INT
DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_blob_emission_modifier')

-- T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_dreadnought_module')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2)

-- T2

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2)

-- T2P

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_dreadnought_module_pr')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2)

-- T3

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.9)

-- T3P

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_dreadnought_module_pr')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.9)

-- T4

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.8)

-- T4P

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_dreadnought_module_pr')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field
INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.8)

GO

-- Set up module property modifiers

DECLARE @categoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')
SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_blob_emission_modifier')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'effect_dreadnought_enhancer_blob_emission_modifier')

DELETE FROM modulepropertymodifiers WHERE categoryflags = @categoryFlag AND basefield = @baseField AND modifierfield = @modifierField

INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

GO
