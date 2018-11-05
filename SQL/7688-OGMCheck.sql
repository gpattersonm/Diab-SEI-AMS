select
TimeCreated,
Body
from W6OUTGOING_MESSAGES 
where TimeCreated > '2018-10-19 00:00:00' 
and body like '%On Hold%'
-- and body like '%OneWorld%'
and body like '%DIABGP181019-2%'
