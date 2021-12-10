/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  *
from ( select top (1) city, len(city) from station order by len(city), city) as x (city, tam)
union
select  *
from ( select top (1) city, len(city) from station order by len(city) desc, city) as y (city, tam)

