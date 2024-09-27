-- Reenabling, repositioning Daoden and making it PvP

UPDATE zones SET enabled = 1, active = 1, protected = 0, raceid = 1, x = -20000, y = -1000 WHERE name = 'zone_ASI'

GO

---- Add relics

DECLARE @sourceZoneId INT
DECLARE @destinationZoneId INT

SET @sourceZoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_gamma_z117')
SET @destinationZoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI')
  
DELETE FROM relicspawninfo WHERE zoneid = @destinationZoneId

INSERT INTO relicspawninfo (relictypeid, zoneid, rate, x, y)
SELECT relictypeid, @destinationZoneId, rate, x, y FROM relicspawninfo WHERE zoneid = @sourceZoneId

DELETE FROM reliczoneconfig WHERE zoneid = @destinationZoneId

INSERT INTO reliczoneconfig (zoneid, maxspawn, respawnrate)
SELECT @destinationZoneId, maxspawn, respawnrate FROM reliczoneconfig WHERE zoneid = @sourceZoneId

GO

---- Fill syndicate market

IF NOT EXISTS (SELECT 1 FROM itemshoppresets WHERE name = 'daoden_preset')
BEGIN
	INSERT INTO itemshoppresets (name, note) VALUES ('daoden_preset', 'Daoden preset')
END

DECLARE @sourcePresetId INT
DECLARE @destinationPresetId INT

SET @sourcePresetId = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'asi_preset_pve')
SET @destinationPresetId = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'daoden_preset')

DECLARE @locationEid INT

SET @locationEid = (SELECT TOP 1 eid FROM entities WHERE ename = 'def_base_item_shop_megacorp_ASI_base_ASI')

UPDATE itemshoplocations SET presetid = @destinationPresetId WHERE locationeid = @locationEid

SET @locationEid = (SELECT TOP 1 eid FROM entities WHERE ename = 'def_base_item_shop_megacorp_ASI_asi_outpost_s_03')

UPDATE itemshoplocations SET presetid = @destinationPresetId WHERE locationeid = @locationEid

SET @locationEid = (SELECT TOP 1 eid FROM entities WHERE ename = 'def_base_item_shop_megacorp_ASI_asi_outpost_w_01')

UPDATE itemshoplocations SET presetid = @destinationPresetId WHERE locationeid = @locationEid

SET @locationEid = (SELECT TOP 1 eid FROM entities WHERE ename = 'def_base_item_shop_megacorp_ASI_asi_outpost_i_02')

UPDATE itemshoplocations SET presetid = @destinationPresetId WHERE locationeid = @locationEid

DELETE FROM itemshop WHERE presetid = @destinationPresetId

INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing)
SELECT @destinationPresetId, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing FROM itemshop its
INNER JOIN entitydefaults ed ON  its.targetdefinition = ed.definition
WHERE presetid = @sourcePresetId AND ed.categoryflags != 328859

GO

---- Set up missions for daoden

DECLARE @zoneid INT

SET @zoneid = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI')

UPDATE missionlocations SET maxmissionlevel = 7 WHERE zoneid = @zoneid

UPDATE missions SET listable = 0 WHERE name = 'mission_asi_gen_tutorial_exp3_01'
UPDATE missions SET listable = 0 WHERE name = 'mission_asi_gen_tutorial_exp3_02'
UPDATE missions SET listable = 0 WHERE name = 'mission_asi_gen_tutorial_exp3_03'
UPDATE missions SET listable = 0 WHERE name = 'mission_asi_gen_tutorial_exp3_04'
UPDATE missions SET listable = 0 WHERE name = 'mission_asi_gen_tutorial_exp3_05'

GO

-- Disable existing spawns

UPDATE p
SET p.enabled = 0
FROM npcpresence p 
INNER JOIN zones z 
ON p.spawnid = z.spawnid
WHERE z.name IN ('zone_ASI') AND p.enabled = 1 AND p.izgroupid IS NULL

