---- Craft

DECLARE @categoryFlags INT

SET @categoryFlags = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_ammo_rcu_calibration_programs')

---- Create CT for assault drones

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

---- Create CT for attack drones

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

---- Create CT for industrial drones

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

---- Create CT for support drones

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, note, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone_unit_cprg', 1, 1024, @categoryFlags, NULL, NULL, 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

GO

-- Set base CT efficiency

DECLARE @definition INT

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit_cprg')

DELETE FROM calibrationdefaults WHERE definition = @definition

INSERT INTO calibrationdefaults (definition, materialefficiency, timeefficiency) VALUES
(@definition, 50, 50)

GO

---- Set up decalibration and production time

DECLARE @categoryFlags BIGINT

----

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_tactical_remote_controllers')

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

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_remote_controllers')

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

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_remote_controllers')

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

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_support_remote_controllers')

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

----

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones_units')

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

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones_units')

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

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_drones_units')

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

SET @categoryFlags = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_support_drones_units')

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

GO

---- Production and prorotyping cost in materials, modules and components ----

DECLARE @definition INT

DECLARE @titanium INT
DECLARE @cryoperine INT
DECLARE @axicoline INT
DECLARE @plasteosine INT
DECLARE @flux INT

DECLARE @biotichrin INT
DECLARE @polynitrocol INT
DECLARE @polynucleit INT
DECLARE @phlobotil INT

DECLARE @bryochite INT
DECLARE @alligior INT
DECLARE @espitium INT
DECLARE @hydrobenol INT

DECLARE @common_basic_components INT
DECLARE @common_advanced_components INT
DECLARE @common_expert_components INT
DECLARE @pelistal_expert_components INT
DECLARE @nuimqol_expert_components INT
DECLARE @thelodica_expert_components INT

DECLARE @gamma_syndicate_shards INT
DECLARE @gamma_pelistal_shards INT
DECLARE @gamma_nuimqol_shards INT
DECLARE @gamma_thelodica_shards INT

DECLARE @assault_remote_controller_t1 INT
DECLARE @assault_remote_controller_t2 INT
DECLARE @assault_remote_controller_t3 INT

DECLARE @tactical_remote_controller_t1 INT
DECLARE @tactical_remote_controller_t2 INT
DECLARE @tactical_remote_controller_t3 INT

DECLARE @industrial_remote_controller_t1 INT
DECLARE @industrial_remote_controller_t2 INT
DECLARE @industrial_remote_controller_t3 INT

DECLARE @support_remote_controller_t1 INT
DECLARE @support_remote_controller_t2 INT
DECLARE @support_remote_controller_t3 INT

SET @titanium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_titanium')
SET @cryoperine = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_axicol')
SET @axicoline = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_axicoline')
SET @plasteosine = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_plasteosine')
SET @flux = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_specimen_sap_item_flux')

SET @biotichrin = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_biotichrin')
SET @polynitrocol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_polynitrocol')
SET @polynucleit = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_polynucleit')
SET @phlobotil = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_phlobotil')

SET @alligior = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_alligior')
SET @hydrobenol = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_hydrobenol')
SET @espitium = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_espitium')
SET @bryochite = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_unimetal') -- unimetal Y U NO bryochite

SET @common_basic_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_basic')
SET @common_advanced_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_advanced')
SET @common_expert_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_common_expert')

SET @pelistal_expert_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_pelistal_expert')
SET @nuimqol_expert_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_nuimqol_expert')
SET @thelodica_expert_components = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_robotshard_thelodica_expert')

SET @gamma_syndicate_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_syndicate')
SET @gamma_pelistal_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_pelistal')
SET @gamma_nuimqol_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_nuimqol')
SET @gamma_thelodica_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_syndicate')

SET @assault_remote_controller_t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')
SET @assault_remote_controller_t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')
SET @assault_remote_controller_t3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

SET @tactical_remote_controller_t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @tactical_remote_controller_t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')
SET @tactical_remote_controller_t3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

SET @industrial_remote_controller_t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @industrial_remote_controller_t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')
SET @industrial_remote_controller_t3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

