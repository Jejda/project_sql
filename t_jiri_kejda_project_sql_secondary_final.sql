CREATE TABLE t_jiri_kejda_project_sql_secondary_final AS
SELECT 
 	c.country,
 	e."year",
 	e.population, 
 	e.gdp,
 	e.taxes, 
 	e.gini 
FROM countries c
JOIN economies e 
 	ON c.country = e.country
WHERE c.continent = 'Europe';