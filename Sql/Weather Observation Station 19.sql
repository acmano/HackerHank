/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select 
cast
(
sqrt
(
power
(
(
(select max (lat_n) from station)
-
(select min (lat_n) from station)
)
, 2
)
+
power
(
(
(select max (long_w) from station)
-
(select min (long_w) from station)
)
, 2
)
)
 as decimal(20,4)
)