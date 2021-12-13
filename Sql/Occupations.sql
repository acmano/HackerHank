/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  OcDo.name
      , OcPr.name
      , OcSi.name
      , OcAc.name
  from  ( select  row_number() over (order by Name) as Row#, name from OCCUPATIONS where occupation = 'Professor' ) as OcPr ( id, name )
  left  outer join ( select  row_number() over (order by Name) as Row#, name from OCCUPATIONS where occupation = 'Doctor' ) as OcDo ( id, name ) on OcDo.id = OcPr.id
  left  outer join ( select  row_number() over (order by Name) as Row#, name from OCCUPATIONS where occupation = 'Singer' ) as OcSi ( id, name ) on OcSi.id = OcPr.id
  left  outer join ( select  row_number() over (order by Name) as Row#, name from OCCUPATIONS where occupation = 'Actor' ) as OcAc ( id, name ) on OcAc.id = OcPr.id