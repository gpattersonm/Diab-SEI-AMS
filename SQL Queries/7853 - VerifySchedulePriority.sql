select 
-- COUNT(t.W6Key) as Count,
t.OrderID,
t.DisplayDate,
d.Name as District,
r.Name as Region,
t.SchedulingPriority, 
spc.Name as SchedulePriorityCategory, 
t.DueDate, 
t.IsScheduled

from W6TASKS t
join W6TASK_TYPES tt on t.TaskType = tt.W6Key
JOIN W6TASK_STATUSES ts on t.[Status] = ts.W6Key
JOIN W6SCHEDULEPRIORITYCATEGORY spc on tt.SchedulePriorityCategory = spc.W6Key
JOIN W6DISTRICTS d on t.District = d.W6Key
JOIN W6REGIONS r on t.Region = r.W6Key

WHERE tt.Name = 'AMIMtnce'
and t.DueDate > DATEADD(day,30,'2018-09-18T00:00:00')
and ts.Name not in (
    'Completed',
    'Cancelled'
)
AND t.SchedulingPriority != '12'

-- GROUP BY spc.Name, t.DueDate, t.SchedulingPriority, t.SchedulePriority, t.IsScheduled