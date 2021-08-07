/****** Script for Display the current home value for each property in question a  ******/
SELECT 
op.[PropertyId],p.Name,phv.Value as 'CurrentHomeValue' 
FROM [Keys].[dbo].[OwnerProperty] op
inner join [Keys].[dbo].[Property] p on op.PropertyId = p.Id
inner join [Keys].[dbo].PropertyHomeValue phv on p.Id = phv.PropertyId
inner join [Keys].[dbo].PropertyHomeValueType phvt on phvt.Id = phv.HomeValueTypeId
WHERE op.OwnerId = 1426
and phvt.HomeValueType = 'Current'
and phv.IsActive = 1;