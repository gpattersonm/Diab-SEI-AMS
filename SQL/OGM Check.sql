select CallID, TimeCreated, TimeModified

From
W6TASKS (nolock)

WHERE
CompletionOGMFlag = 1
and PendingPDFs is NULL
and AttachmentsReady = -1
and Status in (124135430, 124145668) --Complete and Incomplete