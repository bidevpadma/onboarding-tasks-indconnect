SELECT j.Id, j.JobDescription,j.JobStartDate,j.JobEndDate, js.[Status]
FROM [Keys].[dbo].[Job] j
inner join JobStatus js on j.JobStatusId = js.Id
where status not in ('Finished','Cancelled','Deleted');