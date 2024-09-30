---- Spark Teleport Devices ----
DECLARE @categoryFlags INT
DECLARE @options VARCHAR(MAX)
DECLARE @baseeid INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_spark_teleport_devices')

SET @baseeid = (SELECT TOP 1 eid FROM entities WHERE ename = 'base_ASI')
SET @options = CONCAT('#baseId=n', @baseeid)

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_spark_teleport_device_daoden')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) 
	VALUES ( 'def_spark_teleport_device_daoden', 1, 2052, @categoryFlags, @options, '', 1, 2, 50000, 0, 100, 'def_spark_teleport_device_daoden_desc', 1, 0, 0);
END

GO

---- Add Daoden as spark teleport location ----

DECLARE @basedefinition INT
DECLARE @baseeid INT

SET @basedefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_public_docking_base_thelodica')

SET @baseeid = (SELECT TOP 1 eid FROM entities WHERE ename = 'base_ASI')

IF NOT EXISTS (SELECT 1 FROM charactersparkteleports WHERE characterid = 0 AND baseeid = @baseeid AND basedefinition = @basedefinition)
BEGIN
	INSERT INTO [charactersparkteleports] (characterid, baseeid, basedefinition, zoneid, x, y) VALUES
	(0, @baseeid, @basedefinition, 2, 721.5, 1271.5)
END

GO

---- Enable black bots and reward items

UPDATE entitydefaults SET enabled = 1, hidden = 0 WHERE definitionname in (
'def_gropho_reward1_bot',
'def_mesmer_reward1_bot',
'def_purgatory_mass_reductor_reward',
'def_seth_reward1_bot',
'def_tux_shield_hardener_reward'
)

GO

---- Add Spark Teleport Devices and other items into Syndicate shop ----

DECLARE @definition INT
DECLARE @itemshop_preset INT
SET @itemshop_preset = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'daoden_preset')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spark_teleport_device_daoden')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 5000000, 300, null, 0, null)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_small_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 2500, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 2500, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_small_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_medium_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 2500, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 2500, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_medium_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_small_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 2500, NULL, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 2500, icscoin = NULL, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_small_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 5000, NULL, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 5000, icscoin = NULL, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_medium_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 2500, NULL, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 2500, icscoin = NULL, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_medium_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 2500, NULL, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 5000, icscoin = NULL, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_sensor_booster')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_sensor_booster')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_webber')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_webber')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_eccm')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_eccm')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_small_core_booster')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_small_core_booster')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_medium_core_booster')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_medium_core_booster')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_70_tracking_upgrade')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_70_tracking_upgrade')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_small_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 2500, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 2500, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_72_small_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_medium_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 2500, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 2500, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_72_medium_armor_repairer')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_small_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 2500, NULL, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 2500, icscoin = NULL, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_71_small_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 5000, NULL, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 5000, icscoin = NULL, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_medium_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 2500, NULL, NULL, 750000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 2500, icscoin = NULL, asicoin = NULL, credit = 750000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_71_medium_shield_generator')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 5000, NULL, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 5000, icscoin = NULL, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_mining_probe_module')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_71_mining_probe_module')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_damage_mod_projectile')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_72_damage_mod_projectile')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_72_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_72_mass_reductor')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet2_71_maneuvering_upgrade')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 500000000, 10000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 500000000, unicoin = 10000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_71_maneuvering_upgrade')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_autocannon')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_autocannon')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_longrange_medium_autocannon')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_laser')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, 5000, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = 5000, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_laser')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, 5000, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = 5000, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_longrange_medium_laser')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, 5000, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = 5000, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_railgun')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_railgun')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_longrange_medium_railgun')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 5000, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 5000, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_rocket_launcher')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 5000, NULL, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 5000, icscoin = NULL, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_missile_launcher')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 5000, NULL, NULL, 1500000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 5000, icscoin = NULL, asicoin = NULL, credit = 1500000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_driller')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_driller')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_small_harvester')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_harvester')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_purgatory_mass_reductor_reward')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_tux_shield_hardener_reward')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, NULL, 1000000000, 25000, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = NULL, credit = 1000000000, unicoin = 25000  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_gropho_reward1_bot')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, 20000, NULL, NULL, 5000000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = 20000, icscoin = NULL, asicoin = NULL, credit = 5000000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_seth_reward1_bot')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, NULL, 50000, 5000000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = NULL, asicoin = 20000, credit = 5000000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mesmer_reward1_bot')

IF NOT EXISTS (SELECT 1 FROM itemshop WHERE targetdefinition = @definition AND presetid = @itemshop_preset)
BEGIN
	INSERT INTO itemshop (presetid, targetdefinition, targetamount, tmcoin, icscoin, asicoin, credit, unicoin, globallimit, purchasecount, standing) VALUES
	(@itemshop_preset, @definition, 1, NULL, 50000, NULL, 5000000000, NULL, NULL, 0, NULL)
END
ELSE
BEGIN
	UPDATE itemshop SET tmcoin = NULL, icscoin = 20000, asicoin = NULL, credit = 5000000000, unicoin = NULL  WHERE targetdefinition = @definition AND presetid = @itemshop_preset
END

GO

