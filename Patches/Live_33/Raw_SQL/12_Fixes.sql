USE perpetuumsa

GO

-- Remove extra head slot from Seth mk1

UPDATE entitydefaults SET options = '#height=f0.01#slotFlags=48,8,8,8,8,8' WHERE definitionname = 'def_seth_head'

GO

-- Add production duration for landmine detectors

DECLARE @categoryFlag INT

SET @categoryFlag = (SELECT TOP 1 value FROM categoryFlags WHERE name = 'cf_landmine_detectors')

IF NOT EXISTS (SELECT 1 FROM productionduration WHERE category = @categoryFlag)
BEGIN
	INSERT INTO productionduration (category, durationmodifier) VALUES
	(@categoryFlag, 1)
END

GO

-- Fix health for t3 landmine detectors

UPDATE entitydefaults SET health = 100 WHERE definitionname = 'def_named2_landmine_detector'
UPDATE entities SET health = 100 WHERE health > 100

GO

-- Fix Spectator missile hit chance

DECLARE @field INT
DECLARE @definition INT

SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'missile_miss')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES
	(@definition, @field, 0.9)
END ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @definition AND field = @field
END

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_spectator_chassis_pr')

IF NOT EXISTS (SELECT 1 FROM aggregatevalues WHERE definition = @definition AND field = @field)
BEGIN
	INSERT INTO aggregatevalues (definition, field, value) VALUES
	(@definition, @field, 0.9)
END ELSE
BEGIN
	UPDATE aggregatevalues SET value = 0.9 WHERE definition = @definition AND field = @field
END

GO