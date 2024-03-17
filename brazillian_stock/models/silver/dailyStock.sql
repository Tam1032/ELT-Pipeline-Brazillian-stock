select datetime, quarterTime , yearTime , closeValueStock, dc.keyCompany , sectorCompany
from {{ref("raw_dimCompany")}} dc
join {{ref("raw_factStocks")}} ft
on dc.keyCompany  = ft.keyCompany 
join {{ref("raw_dimTime")}} dt
on dt.keyTime = ft.keyTime