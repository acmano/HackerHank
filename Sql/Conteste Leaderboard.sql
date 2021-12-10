/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  hackers.hacker_id
      , hackers.name
      , SUM ( sub.score)
  FROM  hackers
  INNER JOIN 
  (
    select  submissions.hacker_id
          , submissions.challenge_id
          , max ( submissions.score )
      from  submissions
      group by  submissions.hacker_id
              , submissions.challenge_id
  )
  as sub
  (
    hacker_id
  , challenge_id
  , score
  )
    ON  sub.hacker_id
      = hackers.hacker_id
  GROUP BY  hackers.hacker_id
          , hackers.name
  having sum (sub.score) > 0
  order by  SUM ( sub.score ) DESC
  , hackers.hacker_id