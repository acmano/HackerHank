/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  S_Date.Start_Date
      , E_Date.End_Date
  FROM
  (
    SELECT  Projects.Start_Date
          , ROW_NUMBER ( )
              OVER
              (
                ORDER BY Projects.Start_Date
              ) AS RowNumber
      FROM  Projects
      WHERE Projects.Start_Date NOT IN
      (
        SELECT  Projects.END_Date
          FROM  Projects
      )
  ) AS S_Date
  INNER JOIN
  (
    SELECT  Projects.End_Date
          , ROW_NUMBER ( )
              OVER
              (
                ORDER BY Projects.End_Date
              ) AS RowNumber
      FROM  Projects
      WHERE Projects.End_Date NOT IN
      (
        SELECT  Projects.Start_Date
          FROM  Projects
      )

  ) AS E_Date
    ON S_Date.RowNumber = E_Date.RowNumber
  ORDER BY  DATEDIFF ( Day, S_Date.Start_Date, E_Date.End_Date )
          , S_Date.Start_Date