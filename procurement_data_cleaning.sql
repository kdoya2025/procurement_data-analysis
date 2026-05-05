select*
from`procurement kpi analysis dataset`
limit 10;

create table staging_procurement
like `procurement kpi analysis dataset`;
insert into staging_procurement
select*
from`procurement kpi analysis dataset`;
select*
from staging_procurement;
-- remove duplicate

select*,row_number() over(partition by PO_ID,
Supplier,Order_Date,Quantity) as row_num
from staging_procurement;

with staging_cts as (select*,row_number() over(partition by PO_ID,
Supplier,Item_Category,Order_Status,Quantity,Negotiated_Price,Compliance) as row_num
from staging_procurement)
select *
from staging_cts
where row_num >1;
select *
from staging_procurement
where Supplier='Alpha_Inc'
order by Order_Date;
-- there is no duplicate

-- standardize
select distinct supplier
from staging_procurement
order by supplier asc;

select distinct Item_Category
from staging_procurement
order by Item_Category asc;

select distinct Order_Status
from staging_procurement
order by Order_Status asc;

select distinct Compliance
from staging_procurement
order by Compliance asc;

update staging_procurement
set Order_Date=str_to_date(order_date,'%Y-%m-%d')
;

UPDATE staging_procurement
SET Delivery_Date= str_to_date(Delivery_Date,'%Y-%m-%d')
where Delivery_Date !='N/A';

alter table staging_procurement
add column days_to_deliver  int;

update staging_procurement
set days_to_deliver=datediff(Delivery_Date,Order_Date)

;
update staging_procurement
SET days_to_deliver= NULL
WHERE days_to_deliver IS NULL;


-- null values
select *
from staging_procurement
where Supplier= '' or Supplier= NULL;


select *
from staging_procurement
where Order_Date= '' or Order_Date= NULL;

select Order_Status, delivery_date,count(*)
from staging_procurement
where  delivery_date IS NULL
group by Order_Status,delivery_date;
update  staging_procurement
set delivery_date= NULL
where delivery_date='N/A';

update staging_procurement
set Defective_Units=round(Defective_Units,0);

select *
from staging_procurement
where Item_Category= '' or Item_Category IS NULL;

select *
from staging_procurement
where Order_Status= '' or Order_Status IS NULL;

select *
from staging_procurement
where Quantity= '' or Quantity IS NULL;

select *
from staging_procurement
where Unit_Price= '' or Unit_Price IS NULL;

select *
from staging_procurement
where Negotiated_Price= '' or Negotiated_Price IS NULL;

select*
from staging_procurement
where Defective_Units= '' or Defective_Units IS NULL;

update staging_procurement
set Defective_Units = NULL
where Defective_Units= 0 ;


select*
from staging_procurement
where Compliance= '' or Compliance IS  NULL;

select *
from staging_procurement;


select*
from staging_procurement AS ED
inner JOIN staging_procurement AS ED1
ON ED.PO_ID= ED1.PO_ID
;




select*
from staging_procurement;
select*
from `procurement kpi analysis dataset`





