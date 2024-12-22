---- Set up decalibration and production time

DECLARE @categoryFlags BIGINT

----

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_dreadnought_modules')

IF NOT EXISTS (SELECT 1 FROM productiondecalibration WHERE categoryflag = @categoryFlags)
BEGIN
	INSERT INTO productiondecalibration (categoryflag, distorsionmin, distorsionmax, decrease) values
	(@categoryflags, 0.003, 0.005, 1)
END

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlags)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) values
	(@categoryFlags, 2)
END

--

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_excavator_modules')

IF NOT EXISTS (SELECT 1 FROM productiondecalibration WHERE categoryflag = @categoryFlags)
BEGIN
	INSERT INTO productiondecalibration (categoryflag, distorsionmin, distorsionmax, decrease) values
	(@categoryflags, 0.003, 0.005, 1)
END

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlags)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) values
	(@categoryFlags, 2)
END

--

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_adaptive_alloys')

IF NOT EXISTS (SELECT 1 FROM productiondecalibration WHERE categoryflag = @categoryFlags)
BEGIN
	INSERT INTO productiondecalibration (categoryflag, distorsionmin, distorsionmax, decrease) values
	(@categoryflags, 0.003, 0.005, 1)
END

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlags)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) values
	(@categoryFlags, 2)
END

--

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_deep_mining_ammo')

IF NOT EXISTS (SELECT 1 FROM productiondecalibration WHERE categoryflag = @categoryFlags)
BEGIN
	INSERT INTO productiondecalibration (categoryflag, distorsionmin, distorsionmax, decrease) values
	(@categoryflags, 0.001, 0.0015, 0.3)
END

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlags)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) values
	(@categoryFlags, 0.2)
END

--

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_large_drillers')

IF NOT EXISTS (SELECT 1 FROM productiondecalibration WHERE categoryflag = @categoryFlags)
BEGIN
	INSERT INTO productiondecalibration (categoryflag, distorsionmin, distorsionmax, decrease) values
	(@categoryflags, 0.003, 0.005, 1)
END

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlags)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) values
	(@categoryFlags, 2)
END

GO

---- Fix adaptive alloys cpu and powergrid

DECLARE @categoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_adaptive_alloys')

DELETE FROM aggregatemodifiers WHERE categoryflag = @categoryFlag
DELETE FROM modulepropertymodifiers WHERE categoryflags = @categoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_armor_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)
INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_armor_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)
INSERT INTO modulepropertymodifiers (categoryflags, basefield, modifierfield) VALUES (@categoryFlag, @baseField, @modifierField)

GO

---- Rebalance remote controllers

---- Set up aggregate fields for extra remote controllers

DECLARE @definition INT
DECLARE @field INT

-- Tactical

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

UPDATE aggregatevalues SET value = 1800000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

UPDATE aggregatevalues SET value = 240000 WHERE definition = @definition AND field = @field


---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

UPDATE aggregatevalues SET value = 63 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

UPDATE aggregatevalues SET value = 63 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

UPDATE aggregatevalues SET value = 54 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

UPDATE aggregatevalues SET value = 71 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field

-- Industrial

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

UPDATE aggregatevalues SET value = 240000 WHERE definition = @definition AND field = @field

---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

UPDATE aggregatevalues SET value = 63 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

UPDATE aggregatevalues SET value = 63 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

UPDATE aggregatevalues SET value = 54 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

UPDATE aggregatevalues SET value = 71 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field

-- Support

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

UPDATE aggregatevalues SET value = 240000 WHERE definition = @definition AND field = @field

---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field

---- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

UPDATE aggregatevalues SET value = 63 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

UPDATE aggregatevalues SET value = 63 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

UPDATE aggregatevalues SET value = 54 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

UPDATE aggregatevalues SET value = 71 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field

-- Assault

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

DELETE FROM aggregatevalues WHERE definition = @definition AND field = @field

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

UPDATE aggregatevalues SET value = 180000 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

UPDATE aggregatevalues SET value = 240000 WHERE definition = @definition AND field = @field

---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field

GO

---- Add extra head slot to Metis

UPDATE entitydefaults SET options = '#slotFlags=4C08,8,8,8,8  #height=f0.20' WHERE definitionname = 'def_metis_head'

GO

---- Getting rid of ghost bases attempt 1

EXEC dbo.deleteAllChildren 4865912697679673829
DELETE FROM entities WHERE eid = 4865912697679673829

GO