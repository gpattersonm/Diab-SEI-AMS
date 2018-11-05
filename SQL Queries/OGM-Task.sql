select w6key, TimeCreated, CreatedBy, Body, MessageStatus 

from W6OUTGOING_MESSAGES 

where body like '%DIABGP180504-2%' 
--AND Body like '%CompleteTask%'