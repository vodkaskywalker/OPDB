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
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
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
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.5)
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
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_teleport_negator')
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
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
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
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.5)
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
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_shield_negator')
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
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 10)
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
SET @scorcher = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')
SET @range_extender = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tracking_upgrade')
SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @aux_accu = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_battery')
SET @nox_module = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_repair_negator')
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

GO

-- Create Cultist Zealot Mesmer

DECLARE @sourceDefinition INT
DECLARE @targetDefinition INT
DECLARE @templateId INT

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_zealot_mesmer', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_zealot_mesmer_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_mesmer_heavydps_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_mesmer_heavydps_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

-- Create Cultist Acolyte Vagabond

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_acolyte_vagabond', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_acolyte_vagabond_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_vagabond_heavyew_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_vagabond_heavyew_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

-- Create Cultist Zealot Seth

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_zealot_seth', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_zealot_seth_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_seth_heavydps_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_seth_heavydps_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

-- Create Cultist Acolyte Zenith

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_acolyte_zenith', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_acolyte_zenith_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_zenith_heavyew_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_zenith_heavyew_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

-- Create Cultist Zealot Gropho

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_zealot_gropho', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_zealot_gropho_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_gropho_heavydps_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gropho_heavydps_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

-- Create Cultist Acolyte Ictus

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_acolyte_ictus', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_acolyte_ictus_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_ictus_heavyew_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_ictus_heavyew_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

-- Create Cultist Martyr Termis

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_cultist_martyr_termis', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_cultist_martyr_termis_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_termis_basic_rank5'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_termis_basic_rank5')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

GO

-- Create template for Cultist Martyr Termis

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT
DECLARE @shield INT
DECLARE @shield_hardener INT
DECLARE @energy_transferer INT
DECLARE @recharger INT
DECLARE @targetDefinition INT
DECLARE @templateId INT

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')
SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_termis_mk2_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_termis_head_mk2')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_termis_chassis_mk2')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_termis_leg_mk2')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_sequer_mk2')
SET @shield = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_shield_generator')
SET @shield_hardener = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_shield_hardener')
SET @energy_transferer = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_energy_transfer')
SET @recharger = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_core_recharger')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Cultist_Martyr_Termis')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Cultist_Martyr_Termis', CONCAT(
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
		FORMAT(@shield_hardener, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i4]|m4=[|definition=i',
		FORMAT(@shield_hardener, 'X'),
		'|slot=i5]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@energy_transferer, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@energy_transferer, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@energy_transferer, 'X'),
		'|slot=i3]]#legModules=[|m0=[|definition=i',
		FORMAT(@shield, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i4]|m4=[|definition=i',
		FORMAT(@recharger, 'X'),
		'|slot=i5]]'), 'Cultist Martyr Termis')
END
		
SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Cultist_Martyr_Termis')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 2, NULL, NULL, 1500, 'def_npc_cultist_martyr_termis')

GO

-- Add Cultist Preachers roamers

IF NOT EXISTS (SELECT 1 FROM npcinterzonegroup WHERE name = 'alpha3_cultist_preachers_izgroup')
BEGIN
	INSERT INTO npcinterzonegroup (name, respawnTime, respawnNoiseFactor) VALUES
	('alpha3_cultist_preachers_izgroup', 259200, 0.15)
END

DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @templateid INT
DECLARE @flockid INT
DECLARE @izgroupid INT

SET @izgroupid = (SELECT TOP 1 id FROM npcinterzonegroup WHERE name = 'alpha3_cultist_preachers_izgroup')

-- Tellesis

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ICS_pve')

--- roamers 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_cultists_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_cultists_z6', 10, 10, 2038, 2038, 'Tellesis Cultists', @spawnid, 1, 1, 7200, 8, 0, 0, 1, 0, 7200, 1, 1, 1, @izgroupid, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, presencetype = 8 WHERE name = 'roamer_cultists_z6'
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

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z6_cultist_preacher_zenith', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z6_cultist_preacher_vagabond', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

---- Reinforcements

-- Vagabond wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z6_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z6_wave_0', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z6_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_mesmer_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_mesmer_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_seth_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_seth_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_gropho_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_gropho_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Vagabond wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z6_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z6_wave_1', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z6_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_mesmer_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_mesmer_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_seth_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_seth_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_gropho_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_gropho_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Vagabond wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z6_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z6_wave_2', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z6_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_mesmer_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_mesmer_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_seth_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_seth_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_zealot_gropho_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_zealot_gropho_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Zenith wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z6_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z6_wave_0', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z6_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_vagabond_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_vagabond_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_zenith_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_zenith_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_ictus_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_ictus_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Zenith wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z6_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z6_wave_1', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z6_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_vagabond_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_vagabond_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_zenith_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_zenith_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_ictus_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_ictus_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Zenith wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z6_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z6_wave_2', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z6_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_vagabond_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_vagabond_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_zenith_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_zenith_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_acolyte_ictus_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_acolyte_ictus_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Ictus wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z6_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z6_wave_0', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z6_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_martyr_termis_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_martyr_termis_wave_0', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Ictus wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z6_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z6_wave_1', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z6_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_martyr_termis_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_martyr_termis_wave_1', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Ictus wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z6_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z6_wave_2', 0, 0, 0, 0, 'Tellesis Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z6_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z6_cultist_martyr_termis_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z6_cultist_martyr_termis_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'tellesis cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Shinjalar

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ASI_pve')

