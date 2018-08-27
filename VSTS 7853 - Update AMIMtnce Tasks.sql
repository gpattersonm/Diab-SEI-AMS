-- identify the items to update
SELECT
t.W6Key,
t.CallID,
t.OrderID,
t.TaskType,
-- tt.Name AS TaskType,
-- spc.Name as SchedulePriorityCategory,
t.[Status],
ts.Name as Status
from W6TASKS t
JOIN W6TASK_TYPES tt on t.TaskType = tt.W6Key
-- JOIN W6SCHEDULEPRIORITYCATEGORY spc on t.BucketID = spc.W6Key
JOIN W6TASK_STATUSES ts on t.[Status] = ts.W6Key
where tt.Name = 'AMIMtnce'
and ts.Name not in ('Completed', 'Cancelled', 'Incomplete')


select * from W6SCHEDULEPRIORITYCATEGORY
select * from W6CAPACITYBUCKET



-- Update the necessary tasks. Uncomment the below query after validating the proper keys
-- UPDATE W6Tasks
-- SET    ???????? = ???????, -- Large volume/window
--        Revision = Revision + 1, 
--        BinaryData = NULL 
-- WHERE  TaskType = 124821505 -- AMIMtnce
--        AND ???????? = ???????? -- Regular
--        AND status NOT IN ( 124135430, -- Completed  
--                              124143616, -- Cancelled  
--                              124145668 -- Incomplete  
--                             );