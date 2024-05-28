IF NOT EXISTS (SELECT 1 FROM packages WHERE name = 'p31-disable-indy-turrets')
BEGIN
	INSERT INTO packages (name, note) VALUES ('p31-disable-indy-turrets', 'Compensation for indy turrets being disabled for maintenance')
END

DECLARE @packid INT;

SET @packid = (SELECT TOP 1 id FROM packages WHERE name = 'p31-disable-indy-turrets')

DELETE FROM packageitems WHERE packageid = @packid

DECLARE @definition INT

SET @definition = (SELECT TOP 1 definition FROM entitydefaults WHERE definitionname = 'def_respec_token')

INSERT INTO packageitems (packageid, definition, quantity) VALUES (@packid, @definition, 2)

DECLARE @accountid INT;

DECLARE curs CURSOR LOCAL FAST_FORWARD READ_ONLY FOR SELECT [accountID] FROM accounts; --<<FIX accounts to-??? proper table from pre-alpha

SET @packid = (SELECT TOP 1 id FROM packages WHERE name='p31-disable-indy-turrets')

OPEN curs

FETCH NEXT FROM curs INTO @accountid

WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC dbo.accountPackageBought  @accountid, @packid; --logs the package and account
	EXEC dbo.accountPackageProcessOne @accountid, @packid; --puts items in set of redeemables for account to claim in-game
    FETCH NEXT FROM curs INTO @accountid;
END

CLOSE curs;
DEALLOCATE curs;