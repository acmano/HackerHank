/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  Name
      + '('
      + left(Occupation, 1)
      + ')'
  FROM  OCCUPATIONS
  ORDER BY Name
;

SELECT  'There are a total of '
      + cast ( Count ( Name ) as char(4) )
      + ' '
      + LOWER(Occupation)
      + 's.'
  FROM  Occupations
  GROUP BY  Occupation
  ORDER BY  Count(Name)
          , Occupation
;