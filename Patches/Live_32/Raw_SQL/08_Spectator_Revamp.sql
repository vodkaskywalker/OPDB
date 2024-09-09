---- Nerf Spectator base stats

DECLARE @definition INT
DECLARE @field INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_head')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 65)
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

UPDATE aggregatevalues SET value = 8000 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

UPDATE aggregatevalues SET value = 8000 WHERE definition = @definition AND field = @field

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

UPDATE aggregatevalues SET value = 9 WHERE definition = @definition AND field = @field

GO

---- Nerf Spectator chassis bonuses

DECLARE @definition INT
DECLARE @extension INT
DECLARE @field INT

-- Chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis')

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_glider_specialist')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation_modifier')

DELETE FROM chassisbonus WHERE definition = @definition AND extension = @extension AND targetpropertyID = @field

GO

---- Create category flags for extra remote controllers

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_tactical_remote_controllers' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(17564687, 'cf_tactical_remote_controllers', 'Tactical remote controllers', 0, 1)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_assault_remote_controllers' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(34341903, 'cf_assault_remote_controllers', 'Assault remote controllers', 0, 1)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_industrial_remote_controllers' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(51119119, 'cf_industrial_remote_controllers', 'Industrial remote controllers', 0, 1)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_support_remote_controllers' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(67896335, 'cf_support_remote_controllers', 'Support remote controllers', 0, 1)
END

GO

---- Create category flags for extra rcu as ammo

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_attack_drones_units' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(201226, 'cf_attack_drones_units', 'Attack drones units', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_assault_drones_units' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(266762, 'cf_assault_drones_units', 'Assault drones units', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_industrial_drones_units' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(332298, 'cf_industrial_drones_units', 'Industrial drones units', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_support_drones_units' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(397834, 'cf_support_drones_units', 'Support drones units', 0, 0)
END

---- Create category flags for extra rcu as zone object

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_assault_drones' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(4498, 'cf_assault_drones', 'Assault drones', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_industrial_drones' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(4754, 'cf_industrial_drones', 'Industrial drones', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_support_drones' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(5010, 'cf_support_drones', 'Support drones', 0, 0)
END

IF NOT EXISTS (SELECT 1 FROM categoryflags WHERE name = 'cf_attack_drones' )
BEGIN
	INSERT INTO categoryflags (value, name, note, hidden, isunique) VALUES
	(5266, 'cf_attack_drones', 'Attack drones', 0, 0)
END

GO

---- Rename existing remote controllers

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_remote_controllers')

UPDATE entitydefaults SET
	definitionname = 'def_standard_assault_remote_controller',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i3  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t1'
WHERE definitionname = 'def_standart_remote_controller'

UPDATE entitydefaults SET
	definitionname = 'def_standard_assault_remote_controller_cprg'
WHERE definitionname = 'def_standart_remote_controller_cprg'

--

UPDATE entitydefaults SET
	definitionname = 'def_named1_assault_remote_controller',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i3  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2'
WHERE definitionname = 'def_named1_remote_controller'

UPDATE entitydefaults SET
	definitionname = 'def_named1_assault_remote_controller_pr',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i3  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2_pr'
WHERE definitionname = 'def_named1_remote_controller_pr'

UPDATE entitydefaults SET
	definitionname = 'def_named1_assault_remote_controller_cprg'
WHERE definitionname = 'def_named1_remote_controller_cprg'

--

UPDATE entitydefaults SET
	definitionname = 'def_named2_assault_remote_controller',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i4  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3'
WHERE definitionname = 'def_named2_remote_controller'

UPDATE entitydefaults SET
	definitionname = 'def_named2_assault_remote_controller_pr',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i4  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3_pr'
WHERE definitionname = 'def_named2_remote_controller_pr'

UPDATE entitydefaults SET
	definitionname = 'def_named2_assault_remote_controller_cprg'
WHERE definitionname = 'def_named2_remote_controller_cprg'

--

UPDATE entitydefaults SET
	definitionname = 'def_named3_assault_remote_controller',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i5  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4'
WHERE definitionname = 'def_named3_remote_controller'

UPDATE entitydefaults SET
	definitionname = 'def_named3_assault_remote_controller_pr',
	descriptiontoken = 'def_standard_assault_remote_controller_desc',
	categoryflags = @categoryFlag,
	options = '#moduleFlag=i888  #ammoCapacity=i5  #ammoType=L4120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4_pr'
WHERE definitionname = 'def_named3_remote_controller_pr'

UPDATE entitydefaults SET
	definitionname = 'def_named3_assault_remote_controller_cprg'
WHERE definitionname = 'def_named3_remote_controller_cprg'

GO

---- Create extra remote controllers

-- Tactical

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_tactical_remote_controllers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_tactical_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i3  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t1', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 1)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_tactical_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i3  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 2)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_tactical_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i3  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2_pr', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 2)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_tactical_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i4  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 3)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_tactical_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i4  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3_pr', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 3)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_tactical_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i5  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 4)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_tactical_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=i848  #ammoCapacity=i5  #ammoType=L3120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4_pr', 1, 1, 1, 0, 100, 'def_standard_tactical_remote_controller_desc', 1, 1, 4)
END

--

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_electronics_equipment_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_tactical_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t1', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_tactical_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t2', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_tactical_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t3', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_tactical_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t4', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

-- Industrial

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_remote_controllers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_industrial_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i3  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t1', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 1)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_industrial_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i3  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 2)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_industrial_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i3  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2_pr', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 2)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_industrial_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i4  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 3)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_industrial_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i4  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3_pr', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 3)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_industrial_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i5  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 4)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_industrial_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=iA08  #ammoCapacity=i5  #ammoType=L5120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4_pr', 1, 1, 1, 0, 100, 'def_standard_industrial_remote_controller_desc', 1, 1, 4)
END

