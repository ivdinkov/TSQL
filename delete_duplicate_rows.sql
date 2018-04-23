WITH EmployeesCTE AS
(
   SELECT *, ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
   FROM EmployeesCTE
)
delete from EmployeesCTE where RowNumber > 1