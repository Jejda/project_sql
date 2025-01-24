WITH unique_salaries AS (
    SELECT 
        "year",
        industry,
        MAX(average_salary) as average_salary  
    FROM t_jiri_kejda_project_sql_primary_final
    GROUP BY "year", industry
),
salary_growth AS (
    SELECT 
        "year",
        industry,
        average_salary,
        LAG(average_salary) OVER (PARTITION BY industry ORDER BY "year") AS previous_year_salary
    FROM unique_salaries
)
SELECT 
    "year",
    industry,
    average_salary,
    --previous_year_salary::NUMERIC (10,1) as previous_year_salary,
    ((average_salary - previous_year_salary) / previous_year_salary * 100)::numeric(10,2) AS growth_percentage
FROM salary_growth
WHERE previous_year_salary IS NOT NULL
ORDER BY industry, "year";