--

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_electronics_equipment_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_industrial_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t1', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_industrial_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t2', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_industrial_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t3', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_industrial_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t4', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

-- Support

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_support_remote_controllers')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_support_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i3  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t1', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 1)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_support_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i3  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 2)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_support_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i3  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t2_pr', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 2)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_support_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i4  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 3)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_support_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i4  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t3_pr', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 3)
END

--

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_support_remote_controller', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i5  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 4)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_support_remote_controller_pr', 1, 2359320, @categoryFlag, '#moduleFlag=iC08  #ammoCapacity=i5  #ammoType=L6120a  #powergrid_usage=f0.00  #cpu_usage=f0.00  #tier=$tierlevel_t4_pr', 1, 1, 1, 0, 100, 'def_standard_support_remote_controller_desc', 1, 1, 4)
END

--

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_electronics_equipment_calibration_programs')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_standard_support_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t1', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 1)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named1_support_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t2', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 2)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named2_support_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t3', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 3)
END

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_cprg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_named3_support_remote_controller_cprg', 1, 1024, @categoryFlag, '#tier=$tierlevel_t4', 1, 0.01, 0.1, 0, 100, 'calibration_program_desc', 0, 1, 4)
END

GO

---- Create entity defaults for Syndicate Assault Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone_head', 1, 1024, @category, '#height=f0.2#slotFlags=48,8,8,8,8', 1, 3, 1000, 1, 100, 'def_syndicate_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone_chassis', 1, 1024, @category, '#height=f1.1#slotFlags=44d1,4d1,d1', 1, 13, 30000, 1, 100, 'def_syndicate_assault_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone_leg', 1, 1024, @category, '#height=f1.15#slotFlags=420,20,20,20,20', 1, 7, 4000, 1, 100, 'def_syndicate_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_syndicate_assault_drone_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate assault drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_assault_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_syndicate_assault_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate assault drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_longrange_standard_medium_autocannon')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_projectile_rewa')

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'syndicate_assault_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i96]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i96]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i96]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('syndicate_assault_drone', @description, 'Syndicate assault drone')
END

GO

---- Link Syndicate assault drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'syndicate_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'Syndicate assault drone')
END

GO

---- Set up aggregate fields for Syndicate assault drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3520)
END

---- Damage chemical

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Damage explosive

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

---- Damage thermal

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

---- Damage toxic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_toxic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 8000)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'accuracy')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 22)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 28)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

GO

---- Set up aggregate fields for Syndicate assault drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 370)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 405)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3520)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3080)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 720)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1200)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 22)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.847)
END

GO

---- Create entity defaults for nuimqol Assault Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone_head', 1, 1024, @category, '#slotFlags=48,8,8,8  #height=f0.15', 1, 3, 1000, 1, 100, 'def_nuimqol_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone_chassis', 1, 1024, @category, '#height=f1.1#slotFlags=420,20,20,20', 1, 13, 25000, 1, 100, 'def_nuimqol_assault_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone_leg', 1, 1024, @category, '#slotFlags=420  #height=f0.9', 1, 7, 4000, 1, 100, 'def_nuimqol_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_nuimqol_assault_drone_desc', 1, NULL, NULL)
END

GO

---- Create nuimqol assault drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_assault_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_nuimqol_assault_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create nuimqol assault drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_longrange_standard_medium_railgun')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_railgun_d')

-- T1

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'nuimqol_assault_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('nuimqol_assault_drone', @description, 'nuimqol assault drone')
END

GO

---- Link nuimqol assault drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'nuimqol_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'nuimqol assault drone')
END

GO

---- Set up aggregate fields for nuimqol assault drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2880)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 48)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'accuracy')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 14)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 29)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7.5)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

GO

---- Set up aggregate fields for nuimqol assault drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 365)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 33)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 405)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2880)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3300)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 720)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1075)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2.13)
END

GO

---- Create entity defaults for thelodica Assault Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone_head', 1, 1024, @category, '#height=f0.1#slotFlags=48,8,8,8,8,8', 1, 3, 1000, 1, 100, 'def_thelodica_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone_chassis', 1, 1024, @category, '#height=f0.75#slotFlags=44d1,4d1,d1', 1, 13, 25000, 1, 100, 'def_thelodica_assault_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone_leg', 1, 1024, @category, '#height=f0.95#slotFlags=420,20,20,20', 1, 7, 4000, 1, 100, 'def_thelodica_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_thelodica_assault_drone_desc', 1, NULL, NULL)
END

GO

---- Create thelodica assault drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_assault_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_thelodica_assault_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create thelodica assault drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_longrange_standard_medium_laser')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_medium_lasercrystal_d')

-- T1

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'thelodica_assault_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('thelodica_assault_drone', @description, 'thelodica assault drone')
END

GO

---- Link thelodica assault drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'thelodica_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'thelodica assault drone')
END

GO

---- Set up aggregate fields for thelodica assault drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3200)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 48)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6000)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'accuracy')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

GO

---- Set up aggregate fields for thelodica assault drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 315)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 35)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 405)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3200)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3440)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 720)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1375)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.95)
END

GO

---- Create entity defaults for pelistal Assault Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone_head', 1, 1024, @category, '#height=f0.2#slotFlags=48,8,8,8', 1, 3, 1000, 1, 100, 'def_pelistal_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone_chassis', 1, 1024, @category, '#height=f0.8#slotFlags=44d0,4d0,d2,d2,492', 1, 13, 22000, 1, 100, 'def_pelistal_assault_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone_leg', 1, 1024, @category, '#slotFlags=420,20,20,20  #height=f1.15', 1, 7, 4000, 1, 100, 'def_pelistal_assault_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_pelistal_assault_drone_desc', 1, NULL, NULL)
END

