USE perpetuumsa

GO

---- Add new column ----

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.channels ADD
	isForcedJoin bit NULL
GO
ALTER TABLE dbo.channels SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

---- Fill it for General chat ----

UPDATE channels SET isForcedJoin = 1 WHERE name = 'General chat' and type = 1

GO