USE perpetuumsa

GO

-- Add effect

DECLARE @effectCatName BIGINT
SET @effectCatName = (SELECT TOP 1 flag FROM effectcategories WHERE name = 'effcat_zone_effects')

DECLARE @effectName AS VARCHAR(100) = 'effect_gods_bless';

IF NOT EXISTS (SELECT 1 FROM effects WHERE name = @effectName)
BEGIN
	INSERT INTO effects (effectcategory, duration, name, description, note, isaura, auraradius, ispositive, display, saveable) VALUES
	(@effectCatName, 0, @effectName, @effectName+'_desc', 'Gods Bless effect', 1, 0, 1, 1, 0)
END

DECLARE @effectId INT;

SET @effectId = (SELECT TOP 1 id FROM effects WHERE name = @effectName)

DECLARE @zoneId INT

SET @zoneId = (SELECT TOP 1 id FROM zones WHERE name = 'zone_ASI')

DELETE FROM zoneeffects WHERE zoneid = @zoneId;

INSERT INTO zoneeffects (zoneid, effectid) VALUES
(@zoneId, @effectId)

GO