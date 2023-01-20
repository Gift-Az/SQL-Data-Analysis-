SELECT TOP 1 SUM(PRICE) AS TOTALSALES, datesold
FROM raw_sales
GROUP BY datesold
ORDER BY TOTALSALES DESC;


SELECT TOP 1 AVG(PRICE) AS AVGSALES, POSTCODE
FROM raw_sales
GROUP BY POSTCODE
ORDER BY AVGSALES DESC;

SELECT a.datesold, a.totalsales
from( select datesold, sum(price) totalsales
from raw_sales
group by datesold) as a
where totalsales=( select min(b.totalsales)
from(select YEAR(datesold) YEAR, sum(price) totalsales
from raw_sales
group by YEAR(datesold)) as b
)



SELECT min(TotalSales) AS MinSales, year(datesold) YEAR
from(SELECT datesold, SUM(PRICE) AS TotalSales 
FROM raw_sales
group by datesold) AS A
group by datesold, TotalSales;


SELECT TOP 6 sum(price) as totalsales, postcode
from raw_sales
group by postcode
order by totalsales desc;

