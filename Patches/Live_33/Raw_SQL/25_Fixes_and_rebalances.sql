USE perpetuumsa;

GO

---- Reallocate T0 server-wide ep boosters to Daoden

DECLARE @definition INT
DECLARE @itemshop_preset_old INT
DECLARE @itemshop_preset_new INT

SET @itemshop_preset_old = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'tm_preset_pve')
SET @itemshop_preset_new = (SELECT TOP 1 id FROM itemshoppresets WHERE name = 'daoden_preset')

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_server_wide_ep_booster_t0')

UPDATE itemshop SET presetid = @itemshop_preset_new WHERE targetdefinition = @definition AND presetid = @itemshop_preset_old

GO

---- Add cargo to advanced couriers so they finally stop crying about it's missing

UPDATE robottemplates
SET description = '#robot=iC8#head=i5B#chassis=i5C#leg=i5D#container=i146#headModules=[|m0=[|definition=i302|slot=i1]|m1=[|definition=i317|slot=i2]|m2=[|definition=i31A|slot=i3]|m3=[|definition=i31A|slot=i4]|m4=[|definition=i314|slot=i5]]#chassisModules=[|m0=[|definition=i341|slot=i1|ammoDefinition=i989|ammoQuantity=i32]|m1=[|definition=i341|slot=i2|ammoDefinition=i989|ammoQuantity=i32]|m2=[|definition=i2EA|slot=i3]]#legModules=[|m0=[|definition=i338|slot=i1|ammoDefinition=i298|ammoQuantity=iA]|m1=[|definition=i2D5|slot=i2]|m2=[|definition=i57C|slot=i3]]'
WHERE name = 'gamma_intakt_advanced'

UPDATE robottemplates
SET description = '#robot=i3AE#head=i3AB#chassis=i3AC#leg=i3AD#container=i146#headModules=[|m0=[|definition=i2DE|slot=i1]|m1=[|definition=i314|slot=i2]|m2=[|definition=i302|slot=i3]]#chassisModules=[|m0=[|definition=i2F3|slot=i1]|m1=[|definition=i2F3|slot=i2]|m2=[|definition=i356|slot=i3|ammoDefinition=i98F|ammoQuantity=i0]|m3=[|definition=i356|slot=i4|ammoDefinition=i98F|ammoQuantity=i0]|m4=[|definition=i2EA|slot=i5]]#legModules=[|m0=[|definition=i2D5|slot=i1]|m1=[|definition=i332|slot=i2]|m2=[|definition=i57C|slot=i3]]'
WHERE name = 'gamma_troiar_advanced'

UPDATE robottemplates
SET description = '#robot=iC7#head=i58#chassis=i59#leg=i5A#container=i146#headModules=[|m0=[|definition=i314|slot=i1]|m1=[|definition=i31A|slot=i2]|m2=[|definition=i317|slot=i3]|m3=[|definition=i317|slot=i4]|m4=[|definition=i302|slot=i5]]#chassisModules=[|m0=[|definition=i35C|slot=i1|ammoDefinition=i980|ammoQuantity=i0]|m1=[|definition=i35C|slot=i2|ammoDefinition=i980|ammoQuantity=iA]|m2=[|definition=i2ED|slot=i3]]#legModules=[|m0=[|definition=i2D5|slot=i1]|m1=[|definition=i2B7|slot=i2]|m2=[|definition=i57C|slot=i3]]'
WHERE name = 'gamma_cameleon_advanced'

GO