{{config(materialized="table")}}

---LAG function 
WITH ranked_stocks AS (
    SELECT 
        keyCompany, 
        yearTime, 
        quarterTime, 
        closeValueStock,
        sectorCompany,
        ROW_NUMBER() OVER (PARTITION BY keyCompany, yearTime, quarterTime ORDER BY datetime DESC) AS row_num
    FROM 
        {{ref("dailyStock")}}
),
last_day_quarter AS (
SELECT 
        keyCompany, 
        yearTime, 
        quarterTime, 
        sectorCompany,
        closeValueStock AS close_quarter,
        LAG(closeValueStock) OVER (partition by keyCompany ORDER BY yearTime, quarterTime) AS previous_quarter
    FROM 
        ranked_stocks s1
	WHERE	
        row_num = 1
),
return_company as (
SELECT 
    keyCompany, 
    quarterTime,
    yearTime, 
    sectorCompany,
    close_quarter,
    previous_quarter,
    (close_quarter - previous_quarter) / previous_quarter * 100 AS returnRate
FROM 
    last_day_quarter
)
select sectorCompany, yearTime, quarterTime, AVG(returnRate)
from return_company
where returnRate is not null   
group by sectorCompany, yearTime, quarterTime