/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  wand_data.id
      , wand_data.age
      , wand_data.coins_needed
      , wand_data.power
  FROM 
  (
    SELECT  wands.id
          , wands_property.age
          , wands.coins_needed
          , wands.power
          , ROW_NUMBER() OVER 
            (
              PARTITION BY  wands.code
                          , wands.power  
              ORDER BY  wands.coins_needed
                      , wands.power DESC
            ) AS rownumber
      FROM  Wands WITH (NOLOCK)
      INNER JOIN wands_property WITH (NOLOCK)
        ON  wands.code = wands_property.code
      WHERE wands_property.is_evil = 0
  )
  AS wand_data
  WHERE wand_data.rownumber = 1
  ORDER BY  wand_data.power DESC
          , wand_data.age DESC

--select  newwands.id
--      , newwands.age
--      , powerage.coins_needed
--      , powerage.power
--  from
--  (
--    select  wands_property.age
--          , wands.power
--          , min ( wands.coins_needed )
--      from  wands
--      inner join wands_property
--        on  wands_property.code
--          = wands.code
--      where wands_property.is_evil = 0
--      group by  wands_property.age
--              , wands.power
--  )
--  as powerage
--  (
--    age
--  , power
--  , coins_needed
--  )
--  inner join
--  (
--    select  wands_property.age
--          , wands.power
--          , min ( wands.id )
--      from  wands
--      inner join wands_property
--        on  wands_property.code
--          = wands.code
--      where wands_property.is_evil = 0
--      group by  wands_property.age
--              , wands.power
--  )
--  as newwands
--  (
--    age
--  , power
--  , id
--  )
--    on  newwands.age
--      = powerage.age
--    and newwands.power
--      = powerage.power
--  order by  powerage.power desc
--          , newwands.age desc
--