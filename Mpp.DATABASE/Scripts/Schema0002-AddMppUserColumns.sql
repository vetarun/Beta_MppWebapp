IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'stp_custId' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD stp_custId varchar(500)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'stp_cardId' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD stp_cardId varchar(500)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'Affiliation_Id' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
    ALTER TABLE MppUser
		ADD Affiliation_Id int NULL
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'Affiliation_Id' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser 
		ADD CONSTRAINT FK_Affiliate_ID FOREIGN KEY(Affiliation_Id) REFERENCES AffiliationCode (AffiliateID) ON DELETE SET NULL
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'IsAgreementConfirm' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD IsAgreementConfirm bit Not NULL default(0)
END
GO
  
IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'DataImportAlert' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD DataImportAlert int NULL default(0)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'AccessLimitAlert' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD AccessLimitAlert int NOT NULL default(1)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'SevenDayTrialAlert' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD SevenDayTrialAlert int NOT NULL default(0)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'TrialEndAlert' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser
		ADD TrialEndAlert int NOT NULL default(0)
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'IsArchive' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser 
		ADD IsArchive BIT not null DEFAULT 0;
END
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'ActivationEmailAlert' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser 
		ADD  ActivationEmailAlert int DEFAULT 0
END
GO
IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'IsArchiveOn' AND ObJECT_ID = OBJECT_ID('MppUser'))
BEGIN
	ALTER TABLE MppUser 
		ADD IsArchiveOn smalldatetime  DEFAULT Null;
END

