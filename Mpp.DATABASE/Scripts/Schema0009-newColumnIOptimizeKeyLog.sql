IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE Name = N'ManuallyChangedOn' AND ObJECT_ID = OBJECT_ID('OptimizeKeyLog'))
BEGIN
    ALTER TABLE OptimizeKeyLog
		ADD ManuallyChangedOn smalldatetime  
END
GO