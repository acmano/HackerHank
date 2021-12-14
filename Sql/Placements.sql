/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  students.name
  from  students
  inner join friends
    on  friends.id
      = students.id
  inner join students
    as  student_friend
    on  student_friend.id
      = friends.friend_id
  inner join packages
    on  packages.id
      = students.id
  inner join packages
    as  package_friend
    on  package_friend.id
      = student_friend.id
  where package_friend.Salary
      > packages.salary
  order by  package_friend.salary