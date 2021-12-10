/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/


select  cast ( round ( avg ( cast ( salary as decimal(10,2) ) ), 0 ) as integer )
      - round ( avg ( cast ( replace ( cast ( salary as varchar(10) ) , '0', '' ) as integer )), 2)
from  employees