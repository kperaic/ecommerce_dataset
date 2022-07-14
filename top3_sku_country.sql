with sales_per_country as
	(select 
		description,
		count(Description) as no_sales,
		country
	from data
	group by description
	order by country, no_sales desc)

select
*sal
from
	(select
		*,
		row_number() over(partition by country order by no_sales desc) as ranking
	from sales_per_country) as new_table
where ranking < 4