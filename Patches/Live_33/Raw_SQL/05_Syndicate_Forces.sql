USE perpetuumsa

GO

DECLARE @targetDefinition INT
DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ASI')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_forces_echelon_main_combat_bot')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_forces_echelon_main_combat_bot', 1, 1024, 1167, '#faction=SSyndicate', 'Echelon, Armor, Machine Guns', 1, 0, 0, 0, 100, 'def_syndicate_forces_echelon_main_combat_bot_desc', 1, NULL, NULL)
END
ELSE
BEGIN
	UPDATE entitydefaults SET options = '#faction=SSyndicate' WHERE definitionname = 'def_syndicate_forces_echelon_main_combat_bot'
END

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_forces_echelon_main_combat_bot')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.3)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.5)
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

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.5)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.5 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.9)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, -0.25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = -0.25 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'turret_cycle_time_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.9)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 0.4)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.4 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @targetDefinition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength_modifier')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, -10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = -10 WHERE definition = @targetDefinition AND field = @field
END

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @inventory INT

DECLARE @sensor_booster INT
DECLARE @s_demob INT
DECLARE @firearm_tuning INT
DECLARE @medium_mg INT
DECLARE @mg_ammo INT
DECLARE @medium_armor_rep INT
DECLARE @medium_injector INT
DECLARE @injector_charges INT
DECLARE @uni_plate INT
DECLARE @med_plate INT

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_echelon_bot')
SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_echelon_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_echelon_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_echelon_leg')
SET @inventory = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robot_inventory_combat_mech')

SET @sensor_booster = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sensor_booster')
SET @s_demob = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_webber')
SET @firearm_tuning = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_damage_mod_projectile')
SET @medium_mg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_autocannon')
SET @mg_ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_projectile_rewa')
SET @medium_armor_rep = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_repairer')
SET @medium_injector = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_core_booster')
SET @injector_charges = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_corebooster_ammo')
SET @uni_plate = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_resistant_plating')
SET @med_plate = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_medium_armor_plate')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'Echelon_Main_Combat')
BEGIN
	INSERT INTO robottemplates (name, description, note) VALUES
	('Echelon_Main_Combat', CONCAT(
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
		FORMAT(@sensor_booster, 'X'),
		'|slot=i2]|m2=[|definition=i',
		FORMAT(@s_demob, 'X'),
		'|slot=i3]|m3=[|definition=i',
		FORMAT(@firearm_tuning, 'X'),
		'|slot=i4]|m4=[|definition=i',
		FORMAT(@firearm_tuning, 'X'),
		'|slot=i5]]#chassisModules=[|m0=[|definition=i',
		FORMAT(@medium_mg, 'X'),
		'|slot=i1|ammoDefinition=i',
		FORMAT(@mg_ammo, 'X'),
		'|ammoQuantity=i17]|m1=[|definition=i',
		FORMAT(@medium_mg, 'X'),
		'|slot=i2|ammoDefinition=i',
		FORMAT(@mg_ammo, 'X'),
		'|ammoQuantity=i17]|m2=[|definition=i',
		FORMAT(@medium_mg, 'X'),
		'|slot=i3|ammoDefinition=i',
		FORMAT(@mg_ammo, 'X'),
		'|ammoQuantity=i17]|m3=[|definition=i',
		FORMAT(@medium_mg, 'X'),
		'|slot=i4|ammoDefinition=i',
		FORMAT(@mg_ammo, 'X'),
		'|ammoQuantity=i17]]#legModules=[|m0=[|definition=i',
		FORMAT(@medium_armor_rep, 'X'),
		'|slot=i1]|m1=[|definition=i',
		FORMAT(@medium_injector, 'X'),
		'|slot=i2|ammoDefinition=i',
		FORMAT(@injector_charges, 'X'),
		'|ammoQuantity=i8]|m2=[|definition=i',
		FORMAT(@uni_plate, 'X'),
		'|slot=i2]|m3=[|definition=i',
		FORMAT(@uni_plate, 'X'),
		'|slot=i4]|m4=[|definition=i',
		FORMAT(@med_plate, 'X'),
		'|slot=i5]]'), 'Syndicate Forces Main Combat Echelon')
END

DECLARE @templateId INT

SET @templateId = (SELECT TOP 1 id FROM robottemplates WHERE name = 'Echelon_Main_Combat')

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note) VALUES
(@targetDefinition, @templateId, 0, NULL, NULL, 15, 'def_npc_daoden_echelon_main_combat')


--- squad 1

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'syndicate_N01_z2' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('syndicate_N01_z2', 510, 1025, 895, 1405, 'daoden syndicate forces 1', @spawnid, 1, 1, 900, 5, NULL, 720, 1270, 500, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, topx = 510, topy = 1025, bottomx = 895, bottomy = 1405, randomcenterx = 720, randomcentery = 1270, randomradius = 500, roamingrespawnseconds = 900
	WHERE name = 'syndicate_N01_z2'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'syndicate_N01_z2')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_forces_echelon_main_combat_bot')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'syndicate_N01_z2_echelon_main_combat')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('syndicate_N01_z2_echelon_main_combat', @presenceid, 5, @definition, 0, 0, 0, 10, 7200, 0, 50, 'daoden npc', 0.9, 1, 1, 2, 0)
