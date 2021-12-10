/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  cast
        (
          abs
          (
            (select  min ( lat_n ) from station)
          - (select  max ( lat_n ) from station)
          )
        +
          abs
          (
            (select  min ( long_w ) from station)
          - (select  max ( long_w ) from station)
          )
          as decimal(20,4)
        )
