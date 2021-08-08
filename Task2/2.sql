SELECT 
      op.[PropertyId],
	  op.OwnerId,
	  concat(per.FirstName, ' ', per.LastName) as 'OwnerName',
      concat(addr.Number, ' ', addr.Street, ', ', addr.City, ', ', (SELECT [Name]  FROM [Keys].[dbo].[Country] where Id = addr.CountryId) , ' ', addr.PostCode) as 'PropertyAddress',
	  concat(
	  (case when prop.Bedroom IS null then 0 
	  else prop.Bedroom 
	  end),
	  ' Bedrooms, ',
	  (case when prop.Bathroom IS null then 0 
	  else prop.Bathroom 
	  end),
	  ' Bathrooms'
	  )as 'Property Details',
	  concat(
	  '$', 
	  prp.Amount, 
	  ' per ', 
	  (case 
			when prp.FrequencyType=1 then 'week'
			when prp.FrequencyType=2 then 'fortnight'
			when prp.FrequencyType=3 then 'month'
	  else 
			'Unknown' 
	  end)
	  ) as 'RentalPayments'
  FROM [Keys].[dbo].OwnerProperty op
  inner join [Keys].[dbo].Person per on per.Id = op.OwnerId
  inner join [Keys].[dbo].Property prop on prop.Id = op.PropertyId
  inner join [Keys].[dbo].[Address] addr on addr.AddressId = prop.AddressId
  inner join [Keys].[dbo].PropertyRentalPayment prp on prp.PropertyId = op.PropertyId;

  select
  	  pex.[Amount] as 'ExpenseAmount',
      pex.[Date]  as 'ExpenseDate',
      pex.[Description]  as 'ExpenseDescription'
 FROM [Keys].[dbo].OwnerProperty op
 inner join [Keys].[dbo].[PropertyExpense] pex on op.PropertyId = pex.PropertyId
 where op.OwnerId = 348;
 

  
