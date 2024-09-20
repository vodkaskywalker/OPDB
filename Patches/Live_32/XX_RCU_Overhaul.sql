---- Remove obsolete values

DECLARE @field INT
DECLARE @definition INT

---- Mining amount modifier

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mining_amount_modifier')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

---- Harvesting amount modifier

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'harvesting_amount_modifier')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

---- Cycle time

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

-- Mining turrets

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mining_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

-- Harvesting turrets

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

-- Mining turrets

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mining_amount_modifier')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_mining_turret')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_mining_turret')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_mining_turret')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_mining_turret')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

-- Harvesting turrets

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mining_amount_modifier')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_standart_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_harvesting_turret_unit')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

--

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'cycle_time')

-- Drillers

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_standart_industrial_turret_driller')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)

--

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_named1_industrial_turret_driller')

--

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)

--

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_named2_industrial_turret_driller')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)

--

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_named3_industrial_turret_driller')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)

-- Harvesters

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_standart_industrial_turret_harvester')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)

--

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_named1_industrial_turret_harvester')

--

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 12500)

--

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_named2_industrial_turret_harvester')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)

--

SET @definition = (SELECT TOP 1 definition FROM entityDefaults WHERE definitionname = 'def_named3_industrial_turret_harvester')

DELETE FROM aggregatevalues WHERE field = @field AND definition = @definition

INSERT INTO aggregatevalues (definition, field, value) VALUES (@definition, @field, 10000)

GO

---- Add mining bonus to Spectator chassis

DECLARE @definition INT
DECLARE @extension INT
DECLARE @field INT

--

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_mining_turrets_experience')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'mining_amount_modifier')

-- Spectator
    
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis')

IF NOT EXISTS (SELECT 1 FROM chassisbonus WHERE definition = @definition AND extension = @extension AND targetpropertyID = @field)
BEGIN
	INSERT INTO chassisbonus (definition, extension, bonus, targetpropertyID, effectenhancer) VALUES
	(@definition, @extension, 0.03, @field, 0)
END

-- Spectator prototype
    
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis_pr')

IF NOT EXISTS (SELECT 1 FROM chassisbonus WHERE definition = @definition AND extension = @extension AND targetpropertyID = @field)
BEGIN
	INSERT INTO chassisbonus (definition, extension, bonus, targetpropertyID, effectenhancer) VALUES
	(@definition, @extension, 0.03, @field, 0)
END

--

SET @extension = (SELECT TOP 1 extensionid FROM extensions WHERE extensionname = 'ext_harvesting_turrets_experience')

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'harvesting_amount_modifier')

-- Spectator
    
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis')

IF NOT EXISTS (SELECT 1 FROM chassisbonus WHERE definition = @definition AND extension = @extension AND targetpropertyID = @field)
BEGIN
	INSERT INTO chassisbonus (definition, extension, bonus, targetpropertyID, effectenhancer) VALUES
	(@definition, @extension, 0.03, @field, 0)
END

-- Spectator prototype
    
SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis_pr')

IF NOT EXISTS (SELECT 1 FROM chassisbonus WHERE definition = @definition AND extension = @extension AND targetpropertyID = @field)
BEGIN
	INSERT INTO chassisbonus (definition, extension, bonus, targetpropertyID, effectenhancer) VALUES
	(@definition, @extension, 0.03, @field, 0)
END

GO