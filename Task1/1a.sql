/****** Script for Display a list of all property names and their property id’s for Owner Id: 1426  ******/
SELECT 
[PropertyId],p.Name
FROM [Keys].[dbo].[OwnerProperty] op
inner join [Keys].[dbo].[Property] p on op.PropertyId = p.Id
WHERE op.OwnerId = 1426;	