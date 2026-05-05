

-- the analysis

select supplier,round(sum(Negotiated_Price*Quantity),2) as total_price,count(*) as order_deliverd,
avg(days_to_deliver) as avg_days_to_delivered
from staging_procurement
where Order_Status='Delivered'
group by supplier
order by supplier asc;


select supplier,
round(sum(Negotiated_Price*Quantity),2) as total_price, count(*) order_deliverd,
round(avg(days_to_deliver) ,0)as avg_days_to_delivered,
sum(case when Compliance='No' then 1 else 0 end)*1.0/count(*) as quality_score
from staging_procurement

group by supplier

;

-- the fastest supplier is the supplier Gamma Co avg delivered time is 10 days when we combined all the category items
select Supplier,count(Compliance) as no_compliance
from staging_procurement

where Compliance ='No' and Order_Status='Delivered'
group by Supplier
order by Supplier asc;
-- 'Epsilon_Group' is the supplier with the lowest total of no conformity
-- 'Delta_Logistics' is the supplier with the higuest not conformity
-- for product conformity with what we odered 'Epsilon_Group' is trustfull  


select Supplier,Order_Date,Item_Category, Unit_Price,lag(Unit_Price) 
OVER(partition by supplier order by Item_Category, Order_Date) as previous_price
from staging_procurement
order by  Supplier,Item_Category;

-- unite_price are highly changing over yer for each company

 select supplier,order_status,  count(order_date)
from staging_procurement
group by Supplier,order_status
order by supplier;

select supplier,order_status,count(order_status),round( count(order_status)*100/sum(count(order_date)) over (partition by supplier),2) as percentage
from staging_procurement
group by supplier,order_status;

