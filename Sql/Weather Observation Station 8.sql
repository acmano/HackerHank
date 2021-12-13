/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select distinct city
from station
where lower ( left(city,1)) in ( 'a', 'e', 'i', 'o', 'u')
and lower ( right(city,1)) in ( 'a', 'e', 'i', 'o', 'u')