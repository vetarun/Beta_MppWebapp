IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'CreatedOn' AND ObJECT_ID = OBJECT_ID('MppUserActivation'))
BEGIN
	ALTER TABLE MppUserActivation
		ADD CreatedOn datetime NOT NULL
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'Is48HourAlert' AND ObJECT_ID = OBJECT_ID('MppUserActivation'))
BEGIN
	ALTER TABLE MppUserActivation
		ADD Is48HourAlert int NOT NULL DEFAULT(0)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'PaymentAttmepts' AND ObJECT_ID = OBJECT_ID('Billing'))
BEGIN
	ALTER TABLE Billing
		ADD PaymentAttmepts int DEFAULT(0) NOT NULL
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'IsAlertSent' AND ObJECT_ID = OBJECT_ID('Billing'))
BEGIN
	ALTER TABLE Billing 
		ADD IsAlertSent int DEFAULT 0
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'AdGroupName' AND ObJECT_ID = OBJECT_ID('OptimizeLog'))
BEGIN
	ALTER TABLE OptimizeLog
		ADD AdGroupName varchar(max) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'CampName' AND ObJECT_ID = OBJECT_ID('OptimizeLog'))
BEGIN
	ALTER TABLE OptimizeLog
		ALTER COLUMN CampName nvarchar(200) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'KeyName' AND ObJECT_ID = OBJECT_ID('OptimizeLog'))
BEGIN
	ALTER TABLE OptimizeLog
		ALTER COLUMN KeyName nvarchar(200) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'AdGroupName' AND ObJECT_ID = OBJECT_ID('OptimizeLog'))
BEGIN
	ALTER TABLE OptimizeLog
		ALTER COLUMN AdGroupName nvarchar(200) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'CampaignName' AND ObJECT_ID = OBJECT_ID('KeywordNegative'))
BEGIN
	ALTER TABLE KeywordNegative
		ALTER COLUMN CampaignName nvarchar(200) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'AdGroupName' AND ObJECT_ID = OBJECT_ID('KeywordNegative'))
BEGIN
	ALTER TABLE KeywordNegative
		ALTER COLUMN AdGroupName nvarchar(200) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'OldValue' AND ObJECT_ID = OBJECT_ID('ClientLogDtl'))
BEGIN
	ALTER TABLE ClientLogDtl 
		ALTER COLUMN OldValue varbinary(max) 
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'NewValue' AND ObJECT_ID = OBJECT_ID('ClientLogDtl'))
BEGIN
	ALTER TABLE ClientLogDtl 
		ALTER COLUMN NewValue varbinary(max) 
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'UserType' AND ObJECT_ID = OBJECT_ID('MppAdmin'))
BEGIN
	ALTER TABLE MppAdmin 
		ADD UserType INT
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'CreatedBy' AND ObJECT_ID = OBJECT_ID('AffiliationCode'))
BEGIN
	ALTER TABLE AffiliationCode 
		ADD CreatedBy int not null
			CONSTRAINT defaultValue DEFAULT 1
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'AffiliateEarning' AND ObJECT_ID = OBJECT_ID('Billing'))
BEGIN
	ALTER TABLE Billing
		ADD AffiliateEarning decimal(18,2) NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'Email' AND ObJECT_ID = OBJECT_ID('MppAdmin'))
BEGIN
	ALTER TABLE MppAdmin 
		ALTER COLUMN  Email varchar(500)
END
GO