GO

---- Add rare resources

DECLARE @sourceZoneId INT
DECLARE @destinationZoneId INT
DECLARE @mineralId INT

SET @sourceZoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_TM_pve')
SET @destinationZoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI')

DELETE FROM mineralconfigs WHERE zoneid = @destinationZoneId

INSERT INTO mineralconfigs (zoneid, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold)
(SELECT @destinationZoneId, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold FROM mineralconfigs WHERE zoneid = @sourceZoneId)

SET @sourceZoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ICS_A_real')

SET @mineralId = (SELECT TOP 1 idx FROM minerals WHERE name = 'epriton')

INSERT INTO mineralconfigs (zoneid, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold)
(SELECT @destinationZoneId, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold FROM mineralconfigs WHERE zoneid = @sourceZoneId AND materialtype = @mineralId)

SET @mineralId = (SELECT TOP 1 idx FROM minerals WHERE name = 'fluxore')

INSERT INTO mineralconfigs (zoneid, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold)
(SELECT @destinationZoneId, materialtype, maxnodes, maxtilespernode, totalamountpernode, minthreshold FROM mineralconfigs WHERE zoneid = @sourceZoneId AND materialtype = @mineralId)

GO

---- Reconfigure plants

DECLARE @rulesetid INT

SET @rulesetid = (SELECT TOP 1 plantruleset FROM zones WHERE name = 'zone_ASI')

DELETE FROM plantrules WHERE rulesetid = @rulesetid

INSERT INTO plantrules (plantrule, rulesetid, note) VALUES
('bonsai.txt', @rulesetid, 'decor'),
('bush_a.txt', @rulesetid, 'decor'),
('bush_b.txt', @rulesetid, 'decor'),
('coppertree.txt', @rulesetid, 'decor'),
('devrinol.txt', @rulesetid, 'decor'),
('electroplant_wild.txt', @rulesetid, 'harvestable'),
('grass_a.txt', @rulesetid, 'decor'),
('grass_b.txt', @rulesetid, 'decor'),
('irontree_wild.txt', @rulesetid, 'harvestable'),
('nanowheat.txt', @rulesetid, 'decor'),
('pinetree.txt', @rulesetid, 'decor'),
('poffeteg.txt', @rulesetid, 'decor'),
('quag.txt', @rulesetid, 'decor'),
('rango.txt', @rulesetid, 'decor'),
('reed.txt', @rulesetid, 'decor'),
('rustbush_wild.txt', @rulesetid, 'harvestable'),
('slimeroot_wild.txt', @rulesetid, 'harvestable'),
('titanplant.txt', @rulesetid, 'decor'),
('wall.txt', @rulesetid, 'decor')

GO

-- Reconfigure teleports

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'teleport_column_asi_chotassia_to_teleport_column_asipve_1'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'teleport_column_asipve_1_to_teleport_column_asi_chotassia'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'teleport_column_asi_ruydado_Z_to_teleport_column_icspve_3'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'teleport_column_icspve_3_to_teleport_column_asi_ruydado_Z'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'tp_zone_7_8_to_tp_zone_2_10'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'tp_zone_2_10_to_tp_zone_7_8'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'teleport_column_asi_matsu_Z_to_tp_zone_6_8'

UPDATE teleportdescriptions SET active = 0, listable = 0 WHERE description = 'tp_zone_6_8_to_teleport_column_asi_matsu_Z'

UPDATE zoneentities SET enabled = 0 WHERE synckey IN (
'asi_sangutal_Z',
'asi_matsu_Z',
'asi_ruydado_Z',
'asi_golpagany_Z',
'asi_darishoto_a',
'asi_chotassia_b',
'asitutorialpunchbag',
'asi_chotassia',
'asi_hakkabor',
'asi_matsu',
'tpc_awvufzo',
'tpc_prkykye',
'tpc_ovyfjtv'
)

GO