GO

---- Create pelistal assault drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_assault_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_pelistal_assault_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create pelistal assault drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_missile_launcher')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_longrange_missile_d')

-- T1

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'pelistal_assault_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i4|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]|m3=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i5|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('pelistal_assault_drone', @description, 'pelistal assault drone')
END

GO

---- Link pelistal assault drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'pelistal_assault_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'pelistal assault drone')
END

GO

---- Set up aggregate fields for pelistal assault drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3200)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 14000)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'explosion_radius')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 13)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

GO

---- Set up aggregate fields for pelistal assault drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 418)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 34)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 405)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_chassis')

---- Missile miss

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'missile_miss')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3200)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2600)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 720)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1125)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1.95)
END

GO

---- Create entity defaults for Syndicate attack Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone_head', 1, 1024, @category, '#height=f0.01#slotFlags=48,8,8,8', 1, 3, 300, 1, 100, 'def_syndicate_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone_chassis', 1, 1024, @category, '#height=f0.45#slotFlags=4451,6d1,451,6d1', 1, 8, 8400, 1, 100, 'def_syndicate_attack_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone_leg', 1, 1024, @category, '#height=f0.35#slotFlags=420,20,20', 1, 3, 1700, 1, 100, 'def_syndicate_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_syndicate_attack_drone_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate attack drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_syndicate_attack_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_syndicate_attack_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate attack drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_small_autocannon')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_small_projectile_rewa')

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'syndicate_attack_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=ic8]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=ic8]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=ic8]|m3=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i4|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=ic8]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('syndicate_attack_drone', @description, 'Syndicate attack drone')
END

GO

---- Link Syndicate attack drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'syndicate_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'Syndicate attack drone')
END

GO

---- Set up aggregate fields for Syndicate attack drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 996)
END

---- Damage chemical

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Damage explosive

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Damage thermal

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Damage toxic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_toxic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3200)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'accuracy')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 6)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7.5)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12.5)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

GO

---- Set up aggregate fields for Syndicate attack drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 19)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 130)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 280)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 125)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 105)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 996)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 240)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4.5)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.083)
END

GO

---- Create entity defaults for nuimqol attack Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone_head', 1, 1024, @category, '#height=f0.01#slotFlags=48,8,8', 1, 3, 300, 1, 100, 'def_nuimqol_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone_chassis', 1, 1024, @category, '#height=f0.45#slotFlags=4451,6d1,451,6d3', 1, 13, 7100, 1, 100, 'def_nuimqol_attack_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone_leg', 1, 1024, @category, '#height=f0.35#slotFlags=420,20,20,20', 1, 7, 1700, 1, 100, 'def_nuimqol_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_nuimqol_attack_drone_desc', 1, NULL, NULL)
END

GO

---- Create nuimqol attack drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_nuimqol_attack_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_nuimqol_attack_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create nuimqol attack drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_small_railgun')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_small_railgun_d')

-- T1

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'nuimqol_attack_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]|m3=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i4|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i32]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('nuimqol_attack_drone', @description, 'nuimqol attack drone')
END

GO

---- Link nuimqol attack drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'nuimqol_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'nuimqol attack drone')
END

GO

---- Set up aggregate fields for nuimqol attack drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 816)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 24)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'accuracy')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0.5)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

GO

---- Set up aggregate fields for nuimqol attack drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 17)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 280)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 816)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.527)
END

GO

---- Create entity defaults for thelodica attack Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone_head', 1, 1024, @category, '#height=f0.01#slotFlags=48,8,8', 1, 3, 300, 1, 100, 'def_thelodica_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone_chassis', 1, 1024, @category, '#height=f0.3#slotFlags=4451,6d1,451,6d3', 1, 13, 7100, 1, 100, 'def_thelodica_attack_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone_leg', 1, 1024, @category, '#height=f0.3#slotFlags=420,20,20,20', 1, 7, 1700, 1, 100, 'def_thelodica_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_thelodica_attack_drone_desc', 1, NULL, NULL)
END

GO

---- Create thelodica attack drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_thelodica_attack_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_thelodica_attack_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create thelodica attack drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_small_laser')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_small_lasercrystal_d')

-- T1

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'thelodica_attack_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]|m3=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i4|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i78]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('thelodica_attack_drone', @description, 'thelodica attack drone')
END

GO

---- Link thelodica attack drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'thelodica_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'thelodica attack drone')
END

GO

---- Set up aggregate fields for thelodica attack drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 912)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 24)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4000)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'accuracy')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

---- Falloff

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'falloff')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

GO

---- Set up aggregate fields for thelodica attack drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 19)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 280)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 912)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 360)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.222)
END

GO

---- Create entity defaults for pelistal attack Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone_head', 1, 1024, @category, '#height=f0.01#slotFlags=48,8,8,8', 1, 3, 300, 1, 100, 'def_pelistal_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone_chassis', 1, 1024, @category, '#height=f0.25#slotFlags=452,d2,52,d3', 1, 13, 6840, 1, 100, 'def_pelistal_attack_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone_leg', 1, 1024, @category, '#height=f0.5#slotFlags=420,20,20', 1, 7, 1700, 1, 100, 'def_pelistal_attack_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_pelistal_attack_drone_desc', 1, NULL, NULL)
END

GO

---- Create pelistal attack drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_attack_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_pelistal_attack_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_pelistal_attack_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create pelistal attack drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @ammo INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_rocket_launcher')
SET @ammo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_ammo_rocket_b')

