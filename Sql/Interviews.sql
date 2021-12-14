/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  contests.contest_id
      , contests.hacker_id 
      , contests.name
      , SUM ( s_stats.total_submissions )
      , SUM ( s_stats.total_accepted_submissions )
      , SUM ( v_stats.total_views )
      , SUM ( v_stats.total_unique_views )
  FROM  contests
  INNER JOIN colleges
    ON  colleges.contest_id 
      = contests.contest_id
  INNER JOIN challenges
    ON  challenges.college_id 
      = colleges.college_id
  LEFT  OUTER JOIN
  (
    SELECT  view_stats.challenge_id
          , SUM ( view_stats.total_views )
              AS total_views
          , SUM ( view_stats.total_unique_views)
              AS total_unique_views
      FROM  view_stats
      GROUP BY  view_stats.challenge_id
  ) v_stats
    ON  v_stats.challenge_id 
      = challenges.challenge_id
  LEFT  OUTER JOIN
  (
    SELECT  submission_stats.challenge_id
          , SUM ( submission_stats.total_submissions )
              AS total_submissions
          , SUM ( submission_stats.total_accepted_submissions )
              AS total_accepted_submissions
      FROM  submission_stats
      GROUP BY  submission_stats.challenge_id
  ) s_stats
    ON  s_stats.challenge_id
      = challenges.challenge_id
  GROUP BY  contests.contest_id
          , contests.hacker_id
          , contests.name
  HAVING SUM ( s_stats.total_submissions ) !=0
  OR     SUM ( s_stats.total_accepted_submissions ) !=0
  OR     SUM ( v_stats.total_views ) !=0
  OR     SUM ( v_stats.total_unique_views) !=0
  ORDER BY  contests.contest_id