SET @support_remote_controller_t1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @support_remote_controller_t2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')
SET @support_remote_controller_t3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @phlobotil, 1000),
(@definition, @polynucleit, 1000),
(@definition, @polynitrocol, 1000),
(@definition, @axicoline, 1000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50),
(@definition, @flux, 10)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2000),
(@definition, @polynitrocol, 4000),
(@definition, @espitium, 200),
(@definition, @bryochite, 100),
(@definition, @flux, 20),
(@definition, @gamma_nuimqol_shards, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2000),
(@definition, @polynucleit, 4000),
(@definition, @espitium, 200),
(@definition, @bryochite, 100),
(@definition, @flux, 20),
(@definition, @gamma_thelodica_shards, 1)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 2000),
(@definition, @phlobotil, 4000),
(@definition, @espitium, 200),
(@definition, @bryochite, 100),
(@definition, @flux, 20),
(@definition, @gamma_pelistal_shards, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 500),
(@definition, @phlobotil, 500),
(@definition, @polynucleit, 500),
(@definition, @polynitrocol, 500),
(@definition, @axicoline, 500),
(@definition, @espitium, 50),
(@definition, @bryochite, 25)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @polynitrocol, 2000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @polynucleit, 2000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @phlobotil, 2000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @axicoline, 1000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @axicoline, 1000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 1000),
(@definition, @axicoline, 1000),
(@definition, @espitium, 100),
(@definition, @bryochite, 50)

----

-- Assault remote controller T1 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50)

-- Remote controller T2 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @assault_remote_controller_t1, 1)

-- Remote controller T2 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @assault_remote_controller_t1, 1),
(@definition, @common_basic_components, 30)

-- Remote controller T3 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @assault_remote_controller_t2, 1)

-- Remote controller T3 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @assault_remote_controller_t2, 1),
(@definition, @common_basic_components, 20),
(@definition, @common_advanced_components, 20)

-- Remote controller T4 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @assault_remote_controller_t3, 1)

-- Remote controller T4 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @assault_remote_controller_t3, 1),
(@definition, @common_basic_components, 15),
(@definition, @common_advanced_components, 30),
(@definition, @common_expert_components, 45)

----

-- Tactical remote controller T1 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50)

-- Remote controller T2 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @tactical_remote_controller_t1, 1)

-- Remote controller T2 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @tactical_remote_controller_t1, 1),
(@definition, @common_basic_components, 30)

-- Remote controller T3 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @tactical_remote_controller_t2, 1)

-- Remote controller T3 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @tactical_remote_controller_t2, 1),
(@definition, @common_basic_components, 20),
(@definition, @common_advanced_components, 20)

-- Remote controller T4 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @tactical_remote_controller_t3, 1)

-- Remote controller T4 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @tactical_remote_controller_t3, 1),
(@definition, @common_basic_components, 15),
(@definition, @common_advanced_components, 30),
(@definition, @common_expert_components, 45)

----

-- Industrial remote controller T1 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50)

-- Remote controller T2 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @industrial_remote_controller_t1, 1)

-- Remote controller T2 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @industrial_remote_controller_t1, 1),
(@definition, @common_basic_components, 30)

-- Remote controller T3 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @industrial_remote_controller_t2, 1)

-- Remote controller T3 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @industrial_remote_controller_t2, 1),
(@definition, @common_basic_components, 20),
(@definition, @common_advanced_components, 20)

-- Remote controller T4 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @industrial_remote_controller_t3, 1)

-- Remote controller T4 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @industrial_remote_controller_t3, 1),
(@definition, @common_basic_components, 15),
(@definition, @common_advanced_components, 30),
(@definition, @common_expert_components, 45)

----

-- Support remote controller T1 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50)

-- Remote controller T2 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @support_remote_controller_t1, 1)

-- Remote controller T2 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 50),
(@definition, @support_remote_controller_t1, 1),
(@definition, @common_basic_components, 30)

-- Remote controller T3 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @support_remote_controller_t2, 1)

-- Remote controller T3 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 175),
(@definition, @hydrobenol, 50),
(@definition, @support_remote_controller_t2, 1),
(@definition, @common_basic_components, 20),
(@definition, @common_advanced_components, 20)

-- Remote controller T4 --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @support_remote_controller_t3, 1)