-- T1

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'pelistal_attack_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]|m2=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i3|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]|m3=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i4|ammoDefinition=i', FORMAT(@ammo, 'X'), '|ammoQuantity=i14]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('pelistal_attack_drone', @description, 'pelistal attack drone')
END

GO

---- Link pelistal attack drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'pelistal_attack_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'pelistal attack drone')
END

GO

---- Set up aggregate fields for pelistal attack drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 912)
END

---- Damage kinetic

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'damage_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 40)
END

---- Weapon cycle

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END

---- Accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'explosion_radius')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4.5)
END

---- Optimal range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

GO

---- Set up aggregate fields for pelistal attack drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 204)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 18)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 15)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 280)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_chassis')

---- Missile miss

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'missile_miss')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 1)
END

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 912)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 270)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 140)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.222)
END

GO

---- Create entity defaults for industrial Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone_head', 1, 1024, @category, '#slotFlags=48,8,8,8  #height=f0.10', 1, 3, 225, 1, 100, 'def_mining_industrial_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone_chassis', 1, 1024, @category, '#slotFlags=46d3,6d3  #height=f2.00  #decay=n500', 1, 8, 6250, 1, 100, 'def_mining_industrial_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone_leg', 1, 1024, @category, '#slotFlags=420  #height=f1.50', 1, 3, 1875, 1, 100, 'def_mining_industrial_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_mining_industrial_drone_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate industrial drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone'), ' #turretType=$IndustrialDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_mining_industrial_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_mining_industrial_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create industrial drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_industrial_turret_driller')

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'mining_industrial_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('mining_industrial_drone', @description, 'Mining industrial drone')
END

GO

---- Link mining industrial drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'mining_industrial_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'Mining industrial drone')
END

GO

---- Set up aggregate fields for Mining industrial drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

GO

---- Set up aggregate fields for Mining industrial drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 175)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 840)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 360)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2.75)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.05)
END

GO

---- Create entity defaults for industrial Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone_head', 1, 1024, @category, '#slotFlags=48,8,8,8  #height=f0.10', 1, 3, 225, 1, 100, 'def_harvesting_industrial_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone_chassis', 1, 1024, @category, '#slotFlags=46d3,6d3  #height=f2.00  #decay=n500', 1, 8, 6250, 1, 100, 'def_harvesting_industrial_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone_leg', 1, 1024, @category, '#slotFlags=420  #height=f1.50', 1, 3, 1875, 1, 100, 'def_harvesting_industrial_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_harvesting_industrial_drone_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate industrial drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone'), ' #turretType=$IndustrialDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_harvesting_industrial_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_harvesting_industrial_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create industrial drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_industrial_turret_harvester')

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'harvesting_industrial_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('harvesting_industrial_drone', @description, 'harvesting industrial drone')
END

GO

---- Link harvesting industrial drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'harvesting_industrial_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'harvesting industrial drone')
END

GO

---- Set up aggregate fields for harvesting industrial drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

GO

---- Set up aggregate fields for harvesting industrial drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 175)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 840)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 360)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2.75)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.05)
END

GO

---- Create entity defaults for repair support Drones

DECLARE @category INT

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_head')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_head')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone_head', 1, 1024, @category, '#slotFlags=48,8,8,8  #height=f0.10', 1, 3, 225, 1, 100, 'def_repair_support_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_chassis')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_chassis')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone_chassis', 1, 1024, @category, '#slotFlags=46d3,6d3  #height=f2.00  #decay=n500', 1, 8, 6250, 1, 100, 'def_repair_support_drone_chassis_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_leg')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_leg')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone_leg', 1, 1024, @category, '#slotFlags=420  #height=f1.50', 1, 3, 1875, 1, 100, 'def_repair_support_drone_desc', 0, NULL, NULL)
END

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_robot_inventory')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_inventory')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone_inventory', 1, 4195336, @category, '#capacity=f120.0', 1, 0, 0, 0, 100, 'def_robot_inventory_desc', 0, NULL, NULL)
END

DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_inventory')

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_support_drones')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone', 1, 1024, @category, CONCAT('#head=n', @head, '  #chassis=n', @chassis, '  #leg=n', @leg, '  #inventory=n', @cargo), 1, 22.5, 0, 0, 100, 'def_repair_support_drone_desc', 1, NULL, NULL)
END

GO

---- Create Syndicate support drones ammo 

DECLARE @categoryFlag INT
DECLARE @options VARCHAR(MAX)

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_support_drones_units')

SET @options = CONCAT('#turretId=i', (SELECT TOP 1 FORMAT(definition, 'X') FROM entitydefaults WHERE definitionname = 'def_repair_support_drone'), ' #turretType=$CombatDrone')

IF NOT EXISTS (SELECT 1 FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')
BEGIN
	INSERT INTO entitydefaults (definitionname, quantity, attributeflags, categoryflags, options, enabled, volume, mass, hidden, health, descriptiontoken, purchasable, tiertype, tierlevel) VALUES
	('def_repair_support_drone_unit', 10, 2048, @categoryFlag, @options, 1, 2.5, 1, 0, 100, 'def_repair_support_drone_unit_desc', 1, NULL, NULL)
END

GO

---- Create support drones templates

DECLARE @robot INT
DECLARE @head INT
DECLARE @chassis INT
DECLARE @leg INT
DECLARE @cargo INT
DECLARE @gunDefinitionId INT
DECLARE @description VARCHAR(MAX)

SET @head = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_head')
SET @chassis = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_chassis')
SET @leg = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_leg')
SET @cargo = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_inventory')
SET @gunDefinitionId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_small_remote_armor_repairer')

SET @robot = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplates WHERE name = 'repair_support_drone')
BEGIN
	SET @description = CONCAT('#robot=i', FORMAT(@robot, 'X'), '#head=i', FORMAT(@head, 'X'), '#chassis=i', FORMAT(@chassis, 'X'), '#leg=i', FORMAT(@leg, 'X'), '#container=i', FORMAT(@cargo, 'X'), '#chassisModules=[|m0=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i1]|m1=[|definition=i', FORMAT(@gunDefinitionId, 'X'), '|slot=i2]]')

	INSERT INTO robottemplates (name, description, note) VALUES
	('repair_support_drone', @description, 'repair support drone')
