/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  cast ( round ( sum ( lat_n ), 4 ) as decimal (20,4) )
  from  station
  where lat_n > 38.788
  and   lat_n < 137.2345