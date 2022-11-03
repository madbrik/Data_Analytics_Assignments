--Question 1
select *
from
(select "poc", to_char("date", 'day'), "date", "total_order"
 from
 (select distinct a.primary_poc as "poc", o.occurred_at as "date", sum("total") as "total_order"
  from "orders" o
  join "accounts" a
  on o.account_id = a.id
  group by "poc", "date") as table_one
 order by "total_order" desc) as table_two;
 
 /*The day of the week with the highest orders was Monday and the primary point of contact was Kyoko Randall*/
 
 
-- Question 2
select *
from
(select "name", to_char("date", 'day'), "date", "total_amt"
 from
 (select distinct "name", o.occurred_at as "date", sum("total_amt_usd") as "total_amt"
  from "orders" o
  join "accounts" a
  on o.account_id = a.id
  where "name" = 'Walmart'
  group by "name", "date") as table_one
 order by "total_amt" desc) as table_two;
 

--Question 3
select *
from
(select distinct ("name"), "week_day", to_char("week_day", 'month') "months", to_char("week_day", 'day') "day", sum("total_sales") as "sales_total"
 from
 (select s.name, o.occurred_at "week_day", o.total "total_sales"
 from "sales_reps" s
 join "orders" o
 on s.region_id = o.id) as "table_one"
 group by "name", "week_day"
 order by "sales_total" desc) "table_two";
 
 /* Carletta Kosinski, Charles Bidwell, Chau Rowles, Cliff Meints, Cordell Rieder, Delilah Krum,
 Julie Starr, Kathleen Lalonde amd Sherlene all made the highest the highest sales. The sales was made 
 on Thursday, 5th Day of November, 2015.*/
