SELECT COUNT(DISTINCT item_name)
FROM menu_items;
--shows the number of items on the menu

------	
SELECT * 
FROM menu_items
ORDER BY price
----shows the least expensive items on the menu

SELECT * 
FROM menu_items
ORDER BY price DESC
----returns the most expensive items on the menu
	
SELECT COUNT(DISTINCT item_name)
FROM menu_items
WHERE category = 'Italian'
--- returns number of Italian dishes are on the menu

------
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price
---returns the least expensive Italian dishes on the menu

SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
---returns the most expensive Italian dishes on the menu

SELECT COUNT(DISTINCT item_name),category, AVG(price) AS avg_price
	FROM menu_items
	GROUP BY category
----returns the number of dishes in each category and the average dish price within each category



SELECT min(order_date), MAX(order_date)
FROM order_details
---returns the date range of the table

	
	
SELECT COUNT(DISTINCT order_id)
FROM order_details
---returns the number of orders within this date range

	

SELECT COUNT(DISTINCT order_details_id)
FROM order_details
---returns the number of items ordered within this date range

	

SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC
---returns the orders with the most number of items

	

SELECT COUNT(*) AS num_orders
FROM (
	SELECT order_id, COUNT(item_id) AS num_items
	FROM order_details
	GROUP BY order_id
	HAVING COUNT(item_id) > 12
)AS subquery;
----returns the number of orders with more than 12 items


SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mn ON od.item_id = mn.menu_item_id
---Joins both tables while including all rows in the order_details table

SELECT item_name, category, COUNT(order_id) AS num_times
FROM order_details AS od
LEFT JOIN menu_items AS mn ON od.item_id = mn.menu_item_id
GROUP BY item_name, category
ORDER BY num_times ASC
---returns least ordered items and their categories

	
SELECT item_name, category, COUNT(order_id) AS num_times
FROM order_details AS od
LEFT JOIN menu_items AS mn ON od.item_id = mn.menu_item_id
GROUP BY item_name, category
ORDER BY num_times DESC
---returns most ordered items and their categories


	
SELECT order_id, SUM(price) AS total_order_price
FROM order_details AS od
LEFT JOIN menu_items AS mn ON od.item_id = mn.menu_item_id
	WHERE price IS NOT NULL
GROUP BY order_id
ORDER BY total_order_price DESC
---returns the top 5 orders that spent the most money

	

SELECT category, COUNT(item_id) AS num_items, SUM(price) AS total_price
FROM order_details AS od
LEFT JOIN menu_items AS mn ON od.item_id = mn.menu_item_id
	WHERE order_id = 440
	GROUP BY category
	ORDER BY total_price DESC
--returns items purchased under highest spending order



SELECT category, COUNT(item_id) AS num_items, SUM(price) AS total_price
FROM order_details AS od
LEFT JOIN menu_items AS mn ON od.item_id = mn.menu_item_id
	WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY category
	ORDER BY total_price DESC
---returns details of top 5 highest spending orders



