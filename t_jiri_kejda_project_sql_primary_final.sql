CREATE TABLE t_jiri_kejda_project_sql_primary_final AS
WITH salary_data AS (
    SELECT
        avg(cp.value) AS average_salary,
        cb."name" AS industry,
        cp.payroll_year AS year
    FROM czechia_payroll cp
    LEFT JOIN czechia_payroll_industry_branch cb
        ON cp.industry_branch_code = cb.code
    WHERE cp.value_type_code = 5958
        AND cp.calculation_code = 200
    GROUP BY cb.name, cp.payroll_year
),
price_data AS (
    SELECT
        avg(cp.value)::NUMERIC(10,1) AS average_price,
        cpc."name" AS product,
        EXTRACT(YEAR FROM cp.date_from) AS year
    FROM czechia_price cp
    JOIN czechia_price_category cpc
        ON cp.category_code = cpc.code
    WHERE cp.region_code IS NULL
    GROUP BY name, year
)
SELECT 
    s."year",
    s.industry,
    s.average_salary,
    p.product,
    p.average_price
FROM salary_data s
LEFT JOIN price_data p
    ON s.year = p.YEAR;