create procedure [dbo].[CreateCopyGetMVODRsOW]

AS

BEGIN


select W6ONEWORLDODR.AssetNumber, W6ONEWORLDCOMPLETION_ONEWORLDODRS.w6key
INTO OneWorldODRs_temp
from W6ONEWORLDCOMPLETION_ONEWORLDODRS, W6ONEWORLDCOMPLETION, W6ONEWORLDODR
where W6ONEWORLDCOMPLETION.W6Key=W6ONEWORLDCOMPLETION_ONEWORLDODRS.W6Key
and W6ONEWORLDCOMPLETION_ONEWORLDODRS.OneWorldODR=W6ONEWORLDODR.W6Key
and DATEDIFF(day,W6ONEWORLDODR.TimeCreated ,GETDATE())=17


SELECT t.w6key,
       STUFF(ISNULL((SELECT '; ' + convert(varchar(50),(x.AssetNumber))
                FROM OneWorldODRs_temp x
               WHERE x.W6key = t.W6key
            GROUP BY x.AssetNumber
             FOR XML PATH (''), TYPE).value('.','VARCHAR(max)'), ''), 1, 2, '') [GetMVODRs]
  INTO OneWorldODRs
  FROM OneWorldODRs_temp t
GROUP BY t.W6key	

Drop table OneWorldODRs_temp

END
