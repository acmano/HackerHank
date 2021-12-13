/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  bst.n
      , case
          when  bstp.n is null and bsts.p is not null then 'Root'
          when  bstp.n is not null and bsts.p is not null then "Inner"
          when  bstp.n is not null and bsts.p is null then "Leaf"
        end
  from  bst
  left  outer join ( select distinct n from bst ) as bstp on bstp.n = bst.p
  left  outer join ( select distinct p from bst ) as bsts on bsts.p = bst.n
  order by  bst.n
  