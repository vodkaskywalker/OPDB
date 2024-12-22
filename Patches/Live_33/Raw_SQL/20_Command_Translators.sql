USE perpetuumsa

GO

---- Create new categories for remote command translators

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_remote_command_translators')
BEGIN
	INSERT INTO categoryFlags (value, name, note, hidden, isunique) VALUES
	(84673551, 'cf_remote_command_translators', 'Remote command translators', 0, 0)
END

GO

---- Add new aggregate fields

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_damage_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_damage_modifier', 0,'drone_remote_command_translation_damage_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation damage bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_damage_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_damage_modifier_modifier', 1,'drone_remote_command_translation_damage_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation damage bonus extender')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_damage_modifier_modifier'
END

--

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_armor_max_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_armor_max_modifier', 0,'drone_remote_command_translation_armor_max_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation armor max bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_armor_max_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_armor_max_modifier_modifier', 1,'drone_remote_command_translation_armor_max_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation armor max bonus extender')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_armor_max_modifier_modifier'
END

--

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_mining_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_mining_amount_modifier', 0,'drone_remote_command_translation_mining_amount_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation mining amount bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_mining_amount_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_mining_amount_modifier_modifier', 1,'drone_remote_command_translation_mining_amount_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation mining amount bonus extender')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_mining_amount_modifier_modifier'
END

--

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_harvesting_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_harvesting_amount_modifier', 0,'drone_remote_command_translation_harvesting_amount_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation harvesting amount bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_harvesting_amount_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_harvesting_amount_modifier_modifier', 1,'drone_remote_command_translation_harvesting_amount_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation harvesting amount bonus extender')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_harvesting_amount_modifier_modifier'
END

--

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_remote_repair_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_remote_repair_amount_modifier', 0,'drone_remote_command_translation_remote_repair_amount_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation remote repair amount bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_remote_repair_amount_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_remote_repair_amount_modifier_modifier', 1,'drone_remote_command_translation_remote_repair_amount_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone remote command translation remote repair amount bonus extender')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_remote_repair_amount_modifier_modifier'
END

--

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_retreat')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_retreat', 1,'drone_remote_command_translation_retreat_unit', 1, 0, 6, 0, 1, 1, 'Drone remote command translation retreat')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_retreat'
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_remote_command_translation_retreat_confirmation')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_remote_command_translation_retreat_confirmation', 1,'drone_remote_command_translation_retreat_confirmation_unit', 1, 0, 6, 0, 1, 1, 'Drone remote command translation retreat confirmation')
END
ELSE
BEGIN
	UPDATE aggregatefields SET formula = 1 WHERE name = 'drone_remote_command_translation_retreat_confirmation'
END

GO

---- Add remote command translators

DECLARE @categoryFlags INT

-- T1 remote command translator module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_command_translators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_remote_command_translator', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t1#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 2000, 0, 100, 'def_remote_command_translator_desc', 1, 1, 1)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#tier=$tierlevel_t1#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_standard_remote_command_translator'
END

-- T1 remote command translator module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_module_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_remote_command_translator_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t1', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

-- T2 remote command translator module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_command_translators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_remote_command_translator', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t2#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 1500, 0, 100, 'def_remote_command_translator_desc', 1, 1, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#tier=$tierlevel_t2#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_named1_remote_command_translator'
END

-- T2 remote command translator module prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_remote_command_translator_pr', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t2_pr#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 1250, 0, 100, 'def_remote_command_translator_desc', 1, 2, 2)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#ammoCapacity=i2d#tier=$tierlevel_t2_pr#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_named1_remote_command_translator_pr'
END

-- T2 remote command translator module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_module_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_remote_command_translator_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t2', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

-- T3 remote command translator module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_command_translators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_remote_command_translator', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t3#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 1500, 0, 100, 'def_remote_command_translator_desc', 1, 1, 3)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#tier=$tierlevel_t3#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_named2_remote_command_translator'
END

-- T3 remote command translator module prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_remote_command_translator_pr', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t3_pr#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 1250, 0, 100, 'def_remote_command_translator_desc', 1, 2, 3)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#tier=$tierlevel_t3_pr#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_named2_remote_command_translator_pr'
END

-- T3 remote command translator module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_module_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_remote_command_translator_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t3', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

-- T4 remote command translator module

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_command_translators')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_remote_command_translator', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t4#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 1500, 0, 100, 'def_remote_command_translator_desc', 1, 1, 4)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#tier=$tierlevel_t4#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_named3_remote_command_translator'
END

