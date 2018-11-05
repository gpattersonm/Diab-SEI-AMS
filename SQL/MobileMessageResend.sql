select t.W6Key, t.OrderID, a.AssignedEngineers, ts.Name as Status

from
W6TASKS t
join W6TASK_STATUSES ts on t.Status = ts.W6Key
left join W6ASSIGNMENTS a on a.Task = t.W6Key

where t.OrderID in(
'CIS7126695375'
)

order by t.W6Key