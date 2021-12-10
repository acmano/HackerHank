/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  cast ( long_w as decimal (20,4) )
  from  station
  where lat_n = ( select max ( lat_n ) from  station where lat_n < 137.2345 )