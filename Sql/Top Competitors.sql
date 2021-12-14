select  hackers.hacker_id
      , hackers.name
  from  submissions 
  inner join hackers
    on  hackers.hacker_id
      = submissions.hacker_id
  inner join challenges
    on  challenges.challenge_id
      = submissions.challenge_id
  inner join difficulty
    on  difficulty.difficulty_level
      = challenges.difficulty_level
  where submissions.score
      = difficulty.score
  group by  hackers.hacker_id
          , hackers.name
  having    count(hackers.hacker_id) > 1
  order by  count(challenges.challenge_id) desc
          , hackers.hacker_id