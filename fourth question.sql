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
	WHERE product IS NOT NULL
	GROUP BY tf.product,tf."year") 
	SELECT 
		product,
		"year",
		average_price,
			(((average_price - LAG(average_price) OVER (PARTITION BY product ORDER BY year)) 
	      / LAG(average_price) OVER (PARTITION BY product ORDER BY year)) * 100)::NUMERIC(10,1) AS price_year_growth
	FROM unique_product )
SELECT
	pg."year",
	avg(pg.price_year_growth)::NUMERIC(10,1) AS all_product_avg,
	yg.salary_year_growth,
	CASE 
        WHEN (avg(pg.price_year_growth) - yg.salary_year_growth) > 10                         
        THEN 'Greater then 10%'
        ELSE 'Less then 10%'
    END AS different,
    (avg(pg.price_year_growth) - yg.salary_year_growth)::NUMERIC(10,1) AS different
FROM product_price_growth pg
JOIN year_salary_growth yg
	ON pg."year" = yg."year"
GROUP BY pg."year",yg.salary_year_growth
ORDER BY pg."year";