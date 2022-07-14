with sum_per_month as
	(select
		extract(year_month from invoicedate) as 2012_month,
		round(sum(UnitPrice),0) as total_earned
	from data
	where year(InvoiceDate) = 2012
	group by 2012_month)

select
	2012_month,
    total_earned,
    concat(round(((total_earned/sales_evolution)-1)*100,1),' %') as growth_vs_prev_month
from
(select 
	*,
    lag(total_earned,1) over(order by 2012_month) as sales_evolution
from sum_per_month) as new_table