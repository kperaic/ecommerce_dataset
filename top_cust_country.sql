with sum_per_country as
	(select 
		customerID,
		country,
		round(sum(unitprice),0) as total_spent
	from data
	where customerid != 0
	group by customerid)

select
	*
from
	(select 
		*,      
		rank() over(partition by country order by total_spent desc) as top_ranking
	from sum_per_country) as new_table
where top_ranking = 1
order by total_spent desc