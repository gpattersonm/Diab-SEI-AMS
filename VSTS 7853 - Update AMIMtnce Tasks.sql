-- identify the items to update
SELECT
t.W6Key,
t.CallID,
t.OrderID,
t.TaskType,
tt.Name AS TaskType,
spc.W6Key,
spc.Name as SchedulePriorityCategory,
t.[Status],
ts.Name as Status
from W6TASKS t
JOIN W6TASK_TYPES tt on t.TaskType = tt.W6Key
JOIN W6SCHEDULEPRIORITYCATEGORY spc on tt.SchedulePriorityCategory = spc.W6Key
JOIN W6TASK_STATUSES ts on t.[Status] = ts.W6Key
where tt.Name = 'AMIMtnce'