END

GO

---- Link repair support drone with it's template

DECLARE @turret_def INT
DECLARE @turret_template INT

SET @turret_def = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone')
SET @turret_template = (SELECT TOP 1 id FROM robottemplates WHERE name = 'repair_support_drone')

IF NOT EXISTS (SELECT 1 FROM robottemplaterelation WHERE definition = @turret_def AND templateid = @turret_template)
BEGIN
	INSERT INTO robottemplaterelation (definition, templateid, itemscoresum, raceid, note) VALUES
	(@turret_def, @turret_template, 0, 0, 'repair support drone')
END

GO

---- Set up aggregate fields for repair support drones as ammo

DECLARE @definition INT
DECLARE @field INT

---- Bandwidth usage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_usage')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5)
END

---- Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END

---- Repair amount

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_repair_amount')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 60)
END

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20000)
END

GO

---- Set up aggregate fields for repair support drones

DECLARE @definition INT
DECLARE @field INT

--head

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_head')

---- CPU max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 175)
END

---- Locked targets max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locked_targets_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Locking range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END

---- Locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)
END

---- Sensor strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'sensor_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Blob emission

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3)
END

---- Blob emission radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_emission_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10)
END

---- Blob level low

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_low')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Blob level high

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'blob_level_high')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 155)
END

---- Detection strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'detection_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 80)
END

---- Stealth strength

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'stealth_strength')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END

-- chassis

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_chassis')

---- Ammo reload time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'ammo_reload_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END

---- Armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'armor_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 840)
END

---- Core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 360)
END

---- Core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'core_recharge_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 120)
END

---- Powergrid max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END

---- Resists

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_chemical')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_explosive')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_kinetic')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'resist_thermal')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 45)
END

---- Signature radius

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'signature_radius')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 4)
END

---- Reactor radiation

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'reactor_radiation')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 2.75)
END

---- Mine detection range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mine_detection_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7)
END

-- leg

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_leg')

---- Slope

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'slope')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 56)
END

---- Speed max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'speed_max')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 3.05)
END

GO

---- Set up aggregate fields for extra remote controllers

DECLARE @definition INT
DECLARE @field INT

-- Tactical

---- Max bandwidth

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_bandwidth_max')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 150 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 85 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 77)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 77 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 90 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Cycle time

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2000 WHERE definition = @definition AND field = @field
END

---- Optimal range

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 75 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 68)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 68 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 83)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 83 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 90 WHERE definition = @definition AND field = @field
END

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 150 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 85 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 77)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 77 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 90 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Cycle time

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2000 WHERE definition = @definition AND field = @field
END

---- Optimal range

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 75 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 68)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 68 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 83)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 83 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 90 WHERE definition = @definition AND field = @field
END

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 0)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 150)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 150 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 135)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 135 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 165)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 165 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 180)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 180 WHERE definition = @definition AND field = @field
END

---- CPU usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cpu_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 85)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 85 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 77)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 77 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 90 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 100)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 100 WHERE definition = @definition AND field = @field
END

---- Cycle time

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 3000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 7500)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2500 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 5000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 2000 WHERE definition = @definition AND field = @field
END

---- Optimal range

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 20)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 20 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 25)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 25 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

---- Reactor usage

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'powergrid_usage')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 75)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 75 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 68)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 68 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 83)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 83 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 90)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 90 WHERE definition = @definition AND field = @field
END

---- Rcu Lifetime

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'remote_control_lifetime')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 300000)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 300000 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

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

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standard_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 30)
END
ELSE
BEGIN
	UPDATE aggregatevalues SET value = 30 WHERE definition = @definition AND field = @field
END

GO

---- Add extra head slots for heavy mechs

