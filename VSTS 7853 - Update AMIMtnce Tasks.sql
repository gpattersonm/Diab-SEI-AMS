-- identify the items to update
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



-- Update the necessary tasks. Uncomment the below query after validating the proper keys
-- UPDATE
-- W6Tasks t 
-- set t.BucketID = 1166016512 -- Large volume/window
-- and t.Revision to t.Revision + 1  -- incriment Revision by 1
-- where 
-- t.TaskType = 124821505 -- AMIMtnce
-- and t.BucketID = 1166016513 -- Regular
-- and t.Status not in (
--     124135430, -- Completed
--     124143616, -- Cancelled
--     124145668  -- Incomplete
--     )