-- Remote controller T4 prototype --
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

DELETE FROM components WHERE definition = @definition

INSERT INTO components (definition, componentdefinition, componentamount) VALUES
(@definition, @titanium, 50),
(@definition, @cryoperine, 250),
(@definition, @axicoline, 100),
(@definition, @espitium, 300),
(@definition, @hydrobenol, 100),
(@definition, @bryochite, 50),
(@definition, @support_remote_controller_t3, 1),
(@definition, @common_basic_components, 15),
(@definition, @common_advanced_components, 30),
(@definition, @common_expert_components, 45)

GO

---- Research levels ----

DECLARE @definition INT
DECLARE @calibration INT

----

-- Assault Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

-- Assault Remote controller T2 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

-- Assault Remote controller T3 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 7, @calibration, 1)

-- Assault Remote controller T4 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 8, @calibration, 1)

--

-- Tactical Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

-- Tactical Remote controller T2 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

-- Tactical Remote controller T3 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 7, @calibration, 1)

-- Tactical Remote controller T4 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 8, @calibration, 1)

--

-- Industrial Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

-- Industrial Remote controller T2 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

-- Industrial Remote controller T3 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 7, @calibration, 1)

-- Industrial Remote controller T4 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 8, @calibration, 1)

--

-- Support Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

-- Support Remote controller T2 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 6, @calibration, 1)

-- Support Remote controller T3 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO itemresearchlevels (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 7, @calibration, 1)

-- Support Remote controller T4 prototype

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 8, @calibration, 1)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')
SET @calibration = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit_cprg')

DELETE FROM itemresearchlevels WHERE definition = @definition AND calibrationprogram = @calibration

INSERT INTO [itemresearchlevels] (definition, researchlevel, calibrationprogram, enabled) VALUES
(@definition, 5, @calibration, 1)

GO

----Research cost ----

DECLARE @definition INT
DECLARE @common INT
DECLARE @hightech INT
DECLARE @pelistal INT
DECLARE @nuimqol INT
DECLARE @thelodica INT
DECLARE @industrial INT

SET @common = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'common')
SET @hightech = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'hitech')
SET @pelistal = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'pelistal')
SET @nuimqol = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'nuimqol')
SET @thelodica = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'thelodica')
SET @industrial = (SELECT TOP 1 id FROM techtreepointtypes WHERE name = 'industrial')

-- Spectator

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_bot')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 256000),
(@definition, @nuimqol, 100000),
(@definition, @thelodica, 100000),
(@definition, @pelistal, 100000)

-- Assault Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 25000)

-- Assault Remote controller T2

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 50000)

-- Assault Remote controller T3

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 75000)

-- Assault Remote controller T4

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 100000),
(@definition, @hightech, 50000)

-- Tactical Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 25000)

-- Tactical Remote controller T2

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 50000)

-- Tactical Remote controller T3

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 75000)

-- Tactical Remote controller T4

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 100000),
(@definition, @hightech, 50000)

-- Industrial Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 25000)

-- Industrial Remote controller T2

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 50000)

-- Industrial Remote controller T3

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 75000)

-- Industrial Remote controller T4

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 100000),
(@definition, @hightech, 50000)

-- Support Remote controller T1

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 25000)

-- Support Remote controller T2

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 50000)

-- Support Remote controller T3

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 75000)

-- Support Remote controller T4

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @common, 100000),
(@definition, @hightech, 50000)

-- Assault drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @common, 75000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @nuimqol, 75000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @thelodica, 75000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @pelistal, 75000)

-- Attack drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @common, 50000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @nuimqol, 50000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @thelodica, 50000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @pelistal, 50000)

-- Industrial drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @industrial, 50000)

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @industrial, 50000)

-- Support drones

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

DELETE FROM techtreenodeprices WHERE definition = @definition

INSERT INTO [techtreenodeprices] (definition, pointtype, amount) VALUES
(@definition, @hightech, 40000),
(@definition, @industrial, 50000)

GO

---- Revert and reimburse Research

DECLARE @temp TABLE (definition INT, owner BIGINT)

