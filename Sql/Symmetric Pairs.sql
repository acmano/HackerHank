/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  functions_l.x
      , functions_l.y
  from  functions
    as  functions_l
  inner join functions
    as  functions_r
    on  functions_r.x
      = functions_l.y
    and functions_r.y
      = functions_l.x
  group by  functions_l.x
          , functions_l.y
  having  count(functions_l.x) > 1
  or      functions_l.x
        < functions_l.y
  order by  functions_l.x