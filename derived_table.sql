Select DeptName, TotalEmployees
from 
 (
  Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
  from tblEmployee
  join tblDepartment
  on tblEmployee.DepartmentId = tblDepartment.DeptId
  group by DeptName, DepartmentId
 ) 
as EmployeeCount
where TotalEmployees >= 2