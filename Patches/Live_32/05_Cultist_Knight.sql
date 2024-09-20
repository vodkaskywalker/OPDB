---- Tellesis

-- Create and fill Cultists

DECLARE @sourceDefinition INT
DECLARE @targetDefinition INT

-- Create Cultist Assassin Kain

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_cultist_assassin_kain')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_npc_cultist_assassin_kain', 1, 1024, 1167, '#role=$Assassin', 'Yagel, Detector, CrystalAI', 1, 0, 0, 0, 100, 'def_npc_cultist_assassin_kain_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#role=$Assassin' WHERE definitionname = 'def_npc_cultist_assassin_kain'
END

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_assassin_kain')

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

GO

---- Create Kain Assassin template

DECLARE @targetDefinition INT
DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT

DECLARE @sensor_amplifier INT
DECLARE @lr_demob INT
DECLARE @em_tuner INT
DECLARE @masker INT
DECLARE @em_gun INT
DECLARE @med_armor_repair INT
DECLARE @med_injector INT
DECLARE @uni_armor_hardener INT
DECLARE @med_armor_plate INT
DECLARE @lwf INT

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_assassin_kain')
SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kain_mk2_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kain_head_mk2')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kain_chassis_mk2')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_kain_leg_mk2')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_combat_mech_mk2')

SET @sensor_amplifier = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_sensor_booster')
SET @lr_demob = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_webber')
SET @em_tuner = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_damage_mod_railgun')
SET @masker = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_stealth_modul')
SET @em_gun = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_longrange_standard_medium_railgun')
SET @med_armor_repair = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_armor_repairer')
SET @med_injector = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_core_booster')
SET @uni_armor_hardener = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_resistant_plating')
SET @med_armor_plate = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_medium_armor_plate')
SET @lwf = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Cultist_Assassin_Kain')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Cultist_Assassin_Kain', CONCAT(
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
		FORMAT(@sensor_amplifier, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@lr_demob, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@em_tuner, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@masker, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i4]]#legModules=[|m0=[|definition=i',
		FORMAT(@med_armor_repair, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@med_injector, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@uni_armor_hardener, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@med_armor_plate, 'X'),
		'|slot=i4]|m4=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i5]]'), 'Cultist Assassin Kain')
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
		FORMAT(@sensor_amplifier, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@lr_demob, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@em_tuner, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@masker, 'X'),
		'|slot=i4]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@em_gun, 'X'),
		'|slot=i4]]#legModules=[|m0=[|definition=i',
		FORMAT(@med_armor_repair, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@med_injector, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@uni_armor_hardener, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@med_armor_plate, 'X'),
		'|slot=i4]|m4=[|definition=i',
		FORMAT(@lwf, 'X'),
		'|slot=i5]]')
	WHERE name = 'Cultist_Assassin_Kain'
END

DECLARE @templateId INT

SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Cultist_Assassin_Kain')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 2, NULL, NULL, 1500, 'def_npc_cultist_assassin_kain')

GO

-- Add Cultist Assassin roamers

DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @templateid INT

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ICS_pve')

--- roamers 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_cultist_assassins_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_cultist_assassins_z6', 10, 10, 2038, 2038, 'Tellesis Cultists', @spawnid, 1, 1, 7200, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_cultist_assassins_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_cultist_assassins_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_assassin_kain')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_cultist_assassins_z6_cultist_assassin_kain')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_cultist_assassins_z6_cultist_assassin_kain', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis cultists', 0.9, 1, 1, 2, 0)
END

GO