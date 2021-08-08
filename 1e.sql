/****** Script for Display a list of all property names and their property id’s for Owner Id: 1426 and e.	Display all property names, current tenants first and last names and rental payments per week/ fortnight/month ******/
SELECT 
op.[PropertyId],p.Name,pe.FirstName,pe.LastName , tp.PaymentAmount as 'Amount',	 trt.Name as 'RentalPaymentFrequency', 
(case when tp.IsActive = 1 then 'Current' else 'Past' end)	 as 'IsCurrentTenant'
FROM [Keys].[dbo].[OwnerProperty] op
inner join [Keys].[dbo].[Property] p on op.PropertyId = p.Id
inner join [Keys].[dbo].[TenantProperty] tp on tp.PropertyId = p.Id
inner join [Keys].[dbo].[TargetRentType] trt on trt.Id = tp.PaymentFrequencyId
inner join [Keys].dbo.Person pe on tp.TenantId = pe.Id
WHERE op.OwnerId = 1426;	