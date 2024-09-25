CREATE DATABASE pizzahut;
use pizzahut;
select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;
select count(order_id) from orders;

select  COUNT(name), category FROM pizza_types GROUP BY category;

SELECT ROUND(SUM((pizzas.price) * (order_details.quantity)),3) AS total_revenue FROM pizzas JOIN order_details ON pizzas.pizza_id = order_details.pizza_id;

select pizza_types.name,pizzas.price from pizzas join pizza_types on  pizza_types.pizza_type_id=pizzas.pizza_type_id   order by pizzas.price desc limit 1;

SELECT COUNT(order_details.quantity) AS total_quantity, pizzas.size FROM order_details JOIN
pizzas ON order_details.pizza_id = pizzas.pizza_id GROUP BY pizzas.size ORDER BY total_quantity DESC LIMIT 1;

SELECT COUNT(order_details.quantity) AS quantity_of_pizza,pizza_types.name FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY quantity_of_pizza DESC LIMIT 5;


SELECT pizza_types.category,SUM(order_details.quantity) AS category_count FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category ORDER BY category_count asc; 

select time  from orders;
SELECT SUM(od.quantity) AS total_quantity,HOUR(o.time) AS time_hour FROM order_details od JOIN
orders o ON o.order_id = od.order_id GROUP BY time_hour;

SELECT ROUND(AVG(order_quantity), 0) AS order_perday FROM (SELECT o.date AS dates, SUM(od.quantity) AS order_quantity
FROM order_details od JOIN orders o ON o.order_id = od.order_id GROUP BY dates) AS order_quantity;

SELECT pt.name AS pizza_name,ROUND(SUM(o.quantity * p.price), 2) AS total_revenue FROM
pizza_types pt JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id JOIN
order_details o ON o.pizza_id = p.pizza_id GROUP BY name ORDER BY total_revenue DESC LIMIT 3;
 
select max(price) as Highest_price_pizza from pizzas;
select size,count(size) from pizzas group by size limit 1 ;
select count(pizza_type_id),pizza_type_id from pizzas group by pizza_type_id;
select p1.ingredients,p2.pizza_type_id,count(p2.pizza_type_id) from pizza_types p1 join pizzas p2  on p1.pizza_type_id=p2.pizza_type-id group by p2.pizza_type_id ;