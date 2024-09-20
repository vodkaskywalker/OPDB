UPDATE npcpresence SET roamingrespawnseconds = 10800, dynamiclifetime = 10800 WHERE name IN (
'roamer_cultists_z6',
'roamer_cultists_z7',
'roamer_cultists_z1')

UPDATE nf SET nf.respawnseconds = 10800 FROM npcflock nf INNER JOIN npcpresence np ON np.id = nf.presenceid
WHERE np.name IN (
'roamer_cultists_z6',
'roamer_cultists_z7',
'roamer_cultists_z1')

UPDATE npcinterzonegroup SET respawnTime = 10800 WHERE NAME = 'alpha3_cultist_preachers_izgroup'

GO