INSERT INTO @temp (definition, owner) (

SELECT ed.definition, unl.owner FROM entitydefaults ed
LEFT JOIN techtreeunlockednodes unl
ON ed.definition = unl.definition
WHERE ed.definitionname in (
	'def_named3_thelodica_combat_drone_unit',
	'def_named2_thelodica_combat_drone_unit',
	'def_named1_thelodica_combat_drone_unit',
	'def_standart_thelodica_combat_drone_unit',
	'def_named3_nuimqol_combat_drone_unit',
	'def_named2_nuimqol_combat_drone_unit',
	'def_named1_nuimqol_combat_drone_unit',
	'def_standart_nuimqol_combat_drone_unit',
	'def_named3_pelistal_combat_drone_unit',
	'def_named2_pelistal_combat_drone_unit',
	'def_named1_pelistal_combat_drone_unit',
	'def_standart_pelistal_combat_drone_unit',
	'def_named3_harvesting_turret_unit',
	'def_named2_harvesting_turret_unit',
	'def_named1_harvesting_turret_unit',
	'def_standart_harvesting_turret_unit',
	'def_named3_mining_turret_unit',
	'def_named2_mining_turret_unit',
	'def_named1_mining_turret_unit',
	'def_standart_mining_turret_unit',
	'def_named3_sentry_turret_unit',
	'def_named2_sentry_turret_unit',
	'def_named1_sentry_turret_unit',
	'def_standart_sentry_turret_unit',
	'def_named3_assault_remote_controller',
	'def_named2_assault_remote_controller',
	'def_named1_assault_remote_controller',
	'def_standard_assault_remote_controller',
	'def_spectator_bot'
))

DECLARE @currentDefinition INT
DECLARE @currentOwner BIGINT

DECLARE curse CURSOR LOCAL FAST_FORWARD READ_ONLY FOR
	SELECT definition, owner FROM @temp

OPEN curse

FETCH NEXT FROM curse INTO @currentDefinition, @currentOwner

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE tp
	SET tp.amount = tp.amount + np.amount
	FROM techtreepoints tp
	LEFT JOIN techtreenodeprices np
	ON tp.pointtype = np.pointtype
	WHERE tp.owner = @currentOwner
	AND np.definition = @currentDefinition

	DELETE FROM techtreeunlockednodes
	WHERE definition = @currentDefinition
	AND owner = @currentOwner

	FETCH NEXT FROM curse INTO @currentDefinition, @currentOwner
END

CLOSE curse

DEALLOCATE curse

---- Position in tech tree ----

DECLARE @parent INT
DECLARE @spectator INT
DECLARE @pupeteerT1 INT
DECLARE @pupeteerT2 INT
DECLARE @pupeteerT3 INT
DECLARE @pupeteerT4 INT
DECLARE @miningTurretT1 INT
DECLARE @miningTurretT2 INT
DECLARE @miningTurretT3 INT
DECLARE @miningTurretT4 INT
DECLARE @harvestingTurretT1 INT
DECLARE @harvestingTurretT2 INT
DECLARE @harvestingTurretT3 INT
DECLARE @harvestingTurretT4 INT
DECLARE @sentryTurretT1 INT
DECLARE @sentryTurretT2 INT
DECLARE @sentryTurretT3 INT
DECLARE @sentryTurretT4 INT
DECLARE @pelistalDroneT1 INT
DECLARE @pelistalDroneT2 INT
DECLARE @pelistalDroneT3 INT
DECLARE @pelistalDroneT4 INT
DECLARE @nuimqolDroneT1 INT
DECLARE @nuimqolDroneT2 INT
DECLARE @nuimqolDroneT3 INT
DECLARE @nuimqolDroneT4 INT
DECLARE @thelodicaDroneT1 INT
DECLARE @thelodicaDroneT2 INT
DECLARE @thelodicaDroneT3 INT
DECLARE @thelodicaDroneT4 INT

DECLARE @assaultRcmT1 INT
DECLARE @assaultRcmT2 INT
DECLARE @assaultRcmT3 INT
DECLARE @assaultRcmT4 INT

DECLARE @tacticalRcmT1 INT
DECLARE @tacticalRcmT2 INT
DECLARE @tacticalRcmT3 INT
DECLARE @tacticalRcmT4 INT

