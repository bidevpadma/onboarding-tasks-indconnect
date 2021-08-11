/****** Script for Display a list of all property names and their property id’s for Owner Id: 1426  and sum of all payments from start date to end date******/
SELECT p.name,trt.name as 'RentalPaymentFrequency',tp.PaymentAmount,
 (CASE
 when tp.PaymentFrequencyId= 1 then DATEDIFF(WEEK,tp.StartDate,tp.EndDate)
 when tp.PaymentFrequencyId = 2 then DATEDIFF(MONTH,tp.StartDate,tp.EndDate)/2 
 when tp.PaymentFrequencyId = 3 then DATEDIFF(MONTH,tp.StartDate,tp.EndDate)
 else Null
 END)*PaymentAmount as 'Sum Of All Payments'
FROM [Keys].[dbo].[OwnerProperty] op
inner join [Keys].[dbo].[Property] p on op.PropertyId = p.Id
inner join [Keys].[dbo].[PropertyRentalPayment] prp on prp.PropertyId = p.Id
inner join [Keys].[dbo].[TargetRentType] trt on trt.Id = prp.FrequencyType 
inner join [Keys].[dbo].[TenantProperty] tp on tp.PropertyId = p.Id 
WHERE 
op.OwnerId = 1426





 