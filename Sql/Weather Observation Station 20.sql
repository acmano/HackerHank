/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT cast
(
  (
    (
      (
        SELECT  MAX(lat_n)
          FROM
          (
            SELECT TOP 50 PERCENT lat_n FROM station ORDER BY lat_n
          ) AS BottomHalf
      )
    +
      (
        SELECT MIN(lat_n)
          FROM
          (
            SELECT TOP 50 PERCENT lat_n FROM station ORDER BY lat_n DESC
          ) AS TopHalf
      )
    )
  / 2
  )
  as decimal(20,4)
)