DECLARE @industrialRcmT1 INT
DECLARE @industrialRcmT2 INT
DECLARE @industrialRcmT3 INT
DECLARE @industrialRcmT4 INT

DECLARE @supportRcmT1 INT
DECLARE @supportRcmT2 INT
DECLARE @supportRcmT3 INT
DECLARE @supportRcmT4 INT

DECLARE @syndicateAssaultDrone INT
DECLARE @nuimqolAssaultDrone INT
DECLARE @thelodicaAssaultDrone INT
DECLARE @pelistalAssaultDrone INT

DECLARE @syndicateAttackDrone INT
DECLARE @nuimqolAttackDrone INT
DECLARE @thelodicaAttackDrone INT
DECLARE @pelistalAttackDrone INT

DECLARE @miningIndustrialDrone INT
DECLARE @harvestingIndustrialDrone INT

DECLARE @repairSupportDrone INT

DECLARE @group INT

SET @parent = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_cpu_upgrade')
SET @spectator = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_bot')
SET @pupeteerT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_remote_controller')
SET @pupeteerT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_remote_controller')
SET @pupeteerT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_remote_controller')
SET @pupeteerT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_remote_controller')
SET @miningTurretT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_mining_turret_unit')
SET @miningTurretT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_mining_turret_unit')
SET @miningTurretT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_mining_turret_unit')
SET @miningTurretT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mining_turret_unit')
SET @harvestingTurretT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_harvesting_turret_unit')
SET @harvestingTurretT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_harvesting_turret_unit')
SET @harvestingTurretT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_harvesting_turret_unit')
SET @harvestingTurretT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_harvesting_turret_unit')
SET @sentryTurretT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_sentry_turret_unit')
SET @sentryTurretT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_sentry_turret_unit')
SET @sentryTurretT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_sentry_turret_unit')
SET @sentryTurretT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sentry_turret_unit')
SET @pelistalDroneT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_pelistal_combat_drone_unit')
SET @pelistalDroneT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_pelistal_combat_drone_unit')
SET @pelistalDroneT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_pelistal_combat_drone_unit')
SET @pelistalDroneT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_pelistal_combat_drone_unit')
SET @nuimqolDroneT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_nuimqol_combat_drone_unit')
SET @nuimqolDroneT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_nuimqol_combat_drone_unit')
SET @nuimqolDroneT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_nuimqol_combat_drone_unit')
SET @nuimqolDroneT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_nuimqol_combat_drone_unit')
SET @thelodicaDroneT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_thelodica_combat_drone_unit')
SET @thelodicaDroneT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_thelodica_combat_drone_unit')
SET @thelodicaDroneT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_thelodica_combat_drone_unit')
SET @thelodicaDroneT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_thelodica_combat_drone_unit')

SET @assaultRcmT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')
SET @assaultRcmT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')
SET @assaultRcmT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')
SET @assaultRcmT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

SET @tacticalRcmT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @tacticalRcmT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')
SET @tacticalRcmT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')
SET @tacticalRcmT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

SET @industrialRcmT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @industrialRcmT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')
SET @industrialRcmT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')
SET @industrialRcmT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

SET @supportRcmT1 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @supportRcmT2 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')
SET @supportRcmT3 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')
SET @supportRcmT4 = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

SET @syndicateAssaultDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')
SET @nuimqolAssaultDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')
SET @thelodicaAssaultDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')
SET @pelistalAssaultDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

SET @syndicateAttackDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')
SET @nuimqolAttackDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')
SET @thelodicaAttackDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')
SET @pelistalAttackDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

SET @miningIndustrialDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')
SET @harvestingIndustrialDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

SET @repairSupportDrone = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

SET @group = (SELECT TOP 1 id FROM [techtreegroups] WHERE name = 'common2')

