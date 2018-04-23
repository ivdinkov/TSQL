SELECT Name, Salary,
CASE
    WHEN Salary > 50000 THEN "Director"
    WHEN Salary < 30000 THEN "Employe"
    ELSE "Manager"
END
FROM Staff;