---- Tellesis

-- Create and fill Cultists

DECLARE @sourceDefinition INT
DECLARE @targetDefinition INT

-- Create Cultist Preacher Ictus

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_npc_cultist_preacher_ictus', 1, 1024, 1167, '', 'Ictus, Scorchers, Shield, NOX Teleport', 1, 0, 0, 0, 100, 'def_npc_cultist_preacher_ictus_desc', 1, NULL, NULL)
END

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 4.5)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.7)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.7 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 450)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'shield_absorbtion_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_neutralizer_optimal_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

GO

---- Create Ictus Preacher template

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT
DECLARE @shield INT
DECLARE @shield_hardener INT
DECLARE @scorcher INT
DECLARE @recharger INT
DECLARE @range_extender INT
DECLARE @sensor_booster INT
DECLARE @aux_accu INT
DECLARE @nox_module INT
DECLARE @lwf INT
DECLARE @targetDefinition INT

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')
SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ictus_mk2_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ictus_head_mk2')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ictus_chassis_mk2')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ictus_leg_mk2')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_combat_ewmech_indy_runner_mk2')
SET @shield = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_shield_generator')
SET @shield_hardener = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_shield_hardener')
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_nox_teleport_negator')
SET @lwf = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Cultist_Preacher_Ictus')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Cultist_Preacher_Ictus', CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]'), 'Cultist Preacher Ictus')
END
ELSE
BEGIN
	UPDATE robottemplates SET description = CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]')
	WHERE name = 'Cultist_Preacher_Ictus'
END

DECLARE @templateId INT

SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Cultist_Preacher_Ictus')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 2, NULL, NULL, 1500, 'def_npc_cultist_preacher_ictus')

-- Create Cultist Preacher Zenith

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_npc_cultist_preacher_zenith', 1, 1024, 1167, '', 'Ictus, Scorchers, Shield, NOX Shield', 1, 0, 0, 0, 100, 'def_npc_cultist_preacher_zenith_desc', 1, NULL, NULL)
END

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 4.5)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.7)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.7 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 450)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'shield_absorbtion_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_neutralizer_optimal_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_shield_absorbtion_modifier_enhancer')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.45)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.45 WHERE definition = @targetDefinition AND field = @field
END

GO

---- Create Zenith Preacher template

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT
DECLARE @shield INT
DECLARE @shield_hardener INT
DECLARE @scorcher INT
DECLARE @recharger INT
DECLARE @range_extender INT
DECLARE @sensor_booster INT
DECLARE @aux_accu INT
DECLARE @nox_module INT
DECLARE @lwf INT
DECLARE @targetDefinition INT

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')
SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_zenith_mk2_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_zenith_head_mk2')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_zenith_chassis_mk2')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_zenith_leg_mk2')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_combat_ewmech_indy_runner_mk2')
SET @shield = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_shield_generator')
SET @shield_hardener = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_shield_hardener')
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_nox_shield_negator')
SET @lwf = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Cultist_Preacher_Zenith')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Cultist_Preacher_Zenith', CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]'), 'Cultist Preacher Zenith')
END
ELSE
BEGIN
	UPDATE robottemplates SET description = CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]')
	WHERE name = 'Cultist_Preacher_Zenith'
END

DECLARE @templateId INT

SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Cultist_Preacher_Zenith')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 2, NULL, NULL, 1500, 'def_npc_cultist_preacher_zenith')

-- Create Cultist Preacher Vagabond

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_npc_cultist_preacher_vagabond', 1, 1024, 1167, '', 'Vagabond, Scorchers, Shield, NOX Repair', 1, 0, 0, 0, 100, 'def_npc_cultist_preacher_vagabond_desc', 1, NULL, NULL)
END

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 4.5)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.7)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.7 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 450)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'shield_absorbtion_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_neutralizer_optimal_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier_enhancer')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.45)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.45 WHERE definition = @targetDefinition AND field = @field
END

