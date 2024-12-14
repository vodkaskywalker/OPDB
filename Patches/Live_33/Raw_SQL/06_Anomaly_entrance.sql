USE perpetuumsa

GO

---- Create Daoden entrance

DECLARE @zoneId INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @destinationGroupId INT
DECLARE @flockId INT
DECLARE @riftConfigId INT
DECLARE @artifactType INT

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_TM_pve')

-- Create and fill gatekeeper definition

DECLARE @sourceDefinition INT
DECLARE @targetDefinition INT

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_npc_gatekeeper_locust_lvl1')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype)
	SELECT 'def_npc_gatekeeper_locust_lvl1', quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, 'def_npc_gatekeeper_locust_lvl1_desc', purchasable, tiertype FROM entitydefaults WHERE definitionname = 'def_npc_gamma_locust_dps_l3'
END

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_locust_dps_l3')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gatekeeper_locust_lvl1')

DELETE FROM aggregatevalues WHERE definition = @targetDefinition

INSERT INTO aggregatevalues
SELECT @targetDefinition, field, value FROM aggregatevalues where definition = @sourceDefinition

DELETE FROM robottemplaterelation WHERE definition = @targetDefinition

INSERT INTO robottemplaterelation (definition, templateid, raceid, missionlevel, missionleveloverride, killep, note)
SELECT @targetDefinition, templateId, raceid, missionlevel, missionleveloverride, killep, note FROM robottemplaterelation WHERE definition = @sourceDefinition

DELETE FROM npcloot WHERE definition = @targetDefinition

INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity)
SELECT @targetDefinition, nl.lootdefinition, nl.quantity, nl.probability, nl.repackaged, nl.dontdamage, nl.minquantity FROM npcloot nl
INNER JOIN entitydefaults ed ON nl.lootdefinition = ed.definition
WHERE nl.definition = @sourceDefinition AND (ed.tierlevel IS NULL OR (ed.tierlevel != 4))

INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity)
SELECT @targetDefinition, t3.definition, nl.quantity, nl.probability, nl.repackaged, nl.dontdamage, nl.minquantity FROM npcloot nl
INNER JOIN entitydefaults t4 ON nl.lootdefinition = t4.definition
INNER JOIN entitydefaults t3 ON t4.categoryflags = t3.categoryflags
WHERE nl.definition = @sourceDefinition
AND t4.tiertype = 1 and  t4.tierlevel = 4 and t3.tiertype = 1 and t3.tierlevel = 3

---- Create gatekeepers

-- Hershfield

-- Create gatekeepers presence

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'hershfield_to_daoden_gatekeepers_lvl1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('hershfield_to_daoden_gatekeepers_lvl1', 0, 0, 0, 0, 'Hershfield gatekeepers', 10, 1, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, topx = 0, topy = 0, bottomx = 0, bottomy = 0 WHERE name = 'hershfield_to_daoden_gatekeepers_lvl1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'hershfield_to_daoden_gatekeepers_lvl1')

-- Create Gatekeeper flock

DELETE FROM npcflock WHERE presenceid = @presenceid

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gatekeeper_locust_lvl1')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'hershfield_to_daoden_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('hershfield_to_daoden_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1', @presenceid, 1, @definition, 0, 0, 0, 5, 0, 1, 15, 'gatekeeper', 0.5, 1, 1, 2, 1)
END
ELSE
BEGIN
	UPDATE npcflock SET spawnoriginX = 0, spawnoriginY = 0 WHERE name = 'hershfield_to_daoden_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1'
END

-- Add rift config

DELETE FROM riftconfigs WHERE name = 'daoden_z2_entry'

INSERT INTO riftconfigs (name, destinationGroupId, lifespanSeconds, maxUses, categoryExclusionGroupId) VALUES
('daoden_z2_entry', 201, 1800, NULL, NULL)

-- Add rift destinations

SET @destinationGroupId = (SELECT TOP 1 destinationGroupId FROM riftconfigs WHERE name = 'daoden_z2_entry')

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI')

DELETE FROM riftdestinations WHERE groupId = @destinationGroupId AND zoneId = @zoneId

INSERT INTO riftdestinations (groupId, zoneId, x, y, weight) VALUES
(@destinationGroupId, @zoneId, NULL, NULL, 1)

-- Add boss info

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'hershfield_to_daoden_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1')

SET @riftConfigId = (SELECT TOP 1 id FROM riftconfigs WHERE name = 'daoden_z2_entry')

INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced, isServerWideAnnouncement, isNoRadioDelay) VALUES
(@flockId, 0.15, 0, NULL, NULL, 0, '...Hold...the...door...', 'Network security breach. Initiating extermination protocol', @riftConfigId, 0, NULL, NULL)

-- Create artifact type

