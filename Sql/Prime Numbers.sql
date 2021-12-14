/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SET QUOTED_IDENTIFIER ON
GO
With NumberSequence( Number ) AS
(
    SELECT  2 AS Number
    UNION ALL
    SELECT  Number + 1
      FROM  NumberSequence
      WHERE Number < 1000     
) 

, primelist AS
(
  SELECT  1 AS category
        , myvalue.number AS value
    FROM  numberSequence AS myvalue
    LEFT  OUTER JOIN
    (
      SELECT  DISTINCT myvalue.number
        FROM  numbersequence AS myvalue
        INNER JOIN numbersequence AS compareto
          ON  myvalue.number > compareto.number
          AND ( ( myvalue.number * 1.0) / compareto.number )
            = (
                CEILING
                (
                  (
                    (
                      myvalue.number * 1.0
                    )
                  / compareto.number
                  )
                )
              * 1.0
              )
    ) AS nonprimelist
      ON  nonprimelist.number
        = myvalue.number
    WHERE nonprimelist.number IS NULL 
)

SELECT  CAST
        (
          STUFF
          (
            (
              SELECT  CAST
                      (
                        '&' AS varchar(1)
                      )
                    +   CAST
                        (
                          primelist.value as varchar(100)
                        )
                FROM  primelist
                ORDER BY  value
                  FOR XML PATH(''), type
            ).value('.[1]','nvarchar(max)')
          , 1
          , 1
          , ''
          )
          AS VARCHAR(8000)
        ) AS namelist
  OPTION (MAXRECURSION 0);
GO
