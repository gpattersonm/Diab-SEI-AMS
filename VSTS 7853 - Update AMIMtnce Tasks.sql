SELECT 
t.W6Key,
t.CallID,
t.OrderID,
t.TaskType,
tt.Name AS TaskType,
t.BucketID,
spc.Name as SchedulePriorityCategory,
t.[Status],
ts.Name as Status
from W6TASKS t
JOIN W6TASK_TYPES tt on t.TaskType = tt.W6Key
JOIN W6SCHEDULEPRIORITYCATEGORY spc on t.BucketID = spc.W6Key
JOIN W6TASK_STATUSES ts on t.[Status] = ts.W6Key
where tt.Name = 'AMIMtnce'
and ts.Name not in ('Completed', 'Cancelled', 'Incomplete')


-- SELECT * from W6SCHEDULEPRIORITYCATEGORY
-- update W6Tasks t set BucketID = 1166016512 where t.TaskType = 124821505 and t.BucketID = 1166016513 and t.Status not in (124135430, 124143616, 124145668)