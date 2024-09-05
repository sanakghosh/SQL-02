-- SELECT TOP (1000) [EmployeeId]
--       ,[FirstName]
--       ,[LastName]
--       ,[Age]
--       ,[Gender]
--   FROM [test].[dbo].[EmployeeDemographics]

Create table #temp_employee2 (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select * 
From #temp_employee2

INSERT INTO #temp_employee2 VALUES
('1001', 'HR', '45000')

INSERT INTO #temp_employee2
SELECT *
FROM test..EmployeeSalary


Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee3

SELECT AvgAge * AvgSalary
from #temp_employee3