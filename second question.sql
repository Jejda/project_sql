WITH minmax AS(
SELECT 
	max(tf."year") AS max_year,
	min(tf."year") AS min_year
FROM t_jiri_kejda_project_sql_primary_final tf 
WHERE tf.product IS NOT NULL
)
SELECT 
	tf."year", 
	tf.industry,
	tf.product,
	(tf.average_salary/tf.average_price)::Numeric(10,1) AS products_for_salary
FROM t_jiri_kejda_project_sql_primary_final tf 
WHERE tf."year" IN (SELECT min_year FROM minmax UNION SELECT max_year FROM minmax)
	AND product IN ('Chléb konzumní kmínový','Mléko polotučné pasterované')
ORDER BY tf.industry, tf.product, tf."year";  