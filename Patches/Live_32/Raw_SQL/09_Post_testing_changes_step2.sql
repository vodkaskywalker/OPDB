---- Set up aggregate fields for drones

DECLARE @definition INT
DECLARE @field INT

---- Support drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

---- Harvesting industrial drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

---- Mining industrial drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1440)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1440 WHERE definition = @definition AND field = @field
END

---- Pelistal attack drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1368)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1368 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1368)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1368 WHERE definition = @definition AND field = @field
END

---- Thelodica attack drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1368)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1368 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1368)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1368 WHERE definition = @definition AND field = @field
END

---- Nuimqol attack drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1200 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1200)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1200 WHERE definition = @definition AND field = @field
END

---- Syndicate attack drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1500 WHERE definition = @definition AND field = @field
END

---- Pelistal assault drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4000 WHERE definition = @definition AND field = @field
END

---- Thelodica assault drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4000 WHERE definition = @definition AND field = @field
END

---- Nuimqol assault drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3600)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3600 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3600)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3600 WHERE definition = @definition AND field = @field
END

---- Syndicate assault drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_chassis')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4400)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4400 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4400)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 4400 WHERE definition = @definition AND field = @field
END

GO

---- Add extra head slots for heavy mechs

UPDATE entitydefaults SET options = '#height=f0.15#slotFlags=48,8,8,8,8' WHERE definitionname = 'def_mesmer_head'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8  #height=f0.15  #max_locked_targets=f3.00  #max_targeting_range=f35.00  #sensor_strength=f100.00  #cpu=f375.00' WHERE definitionname = 'def_mesmer_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8,8  #height=f0.15  #max_locked_targets=f3.00  #max_targeting_range=f35.00  #sensor_strength=f100.00  #cpu=f375.00' WHERE definitionname = 'def_mesmer_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8,8  #height=f0.15  #max_locked_targets=f3.00  #max_targeting_range=f35.00  #sensor_strength=f100.00  #cpu=f375.00' WHERE definitionname = 'def_mesmer_head_reward1'
UPDATE entitydefaults SET options = '#height=f0.01#slotFlags=4848,8,8,8,8,8,8' WHERE definitionname = 'def_seth_head'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.01  #max_locked_targets=f3.00  #max_targeting_range=f37.50  #sensor_strength=f100.00  #cpu=f325.00' WHERE definitionname = 'def_seth_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8,8,8  #height=f0.01  #max_locked_targets=f3.00  #max_targeting_range=f37.50  #sensor_strength=f100.00  #cpu=f325.00' WHERE definitionname = 'def_seth_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8,8,8  #height=f0.01  #max_locked_targets=f3.00  #max_targeting_range=f37.50  #sensor_strength=f100.00  #cpu=f325.00' WHERE definitionname = 'def_seth_head_reward1'
UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4848,8,8,8,8,8,8' WHERE definitionname = 'def_gropho_head'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.20  #max_locked_targets=f3.00  #max_targeting_range=f32.50  #sensor_strength=f100.00  #cpu=f475.00' WHERE definitionname = 'def_gropho_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8,8,8  #height=f0.20  #max_locked_targets=f3.00  #max_targeting_range=f32.50  #sensor_strength=f100.00  #cpu=f475.00' WHERE definitionname = 'def_gropho_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8,8,8  #height=f0.20  #max_locked_targets=f3.00  #max_targeting_range=f32.50  #sensor_strength=f100.00  #cpu=f475.00' WHERE definitionname = 'def_gropho_head_reward1'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8  #height=f0.20  #max_locked_targets=f1  #max_targeting_range=f21.0  #sensor_strength=f100  #cpu=f450' WHERE definitionname = 'def_riveler_head'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8,8  #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_riveler_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8 #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_riveler_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8  #height=f0.20  #max_locked_targets=f1  #max_targeting_range=f21.0  #sensor_strength=f100  #cpu=f450' WHERE definitionname = 'def_symbiont_head'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8,8  #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_symbiont_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=48,8,8,8 #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_symbiont_head_pr'
UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4848,8,8,8,8,8' WHERE definitionname = 'def_legatus_head'
UPDATE entitydefaults SET options = '#slotFlags=4C08,8,8,8  #height=f0.20' WHERE definitionname = 'def_metis_head'
UPDATE entitydefaults SET options = '#slotFlags=4888,8,8,8,8,8  #height=f0.10', mass=3000  WHERE definitionname = 'def_spectator_head'
UPDATE entitydefaults SET options = '#slotFlags=4888,8,8,8,8,8  #height=f0.10', mass=3000  WHERE definitionname = 'def_spectator_head_pr'

GO

---- Rebalance Preachers

DECLARE @definition INT
DECLARE @field INT

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

UPDATE aggregatevalues SET value = 16 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

UPDATE aggregatevalues SET value = 8 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

UPDATE aggregatevalues SET value = 50 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

UPDATE aggregatevalues SET value = 16 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

UPDATE aggregatevalues SET value = 8 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

UPDATE aggregatevalues SET value = 50 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max_modifier')

UPDATE aggregatevalues SET value = 16 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max_modifier')

UPDATE aggregatevalues SET value = 8 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'nox_effect_enhancer_radius_modifier')

UPDATE aggregatevalues SET value = 50 WHERE definition = @definition AND field = @field

GO

GO