# Analyzing Pizza Sales Trends

CREATE DATABASE pizzahut;

use pizzahut;

select * from order_details;

select * from orders;

select * from pizza_types;

select * from pizzas;

/*Retrieve the total number of orders placed.*/

select count(order_id) from orders;

/*Join relevant tables to find the category-wise distribution of pizzas.*/

select  COUNT(name), category FROM pizza_types GROUP BY category;

/*Calculate the total revenue generated from pizza sales.*/

SELECT ROUND(SUM((pizzas.price) * (order_details.quantity)),3) AS total_revenue FROM pizzas JOIN order_details ON pizzas.pizza_id = order_details.pizza_id;

/*Identify the highest-priced pizza.*/

select pizza_types.name,pizzas.price from pizzas join pizza_types on  pizza_types.pizza_type_id=pizzas.pizza_type_id   order by pizzas.price desc limit 1;

/*Identify the most common pizza size ordered.*/

SELECT COUNT(order_details.quantity) AS total_quantity, pizzas.size FROM order_details JOIN
pizzas ON order_details.pizza_id = pizzas.pizza_id GROUP BY pizzas.size ORDER BY total_quantity DESC LIMIT 1;

/*List the top 5 most ordered pizza types along with their quantities.*/

SELECT COUNT(order_details.quantity) AS quantity_of_pizza,pizza_types.name FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY quantity_of_pizza DESC LIMIT 5;

/*Join the necessary tables to find the total quantity of each pizza category ordered.*/

SELECT pizza_types.category,SUM(order_details.quantity) AS category_count FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category ORDER BY category_count asc; 

/*Determine the distribution of orders by hour of the day.*/

SELECT SUM(od.quantity) AS total_quantity,HOUR(o.time) AS time_hour FROM order_details od JOIN
orders o ON o.order_id = od.order_id GROUP BY time_hour;

/*Group the orders by date and calculate the average number of pizzas ordered per day.*/

SELECT ROUND(AVG(order_quantity), 0) AS order_perday FROM (SELECT o.date AS dates, SUM(od.quantity) AS order_quantity
FROM order_details od JOIN orders o ON o.order_id = od.order_id GROUP BY dates) AS order_quantity;

/*Determine the top 3 most ordered pizza types based on revenue.*/

SELECT pt.name AS pizza_name,ROUND(SUM(o.quantity * p.price), 2) AS total_revenue FROM
pizza_types pt JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id JOIN
order_details o ON o.pizza_id = p.pizza_id GROUP BY name ORDER BY total_revenue DESC LIMIT 3;
 