UPDATE entitydefaults SET options = '#height=f0.15#slotFlags=4848,8,8,8,8,8' WHERE definitionname = 'def_mesmer_head'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8  #height=f0.15  #max_locked_targets=f3.00  #max_targeting_range=f35.00  #sensor_strength=f100.00  #cpu=f375.00' WHERE definitionname = 'def_mesmer_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8  #height=f0.15  #max_locked_targets=f3.00  #max_targeting_range=f35.00  #sensor_strength=f100.00  #cpu=f375.00' WHERE definitionname = 'def_mesmer_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8  #height=f0.15  #max_locked_targets=f3.00  #max_targeting_range=f35.00  #sensor_strength=f100.00  #cpu=f375.00' WHERE definitionname = 'def_mesmer_head_reward1'
UPDATE entitydefaults SET options = '#height=f0.01#slotFlags=4848,8,8,8,8,8,8' WHERE definitionname = 'def_seth_head'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.01  #max_locked_targets=f3.00  #max_targeting_range=f37.50  #sensor_strength=f100.00  #cpu=f325.00' WHERE definitionname = 'def_seth_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.01  #max_locked_targets=f3.00  #max_targeting_range=f37.50  #sensor_strength=f100.00  #cpu=f325.00' WHERE definitionname = 'def_seth_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.01  #max_locked_targets=f3.00  #max_targeting_range=f37.50  #sensor_strength=f100.00  #cpu=f325.00' WHERE definitionname = 'def_seth_head_reward1'
UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4848,8,8,8,8,8,8' WHERE definitionname = 'def_gropho_head'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.20  #max_locked_targets=f3.00  #max_targeting_range=f32.50  #sensor_strength=f100.00  #cpu=f475.00' WHERE definitionname = 'def_gropho_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.20  #max_locked_targets=f3.00  #max_targeting_range=f32.50  #sensor_strength=f100.00  #cpu=f475.00' WHERE definitionname = 'def_gropho_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=4848,8,8,8,8,8,8  #height=f0.20  #max_locked_targets=f3.00  #max_targeting_range=f32.50  #sensor_strength=f100.00  #cpu=f475.00' WHERE definitionname = 'def_gropho_head_reward1'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8  #height=f0.20  #max_locked_targets=f1  #max_targeting_range=f21.0  #sensor_strength=f100  #cpu=f450' WHERE definitionname = 'def_riveler_head'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8,8  #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_riveler_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8 #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_riveler_head_pr'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8  #height=f0.20  #max_locked_targets=f1  #max_targeting_range=f21.0  #sensor_strength=f100  #cpu=f450' WHERE definitionname = 'def_symbiont_head'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8,8  #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_symbiont_head_mk2'
UPDATE entitydefaults SET options = '#slotFlags=4A08,8,8,8,8 #height=f0.20  #max_locked_targets=f1.00  #max_targeting_range=f21.00  #sensor_strength=f100.00  #cpu=f450.00' WHERE definitionname = 'def_symbiont_head_pr'
UPDATE entitydefaults SET options = '#height=f0.2#slotFlags=4848,8,8,8,8,8' WHERE definitionname = 'def_legatus_head'
UPDATE entitydefaults SET options = '#slotFlags=4C08,8,8,8  #height=f0.20' WHERE definitionname = 'def_metis_head'
UPDATE entitydefaults SET options = '#slotFlags=4888,8,8,8,8,8  #height=f0.10', mass=3000  WHERE definitionname = 'def_spectator_head'
UPDATE entitydefaults SET options = '#slotFlags=4888,8,8,8,8,8  #height=f0.10', mass=3000  WHERE definitionname = 'def_spectator_head_pr'

GO

---- Add new effect category

IF NOT EXISTS (SELECT 1 FROM effectcategories WHERE name = 'effcat_drone_amplification')
BEGIN
	INSERT INTO effectcategories (name, flag, maxlevel, note) VALUES
	('effcat_drone_amplification', 50, 1, 'Drone amplification')
END

GO

---- Add new effects

DECLARE @effectCategory BIGINT

SET @effectCategory = 562949953421312

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = 'effect_drone_amplification')
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCategory, 0, 'effect_drone_amplification', 'effect_drone_amplification_desc', 'Drone amplification effect', 0, 0, 1, 0, 0)
END

GO

---- Add new aggregate fields for drones

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_damage_modifier', 0,'drone_amplification_damage_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification damage bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_damage_modifier_modifier', 1,'drone_amplification_damage_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification damage bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_locking_time_modifier', 2,'drone_amplification_locking_time_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification locking time bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_locking_time_modifier_modifier', 1,'drone_amplification_locking_time_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification locking time bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_cycle_time_modifier', 2,'drone_amplification_cycle_time_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification cycle time bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_cycle_time_modifier_modifier', 1,'drone_amplification_cycle_time_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification cycle time bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_armor_max_modifier', 0,'drone_amplification_armor_max_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification armor max bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_armor_max_modifier_modifier', 1,'drone_amplification_armor_max_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification armor max bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_mining_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_mining_amount_modifier', 0,'drone_amplification_mining_amount_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification mining amount bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_mining_amount_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_mining_amount_modifier_modifier', 1,'drone_amplification_mining_amount_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification mining amount bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_harvesting_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_harvesting_amount_modifier', 0,'drone_amplification_harvesting_amount_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification harvesting amount bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_harvesting_amount_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_harvesting_amount_modifier_modifier', 1,'drone_amplification_harvesting_amount_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification harvesting amount bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_amount_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_remote_repair_amount_modifier', 0,'drone_amplification_remote_repair_amount_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification remote repair amount bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_amount_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_remote_repair_amount_modifier_modifier', 1,'drone_amplification_remote_repair_amount_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification remote repair amount bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_cycle_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_remote_repair_cycle_time_modifier', 2,'drone_amplification_remote_repair_cycle_time_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification remote repair cycle time bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_cycle_time_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_remote_repair_cycle_time_modifier_modifier', 1,'drone_amplification_remote_repair_cycle_time_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification remote repair cycle time bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_core_max_modifier', 0,'drone_amplification_core_max_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification core max bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_core_max_modifier_modifier', 1,'drone_amplification_core_max_modifier_modifier_unit', 100, 0, 6, 0, 1, 1, 'Drone amplification core max bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_core_recharge_time_modifier', 0,'drone_amplification_core_recharge_time_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification core recharge time bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_core_recharge_time_modifier_modifier', 1,'drone_amplification_core_recharge_time_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification core max bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_long_range_modifier', 0,'drone_amplification_long_range_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification long range bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_long_range_modifier_modifier', 1,'drone_amplification_long_range_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification long range bonus extender')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_accuracy_modifier', 0,'drone_amplification_accuracy_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification accuracy bonus')
END

