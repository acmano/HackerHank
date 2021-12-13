/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  country.continent
      , cast ( avg ( city.population ) as integer )
  from  country
  inner join city
    on  city.countrycode
      = country.code
  group by  country.continent