IF NOT EXISTS (SELECT 1 FROM artifacttypes WHERE name = 'gateway_hershfield_to_daoden_lvl1')
BEGIN
	INSERT INTO artifacttypes (name, goalrange, npcpresenceid, persistent, minimumloot, dynamic)
	VALUES ('gateway_hershfield_to_daoden_lvl1', 10, @presenceId, 1, 0, 0)
END

-- Create artifact spawn info

SET @artifactType = (SELECT TOP 1 id FROM artifacttypes WHERE name = 'gateway_hershfield_to_daoden_lvl1')

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_TM_pve')

DELETE FROM artifactspawninfo WHERE artifacttype = @artifactType

INSERT INTO artifactspawninfo (artifacttype, zoneid, rate) VALUES
(@artifactType, @zoneId, 99)

-- Daoden

-- Create gatekeepers presence

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'daoden_to_alpha_gatekeepers_lvl1' AND spawnid = 10)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('daoden_to_alpha_gatekeepers_lvl1', 0, 0, 0, 0, 'Daoden gatekeepers', 10, 1, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1, topx = 0, topy = 0, bottomx = 0, bottomy = 0 WHERE name = 'daoden_to_alpha_gatekeepers_lvl1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'daoden_to_alpha_gatekeepers_lvl1')

-- Create Gatekeeper flock

DELETE FROM npcflock WHERE presenceid = @presenceid

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gatekeeper_locust_lvl1')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'daoden_to_alpha_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('daoden_to_alpha_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1', @presenceid, 1, @definition, 0, 0, 0, 5, 0, 1, 15, 'gatekeeper', 0.5, 1, 1, 2, 1)
END
ELSE
BEGIN
	UPDATE npcflock SET spawnoriginX = 0, spawnoriginY = 0 WHERE name = 'daoden_to_alpha_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1'
END

-- Add rift config

DELETE FROM riftconfigs WHERE name = 'daoden_z2_exit'

INSERT INTO riftconfigs (name, destinationGroupId, lifespanSeconds, maxUses, categoryExclusionGroupId) VALUES
('daoden_z2_exit', 200, 1800, NULL, NULL)

-- Add rift destinations

SET @destinationGroupId = (SELECT TOP 1 destinationGroupId FROM riftconfigs WHERE name = 'daoden_z2_exit')

DELETE FROM riftdestinations WHERE groupId = @destinationGroupId

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_TM')

INSERT INTO riftdestinations (groupId, zoneId, x, y, weight) VALUES
(@destinationGroupId, @zoneId, NULL, NULL, 1)

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ICS')

INSERT INTO riftdestinations (groupId, zoneId, x, y, weight) VALUES
(@destinationGroupId, @zoneId, NULL, NULL, 1)

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ICS_pve')

INSERT INTO riftdestinations (groupId, zoneId, x, y, weight) VALUES
(@destinationGroupId, @zoneId, NULL, NULL, 1)

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI_pve')

INSERT INTO riftdestinations (groupId, zoneId, x, y, weight) VALUES
(@destinationGroupId, @zoneId, NULL, NULL, 1)

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_TM_pve')

INSERT INTO riftdestinations (groupId, zoneId, x, y, weight) VALUES
(@destinationGroupId, @zoneId, NULL, NULL, 1)

-- Add boss info

SET @flockId = (SELECT TOP 1 id FROM npcflock WHERE name = 'daoden_to_alpha_gatekeepers_lvl1_def_npc_gatekeeper_locust_lvl1')

SET @riftConfigId = (SELECT TOP 1 id FROM riftconfigs WHERE name = 'daoden_z2_exit')

INSERT INTO npcbossinfo (flockid, respawnNoiseFactor, lootSplitFlag, outpostEID, stabilityPts, overrideRelations, customDeathMessage, customAggressMessage, riftConfigId, isAnnounced, isServerWideAnnouncement, isNoRadioDelay) VALUES
(@flockId, 0.15, 0, NULL, NULL, 0, '...Hold...the...door...', 'Network security breach. Initiating extermination protocol', @riftConfigId, 0, NULL, NULL)

-- Create artifact type

IF NOT EXISTS (SELECT 1 FROM artifacttypes WHERE name = 'gateway_daoden_to_alpha_lvl1')
BEGIN
	INSERT INTO artifacttypes (name, goalrange, npcpresenceid, persistent, minimumloot, dynamic)
	VALUES ('gateway_daoden_to_alpha_lvl1', 10, @presenceId, 1, 0, 0)
END

-- Create artifact spawn info

SET @artifactType = (SELECT TOP 1 id FROM artifacttypes WHERE name = 'gateway_daoden_to_alpha_lvl1')

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI')

DELETE FROM artifactspawninfo WHERE artifacttype = @artifactType

INSERT INTO artifactspawninfo (artifacttype, zoneid, rate) VALUES
(@artifactType, @zoneId, 99)

GO