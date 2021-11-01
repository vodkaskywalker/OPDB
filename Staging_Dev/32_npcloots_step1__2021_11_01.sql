USE [perpetuumsa]
GO

---------------------------------------
-- GAMMA NPC LOOTS part 1
-- L3-L7, N/P/T/S factions
-- Just basics, mods, kern/frag/plas
-- Date modified: 2021/11/01
---------------------------------------

DROP TABLE IF EXISTS #BOTS_BY_FACTION;
CREATE TABLE #BOTS_BY_FACTION(
	botName varchar(64),
	className varchar(64),
	faction varchar(64)
);
INSERT INTO #BOTS_BY_FACTION (botName, className, faction) VALUES
('apollo', 'destroyer', 'syndicate'),
('arbalest', 'assault', 'nuimqol'),
('artemis', 'mech', 'thelodica'),
('baphomet', 'assault', 'thelodica'),
('callisto', 'mech', 'syndicate'),
('cameleon', 'light ewar', 'nuimqol'),
('castel', 'light', 'pelistal'),
('cronus', 'assault indy', 'syndicate'),
('daidalos', 'mech indy', 'syndicate'),
('echelon', 'mech', 'syndicate'),
('felos', 'destroyer', 'nuimqol'),
('gargoyle', 'mech indy', 'industrial'),
('gropho', 'heavy mech', 'pelistal'),
('helix', 'light ewar', 'syndicate'),
('hermes', 'assault indy', 'syndicate'),
('hydra', 'destroyer', 'pelistal'),
('ictus', 'mech ewar', 'pelistal'),
('ikarus', 'light indy', 'syndicate'),
('intakt', 'light ewar', 'thelodica'),
('kain', 'mech', 'nuimqol'),
('laird', 'light indy', 'industrial'),
('legatus', 'heavy mech', 'syndicate'),
('lithus', 'heavy mech indy', 'industrial'),
('locust', 'assault', 'syndicate'),
('mesmer', 'heavy mech', 'nuimqol'),
('onyx', 'destroyer', 'thelodica'),
('prometheus', 'light', 'thelodica'),
('riveler', 'heavy mech indy', 'industrial'),
('scarab', 'heavy mech indy', 'industrial'),
('sequer', 'assault indy', 'industrial'),
('seth', 'heavy mech', 'thelodica'),
('symbiont', 'heavy mech indy', 'industrial'),
('termis', 'mech indy', 'industrial'),
('troiar', 'light ewar', 'pelistal'),
('tyrannos', 'mech', 'pelistal'),
('vagabond', 'mech', 'nuimqol'),
('vektor', 'light', 'syndicate'),
('waspish', 'assault', 'pelistal'),
('yagel', 'light', 'nuimqol'),
('zenith', 'mech ewar', 'thelodica');


DROP TABLE IF EXISTS #NPCS_BY_FACTION_BY_LEVEL;
CREATE TABLE #NPCS_BY_FACTION_BY_LEVEL(
	def int,
	npcName varchar(128),
	className varchar(64),
	faction varchar(64),
	levelName varchar(32)
);
INSERT INTO #NPCS_BY_FACTION_BY_LEVEL (def, npcName, className, faction, levelName)
SELECT d.definition, d.definitionname, f.className, f.faction, RIGHT(d.definitionname, CHARINDEX('_',REVERSE(d.definitionname))-1)
FROM entitydefaults d
JOIN #BOTS_BY_FACTION f ON d.definitionname like '%'+f.botName+'%'
WHERE definitionname like 'def_npc_gamma_%';

