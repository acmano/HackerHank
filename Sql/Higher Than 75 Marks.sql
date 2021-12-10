/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select students.name
from students
where students.marks > 75
order by right(students.name, 3)
, students.id