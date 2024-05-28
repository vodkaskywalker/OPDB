---- Disable Spectator minibosses

UPDATE npcpresence SET enabled = 0 WHERE name IN ('spectator_01_z7', 'spectator_01_z1', 'spectator_01_z6')

GO

---- Fix Drones craft COST

DECLARE @definition INT
DECLARE @gamma_nuimqol_shards INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_nuimqol_combat_drone_unit')
SET @gamma_nuimqol_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_nuimqol')

UPDATE components SET componentamount = 1 WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards

GO

---- Speeding up the destroyers

UPDATE entitydefaults SET mass = 78000 WHERE definitionname IN ('def_onyx_bot_chassis', 'def_hydra_bot_chassis', 'def_felos_bot_chassis')
UPDATE entitydefaults SET mass = 18000 WHERE definitionname IN ('def_onyx_bot_leg', 'def_hydra_bot_leg', 'def_felos_bot_leg')

DECLARE @definition INT
DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_hydra_bot_leg')
UPDATE aggregatevalues SET value = 1.7 WHERE definition = @definition AND field = @field

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_felos_bot_leg')
UPDATE aggregatevalues SET value = 1.87 WHERE definition = @definition AND field = @field

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_onyx_bot_leg')
UPDATE aggregatevalues SET value = 1.7 WHERE definition = @definition AND field = @field

GO

---- Fixes for drones description

UPDATE entitydefaults SET descriptiontoken = 'def_standart_nuimqol_combat_drone_desc' WHERE definitionname = 'def_named1_nuimqol_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_nuimqol_combat_drone_desc' WHERE definitionname = 'def_named1_nuimqol_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_pelistal_combat_drone_desc' WHERE definitionname = 'def_named1_pelistal_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_pelistal_combat_drone_desc' WHERE definitionname = 'def_named1_pelistal_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_thelodica_combat_drone_desc' WHERE definitionname = 'def_named1_thelodica_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_thelodica_combat_drone_desc' WHERE definitionname = 'def_named1_thelodica_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_nuimqol_combat_drone_desc' WHERE definitionname = 'def_named2_nuimqol_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_nuimqol_combat_drone_desc' WHERE definitionname = 'def_named2_nuimqol_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_pelistal_combat_drone_desc' WHERE definitionname = 'def_named2_pelistal_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_pelistal_combat_drone_desc' WHERE definitionname = 'def_named2_pelistal_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_thelodica_combat_drone_desc' WHERE definitionname = 'def_named2_thelodica_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_thelodica_combat_drone_desc' WHERE definitionname = 'def_named2_thelodica_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_nuimqol_combat_drone_desc' WHERE definitionname = 'def_named3_nuimqol_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_nuimqol_combat_drone_desc' WHERE definitionname = 'def_named3_nuimqol_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_pelistal_combat_drone_desc' WHERE definitionname = 'def_named3_pelistal_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_pelistal_combat_drone_desc' WHERE definitionname = 'def_named3_pelistal_combat_drone_unit'

UPDATE entitydefaults SET descriptiontoken = 'def_standart_thelodica_combat_drone_desc' WHERE definitionname = 'def_named3_thelodica_combat_drone'
UPDATE entitydefaults SET descriptiontoken = 'def_standart_thelodica_combat_drone_desc' WHERE definitionname = 'def_named3_thelodica_combat_drone_unit'

GO