-- T4 remote command translator module prototype

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_remote_command_translator_pr', 1, 262420, @categoryFlags, '#moduleFlag=i410#tier=$tierlevel_t4_pr#ammoType=L7120a#ammoCapacity=i1', '', 1, 2.5, 1250, 0, 100, 'def_remote_command_translator_desc', 1, 2, 4)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#moduleFlag=i410#tier=$tierlevel_t4_pr#ammoType=L7120a#ammoCapacity=i1', descriptiontoken = 'def_remote_command_translator_desc', attributeflags = 262420 WHERE definitionname = 'def_named3_remote_command_translator_pr'
END

-- T4 remote command translator module CT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_module_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_remote_command_translator_cprg', 1, 1024, @categoryFlags, '#tier=$tierlevel_t4', '', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

---- Create new categories for remote commands

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_remote_commands')
BEGIN
	INSERT INTO categoryFlags (value, name, note, hidden, isunique) VALUES
	(463370, 'cf_remote_commands', 'Remote commands', 0, 0)
END

GO

---- Add remote commands

DECLARE @categoryFlags INT

-- Attack remote commands

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_commands')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_basic_attack_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_basic_attack_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_attack_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_attack_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_basic_attack_remote_command'
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_improved_attack_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_improved_attack_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_attack_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_attack_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_improved_attack_remote_command'
END

-- Defend remote command

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_basic_defend_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_basic_defend_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_defend_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_defend_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_basic_defend_remote_command'
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_improved_defend_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_improved_defend_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_defend_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_defend_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_improved_defend_remote_command'
END

-- Gather remote command

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_basic_gather_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_basic_gather_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_gather_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_gather_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_basic_gather_remote_command'
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_improved_gather_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_improved_gather_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_gather_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_gather_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_improved_gather_remote_command'
END

-- Support remote command

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_basic_support_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_basic_support_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_support_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_support_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_support_remote_command'
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_improved_support_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_improved_support_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_support_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_support_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_improved_support_remote_command'
END

-- Retreat remote command

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_commands')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_retreat_remote_command')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_retreat_remote_command', 1, 2147485696, @categoryFlags, '', '', 1, 0.01, 1, 0, 100, 'def_retreat_remote_command_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '', descriptiontoken = 'def_retreat_remote_command_desc', attributeflags = 2147485696 WHERE definitionname = 'def_retreat_remote_command'
END

GO

---- Set up aggregate fields for remote command translators

DECLARE @definition INT
DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_damage_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_armor_max_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.1 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.1 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_mining_amount_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_harvesting_amount_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_remote_repair_amount_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.025 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.05 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.075)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.075 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_retreat')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.001 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.001 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.001 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.001 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.001 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.001 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 9000)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 9000)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 9000)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 15 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 15 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 150000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 150000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

---- Accumulator usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 9)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 9 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 8)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 8 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 11)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 11 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 12 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 125)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 125 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 113)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 113 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 107)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 107 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 129)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 129 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 143)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 143 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 136)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 136 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 57)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 57 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 64)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 64 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 70)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 70 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

GO

---- Set up aggregate fields for remote commands

DECLARE @definition INT
DECLARE @field INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_attack_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_damage_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.025 WHERE definition = @definition AND field = @field
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_attack_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_damage_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.05 WHERE definition = @definition AND field = @field
END

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_defend_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_armor_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.025 WHERE definition = @definition AND field = @field
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_defend_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_armor_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.05 WHERE definition = @definition AND field = @field
END

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_gather_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_mining_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.025 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_harvesting_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.025 WHERE definition = @definition AND field = @field
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_gather_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_mining_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.05 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_harvesting_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.05 WHERE definition = @definition AND field = @field
END

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_support_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_remote_repair_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.025)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.025 WHERE definition = @definition AND field = @field
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_support_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_remote_repair_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.05)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.05 WHERE definition = @definition AND field = @field
END

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_retreat_remote_command')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_remote_command_translation_retreat_confirmation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.001)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.001 WHERE definition = @definition AND field = @field
END

GO

---- Reconfigure uniqueness of remote controllers

UPDATE categoryFlags SET isunique = 0 WHERE name = 'cf_remote_controllers'
UPDATE categoryFlags SET isunique = 1 WHERE name = 'cf_remote_command_translators'

GO

---- Add new effect category

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_drone_remote_command_translation')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_drone_remote_command_translation', 53, 1, 'Drone remote command translation')
END

GO

