/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  city.name
  from  country
  inner join city
    on  city.countrycode
      = country.code
  where country.continent = 'Africa'