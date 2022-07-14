with units_price_range as
	(select
		case
			when UnitPrice <= 1 then '0$-1$'
            when UnitPrice <= 2 then '1$-2$'
            when UnitPrice <= 3 then '2$-3$'
            when UnitPrice <= 4 then '3$-4$'
            when UnitPrice <= 5 then '4$-5$'
            when UnitPrice <= 6 then '5$-6$'
            when UnitPrice <= 7 then '6$-7$'
            when UnitPrice <= 8 then '7$-8$'
            when UnitPrice <= 9 then '8$-9$'
            when UnitPrice <= 10 then '9$-10$'
            else 'above 10$'
		END as price_range
	from data
	order by UnitPrice asc)

select
	*,
    concat(round(no_units/sum(no_units) over() * 100,2),'%')
from(
select
	price_range,
    count(*) as no_units
from units_price_range
group by price_range
order by price_range) as new_table