---- Add new effects

DECLARE @effectCategory BIGINT

SET @effectCategory = 9007199254740992

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'remote_command_translation')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'remote_command_translation', 'remote_command_translation_desc', 'Remote command translation', 0, 0, 1, 1, 0)
END
ELSE
BEGIN
	UPDATE effects SET effectcategory = @effectCategory, duration = 0, isaura = 0, auraradius = 0 WHERE name = 'remote_command_translation'
END

GO

---- Fix effect categories

UPDATE effects SET effectcategory = 70368744177664 WHERE name = 'effect_mine_detector'
UPDATE effects SET effectcategory = 140737488355328 WHERE name = 'nox_effect_shield_negation'
UPDATE effects SET effectcategory = 281474976710656 WHERE name = 'nox_effect_repair_negation'
UPDATE effects SET effectcategory = 562949953421312 WHERE name = 'nox_effect_teleport_negation'
UPDATE effects SET effectcategory = 1125899906842624 WHERE name = 'effect_drone_amplification'
UPDATE effects SET effectcategory = 2251799813685248 WHERE name = 'effect_dreadnought'
UPDATE effects SET effectcategory = 4503599627370496 WHERE name = 'effect_overheat_buildup_low'
UPDATE effects SET effectcategory = 4503599627370496 WHERE name = 'effect_overheat_buildup_medium'
UPDATE effects SET effectcategory = 4503599627370496 WHERE name = 'effect_overheat_buildup_high'
UPDATE effects SET effectcategory = 4503599627370496 WHERE name = 'effect_overheat_buildup_critical'
UPDATE effects SET effectcategory = 2251799813685248 WHERE name = 'effect_excavator'
UPDATE effects SET effectcategory = 9007199254740992 WHERE name = 'remote_command_translation'

GO

---- Set rcu ammo id for scooping

UPDATE entitydefaults SET options = '#head=n8593  #chassis=n8594  #leg=n8595  #inventory=n8596 #faction=sSyndicate #packedTurretId=i2196' WHERE definitionname = 'def_syndicate_assault_drone'
UPDATE entitydefaults SET options = '#head=n8599  #chassis=n8600  #leg=n8601  #inventory=n8602 #faction=sSyndicate #packedTurretId=i219c' WHERE definitionname = 'def_nuimqol_assault_drone'
UPDATE entitydefaults SET options = '#head=n8605  #chassis=n8606  #leg=n8607  #inventory=n8608 #faction=sSyndicate #packedTurretId=i21a2' WHERE definitionname = 'def_thelodica_assault_drone'
UPDATE entitydefaults SET options = '#head=n8611  #chassis=n8612  #leg=n8613  #inventory=n8614 #faction=sSyndicate #packedTurretId=i21a8' WHERE definitionname = 'def_pelistal_assault_drone'

UPDATE entitydefaults SET options = '#head=n8617  #chassis=n8618  #leg=n8619  #inventory=n8620 #faction=sSyndicate #packedTurretId=i21ae' WHERE definitionname = 'def_syndicate_attack_drone'
UPDATE entitydefaults SET options = '#head=n8623  #chassis=n8624  #leg=n8625  #inventory=n8626 #faction=sSyndicate #packedTurretId=i21b4' WHERE definitionname = 'def_nuimqol_attack_drone'
UPDATE entitydefaults SET options = '#head=n8629  #chassis=n8630  #leg=n8631  #inventory=n8632 #faction=sSyndicate #packedTurretId=i21ba' WHERE definitionname = 'def_thelodica_attack_drone'
UPDATE entitydefaults SET options = '#head=n8635  #chassis=n8636  #leg=n8637  #inventory=n8638 #faction=sSyndicate #packedTurretId=i21c0' WHERE definitionname = 'def_pelistal_attack_drone'

UPDATE entitydefaults SET options = '#head=n8641  #chassis=n8642  #leg=n8643  #inventory=n8644 #faction=sSyndicate #packedTurretId=i21c6' WHERE definitionname = 'def_mining_industrial_drone'

UPDATE entitydefaults SET options = '#head=n8647  #chassis=n8648  #leg=n8649  #inventory=n8650 #faction=sSyndicate #packedTurretId=i21cc' WHERE definitionname = 'def_harvesting_industrial_drone'

UPDATE entitydefaults SET options = '#head=n8653  #chassis=n8654  #leg=n8655  #inventory=n8656 #faction=sSyndicate #packedTurretId=i21d2' WHERE definitionname = 'def_repair_support_drone'

