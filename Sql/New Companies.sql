/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  company.company_code
      , company.founder
      , count ( distinct lead_manager.lead_manager_code )
      , count ( distinct senior_manager.senior_manager_code )
      , count ( distinct manager.manager_code )
      , count ( distinct employee.employee_code )
  from  Company
  left  outer join lead_manager
    on  lead_manager.company_code = company.company_code
  left  outer join senior_manager
    on  senior_manager.company_code = company.company_code
    and senior_manager.lead_manager_code = lead_manager.lead_manager_code
  left  outer join manager
    on  manager.company_code = company.company_code
    and manager.senior_manager_code = senior_manager.senior_manager_code
    and manager.lead_manager_code = lead_manager.lead_manager_code
  left  outer join employee
    on  employee.company_code = company.company_code
    and employee.lead_manager_code = lead_manager.lead_manager_code
    and employee.senior_manager_code = senior_manager.senior_manager_code
    and employee.manager_code = manager.manager_code
  group by  company.company_code
          , company.founder
  order by  company.company_code