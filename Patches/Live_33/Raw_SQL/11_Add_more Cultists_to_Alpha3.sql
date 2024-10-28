-- Add roamers for Tellesis

DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @templateid INT

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ICS_pve')

--- roamers 10

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_10_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_10_z6', 10, 10, 2038, 2038, 'Tellesis roamers 10', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_10_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_10_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z6_kain_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z6_kain_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_arbalest_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z6_arbalest_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z6_arbalest_dps_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_cameleon_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z6_cameleon_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z6_cameleon_shield_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 11

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_11_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_11_z6', 10, 10, 2038, 2038, 'Tellesis roamers 11', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_11_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_11_z6')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_sequer_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_sequer_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_sequer_basic_lindy', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_riveler_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_riveler_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_riveler_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_laird_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_laird_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_laird_basic_lindy', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_mesmer_tank_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_mesmer_tank_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_mesmer_tank_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_tank_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_kain_tank_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_kain_tank_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_vagabond_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_vagabond_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_vagabond_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_cameleon_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_cameleon_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_cameleon_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z6_yagel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z6_yagel_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 12

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_12_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_12_z6', 10, 10, 2038, 2038, 'Tellesis roamers 12', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_12_z6'
END


SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_12_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_arbalest_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z6_arbalest_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z6_arbalest_dps_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_vagabond_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z6_vagabond_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z6_vagabond_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z6_yagel_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z6_yagel_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 13

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_13_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_13_z6', 10, 10, 2038, 2038, 'Tellesis roamers 13', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_13_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_13_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_mesmer_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z6_mesmer_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z6_mesmer_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z6_yagel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z6_yagel_speed_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_arbalest_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z6_arbalest_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z6_arbalest_speed_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 14

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_14_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_14_z6', 10, 10, 2038, 2038, 'Tellesis roamers 14', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_14_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_14_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z6_kain_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z6_kain_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_vagabond_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z6_vagabond_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z6_vagabond_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_cameleon_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z6_cameleon_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z6_cameleon_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z6_yagel_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z6_yagel_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 15

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_15_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_15_z6', 10, 10, 2038, 2038, 'Tellesis roamers 15', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_15_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_15_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z6_yagel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z6_yagel_speed_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_arbalest_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z6_arbalest_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z6_arbalest_speed_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_cameleon_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z6_cameleon_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z6_cameleon_shield_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z6_kain_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z6_kain_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 16

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_16_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_16_z6', 10, 10, 2038, 2038, 'Tellesis roamers 16', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_16_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_16_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z6_yagel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z6_yagel_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_cameleon_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z6_cameleon_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z6_cameleon_shield_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_arbalest_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z6_arbalest_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z6_arbalest_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 17

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_17_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_17_z6', 10, 10, 2038, 2038, 'Tellesis roamers 17', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_17_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_17_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_mesmer_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z6_mesmer_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z6_mesmer_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z6_kain_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z6_kain_dps_l3', @presenceid, 5, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_cameleon_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z6_cameleon_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z6_cameleon_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z6_yagel_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z6_yagel_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--- roamers 18

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_18_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_18_z6', 10, 10, 2038, 2038, 'Tellesis roamers 18', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_18_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_18_z6')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_sequer_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z6_sequer_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z6_sequer_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_laird_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z6_laird_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z6_laird_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_argano_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z6_argano_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z6_argano_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_arbalest_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z6_arbalest_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z6_arbalest_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_yagel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z6_yagel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z6_yagel_speed_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

-- observer 3

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'observer_03_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('observer_03_z6', 10, 10, 2038, 2038, 'Tellesis observer 3', @spawnid, 1, 1, 18000, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'observer_03_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'observer_03_z6')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_mesmer_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z6_def_npc_tellesis_mesmer_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z6_def_npc_tellesis_mesmer_advanced_observer', @presenceid, 2, @definition, 0, 0, 0, 10, 18000, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z6_def_npc_tellesis_kain_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z6_def_npc_tellesis_kain_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_vagabond_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z6_def_npc_tellesis_vagabond_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z6_def_npc_tellesis_vagabond_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

-- observer 4

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'observer_04_z6' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('observer_04_z6', 10, 10, 2038, 2038, 'Tellesis observer 4', @spawnid, 1, 1, 18000, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'observer_04_z6'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'observer_04_z6')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_kain_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_04_z6_def_npc_tellesis_kain_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_04_z6_def_npc_tellesis_kain_advanced_observer', @presenceid, 2, @definition, 0, 0, 0, 10, 18000, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_tellesis_vagabond_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_04_z6_def_npc_tellesis_vagabond_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_04_z6_def_npc_tellesis_vagabond_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'tellesis npc', 0.9, 1, 1, 2, 0)
END

GO

-- Add roamers for Shinjalar

DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @templateid INT

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ASI_pve')

