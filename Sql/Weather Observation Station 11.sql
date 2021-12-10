/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select distinct station.city
from station
where lower ( left ( station.city, 1) ) not in ( 'a', 'e', 'i', 'o', 'u')
or lower ( right ( station.city, 1) ) not in ( 'a', 'e', 'i', 'o', 'u')