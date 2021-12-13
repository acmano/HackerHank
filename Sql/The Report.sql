/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  case
          when grades.grade >= 8
            then students.name
          else null
        end
      , grades.grade
      , students.marks
  from  students
  inner join grades
    on  grades.min_mark <= students.marks
    and grades.max_mark >= students.marks
  order by  grades.grade desc
          , students.name