IF NOT EXISTS (SELECT 1 FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier_modifier')
BEGIN
	INSERT INTO aggregatefields (name, formula, measurementunit, measurementmultiplier, measurementoffset, category, digits, moreisbetter, usedinconfig, note) VALUES
	('drone_amplification_accuracy_modifier_modifier', 1,'drone_amplification_accuracy_modifier_modifier_unit', 100, 0, 6, 0, 0, 1, 'Drone amplification accuracy bonus extender')
END

GO

---- Link base value with modifier via category flag

DECLARE @category INT
DECLARE @base INT
DECLARE @modifier INT

-- assault remote controllers

-- damage

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_assault_remote_controllers')

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- cycle

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- long range

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Accuracy

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- tactical remote controllers

-- damage

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_tactical_remote_controllers')

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- cycle

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- long range

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Accuracy

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- industrial remote controllers

-- mining amount

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_remote_controllers')

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_mining_amount_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_mining_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- harvesting amount

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_industrial_remote_controllers')

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_harvesting_amount_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_harvesting_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- support remote controllers

-- remote repair amount

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_support_remote_controllers')

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_amount_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- remote repair cycle

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_cycle_time_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_cycle_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- all remote controllers

-- locking time

SET @category = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_remote_controllers')

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Armor max

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Core max

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

-- Core recharge time

SET @base = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier')
SET @modifier = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM [modulepropertymodifiers] WHERE categoryflags = @category AND baseField = @base AND modifierField = @modifier)
BEGIN
	INSERT INTO [modulepropertymodifiers] (categoryflags, baseField, modifierField) VALUES
	(@category, @base, @modifier)
END

GO

---- Add new extensions category

IF NOT EXISTS (SELECT 1 FROM extensioncategories WHERE categoryname = 'extcat_drones_operations')
BEGIN
	INSERT INTO extensioncategories (extensioncategoryid, categoryname, hidden) VALUES
	(11, 'extcat_drones_operations', 0)
END

GO

---- Add new extensions

DECLARE @extensionsCategory INT
DECLARE @field INT

SET @extensionsCategory = (SELECT TOP 1 extensioncategoryid FROM extensioncategories WHERE categoryname = 'extcat_drones_operations')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_damage')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(380, 'ext_drone_amplification_damage', @extensionsCategory, 6, 'attributeA', 0.085, '', 180000, 1, 'ext_drone_amplification_damage_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.085 WHERE extensionname = 'ext_drone_amplification_damage'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_locking_time')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(381, 'ext_drone_amplification_locking_time', @extensionsCategory, 2, 'attributeA', -0.07, '', 20000, 1, 'ext_drone_amplification_locking_time_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.07 WHERE extensionname = 'ext_drone_amplification_locking_time'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_cycle_time')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(382, 'ext_drone_amplification_cycle_time', @extensionsCategory, 4, 'attributeA', -0.05, '', 80000, 1, 'ext_drone_amplification_cycle_time_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.05 WHERE extensionname = 'ext_drone_amplification_cycle_time'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_armor_max')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(383, 'ext_drone_amplification_armor_max', @extensionsCategory, 3, 'attributeA', 0.05, '', 45000, 1, 'ext_drone_amplification_armor_max_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.05 WHERE extensionname = 'ext_drone_amplification_armor_max'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_mining_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_mining_amount')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(384, 'ext_drone_amplification_mining_amount', @extensionsCategory, 6, 'attributeA', 0.05, '', 180000, 1, 'ext_drone_amplification_mining_amount_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.05 WHERE extensionname = 'ext_drone_amplification_mining_amount'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_harvesting_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_harvesting_amount')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(385, 'ext_drone_amplification_harvesting_amount', @extensionsCategory, 6, 'attributeA', 0.05, '', 180000, 1, 'ext_drone_amplification_harvesting_amount_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.05 WHERE extensionname = 'ext_drone_amplification_harvesting_amount'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_amount_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_remote_repair_amount')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(386, 'ext_drone_amplification_remote_repair_amount', @extensionsCategory, 6, 'attributeA', 0.02, '', 180000, 1, 'ext_drone_amplification_remote_repair_amount_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.02 WHERE extensionname = 'ext_drone_amplification_remote_repair_amount'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_cycle_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_remote_repair_cycle_time')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(387, 'ext_drone_amplification_remote_repair_cycle_time', @extensionsCategory, 1, 'attributeA', -0.05, '', 5000, 1, 'ext_drone_amplification_remote_repair_cycle_time_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.05 WHERE extensionname = 'ext_drone_amplification_remote_repair_cycle_time'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_core_max')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(388, 'ext_drone_amplification_core_max', @extensionsCategory, 5, 'attributeA', 0.03, '', 125000, 1, 'ext_drone_amplification_core_max_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.03 WHERE extensionname = 'ext_drone_amplification_core_max'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_core_recharge_time')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(389, 'ext_drone_amplification_core_recharge_time', @extensionsCategory, 5, 'attributeA', -0.03, '', 125000, 1, 'ext_drone_amplification_core_recharge_time_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.03 WHERE extensionname = 'ext_drone_amplification_core_recharge_time'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_long_range')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(390, 'ext_drone_amplification_long_range', @extensionsCategory, 3, 'attributeA', 0.03, '', 45000, 1, 'ext_drone_amplification_long_range_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = 0.03 WHERE extensionname = 'ext_drone_amplification_long_range'
END

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier_modifier')

IF NOT EXISTS (SELECT 1 FROM extensions WHERE extensionname = 'ext_drone_amplification_accuracy')
BEGIN
	INSERT INTO extensions (extensionid, extensionname, category, rank, learningattributeprimary, bonus, note, price, active, description, targetpropertyID, effectenhancer, hidden, freezelimit) VALUES
	(391, 'ext_drone_amplification_accuracy', @extensionsCategory, 3, 'attributeA', -0.03, '', 45000, 1, 'ext_drone_amplification_accuracy_desc', @field, 0, 0, 4)
