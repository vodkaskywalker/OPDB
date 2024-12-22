---- Remove flux from drones

DECLARE @definition INT
DECLARE @flux INT
DECLARE @gamma_syndicate_shards INT
DECLARE @gamma_pelistal_shards INT
DECLARE @gamma_nuimqol_shards INT
DECLARE @gamma_thelodica_shards INT

SET @flux = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_specimen_sap_item_flux')
SET @gamma_syndicate_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_syndicate')
SET @gamma_pelistal_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_pelistal')
SET @gamma_nuimqol_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_nuimqol')
SET @gamma_thelodica_shards = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_material_boss_gamma_syndicate')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_harvesting_industrial_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_mining_industrial_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_assault_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_nuimqol_attack_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_assault_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_pelistal_attack_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_repair_support_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_assault_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_syndicate_attack_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_assault_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_thelodica_attack_drone_unit')

DELETE FROM components WHERE definition = @definition AND componentdefinition = @flux
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_syndicate_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_pelistal_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_nuimqol_shards
DELETE FROM components WHERE definition = @definition AND componentdefinition = @gamma_thelodica_shards

GO