GO

---- Add cpu, reactor, bandwidth, lifetime and operational range modifier

DECLARE @categoryFlags INT
DECLARE @baseField INT
DECLARE @modifierField INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_command_translators')
DELETE FROM aggregatemodifiers WHERE categoryflag = @categoryFlags

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlags, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlags, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlags, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlags, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlags, @baseField, @modifierField)

GO

---- Production and prorotyping cost in materials, modules and components ----

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

DECLARE @t1_remote_command_translator INT
DECLARE @t2_remote_command_translator INT
DECLARE @t3_remote_command_translator INT

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

SET @t1_remote_command_translator = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
SET @t2_remote_command_translator = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')
SET @t3_remote_command_translator = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')

DECLARE @tempTable TABLE (definition INT, componentdefinition INT, componentamount INT)

-- Modules --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 200),
(@definition, @espitium, 200)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 200),
(@definition, @espitium, 200),
(@definition, @t1_remote_command_translator, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 100),
(@definition, @cryoperine, 125),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @t2_remote_command_translator, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 200),
(@definition, @espitium, 400),
(@definition, @hydrobenol, 200),
(@definition, @bryochite, 200),
(@definition, @t3_remote_command_translator, 1)

-- Prototypes --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 200),
(@definition, @espitium, 200),
(@definition, @t1_remote_command_translator, 1),
(@definition, @common_basic_components, 120)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 100),
(@definition, @cryoperine, 125),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @t2_remote_command_translator, 1),
(@definition, @common_basic_components, 80),
(@definition, @common_advanced_components, 80)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')
INSERT INTO @tempTable (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 200),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 200),
(@definition, @espitium, 400),
(@definition, @hydrobenol, 200),
(@definition, @bryochite, 200),
(@definition, @t3_remote_command_translator, 1),
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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator_cprg')
INSERT INTO @tempTable (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 7, @calibration, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator_cprg')
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
DECLARE @parent INT
DECLARE @group INT
DECLARE @tempTable TABLE (parentdefinition INT, childdefinition INT, groupID INT, x INT, y INT, enablerextensionid INT)

SET @t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
SET @t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')
SET @t3 = (SELECT TOP 1 definition definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')
SET @t4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')

SET @parent = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_cpu_upgrade')

SET @group = (SELECT TOP 1 id FROM [techtreegroups] WHERE name = 'common2')

INSERT INTO @tempTable (parentdefinition, childdefinition, groupID, x, y, enablerextensionid) VALUES
(@parent, @t1, @group, 1, 35, NULL),
(@t1, @t2, @group, 2, 35, NULL),
(@t2, @t3, @group, 3, 35, NULL),
(@t3, @t4, @group, 4, 35, NULL)

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_remote_command_translator')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 25000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_command_translator')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 50000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_command_translator')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 75000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_command_translator')
INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 100000),
(@definition, @hightech, 50000)

GO

---- Link modules and their prototypes----

DECLARE @module int
DECLARE @prototype int
DECLARE @tempTable TABLE (definition INT, prototype INT)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named1_remote_command_translator')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named1_remote_command_translator_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named2_remote_command_translator')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named2_remote_command_translator_pr')

INSERT INTO @tempTable (definition, prototype) VALUES (@module, @prototype)

SET @module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named3_remote_command_translator')
SET @prototype = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname LIKE 'def_named3_remote_command_translator_pr')

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

---- Set up decalibration and production time

DECLARE @categoryFlags BIGINT

----

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_command_translators')

IF NOT EXISTS (SELECT 1 FROM productiondecalibration WHERE categoryflag = @categoryFlags)
BEGIN
	INSERT INTO productiondecalibration (categoryflag, distorsionmin, distorsionmax, decrease) values
	(@categoryflags, 0.003, 0.005, 1)
END

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlags)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) values
	(@categoryFlags, 2)
END

GO

---- Add Improved Commands into Daoden Syndicate shop ----

DECLARE @definition INT
DECLARE @itemshop_preset INT

SET @itemshop_preset = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'tm_preset_pve')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_attack_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000, 150, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_defend_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000, 150, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_gather_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000, 150, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_basic_support_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000, 150, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_retreat_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000, 150, null, 0, null)
END

----

SET @itemshop_preset = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'daoden_preset')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_attack_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 5000000, 300, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_defend_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 5000000, 300, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_gather_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 5000000, 300, null, 0, null)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_improved_support_remote_command')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 5000000, 300, null, 0, null)
END

GO