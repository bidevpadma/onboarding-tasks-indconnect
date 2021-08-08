/****** Script for Display a list of all property names and their property id’s for Owner Id: 1426  and sum of all payments from start date to end date******/
SELECT 
op.OwnerId, op.[PropertyId],p.Name,trt.Name as 'RentalPaymentFrequency',SUM(prp.amount) as 'PaymentsSum'
FROM [Keys].[dbo].[OwnerProperty] op
inner join [Keys].[dbo].[Property] p on op.PropertyId = p.Id
inner join [Keys].[dbo].[PropertyRentalPayment] prp on prp.PropertyId = p.Id
inner join [Keys].[dbo].[TargetRentType] trt on trt.Id = prp.FrequencyType 
inner join [Keys].[dbo].[TenantProperty] tp on tp.PropertyId = p.Id 
WHERE 
op.OwnerId = 1426 and 
prp.Date between tp.StartDate and tp.EndDate
GROUP BY op.OwnerId,op.[PropertyId],p.Name,trt.Name