END
ELSE
BEGIN
	UPDATE extensions SET bonus = -0.03 WHERE extensionname = 'ext_drone_amplification_accuracy'
END

GO

---- Set up additional aggregate fields for remote controllers

DECLARE @definition INT
DECLARE @field INT

---- Tactical

---- Drone amplification damage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier')

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

---- Drone amplification locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier')

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

---- Drone amplification cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier')

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

---- Drone amplification armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier')

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

---- Drone amplification core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier')

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

---- Drone amplification core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier')

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

---- Drone amplification long range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier')

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

---- Drone amplification accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier')

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

---- Drone amplification damage

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_damage_modifier')

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

---- Drone amplification locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier')

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

---- Drone amplification cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_cycle_time_modifier')

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

---- Drone amplification armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier')

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

---- Drone amplification core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier')

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

---- Drone amplification core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier')

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

---- Drone amplification long range

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_long_range_modifier')

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

---- Drone amplification accuracy

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_accuracy_modifier')

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

---- Drone amplification locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier')

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

---- Drone amplification armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier')

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

---- Drone amplification mining amount

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_mining_amount_modifier')

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

---- Drone amplification harvesting amount

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_harvesting_amount_modifier')

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

---- Drone amplification core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier')

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

---- Drone amplification core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier')

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

---- Drone amplification locking time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_locking_time_modifier')

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

---- Drone amplification armor max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_armor_max_modifier')

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

---- Drone amplification remote repair amount

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_amount_modifier')

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

---- Drone amplification remote repair cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_remote_repair_cycle_time_modifier')

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

---- Drone amplification core max

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_max_modifier')

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

---- Drone amplification core recharge time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'drone_amplification_core_recharge_time_modifier')

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

---- Revert obsolete extensions

DECLARE @extensionId INT
DECLARE @accountId INT

DECLARE procAccounts CURSOR LOCAL FORWARD_ONLY FAST_FORWARD FOR
SELECT accountID FROM accounts WHERE DATEDIFF(MONTH, lastloggedin, GETDATE()) < 4

OPEN procAccounts

FETCH NEXT FROM procAccounts INTO @accountId

WHILE @@FETCH_STATUS = 0
BEGIN
	-- Sentry turrets experience
	SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_sentry_turrets_experience')
	EXEC dbo.extensionRevertV2 @accountID, @extensionId
	
	-- Mining turrets experience
	SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_mining_turrets_experience')
	EXEC dbo.extensionRevertV2 @accountID, @extensionId
	
	-- Harvesting turrets experience
	SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_harvesting_turrets_experience')
	EXEC dbo.extensionRevertV2 @accountID, @extensionId
	
	-- Pelistal combat drones experience
	SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_pelistal_combat_drones_experience')
	EXEC dbo.extensionRevertV2 @accountID, @extensionId
	
	-- Nuimqol combat drones experience
	SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_nuimqol_combat_drones_experience')
	EXEC dbo.extensionRevertV2 @accountID, @extensionId
	
	-- Thelodica combat drones experience
	SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_thelodica_combat_drones_experience')
	EXEC dbo.extensionRevertV2 @accountID, @extensionId
	
	FETCH NEXT FROM procAccounts INTO @accountId
END

CLOSE procAccounts

DEALLOCATE procAccounts

---- Disable obsolete extensions

-- Sentry turrets experience

SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_sentry_turrets_experience')

UPDATE extensions SET active = 0, hidden = 1 WHERE extensionid = @extensionId

-- Mining turrets experience

SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_mining_turrets_experience')

UPDATE extensions SET active = 0, hidden = 1 WHERE extensionid = @extensionId

-- Harvesting turrets experience

SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_harvesting_turrets_experience')

UPDATE extensions SET active = 0, hidden = 1 WHERE extensionid = @extensionId

-- Pelistal combat drones experience

SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_pelistal_combat_drones_experience')

UPDATE extensions SET active = 0, hidden = 1 WHERE extensionid = @extensionId

-- Nuimqol combat drones experience

SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_nuimqol_combat_drones_experience')

UPDATE extensions SET active = 0, hidden = 1 WHERE extensionid = @extensionId

-- Thelodica combat drones experience

SET @extensionId = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_thelodica_combat_drones_experience')

UPDATE extensions SET active = 0, hidden = 1 WHERE extensionid = @extensionId

GO

---- Hide obsolete categories

UPDATE categoryFlags SET hidden = 1 WHERE name = 'cf_mining_turret_units'
UPDATE categoryFlags SET hidden = 1 WHERE name = 'cf_harvesting_turret_units'
UPDATE categoryFlags SET hidden = 1 WHERE name = 'cf_nuimqol_combat_drones_units'
UPDATE categoryFlags SET hidden = 1 WHERE name = 'cf_pelistal_combat_drones_units'
UPDATE categoryFlags SET hidden = 1 WHERE name = 'cf_sentry_turret_units'
UPDATE categoryFlags SET hidden = 1 WHERE name = 'cf_thelodica_combat_drones_units'

GO

/*
cf_remote_controlled_turrets
cf_sentry_turret_units
cf_mining_turret_units
cf_harvesting_turret_units
cf_remote_controlled_combat_drones
cf_pelistal_combat_drones_units
cf_nuimqol_combat_drones_units
cf_thelodica_combat_drones_units

cf_combat_drones_units
cf_assault_drones_units
cf_industrial_drones_units
cf_support_drones_units
*/