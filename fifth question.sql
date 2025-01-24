WITH year_salary_growth AS (
	WITH year_salary AS (
		SELECT DISTINCT 
			"year",
			average_salary
		FROM t_jiri_kejda_project_sql_primary_final tf 
		WHERE industry IS NULL 
		ORDER BY "year" )
		SELECT *,
			(((average_salary - LAG(average_salary) OVER ( ORDER BY year)) 
		      / LAG(average_salary) OVER ( ORDER BY year)) * 100)::NUMERIC(10,1) AS salary_year_growth
		FROM year_salary), 
product_price_growth AS (
	WITH unique_product AS (
	SELECT
		tf.product,
	    tf."year",
	    MAX(tf.average_price ) as average_price   
	FROM t_jiri_kejda_project_sql_primary_final tf
	GROUP BY tf.product,tf."year") 
	SELECT 
		product,
		"year",
		average_price,
		(((average_price - LAG(average_price) OVER (PARTITION BY product ORDER BY year)) 
	      / LAG(average_price) OVER (PARTITION BY product ORDER BY year)) * 100)::NUMERIC(10,1) AS price_year_growth
	FROM unique_product ),
gdp_growth AS (
	SELECT 
		ts."year",
		ts.gdp,
		(((ts.gdp - LAG(ts.gdp) OVER (ORDER BY year)) 
		      / LAG(ts.gdp) OVER (ORDER BY year)) * 100)::NUMERIC(10,1) AS gdp_year_growth
	FROM t_jiri_kejda_project_sql_secondary_final ts 
	WHERE ts.country = 'Czech Republic')	
SELECT
	pg."year",
	avg(pg.price_year_growth)::numeric(10,1) AS all_product_avg,
	yg.salary_year_growth,
	gg.gdp_year_growth
FROM product_price_growth pg
JOIN year_salary_growth yg
	ON pg."year" = yg."year"
JOIN gdp_growth gg
	ON pg."year" = gg."year"
GROUP BY pg."year",yg.salary_year_growth, gg.gdp_year_growth
ORDER BY pg."year";