/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  cast ( round ( sum ( lat_n ), 2) as decimal (20, 2) )
      , cast ( round ( sum ( long_w ), 2) as decimal (20, 2) )
  from  station