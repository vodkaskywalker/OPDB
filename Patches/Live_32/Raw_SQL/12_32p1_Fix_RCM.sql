DECLARE @prototypeId INT
DECLARE @itemId INT

-- T2

-- Assault

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_assault_remote_controller_pr')

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Industrial

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_industrial_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Support

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_support_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Tactical

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named1_tactical_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- T3

-- Assault

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_assault_remote_controller_pr')

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Industrial

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_industrial_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Support

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_support_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Tactical

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named2_tactical_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- T4

-- Assault

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_assault_remote_controller_pr')

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Industrial

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_industrial_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Support

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_support_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

-- Tactical

SET @prototypeId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller_pr')
SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_named3_tactical_remote_controller')

DELETE FROM prototypes WHERE definition = @itemId OR prototype = @prototypeId
INSERT INTO prototypes (definition, prototype) VALUES (@itemId, @prototypeId)

UPDATE entitydefaults SET tiertype = 2 WHERE definition = @prototypeId

GO

-- Remove tiers from ammo CT

DECLARE @itemId INT

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

--

SET @itemId = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit_cprg')

UPDATE entitydefaults SET tiertype = NULL, tierlevel = NULL WHERE definition = @itemId

GO