/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  challenges.hacker_id
      , hackers.name
      , COUNT(challenges.hacker_id)
  FROM  challenges
  INNER JOIN hackers
    ON  challenges.hacker_id = hackers.hacker_id
  GROUP BY  challenges.hacker_id
          , hackers.name
  HAVING COUNT(challenges.hacker_id)
    = (
        SELECT MAX(cnts.cnt) 
          FROM
          (
            SELECT  COUNT(hacker_id) AS cnt 
              FROM  Challenges 
              GROUP BY hacker_id
          ) AS cnts
      )
  OR  COUNT(challenges.hacker_id)
    IN
    (
      SELECT  cnts.cnt 
        FROM  
        (
          SELECT  COUNT(hacker_id) AS cnt
            FROM  Challenges
            GROUP BY  hacker_id
        ) AS cnts
        GROUP BY  cnts.cnt
        HAVING COUNT(cnts.cnt) = 1
    )
  ORDER BY  COUNT(challenges.hacker_id) DESC
          , challenges.hacker_id