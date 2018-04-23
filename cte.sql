With EmployeeCount(DeptName, DepartmentId, TotalEmployees)
as
(
 Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
 from tblEmployee
 join tblDepartment
 on tblEmployee.DepartmentId = tblDepartment.DeptId
 group by DeptName, DepartmentId
)

Select DeptName, TotalEmployees
from EmployeeCount
where TotalEmployees >= 2