--- roamers 10

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_10_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_10_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 10', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_10_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_10_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z7_artemis_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z7_artemis_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_baphomet_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z7_baphomet_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z7_baphomet_dps_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_intakt_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z7_intakt_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z7_intakt_shield_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 11

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_11_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_11_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 11', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_11_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_11_z7')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_sequer_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_sequer_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_sequer_basic_lindy', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_riveler_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_riveler_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_riveler_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_laird_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_laird_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_laird_basic_lindy', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_seth_tank_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_seth_tank_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_seth_tank_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_tank_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_artemis_tank_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_artemis_tank_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_zenith_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_zenith_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_zenith_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_intakt_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_intakt_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_intakt_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z7_prometheus_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z7_prometheus_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 12

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_12_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_12_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 12', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_12_z7'
END


SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_12_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_baphomet_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z7_baphomet_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z7_baphomet_dps_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_zenith_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z7_zenith_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z7_zenith_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z7_prometheus_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z7_prometheus_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 13

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_13_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_13_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 13', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_13_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_13_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_seth_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z7_seth_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z7_seth_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z7_prometheus_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z7_prometheus_speed_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_baphomet_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z7_baphomet_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z7_baphomet_speed_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 14

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_14_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_14_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 14', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_14_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_14_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z7_artemis_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z7_artemis_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_zenith_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z7_zenith_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z7_zenith_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_intakt_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z7_intakt_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z7_intakt_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z7_prometheus_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z7_prometheus_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 15

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_15_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_15_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 15', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_15_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_15_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z7_prometheus_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z7_prometheus_speed_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_baphomet_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z7_baphomet_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z7_baphomet_speed_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_intakt_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z7_intakt_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z7_intakt_shield_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z7_artemis_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z7_artemis_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 16

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_16_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_16_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 16', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_16_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_16_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z7_prometheus_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z7_prometheus_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_intakt_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z7_intakt_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z7_intakt_shield_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_baphomet_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z7_baphomet_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z7_baphomet_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 17

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_17_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_17_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 17', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_17_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_17_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_seth_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z7_seth_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z7_seth_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z7_artemis_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z7_artemis_dps_l3', @presenceid, 5, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_intakt_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z7_intakt_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z7_intakt_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z7_prometheus_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z7_prometheus_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--- roamers 18

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_18_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_18_z7', 10, 10, 2038, 2038, 'Shinjalar roamers 18', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_18_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_18_z7')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_sequer_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z7_sequer_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z7_sequer_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_laird_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z7_laird_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z7_laird_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_argano_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z7_argano_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z7_argano_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_baphomet_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z7_baphomet_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z7_baphomet_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_prometheus_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z7_prometheus_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z7_prometheus_speed_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

-- observer 3

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'observer_03_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('observer_03_z7', 10, 10, 2038, 2038, 'Shinjalar observer 3', @spawnid, 1, 1, 18000, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'observer_03_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'observer_03_z7')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_seth_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z7_def_npc_shinjalar_seth_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z7_def_npc_shinjalar_seth_advanced_observer', @presenceid, 2, @definition, 0, 0, 0, 10, 18000, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z7_def_npc_shinjalar_artemis_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z7_def_npc_shinjalar_artemis_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_zenith_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z7_def_npc_shinjalar_zenith_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z7_def_npc_shinjalar_zenith_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

-- observer 4

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'observer_04_z7' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('observer_04_z7', 10, 10, 2038, 2038, 'Shinjalar observer 4', @spawnid, 1, 1, 18000, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'observer_04_z7'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'observer_04_z7')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_artemis_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_04_z7_def_npc_shinjalar_artemis_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_04_z7_def_npc_shinjalar_artemis_advanced_observer', @presenceid, 2, @definition, 0, 0, 0, 10, 18000, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_shinjalar_zenith_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_04_z7_def_npc_shinjalar_zenith_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_04_z7_def_npc_shinjalar_zenith_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'shinjalar npc', 0.9, 1, 1, 2, 0)
END

GO

-- Add roamers for attalica

DECLARE @spawnid INT
DECLARE @presenceid INT
DECLARE @definition INT
DECLARE @templateid INT

SET @spawnid = (SELECT TOP 1 spawnid FROM zones WHERE name = 'zone_ICS')

--- roamers 10

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_10_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_10_z1', 10, 10, 2038, 2038, 'attalica roamers 10', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_10_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_10_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z1_tyrannos_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z1_tyrannos_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_waspish_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z1_waspish_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z1_waspish_dps_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_troiar_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_10_z1_troiar_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_10_z1_troiar_shield_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 11

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_11_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_11_z1', 10, 10, 2038, 2038, 'attalica roamers 11', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_11_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_11_z1')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_sequer_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_sequer_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_sequer_basic_lindy', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_riveler_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_riveler_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_riveler_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_laird_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_laird_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_laird_basic_lindy', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_gropho_tank_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_gropho_tank_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_gropho_tank_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_tank_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_tyrannos_tank_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_tyrannos_tank_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_ictus_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_ictus_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_ictus_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_troiar_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_troiar_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_troiar_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_11_z1_castel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_11_z1_castel_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 12

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_12_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_12_z1', 10, 10, 2038, 2038, 'attalica roamers 12', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_12_z1'
END


SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_12_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_waspish_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z1_waspish_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z1_waspish_dps_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_ictus_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z1_ictus_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z1_ictus_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_12_z1_castel_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_12_z1_castel_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 13

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_13_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_13_z1', 10, 10, 2038, 2038, 'attalica roamers 13', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_13_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_13_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_gropho_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z1_gropho_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z1_gropho_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z1_castel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z1_castel_speed_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_waspish_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_13_z1_waspish_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_13_z1_waspish_speed_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 14

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_14_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_14_z1', 10, 10, 2038, 2038, 'attalica roamers 14', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_14_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_14_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z1_tyrannos_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z1_tyrannos_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_ictus_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z1_ictus_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z1_ictus_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_troiar_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z1_troiar_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z1_troiar_armor_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_14_z1_castel_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_14_z1_castel_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 15

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_15_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_15_z1', 10, 10, 2038, 2038, 'attalica roamers 15', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_15_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_15_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z1_castel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z1_castel_speed_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_waspish_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z1_waspish_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z1_waspish_speed_l3', @presenceid, 4, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_troiar_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z1_troiar_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z1_troiar_shield_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_15_z1_tyrannos_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_15_z1_tyrannos_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 16

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_16_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_16_z1', 10, 10, 2038, 2038, 'attalica roamers 16', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_16_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_16_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z1_castel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z1_castel_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_troiar_shield_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z1_troiar_shield_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z1_troiar_shield_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_waspish_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_16_z1_waspish_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_16_z1_waspish_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 17

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_17_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_17_z1', 10, 10, 2038, 2038, 'attalica roamers 17', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_17_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_17_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_gropho_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z1_gropho_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z1_gropho_dps_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z1_tyrannos_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z1_tyrannos_dps_l3', @presenceid, 5, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_troiar_armor_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z1_troiar_armor_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z1_troiar_armor_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_dps_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_17_z1_castel_dps_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_17_z1_castel_dps_l3', @presenceid, 3, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--- roamers 18

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'roamer_18_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('roamer_18_z1', 10, 10, 2038, 2038, 'attalica roamers 18', @spawnid, 1, 1, 7200, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'roamer_18_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'roamer_18_z1')

----

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_sequer_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z1_sequer_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z1_sequer_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_laird_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z1_laird_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z1_laird_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_argano_basic_lindy')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z1_argano_basic_lindy')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z1_argano_basic_lindy', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_waspish_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z1_waspish_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z1_waspish_speed_l3', @presenceid, 2, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_castel_speed_l3')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'roamer_18_z1_castel_speed_l3')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('roamer_18_z1_castel_speed_l3', @presenceid, 1, @definition, 0, 0, 0, 10, 7200, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

-- observer 3

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'observer_03_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('observer_03_z1', 10, 10, 2038, 2038, 'attalica observer 3', @spawnid, 1, 1, 18000, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'observer_03_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'observer_03_z1')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_gropho_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z1_def_npc_attalica_gropho_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z1_def_npc_attalica_gropho_advanced_observer', @presenceid, 2, @definition, 0, 0, 0, 10, 18000, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z1_def_npc_attalica_tyrannos_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z1_def_npc_attalica_tyrannos_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_ictus_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_03_z1_def_npc_attalica_ictus_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_03_z1_def_npc_attalica_ictus_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

-- observer 4

IF NOT EXISTS (SELECT 1 FROM npcpresence WHERE name = 'observer_04_z1' AND spawnid = @spawnid)
BEGIN
	INSERT INTO npcpresence (name, topx, topy, bottomx, bottomy, note, spawnid, enabled, roaming, roamingrespawnseconds, presencetype, maxrandomflock, randomcenterx, randomcentery, randomradius, dynamiclifetime, isbodypull, isrespawnallowed, safebodypull, izgroupid, growthseconds) VALUES
	('observer_04_z1', 10, 10, 2038, 2038, 'attalica observer 4', @spawnid, 1, 1, 18000, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL)
END
ELSE BEGIN
	UPDATE npcpresence SET enabled = 1 WHERE name = 'observer_04_z1'
END

SET @presenceid = (SELECT TOP 1 id FROM npcpresence WHERE name = 'observer_04_z1')

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_tyrannos_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_04_z1_def_npc_attalica_tyrannos_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_04_z1_def_npc_attalica_tyrannos_advanced_observer', @presenceid, 2, @definition, 0, 0, 0, 10, 18000, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

--

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_npc_attalica_ictus_advanced_observer')

IF NOT EXISTS (SELECT 1 FROM npcflock WHERE name = 'observer_04_z1_def_npc_attalica_ictus_advanced_observer')
BEGIN
INSERT INTO npcflock ([name], presenceid, flockmembercount, [definition], spawnoriginX, spawnoriginY, spawnrangeMin, spawnrangeMax, respawnseconds, totalspawncount, homerange, note, respawnmultiplierlow, [enabled], iscallforhelp, behaviorType, npcSpecialType) VALUES
	('observer_04_z1_def_npc_attalica_ictus_advanced_observer', @presenceid, 1, @definition, 0, 0, 0, 10, 18000, 0, 50, 'attalica npc', 0.9, 1, 1, 2, 0)
END

GO