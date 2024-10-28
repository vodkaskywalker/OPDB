-- Small QoL for riveler mk2 pilots would be increase the range of the base locking range, add an additional amount of targets they can lock (to account for the drones) and buff the range on t4+ miners.

USE perpetuumsa

DECLARE @definition INT
DECLARE @field INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_riveler_head_mk2')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'locking_range')

UPDATE aggregatevalues SET value = 44 WHERE definition = @definition AND field = @field

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_elitet4_gamma_medium_driller')
SET @field = (SELECT TOP 1 id FROM aggregatefields WHERE name = 'optimal_range')

UPDATE aggregatevalues SET value = 10 WHERE definition = @definition AND field = @field

GO