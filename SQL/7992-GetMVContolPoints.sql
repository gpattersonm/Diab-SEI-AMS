create procedure [dbo].[CreateCopyGetMVContolPointsOW]

AS

BEGIN


select W6ONEWORLDCONTROLPOINT.AssetNumber, W6ONEWORLDCOMPLETION_ONEWORLDCONTROLPOINTS.w6key
INTO OneWorldControlPoints_temp
from W6ONEWORLDCOMPLETION_ONEWORLDCONTROLPOINTS, W6ONEWORLDCOMPLETION, W6ONEWORLDCONTROLPOINT
where W6ONEWORLDCOMPLETION.W6Key=W6ONEWORLDCOMPLETION_ONEWORLDCONTROLPOINTS.W6Key
and W6ONEWORLDCOMPLETION_ONEWORLDCONTROLPOINTS.OneWorldControlPoint=W6ONEWORLDCONTROLPOINT.W6Key
and DATEDIFF(day,W6ONEWORLDCONTROLPOINT.TimeCreated ,GETDATE())=17


SELECT t.w6key,
       STUFF(ISNULL((SELECT '; ' + convert(varchar(50),(x.AssetNumber))
                FROM OneWorldControlPoints_temp x
               WHERE x.W6key = t.W6key
            GROUP BY x.AssetNumber
             FOR XML PATH (''), TYPE).value('.','VARCHAR(max)'), ''), 1, 2, '') [GetMVContolPoints]
  INTO OneWorldControlPoints
  FROM OneWorldControlPoints_temp t
GROUP BY t.W6key	

Drop table OneWorldControlPoints_temp

END


