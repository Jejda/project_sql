WITH minmax AS(
SELECT 
	max(tf."year") AS max_year,
	min(tf."year") AS min_year
FROM t_jiri_kejda_project_sql_primary_final tf 
WHERE tf.product IS NOT NULL
)
SELECT 
	tf.product,
	COALESCE((((average_price - LAG(average_price) OVER (PARTITION BY product ORDER BY year))
  	/ LAG(average_price) OVER (PARTITION BY product ORDER BY year)) * 100)::NUMERIC(10,1), 0) AS years_growth
FROM t_jiri_kejda_project_sql_primary_final tf 
WHERE tf."year" IN (SELECT min_year FROM minmax UNION SELECT max_year FROM minmax)
ORDER BY years_growth  
LIMIT 1;