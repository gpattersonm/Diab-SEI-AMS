select COUNT(t.W6Key) as Count, t.SchedulingPriority, spc.Name as SchedulePriorityCategory, t.DueDate, t.IsScheduled

from W6TASKS t
join W6TASK_TYPES tt on t.TaskType = tt.W6Key
JOIN W6TASK_STATUSES ts on t.[Status] = ts.W6Key
JOIN W6SCHEDULEPRIORITYCATEGORY spc on tt.SchedulePriorityCategory = spc.W6Key

WHERE tt.Name = 'AMIMtnce'
and t.DueDate > DATEADD(day,30,'2018-09-18T00:00:00')
and ts.Name not in (
    'Completed',
    'Cancelled'
)

GROUP BY spc.Name, t.DueDate, t.SchedulingPriority, t.SchedulePriority, t.IsScheduled