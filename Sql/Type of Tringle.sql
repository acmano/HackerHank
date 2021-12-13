/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  case
          when (a+b>c) and (a+c>b) and (b+c>a)
            then
              case
                when (a=b) and (b=c)
                  then "Equilateral"
                else
                  case
                    when (a=b) or (b=c) or (a=c)
                      then "Isosceles"
                    else "Scalene"
                  end
              end
            else "Not A Triangle"
        end
  from  triangles