END
ELSE
BEGIN
	UPDATE npcflock SET respawnseconds = 900 WHERE name = 'syndicate_N01_z2_echelon_main_combat'
END
	
--- squad 2

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'syndicate_N02_z2' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('syndicate_N02_z2', 510, 1025, 895, 1405, 'daoden syndicate forces 2', @spawnid, 1, 1, 900, 5, NULL, 720, 1270, 500, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, topx = 510, topy = 1025, bottomx = 895, bottomy = 1405, randomcenterx = 720, randomcentery = 1270, randomradius = 500, roamingrespawnseconds = 900
	WHERE name = 'syndicate_N02_z2'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'syndicate_N02_z2')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_forces_echelon_main_combat_bot')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'syndicate_N02_z2_echelon_main_combat')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('syndicate_N02_z2_echelon_main_combat', @presenceid, 5, @definition, 0, 0, 0, 10, 7200, 0, 50, 'daoden npc', 0.9, 1, 1, 2, 0)
END
ELSE
BEGIN
	UPDATE npcflock SET respawnseconds = 900 WHERE name = 'syndicate_N02_z2_echelon_main_combat'
END

--- squad 3

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'syndicate_N03_z2' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('syndicate_N03_z2', 510, 1025, 895, 1405, 'daoden syndicate forces 3', @spawnid, 1, 1, 900, 5, NULL, 720, 1270, 500, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, topx = 510, topy = 1025, bottomx = 895, bottomy = 1405, randomcenterx = 720, randomcentery = 1270, randomradius = 500, roamingrespawnseconds = 900
	WHERE name = 'syndicate_N03_z2'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'syndicate_N03_z2')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_forces_echelon_main_combat_bot')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'syndicate_N03_z2_echelon_main_combat')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('syndicate_N03_z2_echelon_main_combat', @presenceid, 5, @definition, 0, 0, 0, 10, 7200, 0, 50, 'daoden npc', 0.9, 1, 1, 2, 0)
END
ELSE
BEGIN
	UPDATE npcflock SET respawnseconds = 900 WHERE name = 'syndicate_N03_z2_echelon_main_combat'
END

GO

---- Mark drones as Syndicate

UPDATE entitydefaults SET options = '#head=n8647  #chassis=n8648  #leg=n8649  #inventory=n8650 #faction=sSyndicate' WHERE definitionname = 'def_harvesting_industrial_drone'
UPDATE entitydefaults SET options = '#head=n8641  #chassis=n8642  #leg=n8643  #inventory=n8644 #faction=sSyndicate' WHERE definitionname = 'def_mining_industrial_drone'
UPDATE entitydefaults SET options = '#head=n8599  #chassis=n8600  #leg=n8601  #inventory=n8602 #faction=sSyndicate' WHERE definitionname = 'def_nuimqol_assault_drone'
UPDATE entitydefaults SET options = '#head=n8623  #chassis=n8624  #leg=n8625  #inventory=n8626 #faction=sSyndicate' WHERE definitionname = 'def_nuimqol_attack_drone'
UPDATE entitydefaults SET options = '#head=n8611  #chassis=n8612  #leg=n8613  #inventory=n8614 #faction=sSyndicate' WHERE definitionname = 'def_pelistal_assault_drone'
UPDATE entitydefaults SET options = '#head=n8635  #chassis=n8636  #leg=n8637  #inventory=n8638 #faction=sSyndicate' WHERE definitionname = 'def_pelistal_attack_drone'
UPDATE entitydefaults SET options = '#head=n8653  #chassis=n8654  #leg=n8655  #inventory=n8656 #faction=sSyndicate' WHERE definitionname = 'def_repair_support_drone'
UPDATE entitydefaults SET options = '#head=n8593  #chassis=n8594  #leg=n8595  #inventory=n8596 #faction=sSyndicate' WHERE definitionname = 'def_syndicate_assault_drone'
UPDATE entitydefaults SET options = '#head=n8617  #chassis=n8618  #leg=n8619  #inventory=n8620 #faction=sSyndicate' WHERE definitionname = 'def_syndicate_attack_drone'
UPDATE entitydefaults SET options = '#head=n8605  #chassis=n8606  #leg=n8607  #inventory=n8608 #faction=sSyndicate' WHERE definitionname = 'def_thelodica_assault_drone'
UPDATE entitydefaults SET options = '#head=n8629  #chassis=n8630  #leg=n8631  #inventory=n8632 #faction=sSyndicate' WHERE definitionname = 'def_thelodica_attack_drone'

GO