GO

---- Create Vagabond Preacher template

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT
DECLARE @shield INT
DECLARE @shield_hardener INT
DECLARE @scorcher INT
DECLARE @recharger INT
DECLARE @range_extender INT
DECLARE @sensor_booster INT
DECLARE @aux_accu INT
DECLARE @nox_module INT
DECLARE @lwf INT
DECLARE @targetDefinition INT

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')
SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_mk2_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_head_mk2')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_chassis_mk2')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_leg_mk2')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_combat_ewmech_indy_runner_mk2')
SET @shield = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_shield_generator')
SET @shield_hardener = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_shield_hardener')
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_nox_repair_negator')
SET @lwf = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Cultist_Preacher_Vagabond')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Cultist_Preacher_Vagabond', CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]'), 'Cultist Preacher Vagabond')
END
ELSE
BEGIN
	UPDATE robottemplates SET description = CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]'),
		note = 'Cultist Preacher Vagabond'
	WHERE name = 'Cultist_Preacher_Vagabond'
END

DECLARE @templateId INT

SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Cultist_Preacher_Vagabond')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 2, NULL, NULL, 1500, 'def_npc_cultist_preacher_vagabond')

-- Create Cultist Preacher Vagabond

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_npc_cultist_preacher_vagabond', 1, 1024, 1167, '', 'Vagabond, Scorchers, Shield, NOX Repair', 1, 0, 0, 0, 100, 'def_npc_cultist_preacher_vagabond_desc', 1, NULL, NULL)
END

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 10 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 4.5)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.7)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.7 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 450)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'shield_absorbtion_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'energy_neutralizer_optimal_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 200 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_repair_amount_modifier_enhancer')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.45)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.45 WHERE definition = @targetDefinition AND field = @field
END

GO

---- Create Vagabond Preacher template

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT
DECLARE @shield INT
DECLARE @shield_hardener INT
DECLARE @scorcher INT
DECLARE @recharger INT
DECLARE @range_extender INT
DECLARE @sensor_booster INT
DECLARE @aux_accu INT
DECLARE @nox_module INT
DECLARE @lwf INT
DECLARE @targetDefinition INT

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')
SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_mk2_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_head_mk2')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_chassis_mk2')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_vagabond_leg_mk2')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_combat_ewmech_indy_runner_mk2')
SET @shield = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_shield_generator')
SET @shield_hardener = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_shield_hardener')
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_nox_repair_negator')
SET @lwf = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Cultist_Preacher_Vagabond')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Cultist_Preacher_Vagabond', CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]'), 'Cultist Preacher Zenith')
END
ELSE
BEGIN
	UPDATE robottemplates SET description = CONCAT(
		'#robot=i',
		FORMAT(@robot, 'X'),
		'#head=i',
		FORMAT(@head, 'X'),
		'#chassis=i',
		FORMAT(@chassis, 'X'),
		'#leg=i',
		FORMAT(@leg, 'X'),
		'#container=i',
		FORMAT(@inventory, 'X'),
		'#headModules=[|m0=[|definition=i',
		FORMAT(@sensor_booster, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@nox_module, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@range_extender, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@scorcher, 'X'),
		'|slot=i2]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@aux_accu, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i4]]')
	WHERE name = 'Cultist_Preacher_Vagabond'
END

DECLARE @templateId INT

SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Cultist_Preacher_Vagabond')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 2, NULL, NULL, 1500, 'def_npc_cultist_preacher_vagabond')

GO

-- Add Cultist Preachers roamers

DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @templateid INT

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ICS_pve')

--- roamers 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_cultists_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_cultists_z6', 10, 10, 2038, 2038, 'Tellesis Cultists', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_cultists_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_cultists_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z6_cultist_preacher_ictus', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis cultists', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z6_cultist_preacher_zenith', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis cultists', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z6_cultist_preacher_vagabond', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis cultists', 0.9, 1, 1, 2, 0)
END

GO