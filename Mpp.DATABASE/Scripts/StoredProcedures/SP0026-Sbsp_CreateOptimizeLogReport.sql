IF EXISTS(
        SELECT*
        FROM sys.objects
        WHERE object_id = OBJECT_ID(N'[dbo].[Sbsp_CreateOptimizeLogReport]')

            AND type IN (
                N'P'
				, N'PC'
				) 
		)
	DROP PROCEDURE[dbo].[Sbsp_CreateOptimizeLogReport]
GO 
CREATE PROCEDURE [dbo].[Sbsp_CreateOptimizeLogReport]
(	
	@tblOptimizelog OptimizeKeyLogType READONLY,
	@ReportID  int,
	@Type      int,
	@Date      smalldatetime
)   
AS
BEGIN 
BEGIN TRANSACTION
set xact_abort on
      If(@Type = 3)
	  BEGIN
		  MERGE INTO OptimizeKeyLog k1
		  USING @tblOptimizelog k2
		  ON k1.ReportID = @ReportID and k1.CampaignID = k2. CampaignID and k1.AdgroupID = k2.AdgroupID and k1.KeywordID = k2.KeywordID
		  WHEN MATCHED THEN
		  UPDATE SET k1.UpdateStatus = k2.UpdateStatus, k1.ModifiedOn = GETDATE()
		  WHEN NOT MATCHED THEN
		  INSERT VALUES(@ReportID,k2.CampaignID,k2.AdgroupID,k2.KeywordID,@Type,Null,k2.ModifiedField,k2.OldValue,k2.NewValue,
		  k2.ReasonID,k2.ReasonValue,k2.UpdateStatus,null,GETDATE(),NULL);

		  Update Reports set UpdtBidStatus=1, IsLocallyProcessed = 1, OptimizeDate=@Date, ModifiedOn = GETDATE() where ReportID=@ReportID
	  END
	  ELSE IF(@Type = 4)
	  BEGIN
		  MERGE INTO OptimizeKeyLog k1
		  USING @tblOptimizelog k2
		  ON k1.ReportID = @ReportID and k1.CampaignID = k2. CampaignID and k1.AdgroupID = k2.AdgroupID and k1.KeywordID = k2.KeywordID and k1.Query = k2.Query
		  WHEN MATCHED THEN
		  UPDATE SET k1.UpdateStatus = k2.UpdateStatus, k1.ModifiedOn = GETDATE()
		  WHEN NOT MATCHED THEN
		  INSERT VALUES(@ReportID,k2.CampaignID,k2.AdgroupID,k2.KeywordID,@Type,k2.Query,k2.ModifiedField,k2.OldValue,k2.NewValue,
		  k2.ReasonID,k2.ReasonValue,k2.UpdateStatus,null,GETDATE(),NULL);

		  UPDATE t1 SET IsNegKeyword = t2.UpdateStatus from SearchtermInventory t1 JOIN @tblOptimizelog t2 ON t1.RecordID = t2.KeywordID and t1.Query = t2.Query
		  
		  Update Reports set UpdtNegStatus=1, IsLocallyProcessedSearchTerm = 1, OptimizeDate=@Date, ModifiedOn = GETDATE() where ReportID=@ReportID
	  END
COMMIT
END