--- roamers 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_cultists_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_cultists_z7', 10, 10, 2038, 2038, 'Shinjalar Cultists', @spawnid, 1, 1, 7200, 8, 0, 0, 1, 0, 7200, 1, 1, 1, @izgroupid, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, presencetype = 8 WHERE name = 'roamer_cultists_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_cultists_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_ictus')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z7_cultist_preacher_ictus', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_zenith')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z7_cultist_preacher_zenith', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_vagabond')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z7_cultist_preacher_vagabond', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

---- Reinforcements

-- Vagabond wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z7_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z7_wave_0', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z7_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_mesmer_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_mesmer_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_seth_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_seth_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_gropho_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_gropho_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Vagabond wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z7_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z7_wave_1', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z7_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_mesmer_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_mesmer_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_seth_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_seth_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_gropho_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_gropho_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Vagabond wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z7_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z7_wave_2', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z7_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_mesmer_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_mesmer_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_seth_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_seth_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_zealot_gropho_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_zealot_gropho_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Zenith wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z7_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z7_wave_0', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z7_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_vagabond_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_vagabond_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_zenith_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_zenith_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_ictus_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_ictus_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Zenith wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z7_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z7_wave_1', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z7_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_vagabond_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_vagabond_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_zenith_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_zenith_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_ictus_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_ictus_wave_1', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Zenith wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z7_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z7_wave_2', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z7_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_vagabond_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_vagabond_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_zenith_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_zenith_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_acolyte_ictus_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_acolyte_ictus_wave_2', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Ictus wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z7_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z7_wave_0', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z7_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_martyr_termis_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_martyr_termis_wave_0', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Ictus wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z7_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z7_wave_1', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z7_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_martyr_termis_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_martyr_termis_wave_1', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Ictus wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z7_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z7_wave_2', 0, 0, 0, 0, 'Shinjalar Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z7_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z7_cultist_martyr_termis_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z7_cultist_martyr_termis_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'shinjalar cultists', 0.5, 1, 1, 2, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Attalica

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ICS')

--- roamers 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_cultists_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_cultists_z1', 10, 10, 2038, 2038, 'Attalica Cultists', @spawnid, 1, 1, 7200, 8, 0, 0, 1, 0, 7200, 1, 1, 1, @izgroupid, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, presencetype = 8 WHERE name = 'roamer_cultists_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_cultists_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_ictus')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z1_cultist_preacher_ictus', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_zenith')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z1_cultist_preacher_zenith', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_vagabond')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultists_z1_cultist_preacher_vagabond', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica cultists', 0.9, 1, 1, 2, 0)
END

--

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcbossinfo WHERE flockid = @flockid)
BEGIN
	INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced) VALUES
	(@flockId, 0.15, 1, NULL, NULL, 0, '....Gooodssssss....blessssssing.....usssssss.....', '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....', NULL, 1)
END

---- Reinforcements

-- Vagabond wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z1_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z1_wave_0', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z1_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_mesmer_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_mesmer_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_seth_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_seth_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_gropho_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_gropho_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Vagabond wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z1_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z1_wave_1', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z1_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_mesmer_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_mesmer_wave_1', @presenceid, 2, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_seth_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_seth_wave_1', @presenceid, 2, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_gropho_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_gropho_wave_1', @presenceid, 2, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Vagabond wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z1_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_vagabond_z1_wave_2', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_vagabond_z1_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_mesmer_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_mesmer_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_seth_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_seth_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_zealot_gropho_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_zealot_gropho_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Zenith wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z1_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z1_wave_0', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z1_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_vagabond_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_vagabond_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_zenith_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_zenith_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_ictus_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_ictus_wave_0', @presenceid, 1, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Zenith wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z1_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z1_wave_1', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z1_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_vagabond_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_vagabond_wave_1', @presenceid, 2, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_zenith_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_zenith_wave_1', @presenceid, 2, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_ictus_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_ictus_wave_1', @presenceid, 2, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Zenith wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z1_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_zenith_z1_wave_2', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_zenith_z1_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_vagabond_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_vagabond_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_zenith_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_zenith_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_acolyte_ictus_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_acolyte_ictus_wave_2', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

-- Ictus wave 0

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z1_wave_0' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z1_wave_0', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 0', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z1_wave_0')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_martyr_termis_wave_0')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_martyr_termis_wave_0', @presenceid, 3, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.25, @presenceid, NULL)
END

