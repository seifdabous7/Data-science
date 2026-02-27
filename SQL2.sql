select product_name, model_year, count(product_name) as"count"
from production.products
group by product_name,model_year
order by model_year desc;


select customer_id, count(order_id) as "quantity"
from sales.orders
group by customer_id ;


select sc.customer_id,first_name, last_name,city,order_date,order_status,required_date
from sales.customers sc join sales.orders so
on sc.customer_id = so.customer_id

select product_name,model_year,list_price,category_name
from production.products pp join production.categories pc
on pp.category_id = pc.category_id;




select so.customer_id product_id,quantity,list_price
from sales.order_items soi join sales.orders so
on soi.order_id =so.order_id;


select brand_name , count(brand_name) as "avg list price"
from production.brands pb join production.products pp
on pb.brand_id= pp.brand_id
group by brand_name
having  count(product_name)>30;



select brand_name, product_name,model_year,category_name
from production.brands pb join production.products pp 
on pb.brand_id = pp.brand_id
join production.categories pc
on pp.category_id=pc.category_id;

select brand_name, product_name,category_name, sum(quantity) as"sum of quantity"
from production.products pp join production.brands pb
on pp.brand_id = pb.brand_id join production.categories pc
on pc.category_id = pp.category_id join production.stocks ps
on pp.product_id = ps.product_id
group by  brand_name, product_name,category_name;

