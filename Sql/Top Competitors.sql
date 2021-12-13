/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  hackers.hacker_id
      , hackers.name
      , count ( distinct submissions.challenge_id )
  from  hackers
  inner join challenges
    on  challenges.hacker_id
      = hackers.hacker_id
  inner join difficulty
    on  difficulty.difficulty_level
      = challenges.difficulty_level
  inner join submissions
    on  submissions.challenge_id
      = challenges.challenge_id
    and submissions.hacker_id
      = hackers.hacker_id
  group by  hackers.hacker_id
          , hackers.name
      