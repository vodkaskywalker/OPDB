---- New category for Server-wide EP boosts ----

IF NOT EXISTS (SELECT 1 FROM categoryFlags WHERE name = 'cf_server_wide_ep_boosters')
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(394395, 'cf_server_wide_ep_boosters', 'Server-wide EP boosters', 0, 0)
END

GO

---- Add new aggregate fields

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'server_wide_ep_bonus')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('server_wide_ep_bonus', 1,'server_wide_ep_bonus_unit', 1, 0, 6, 0, 1, 1, 'Server-wide EP bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'server_wide_ep_bonus_duration')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('server_wide_ep_bonus_duration', 1,'server_wide_ep_bonus_duration_unit', 1, 0, 6, 0, 1, 1, 'Server-wide EP bonus duration')
END

---- Server-wide EP boost ----

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_server_wide_ep_boosters')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t0')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_server_wide_ep_booster_t0', 1, 2052, @categoryflags, '', '', 1, 0.1, 0.1, 0, 100, 'def_server_wide_ep_booster', 1, 1, 0); 
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t1')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_server_wide_ep_booster_t1', 1, 2052, @categoryflags, '', '', 1, 0.1, 0.1, 0, 100, 'def_server_wide_ep_booster', 1, 1, 1); 
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t2')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_server_wide_ep_booster_t2', 1, 2052, @categoryflags, '', '', 1, 0.1, 0.1, 0, 100, 'def_server_wide_ep_booster', 1, 1, 2); 
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t3')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_server_wide_ep_booster_t3', 1, 2052, @categoryflags, '', '', 1, 0.1, 0.1, 0, 100, 'def_server_wide_ep_booster', 1, 1, 3); 
END

GO

---- Set up aggregate fields for Server-wide EP boosters

DECLARE @definition INT
DECLARE @field INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t0')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 15 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus_duration')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 24)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 168 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t1')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 15 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus_duration')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 72)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 72 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t2')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 15 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus_duration')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 120 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t3')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 15 WHERE definition = @definition AND field = @field
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'server_wide_ep_bonus_duration')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 168)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 168 WHERE definition = @definition AND field = @field
END

GO

---- Add boosters to distribution sources

-- Add T0 into Daoden Syndicate shop ----


DECLARE @npc INT
DECLARE @loot INT

DECLARE @definition INT
DECLARE @itemshop_preset INT

SET @itemshop_preset = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'tm_preset_pve')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t0')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 10000000, 500, null, 0, null)
END

-- Add T1 to destroyer bosses

SET @loot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t1')

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_onyx_mammoth_destro')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_onyx_thelodica_pitboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_onyx_thelodica_pitboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_hydra_pelistal_pitboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_hydra_mammoth_destro')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_hydra_pelistal_pitboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_felos_mammoth_destro')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_gamma_felos_nuimqol_pitboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_felos_nuimqol_pitboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

-- Add T2 to Radamanthys

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

-- Add T3 to Commendant main boss

SET @npc = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_sh70_mainboss')

IF NOT EXISTS (SELECT 1 FROM npcloot WHERE definition = @npc AND lootdefinition = @loot)
BEGIN
	INSERT INTO npcloot (definition, lootdefinition, quantity, probability, repackaged, dontdamage, minquantity) VALUES
	(@npc, @loot, 1, 1, 0, 0, 1)
END

GO