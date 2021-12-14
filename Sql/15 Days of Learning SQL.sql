/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH CTE_Hacker_List(submission_date,hacker_id)
AS
(
  SELECT  submissions.submission_date
        , submissions.hacker_id
    FROM  submissions
    WHERE submissions.submission_date = '2016-03-01'  
  UNION ALL
  SELECT  submissions.submission_date
        , submissions.hacker_id
    FROM  submissions
    INNER JOIN CTE_Hacker_List
      ON  submissions.submission_date
        = DATEADD(DD, 1, CTE_Hacker_List.submission_date) 
      AND submissions.hacker_id
        = CTE_Hacker_List.hacker_id  
    WHERE submissions.submission_date <> '2016-03-01'    
),
CTE_Hackers_Count(submission_date,Hackers_Count)
AS
(
  SELECT  CTE_Hacker_List.submission_date
        , COUNT(DISTINCT CTE_Hacker_List.hacker_id) AS Hackers_Count
    FROM  CTE_Hacker_List
    GROUP BY  CTE_Hacker_List.submission_date
),
CTE_Hacker_MAX_Submissions(submission_date,hacker_id, name, Row_Num)
AS
(
  SELECT  submissions.submission_date
        , submissions.hacker_id
        , hackers.name
        , ROW_NUMBER()
            OVER
            (
              PARTITION BY submissions.submission_date 
              ORDER BY  COUNT(submissions.hacker_id) DESC
                      , submissions.hacker_id
            ) AS Row_Num 
    FROM  submissions
    INNER JOIN hackers
      ON  submissions.hacker_id
        = hackers.hacker_id
    GROUP BY  submissions.submission_date
            , submissions.hacker_id
            , hackers.name
)

SELECT  CTE_Hackers_Count.submission_date
      , CTE_Hackers_Count.Hackers_Count
      , CTE_Hacker_MAX_Submissions.hacker_id
      , CTE_Hacker_MAX_Submissions.name
  FROM  CTE_Hackers_Count
  INNER JOIN CTE_Hacker_MAX_Submissions
    ON  CTE_Hackers_Count.submission_date
      = CTE_Hacker_MAX_Submissions.submission_date
  WHERE CTE_Hacker_MAX_Submissions.Row_Num = 1
  ORDER BY  CTE_Hacker_MAX_Submissions.submission_date