-- Ictus wave 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z1_wave_1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z1_wave_1', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 1', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z1_wave_1')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_martyr_termis_wave_1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_martyr_termis_wave_1', @presenceid, 6, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.5, @presenceid, NULL)
END

/*
-- Ictus wave 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z1_wave_2' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('reinforce_cultists_preacher_ictus_z1_wave_2', 0, 0, 0, 0, 'Attalica Cultists Reinforcement Wave 2', 10, 1, 0, 0, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'reinforce_cultists_preacher_ictus_z1_wave_2')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'reinforce_cultists_z1_cultist_martyr_termis_wave_2')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('reinforce_cultists_z1_cultist_martyr_termis_wave_2', @presenceid, 9, @definition, 0, 0, 0, 10, 0, 1, 55, 'attalica cultists', 0.5, 1, 1, 1, 0)
END

SET @flockid = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcreinforcements WHERE presenceId = @presenceid AND targetId = @flockid)
BEGIN
	INSERT INTO npcreinforcements (reinforcementType, targetId, threshold, presenceId, zoneId) VALUES
	(2, @flockid, 0.75, @presenceid, NULL)
END
*/

GO

---- Adding loot

DECLARE @lootDefinition INT
DECLARE @targetDefinition INT

-- Mesmer Zealot

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_mesmer')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_thrm_armor_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_plate')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_railgun')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_damage_mod_railgun')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_plate')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_thrm_armor_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_railgun')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_damage_mod_railgun')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_railgun_d')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 100, 0.5, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1125, 1, 0, 0, 921)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 240, 1, 0, 1, 160)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_nuimqol')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 960, 1, 0, 1, 640)

-- Vagabond Acolyte

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_vagabond')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_longrange_medium_railgun')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_dampener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_jammer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_webber')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_longrange_medium_railgun')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_jammer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_dampener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_webber')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_railgun_b')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 100, 0.5, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 335, 1, 0, 0, 274)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_nuimqol')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

-- Seth Zealot

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_seth')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_plate')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_laser')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_damage_mod_laser')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_plate')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_laser')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_damage_mod_laser')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_lasercrystal_d')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 100, 0.5, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1005, 1, 0, 0, 821)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 240, 1, 0, 1, 160)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_thelodica')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 960, 1, 0, 1, 640)

-- Zenith Acolyte

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_zenith')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_dampener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_jammer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_laser')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_webber')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_laser')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_jammer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_dampener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_webber')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_lasercrystal_a')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 100, 0.5, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 335, 1, 0, 0, 274)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_thelodica')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

-- Gropho Zealot

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_zealot_gropho')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_plate')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_kin_armor_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_missile_launcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_damage_mod_missile')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_plate')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_kin_armor_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_missile_launcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_damage_mod_missile')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_missile_d')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 100, 0.5, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 965, 1, 0, 0, 788)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 240, 1, 0, 1, 160)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_pelistal')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 960, 1, 0, 1, 640)

-- Ictus Acolyte

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_acolyte_ictus')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_webber')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_neutralizer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_jammer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_missile_launcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_neutralizer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_webber')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_jammer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_missile_launcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_resistant_plating')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_vampire')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_missile_d')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 100, 0.5, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 335, 1, 0, 0, 274)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_pelistal')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

-- Termis Martyr

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_martyr_termis')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_energy_transfer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1),
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_energy_transfer')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_common_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 296, 1, 0, 0, 242)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_industrial')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

-- Zenith Preacher

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.35, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_tracking_upgrade')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_booster')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_core_battery')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_shield_negator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.35, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_mass_reductor')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tracking_upgrade')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_booster')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_core_battery')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mass_reductor')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 335, 1, 0, 0, 274)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_thelodica')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

-- Vagabond Preacher

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.35, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_tracking_upgrade')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_booster')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_core_battery')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_repair_negator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.35, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_mass_reductor')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tracking_upgrade')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_booster')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_core_battery')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mass_reductor')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 335, 1, 0, 0, 274)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_nuimqol')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

-- Ictus Preacher

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

DELETE FROM npcloot WHERE definition = @targetDefinition

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.35, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_tracking_upgrade')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_sensor_booster')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_medium_core_battery')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_nox_teleport_negator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.35, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_artifact_a_mass_reductor')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.175, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_shield_generator')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_shield_hardener')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_core_recharger')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tracking_upgrade')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_booster')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_core_battery')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mass_reductor')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.0025, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_basic')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 3, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_advanced')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 5, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_expert')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 7, 0.5, 0, 1, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_5')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_6')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.02, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_7')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_8')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.01, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_9')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_research_kit_10')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 1, 0.005, 0, 0, 1)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_reactor_plasma')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 335, 1, 0, 0, 274)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_hitech')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 192, 1, 0, 1, 128)

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kernel_pelistal')
INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
(@targetDefinition, @lootDefinition, 768, 1, 0, 1, 512)

GO