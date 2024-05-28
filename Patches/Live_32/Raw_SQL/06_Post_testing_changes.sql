---- Add new boss settings

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.npcbossinfo ADD
	isServerWideAnnouncement bit NULL,
	isNoRadioDelay bit NULL
GO
ALTER TABLE dbo.npcbossinfo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

---- Fill new boss settings

DECLARE @flockId INTEGER

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_ictus')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '....Gooodssssss....blessssssing.....usssssss.....',
	customAggressMessage = '....Sssssslaaaaay.....hhhhumansssss....Worshhhhhhip.....Goooodsssssss....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_zenith')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '...Deathssss........pleasuresssss...Goooodsssssss.......',
	customAggressMessage = '....Sssssslay....Ssssssslaaaaaaay....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z1_cultist_preacher_vagabond')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '....Prrrraaaaayssssssse......',
	customAggressMessage = '.....Masssssacre....in the name offff.....Gooooodssss....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_ictus')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '...Sssssacrifice......ourselvesssss.....',
	customAggressMessage = '.....Sssssacrifice....humanssssss.....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_zenith')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '.....Resssstoooooore.....bodiessss......',
	customAggressMessage = '....Ssssssummon.....forcessssss....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z7_cultist_preacher_vagabond')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '...Retreeeeeat....to issssslandsssss....',
	customAggressMessage = '.....Assssseeeemble....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_ictus')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '....Witnessssss...uuussssss....',
	customAggressMessage = '....Dessssintergaaaate....'
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_zenith')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '',
	customAggressMessage = ''
WHERE flockId = @flockId

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'roamer_cultists_z6_cultist_preacher_vagabond')
UPDATE npcbossinfo SET
	isServerWideAnnouncement = 1,
	isNoRadioDelay = 1,
	customDeathMessage = '.....Lossssst....powersssss.....',
	customAggressMessage = '.....Sssssstrike......with Ssssscorchersssss.....'
WHERE flockId = @flockId

GO

---- Add T2+ items to Josef, Bonnie and Commandant loot

DECLARE @definition INT
DECLARE @lootDefinition INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_Zone71_WilliamHBonnie')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_maneuvering_upgrade')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_medium_shield_generator')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_mining_probe_module')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_small_shield_generator')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_Zone72_One_Eye_Josef')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_small_armor_repairer')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_medium_armor_repairer')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_damage_mod_projectile')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_mass_reductor')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_sh70_mainboss')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_small_armor_repairer')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_medium_armor_repairer')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_small_shield_generator')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_medium_shield_generator')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_sensor_booster')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_webber')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_eccm')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_small_core_booster')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_medium_core_booster')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_tracking_upgrade')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.1, 0, 0, 1)
END

GO

---- Adding T4+ to gamma pitbosses loot

DECLARE @definition INT
DECLARE @lootDefinition INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_apollo_syndicate_syn_pitboss')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_longrange_medium_autocannon')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_autocannon')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_autocannon')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_driller')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_driller')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_harvester')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_harvester')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_felos_nuimqol_pitboss')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_longrange_medium_railgun')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_railgun')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_railgun')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_onyx_thelodica_pitboss')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_longrange_medium_laser')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_laser')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_laser')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_hydra_pelistal_pitboss')

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_missile_launcher')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

SET @lootDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_rocket_launcher')
IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @definition AND lootdefinition = @lootDefinition)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@definition, @lootDefinition, 1, 0.05, 0, 0, 1)
END

GO

---- Increase PBS bandwidth

DECLARE @entityDef INT
DECLARE @capsuleDef INT
DECLARE @protoDef INT

SET @entityDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_small')
SET @capsuleDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_small_capsule')
SET @protoDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_small_capsule_pr')

UPDATE definitionconfig SET bandwidthcapacity = 15000 WHERE definition IN (@entityDef, @capsuleDef, @protoDef)

SET @entityDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_medium')
SET @capsuleDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_medium_capsule')
SET @protoDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_medium_capsule_pr')

UPDATE definitionconfig SET bandwidthcapacity = 30000 WHERE definition IN (@entityDef, @capsuleDef, @protoDef)

SET @entityDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_large')
SET @capsuleDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_large_capsule')
SET @protoDef = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pbs_docking_base_large_capsule_pr')

UPDATE definitionconfig SET bandwidthcapacity = 54000 WHERE definition IN (@entityDef, @capsuleDef, @protoDef)

GO

---- Nerf scorchers

DECLARE @definition INT
DECLARE @field INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elite2_cultist_scorcher')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage')

UPDATE aggregatevalues SET value = 125 WHERE definition = @definition AND field = @field

GO

---- Fix Doom Beamers shards

DECLARE @titanium INT
DECLARE @polynucleit INT
DECLARE @espitium INT
DECLARE @bryochite INT
DECLARE @flux INT
DECLARE @gamma_thelodica_shards INT
DECLARE @definition INT

SET @titanium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_titanium')
SET @polynucleit = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_polynucleit')
SET @espitium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_espitium')
SET @bryochite = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_unimetal') -- unimetal Y U NO bryochite
SET @flux = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_specimen_sap_item_flux')
SET @gamma_thelodica_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_thelodica')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_thelodica_combat_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2000),
(@definition, @polynucleit, 4000),
(@definition, @espitium, 200),
(@definition, @bryochite, 100),
(@definition, @flux, 20),
(@definition, @gamma_thelodica_shards, 1)

GO