DELETE FROM techtree WHERE childdefinition IN (@spectator,@pupeteerT1,@pupeteerT2,@pupeteerT3,@pupeteerT4,@miningTurretT1,@miningTurretT2,@miningTurretT3,@miningTurretT4,
@harvestingTurretT1,@harvestingTurretT2,@harvestingTurretT3,@harvestingTurretT4,@sentryTurretT1,@sentryTurretT2,@sentryTurretT3,@sentryTurretT4,
@pelistalDroneT1,@pelistalDroneT2,@pelistalDroneT3,@pelistalDroneT4,@nuimqolDroneT1,@nuimqolDroneT2,@nuimqolDroneT3,@nuimqolDroneT4,
@thelodicaDroneT1,@thelodicaDroneT2,@thelodicaDroneT3,@thelodicaDroneT4,
@assaultRcmT1, @assaultRcmT2, @assaultRcmT3, @assaultRcmT4, @tacticalRcmT1, @tacticalRcmT2, @tacticalRcmT3, @tacticalRcmT4,
@industrialRcmT1, @industrialRcmT2, @industrialRcmT3, @industrialRcmT4, @supportRcmT1, @supportRcmT2, @supportRcmT3, @supportRcmT4,
@syndicateAssaultDrone, @nuimqolAssaultDrone, @thelodicaAssaultDrone, @pelistalAssaultDrone, @syndicateAttackDrone, @nuimqolAttackDrone, @thelodicaAttackDrone,
@pelistalAttackDrone, @miningIndustrialDrone, @harvestingIndustrialDrone, @repairSupportDrone)

INSERT INTO [techtree] (parentdefinition, childdefinition, groupID, x, y, enablerextensionid) VALUES
	(@parent, @assaultRcmT1, @group, 1, 20, NULL),
	(@assaultRcmT1, @assaultRcmT2, @group, 2, 20, NULL),
	(@assaultRcmT2, @assaultRcmT3, @group, 3, 20, NULL),
	(@assaultRcmT3, @assaultRcmT4, @group, 4, 20, NULL),
	
	(@assaultRcmT1, @spectator, @group, 2, 19, NULL),
	
	(@assaultRcmT1, @syndicateAssaultDrone, @group, 2, 21, NULL),
	(@syndicateAssaultDrone, @nuimqolAssaultDrone, @group, 3, 22, NULL),
	(@syndicateAssaultDrone, @thelodicaAssaultDrone, @group, 3, 23, NULL),
	(@syndicateAssaultDrone, @pelistalAssaultDrone, @group, 3, 24, NULL),
	
	(@parent, @tacticalRcmT1, @group, 1, 25, NULL),
	(@tacticalRcmT1, @tacticalRcmT2, @group, 2, 25, NULL),
	(@tacticalRcmT2, @tacticalRcmT3, @group, 3, 25, NULL),
	(@tacticalRcmT3, @tacticalRcmT4, @group, 4, 25, NULL),
	
	(@tacticalRcmT1, @syndicateAttackDrone, @group, 2, 26, NULL),
	(@syndicateAttackDrone, @nuimqolAttackDrone, @group, 3, 27, NULL),
	(@syndicateAttackDrone, @thelodicaAttackDrone, @group, 3, 28, NULL),
	(@syndicateAttackDrone, @pelistalAttackDrone, @group, 3, 29, NULL),
	
	(@parent, @industrialRcmT1, @group, 1, 30, NULL),
	(@industrialRcmT1, @industrialRcmT2, @group, 2, 30, NULL),
	(@industrialRcmT2, @industrialRcmT3, @group, 3, 30, NULL),
	(@industrialRcmT3, @industrialRcmT4, @group, 4, 30, NULL),
	
	(@industrialRcmT1, @miningIndustrialDrone, @group, 2, 31, NULL),
	(@industrialRcmT1, @harvestingIndustrialDrone, @group, 2, 32, NULL),
	
	(@parent, @supportRcmT1, @group, 1, 33, NULL),
	(@supportRcmT1, @supportRcmT2, @group, 2, 33, NULL),
	(@supportRcmT2, @supportRcmT3, @group, 3, 33, NULL),
	(@supportRcmT3, @supportRcmT4, @group, 4, 33, NULL),
	
	(@supportRcmT1, @repairSupportDrone, @group, 2, 34, NULL)

GO

---- Nerf Preachers Scorchers

DECLARE @targetDefinition INT
DECLARE @field INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'electric_damage_modifier')

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_vagabond')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @targetDefinition AND field = @field
END

--

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_zenith')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @targetDefinition AND field = @field
END

--

SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_cultist_preacher_ictus')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @targetDefinition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@targetDefinition, @field, 1.2)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 1.2 WHERE definition = @targetDefinition AND field = @field
END

GO

---- Increase drones extensions complexity

UPDATE extensions SET rank = 9, price = 405000 WHERE extensionname = 'ext_drone_amplification_damage'
UPDATE extensions SET rank = 5, price = 125000 WHERE extensionname = 'ext_drone_amplification_locking_time'
UPDATE extensions SET rank = 7, price = 245000 WHERE extensionname = 'ext_drone_amplification_cycle_time'
UPDATE extensions SET rank = 6, price = 180000 WHERE extensionname = 'ext_drone_amplification_armor_max'
UPDATE extensions SET rank = 9, price = 405000 WHERE extensionname = 'ext_drone_amplification_mining_amount'
UPDATE extensions SET rank = 9, price = 405000 WHERE extensionname = 'ext_drone_amplification_harvesting_amount'
UPDATE extensions SET rank = 9, price = 405000 WHERE extensionname = 'ext_drone_amplification_remote_repair_amount'
UPDATE extensions SET rank = 4, price = 80000 WHERE extensionname = 'ext_drone_amplification_remote_repair_cycle_time'
UPDATE extensions SET rank = 8, price = 320000 WHERE extensionname = 'ext_drone_amplification_core_max'
UPDATE extensions SET rank = 8, price = 320000 WHERE extensionname = 'ext_drone_amplification_core_recharge_time'
UPDATE extensions SET rank = 6, price = 180000 WHERE extensionname = 'ext_drone_amplification_long_range'
UPDATE extensions SET rank = 6, price = 180000 WHERE extensionname = 'ext_drone_amplification_accuracy'

GO

---- Add new aggregate fields for drones

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_speed_max_modifier', 0,'drone_amplification_speed_max_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone max speed bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_speed_max_modifier_modifier', 1,'drone_amplification_speed_max_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone max speed bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_reactor_radiation_modifier', 0,'drone_amplification_reactor_radiation_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone reactor stability bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_reactor_radiation_modifier_modifier', 1,'drone_amplification_reactor_radiation_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone reactor stability bonus extender')
END

GO

---- Link base value with modifier via category flag

DECLARE @category INT
DECLARE @base INT
DECLARE @modifier INT

-- all remote controllers

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_controllers')

-- Speed max

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Reactor stability

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

GO

---- Add new extensions

DECLARE @extensionsCategory INT
DECLARE @field INT

SET @extensionsCategory = (SELECT TOP 1 extensioncategoryid FROM extensioncategories WHERE categoryname = 'extcat_drones_operations')

-- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_speed_max')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(392, 'ext_drone_amplification_speed_max', @extensionsCategory, 6, 'attributeA', 0.05, '', 180000, 1, 'ext_drone_amplification_speed_max_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.05 WHERE extensionname = 'ext_drone_amplification_speed_max'
END

-- Reactor stability

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_reactor_radiation')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(393, 'ext_drone_amplification_reactor_radiation', @extensionsCategory, 9, 'attributeA', -0.03, '', 405000, 1, 'ext_drone_amplification_reactor_radiation_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.03 WHERE extensionname = 'ext_drone_amplification_reactor_radiation'
END

GO

---- Set up additional aggregate fields for remote controllers

DECLARE @definition INT
DECLARE @field INT

---- Tactical

---- Drone amplification speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Drone amplification reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Assault

---- Drone amplification speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Drone amplification reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Industrial

---- Drone amplification speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Drone amplification reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Support

---- Drone amplification speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_speed_max_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Drone amplification reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_reactor_radiation_modifier')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

GO

---- Set up aggregate fields for remote controllers

DECLARE @definition INT
DECLARE @field INT

-- Assault

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 250)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 250 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 225)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 225 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 214)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 214 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 270)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 270 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 257)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 257 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 285)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 285 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 271)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 271 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_assault_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 57)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 57 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 64)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 64 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 70)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 70 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

-- Tactical

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 125)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 125 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 113)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 113 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 107)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 107 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 129)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 129 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 143)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 143 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 136)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 136 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 57)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 57 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 64)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 64 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 70)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 70 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