DROP TABLE IF EXISTS #LOOT_SHEET_OUTPUT_BASICS;
CREATE TABLE #LOOT_SHEET_OUTPUT_BASICS(
	faction varchar(64),
	levelName varchar(32),
	lootName varchar(128),
	heavyQuant int,
	mechQuant int,
	mechEwQuant int,
	assaultQuant int,
	lightEWQuant int,
	lightQuant int
);
INSERT INTO #LOOT_SHEET_OUTPUT_BASICS (faction, levelName, lootName, heavyQuant, mechQuant, mechEwQuant, assaultQuant, lightEWQuant, lightQuant) VALUES
('thelodica','l7','def_thelodica_reactor_plasma',11128,8008,8008,1560,1560,832),
('thelodica','l7','def_kernel_thelodica',17472,9282,5642,7098,7098,3640),
('thelodica','l7','def_kernel_hitech',6240,5200,5200,2600,2600,1820),
('thelodica','l7','def_kernel_common',7488,3978,2418,3042,3042,1560),
('thelodica','l6','def_thelodica_reactor_plasma',7790,5606,5606,1092,1092,582),
('thelodica','l6','def_kernel_thelodica',12230,6497,3949,4969,4969,2548),
('thelodica','l6','def_kernel_hitech',4368,3640,3640,1820,1820,1274),
('thelodica','l6','def_kernel_common',5242,2785,1693,2129,2129,1092),
('thelodica','l5','def_thelodica_reactor_plasma',5564,4004,4004,780,780,416),
('thelodica','l5','def_kernel_thelodica',8736,4641,2821,3549,3549,1820),
('thelodica','l5','def_kernel_hitech',3120,2600,2600,1300,1300,910),
('thelodica','l5','def_kernel_common',3744,1989,1209,1521,1521,780),
('thelodica','l4','def_thelodica_reactor_plasma',4451,3203,3203,624,624,333),
('thelodica','l4','def_kernel_thelodica',6989,3713,2257,2839,2839,1456),
('thelodica','l4','def_kernel_hitech',2496,2080,2080,1040,1040,728),
('thelodica','l4','def_kernel_common',2995,1591,967,1217,1217,624),
('thelodica','l3','def_thelodica_reactor_plasma',3338,2402,2402,468,468,250),
('thelodica','l3','def_kernel_thelodica',5242,2785,1693,2129,2129,1092),
('thelodica','l3','def_kernel_hitech',1872,1560,1560,780,780,546),
('thelodica','l3','def_kernel_common',2246,1193,725,913,913,468),

('nuimqol','l7','def_nuimqol_reactor_plasma',11128,8008,8008,1560,1560,832),
('nuimqol','l7','def_kernel_nuimqol',17472,9282,5642,7098,7098,3640),
('nuimqol','l7','def_kernel_hitech',6240,5200,5200,2600,2600,1820),
('nuimqol','l7','def_kernel_common',7488,3978,2418,3042,3042,1560),
('nuimqol','l6','def_nuimqol_reactor_plasma',7790,5606,5606,1092,1092,582),
('nuimqol','l6','def_kernel_nuimqol',12230,6497,3949,4969,4969,2548),
('nuimqol','l6','def_kernel_hitech',4368,3640,3640,1820,1820,1274),
('nuimqol','l6','def_kernel_common',5242,2785,1693,2129,2129,1092),
('nuimqol','l5','def_nuimqol_reactor_plasma',5564,4004,4004,780,780,416),
('nuimqol','l5','def_kernel_nuimqol',8736,4641,2821,3549,3549,1820),
('nuimqol','l5','def_kernel_hitech',3120,2600,2600,1300,1300,910),
('nuimqol','l5','def_kernel_common',3744,1989,1209,1521,1521,780),
('nuimqol','l4','def_nuimqol_reactor_plasma',4451,3203,3203,624,624,333),
('nuimqol','l4','def_kernel_nuimqol',6989,3713,2257,2839,2839,1456),
('nuimqol','l4','def_kernel_hitech',2496,2080,2080,1040,1040,728),
('nuimqol','l4','def_kernel_common',2995,1591,967,1217,1217,624),
('nuimqol','l3','def_nuimqol_reactor_plasma',3338,2402,2402,468,468,250),
('nuimqol','l3','def_kernel_nuimqol',5242,2785,1693,2129,2129,1092),
('nuimqol','l3','def_kernel_hitech',1872,1560,1560,780,780,546),
('nuimqol','l3','def_kernel_common',2246,1193,725,913,913,468),