-- Industrial

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 125)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 125 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 113)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 113 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 107)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 107 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 129)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 129 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 143)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 143 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 136)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 136 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 57)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 57 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 64)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 64 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 70)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 70 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

-- Support

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 125)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 125 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 113)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 113 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 107)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 107 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 129)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 129 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 143)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 143 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 136)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 136 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 65 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 60 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 57)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 57 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 64)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 64 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 70)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 70 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 67)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 67 WHERE definition = @definition AND field = @field
END

GO

---- Add missing aggregate fields to new prototypes

DECLARE @definition INT
DECLARE @field INT

-- Tactical

---- Max bandwidth

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

---- Accumulator usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2000 WHERE definition = @definition AND field = @field
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

-- Industrial

---- Max bandwidth

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

---- Accumulator usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2000 WHERE definition = @definition AND field = @field
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

-- Support

---- Max bandwidth

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

---- Accumulator usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2000 WHERE definition = @definition AND field = @field
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

---- Drones operational range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_operational_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

GO

---- Add new aggregate fields for RCM

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('cpu_usage_remote_controller_modifier', 0,'cpu_usage_remote_controller_modifier_unit', 100, -100, 1, 0, 0, 1, 'RCM CPU usage')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('powergrid_usage_remote_controller_modifier', 0,'powergrid_usage_remote_controller_modifier_unit', 100, -100, 1, 0, 0, 1, 'RCM Powergrid usage')
END

GO

---- Add new extensions to manage CPU and Powergrid usage

DECLARE @extensionsCategory INT
DECLARE @field INT

SET @extensionsCategory = (SELECT TOP 1 extensioncategoryid FROM extensioncategories WHERE categoryname = 'extcat_remote_command')

-- CPU usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_rcm_cpu_upgrade')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(394, 'ext_rcm_cpu_upgrade', @extensionsCategory, 4, 'attributeD', -0.03, 'attributeB', 80000, 1, 'ext_rcm_cpu_upgrade_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.03 WHERE extensionname = 'ext_rcm_cpu_upgrade'
END

-- Powergrid usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_rcm_powergrid_upgrade')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(395, 'ext_rcm_powergrid_upgrade', @extensionsCategory, 4, 'attributeD', -0.03, 'attributeB', 80000, 1, 'ext_rcm_powergrid_upgrade_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.03 WHERE extensionname = 'ext_drone_amplification_reactor_radiation'
END

---- Set up aggregate modifiers for remote controllers

DECLARE @destinationCategoryFlag INT
DECLARE @baseField INT
DECLARE @modifierField INT

-- Assault

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_assault_remote_controllers')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- Tactical

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_tactical_remote_controllers')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- Industrial

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_industrial_remote_controllers')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

-- Support

SET @destinationCategoryFlag = (SELECT TOP 1 value FROM categoryflags WHERE name = 'cf_support_remote_controllers')

DELETE FROM aggregatemodifiers WHERE categoryflag = @destinationCategoryFlag

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

SET @baseField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifierField = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

INSERT INTO aggregatemodifiers (categoryflag, basefield, modifierfield) VALUES
(@destinationCategoryFlag, @baseField, @modifierField)

GO

---- Link base value with modifier via category flag

DECLARE @category INT
DECLARE @base INT
DECLARE @modifier INT

-- all remote controllers

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_controllers')

-- CPU usage

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage_remote_controller_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Reactor stability

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage_remote_controller_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

GO

---- Stop running Production

UPDATE productionlines SET runningproductionid = NULL

DELETE FROM runningproduction

GO

---- Replace old stuff with new analogue

DECLARE @sourceDefinition INT
DECLARE @targetDefinition INT

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_sentry_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_sentry_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_sentry_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_sentry_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_mining_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_mining_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_mining_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mining_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_harvesting_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_harvesting_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_harvesting_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_harvesting_turret_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_pelistal_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_pelistal_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_pelistal_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_pelistal_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_nuimqol_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_nuimqol_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_nuimqol_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_nuimqol_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_thelodica_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_thelodica_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_thelodica_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

--

SET @sourceDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_thelodica_combat_drone_unit')
SET @targetDefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

UPDATE entities SET definition = @targetDefinition WHERE definition = @sourceDefinition

GO