('pelistal','l7','def_pelistal_reactor_plasma',11128,8008,8008,1560,1560,832),
('pelistal','l7','def_kernel_pelistal',17472,9282,5642,7098,7098,3640),
('pelistal','l7','def_kernel_hitech',6240,5200,5200,2600,2600,1820),
('pelistal','l7','def_kernel_common',7488,3978,2418,3042,3042,1560),
('pelistal','l6','def_pelistal_reactor_plasma',7790,5606,5606,1092,1092,582),
('pelistal','l6','def_kernel_pelistal',12230,6497,3949,4969,4969,2548),
('pelistal','l6','def_kernel_hitech',4368,3640,3640,1820,1820,1274),
('pelistal','l6','def_kernel_common',5242,2785,1693,2129,2129,1092),
('pelistal','l5','def_pelistal_reactor_plasma',5564,4004,4004,780,780,416),
('pelistal','l5','def_kernel_pelistal',8736,4641,2821,3549,3549,1820),
('pelistal','l5','def_kernel_hitech',3120,2600,2600,1300,1300,910),
('pelistal','l5','def_kernel_common',3744,1989,1209,1521,1521,780),
('pelistal','l4','def_pelistal_reactor_plasma',4451,3203,3203,624,624,333),
('pelistal','l4','def_kernel_pelistal',6989,3713,2257,2839,2839,1456),
('pelistal','l4','def_kernel_hitech',2496,2080,2080,1040,1040,728),
('pelistal','l4','def_kernel_common',2995,1591,967,1217,1217,624),
('pelistal','l3','def_pelistal_reactor_plasma',3338,2402,2402,468,468,250),
('pelistal','l3','def_kernel_pelistal',5242,2785,1693,2129,2129,1092),
('pelistal','l3','def_kernel_hitech',1872,1560,1560,780,780,546),
('pelistal','l3','def_kernel_common',2246,1193,725,913,913,468),

('syndicate','l7','def_common_reactor_plasma',13354,9610,9610,1872,1872,998),
('syndicate','l7','def_kernel_common',22464,11934,7254,9126,9126,4680),
('syndicate','l7','def_kernel_hitech',12480,10400,10400,5200,5200,3640),
('syndicate','l6','def_common_reactor_plasma',9348,6727,6727,1310,1310,699),
('syndicate','l6','def_kernel_common',15725,8354,5078,6388,6388,3276),
('syndicate','l6','def_kernel_hitech',8736,7280,7280,3640,3640,2548),
('syndicate','l5','def_common_reactor_plasma',6677,4805,4805,936,936,499),
('syndicate','l5','def_kernel_common',11232,5967,3627,4563,4563,2340),
('syndicate','l5','def_kernel_hitech',6240,5200,5200,2600,2600,1820),
('syndicate','l4','def_common_reactor_plasma',5341,3844,3844,749,749,399),
('syndicate','l4','def_kernel_common',8986,4774,2902,3650,3650,1872),
('syndicate','l4','def_kernel_hitech',4992,4160,4160,2080,2080,1456),
('syndicate','l3','def_common_reactor_plasma',4006,2883,2883,562,562,300),
('syndicate','l3','def_kernel_common',6739,3580,2176,2738,2738,1404),
('syndicate','l3','def_kernel_hitech',3744,3120,3120,1560,1560,1092);


DROP TABLE IF EXISTS #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED;
CREATE TABLE #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED(
	faction varchar(64),
	levelName varchar(32),
	className varchar(32),
	lootName varchar(128),
	minQuant int,
	maxQuant int
);
INSERT INTO #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED (faction, levelName, className, lootName, minQuant, maxQuant)
SELECT faction, levelName, 'light', lootName, CAST(lightQuant*0.9 as int), CAST(lightQuant*1.1 as int)
FROM #LOOT_SHEET_OUTPUT_BASICS;

INSERT INTO #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED (faction, levelName, className, lootName, minQuant, maxQuant)
SELECT faction, levelName, 'assault', lootName, CAST(assaultQuant*0.9 as int), CAST(assaultQuant*1.1 as int)
FROM #LOOT_SHEET_OUTPUT_BASICS;

INSERT INTO #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED (faction, levelName, className, lootName, minQuant, maxQuant)
SELECT faction, levelName, 'light ewar', lootName, CAST(lightEWQuant*0.9 as int), CAST(lightEWQuant*1.1 as int)
FROM #LOOT_SHEET_OUTPUT_BASICS;

INSERT INTO #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED (faction, levelName, className, lootName, minQuant, maxQuant)
SELECT faction, levelName, 'mech', lootName, CAST(mechQuant*0.9 as int), CAST(mechQuant*1.1 as int)
FROM #LOOT_SHEET_OUTPUT_BASICS;

INSERT INTO #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED (faction, levelName, className, lootName, minQuant, maxQuant)
SELECT faction, levelName, 'mech ewar', lootName, CAST(mechEwQuant*0.9 as int), CAST(mechEwQuant*1.1 as int)
FROM #LOOT_SHEET_OUTPUT_BASICS;

INSERT INTO #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED (faction, levelName, className, lootName, minQuant, maxQuant)
SELECT faction, levelName, 'heavy mech', lootName, CAST(heavyQuant*0.9 as int), CAST(heavyQuant*1.1 as int)
FROM #LOOT_SHEET_OUTPUT_BASICS;


DROP TABLE IF EXISTS #LOOT_SHEET_OUTPUT_MODULES;
CREATE TABLE #LOOT_SHEET_OUTPUT_MODULES(
	faction varchar(64),
	className varchar(32),
	lootName varchar(128),
	minQuant int,
	maxQuant int,
	level7prob float,
	level6prob float,
	level5prob float,
	level4prob float,
	level3prob float
);
INSERT INTO #LOOT_SHEET_OUTPUT_MODULES (faction, className, lootName, minQuant, maxQuant, level7prob, level6prob, level5prob, level4prob, level3prob) VALUES
('thelodica','light','def_named3_kin_armor_hardener',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named3_damage_mod_laser',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named3_resistant_plating',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named3_small_armor_plate',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named3_small_laser',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named2_kin_armor_hardener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named2_damage_mod_laser',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named2_resistant_plating',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named2_small_armor_plate',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named2_small_laser',1,2,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named1_kin_armor_hardener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','light','def_named1_damage_mod_laser',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','light','def_named1_resistant_plating',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','light','def_named1_small_armor_plate',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','light','def_named1_small_laser',1,2,0.22,0.18,0.126,0.076,0.038),
('thelodica','light','def_standard_kin_armor_hardener',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_standard_damage_mod_laser',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_standard_resistant_plating',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_standard_small_armor_plate',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_standard_small_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_ammo_small_lasercrystal_b',10,200,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_ammo_small_lasercrystal_d',10,200,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_named2_sensor_booster',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named2_webber',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','light','def_named1_sensor_booster',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named1_webber',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_named1_small_armor_repairer',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','light','def_standard_sensor_booster',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_standard_webber',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','light','def_standard_small_armor_repairer',1,1,0.5,0.5,0.5,0.5,0.5),

('thelodica','mech','def_named3_kin_armor_hardener',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named3_damage_mod_laser',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named3_resistant_plating',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named3_medium_laser',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named3_longrange_medium_laser',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named3_medium_armor_plate',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named2_kin_armor_hardener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named2_damage_mod_laser',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named2_resistant_plating',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named2_tracking_upgrade',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named2_medium_laser',1,2,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named2_longrange_medium_laser',1,2,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named2_medium_armor_plate',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named1_kin_armor_hardener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech','def_named1_damage_mod_laser',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech','def_named1_resistant_plating',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech','def_named1_tracking_upgrade',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech','def_named1_medium_laser',1,2,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech','def_named1_medium_armor_plate',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech','def_standard_tracking_upgrade',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_standard_medium_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_longrange_standard_medium_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_named1_longrange_medium_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_ammo_medium_lasercrystal_b',8,120,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_ammo_medium_lasercrystal_d',8,120,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_standard_medium_armor_plate',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_named2_sensor_booster',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech','def_named1_sensor_booster',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_named1_medium_armor_repairer',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech','def_standard_sensor_booster',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech','def_standard_medium_armor_repairer',1,1,0.5,0.5,0.5,0.5,0.5),

('thelodica','heavy mech','def_named3_kin_armor_hardener',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named3_damage_mod_laser',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named3_resistant_plating',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named3_medium_laser',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named3_longrange_medium_laser',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named3_medium_armor_plate',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named2_kin_armor_hardener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named2_damage_mod_laser',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named2_resistant_plating',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named2_tracking_upgrade',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named2_medium_laser',1,2,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named2_longrange_medium_laser',1,2,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named2_medium_armor_plate',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named1_kin_armor_hardener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','heavy mech','def_named1_damage_mod_laser',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','heavy mech','def_named1_resistant_plating',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','heavy mech','def_named1_tracking_upgrade',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','heavy mech','def_named1_medium_laser',1,2,0.22,0.18,0.126,0.076,0.038),
('thelodica','heavy mech','def_named1_medium_armor_plate',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','heavy mech','def_standard_tracking_upgrade',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_standard_medium_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_longrange_standard_medium_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_named1_longrange_medium_laser',1,2,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_ammo_medium_lasercrystal_b',8,120,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_ammo_medium_lasercrystal_d',8,120,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_standard_medium_armor_plate',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_named2_sensor_booster',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','heavy mech','def_named1_sensor_booster',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_named1_medium_armor_repairer',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','heavy mech','def_standard_sensor_booster',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','heavy mech','def_standard_medium_armor_repairer',1,1,0.5,0.5,0.5,0.5,0.5),

('thelodica', 'light ewar', 'def_named3_sensor_supressor_booster',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica', 'light ewar', 'def_named3_sensor_dampener',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica', 'light ewar', 'def_named2_sensor_dampener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_named2_sensor_supressor_booster',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_named2_kin_armor_hardener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_named2_small_armor_plate',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_named1_sensor_supressor_booster',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica', 'light ewar', 'def_named1_sensor_dampener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica', 'light ewar', 'def_named1_kin_armor_hardener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica', 'light ewar', 'def_named1_small_armor_plate',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica', 'light ewar', 'def_standard_kin_armor_hardener',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica', 'light ewar', 'def_standard_small_armor_plate',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica', 'light ewar', 'def_standard_sensor_supressor_booster',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica', 'light ewar', 'def_standard_sensor_dampener',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica', 'light ewar', 'def_named2_mass_reductor',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica', 'light ewar', 'def_named2_webber',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica', 'light ewar', 'def_named1_mass_reductor',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_named1_webber',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_named1_sensor_jammer',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica', 'light ewar', 'def_standard_webber',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica', 'light ewar', 'def_standard_sensor_jammer',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica', 'light ewar', 'def_standard_mass_reductor',1,1,0.5,0.5,0.5,0.5,0.5),

('thelodica','mech ewar','def_named3_sensor_supressor_booster',1,2,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech ewar','def_named3_sensor_dampener',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech ewar','def_named2_sensor_dampener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_named2_sensor_supressor_booster',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_named2_kin_armor_hardener',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_named2_medium_armor_plate',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_named1_sensor_supressor_booster',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech ewar','def_named1_sensor_dampener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech ewar','def_named1_kin_armor_hardener',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech ewar','def_named1_medium_armor_plate',1,1,0.22,0.18,0.126,0.076,0.038),
('thelodica','mech ewar','def_standard_kin_armor_hardener',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech ewar','def_standard_medium_armor_plate',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech ewar','def_standard_sensor_supressor_booster',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech ewar','def_standard_sensor_dampener',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech ewar','def_named2_mass_reductor',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech ewar','def_named2_webber',1,1,0.11,0.07,0.049,0.029,NULL),
('thelodica','mech ewar','def_named1_mass_reductor',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_named1_webber',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_named1_sensor_jammer',1,1,0.165,0.125,0.088,0.053,0.027),
('thelodica','mech ewar','def_standard_webber',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech ewar','def_standard_sensor_jammer',1,1,0.5,0.5,0.5,0.5,0.5),
('thelodica','mech ewar','def_standard_mass_reductor',1,1,0.5,0.5,0.5,0.5,0.5);

DROP TABLE IF EXISTS #LOOT_BY_NPC;
CREATE TABLE #LOOT_BY_NPC(
	npcName varchar(128),
	lootName varchar(128),
	minQuant int,
	maxQuant int,
	prob float
);
INSERT INTO #LOOT_BY_NPC (npcName, lootName, minQuant, maxQuant, prob)
SELECT n.npcName, loot.lootName, loot.minQuant, loot.maxQuant, 1.0
FROM #NPCS_BY_FACTION_BY_LEVEL n
JOIN #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED loot ON
	loot.levelName=n.levelName AND loot.faction=n.faction AND loot.className=n.className;


INSERT INTO #LOOT_BY_NPC (npcName, lootName, minQuant, maxQuant, prob)
SELECT n.npcName, loot.lootName, loot.minQuant, loot.maxQuant, loot.level7prob
FROM #NPCS_BY_FACTION_BY_LEVEL n
JOIN #LOOT_SHEET_OUTPUT_MODULES loot ON loot.faction=n.faction AND loot.className=n.className
WHERE n.levelName='l7' AND loot.level7prob IS NOT NULL;

INSERT INTO #LOOT_BY_NPC (npcName, lootName, minQuant, maxQuant, prob)
SELECT n.npcName, loot.lootName, loot.minQuant, loot.maxQuant, loot.level6prob
FROM #NPCS_BY_FACTION_BY_LEVEL n
JOIN #LOOT_SHEET_OUTPUT_MODULES loot ON loot.faction=n.faction AND loot.className=n.className
WHERE n.levelName='l6' AND loot.level6prob IS NOT NULL;

INSERT INTO #LOOT_BY_NPC (npcName, lootName, minQuant, maxQuant, prob)
SELECT n.npcName, loot.lootName, loot.minQuant, loot.maxQuant, loot.level5prob
FROM #NPCS_BY_FACTION_BY_LEVEL n
JOIN #LOOT_SHEET_OUTPUT_MODULES loot ON loot.faction=n.faction AND loot.className=n.className
WHERE n.levelName='l5' AND loot.level5prob IS NOT NULL;

INSERT INTO #LOOT_BY_NPC (npcName, lootName, minQuant, maxQuant, prob)
SELECT n.npcName, loot.lootName, loot.minQuant, loot.maxQuant, loot.level4prob
FROM #NPCS_BY_FACTION_BY_LEVEL n
JOIN #LOOT_SHEET_OUTPUT_MODULES loot ON loot.faction=n.faction AND loot.className=n.className
WHERE n.levelName='l4' AND loot.level4prob IS NOT NULL;

INSERT INTO #LOOT_BY_NPC (npcName, lootName, minQuant, maxQuant, prob)
SELECT n.npcName, loot.lootName, loot.minQuant, loot.maxQuant, loot.level3prob
FROM #NPCS_BY_FACTION_BY_LEVEL n
JOIN #LOOT_SHEET_OUTPUT_MODULES loot ON loot.faction=n.faction AND loot.className=n.className
WHERE n.levelName='l3' AND loot.level3prob IS NOT NULL;


SELECT * FROM npcloot WHERE definition IN (
	SELECT definition FROM entitydefaults WHERE definitionname in (
		SELECT DISTINCT npcName FROM  #NPCS_BY_FACTION_BY_LEVEL
	)
);

DELETE FROM npcloot WHERE definition IN (
	SELECT definition FROM entitydefaults WHERE definitionname in (
		SELECT DISTINCT npcName FROM  #NPCS_BY_FACTION_BY_LEVEL
	)
);

MERGE [dbo].[npcloot] n USING #LOOT_BY_NPC loot
ON n.definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname=loot.npcName)
AND n.lootdefinition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname=loot.lootName)
WHEN MATCHED
    THEN UPDATE SET
		n.minquantity = loot.minQuant,
		n.quantity = loot.maxQuant,
		n.probability = loot.prob,
		n.repackaged = 0,
		n.dontdamage = IIF(loot.prob = 1.0, 1, 0)
WHEN NOT MATCHED
    THEN INSERT (definition, lootdefinition, quantity, minquantity, probability, dontdamage, repackaged) VALUES
	((SELECT TOP 1 definition FROM entitydefaults WHERE definitionname=loot.npcName),
	(SELECT TOP 1 definition FROM entitydefaults WHERE definitionname=loot.lootName),
	loot.minQuant, loot.maxQuant, loot.prob, IIF(loot.prob = 1.0, 1, 0), 0);



DROP TABLE IF EXISTS #BOTS_BY_FACTION;
DROP TABLE IF EXISTS #LOOT_BY_NPC;
DROP TABLE IF EXISTS #LOOT_SHEET_OUTPUT_BASICS;
DROP TABLE IF EXISTS #LOOT_SHEET_OUTPUT_BASICS_TRANSPOSED;
DROP TABLE IF EXISTS #LOOT_SHEET_OUTPUT_MODULES;
DROP TABLE IF EXISTS #NPCS_BY_FACTION_BY_LEVEL;
GO
