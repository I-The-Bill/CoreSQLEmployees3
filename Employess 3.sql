drop database if exists employee_practice_3;
create database if not exists employee_practice_3;
use employee_practice_3;

#Must use delete and update cascading


create table if not exists EmployeeDetails(
	EmpId int,
    EmpFullname varchar(100),
    ManagerId int,
    DateOfJoining date,
    City varchar(50),
    primary key (EmpId)
);

create table if not exists EmployeeSalary(
	EmpID int auto_increment,
	Project varchar(25),
	Salary double,
    Varible int,
    foreign key (EmpId) References EmployeeDetails(EmpId)
    on delete cascade
    on update cascade
);

insert into EmployeeDetails(EmpId, EmpFullname, ManagerId, DateOfJoining, City) 
	value (121,'John Snow',321,'2014-01-31','Toronto');
insert into EmployeeDetails(EmpId, EmpFullname, ManagerId, DateOfJoining, City) 
	value (321,'Walter White',986,'2015-01-30','California');
insert into EmployeeDetails(EmpId, EmpFullname, ManagerId, DateOfJoining, City) 
	value (421,'Kuldeep Rana',876,'2016-11-27','New Delhi');

Select * from EmployeeDetails;

insert into EmployeeSalary(EmpID, Project, Salary, Varible)
	value (121,'P1',8000,500);
insert into EmployeeSalary(EmpID, Project, Salary, Varible)
	value (321,'P2',10000,1000);
insert into EmployeeSalary(EmpID, Project, Salary, Varible)
	value (421,'P1',12000,0);

    
Select * from EmployeeSalary;

#1. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321. 
select * from EmployeeDetails where city = 'California' or ManagerId = 321;

#2. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ending with any sequence of characters. 
select * from EmployeeDetails where substring(EmpFullname,3,2) = 'hn'; 

#3. Write an SQL query to fetch the EmpIds that are present in both the tables –‘EmployeeDetails’ and ‘EmployeeSalary
select * from EmployeeDetails join EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId;

#4. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field. 
select length(EmpFullname) - length(replace(EmpFullname,'n','')) from EmployeeDetails;

#5. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000. 
select EmpFullname from EmployeeDetails  join EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId and EmployeeSalary.salary between 5000 and 10000;

#6. Write an SQL query to fetch all employee records from EmployeeDetails table who have a salary record in EmployeeSalary table. 
select EmployeeDetails.EmpId as EmpId,EmpFullname, ManagerId, DateOfJoining, City from EmployeeDetails  join EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId;

#7. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee. 
select EmpFullname, Salary from EmployeeDetails left join EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId;

#8. Write an SQL query to fetch all the Employees who are also managers from the EmployeeDetails table. 
select * from EmployeeDetails where ManagerId is not null;

#9. Write an SQL query to remove duplicates from a table without using a temporary table. 

select * from employeedetails;
    
insert into EmployeeDetails(EmpId, EmpFullname, ManagerId, DateOfJoining, City) 
	value (122,'John Snow',321,'2014-01-31','Toronto');

select * from employeedetails;

Delete ED1 FROM EmployeeDetails ED1 
inner join EmployeeDetails ED2 where 
ED1.EmpId > ED2.EmpId and 
ED1.EmpFullname = ED2.EmpFullname and 
ED1.ManagerId = ED2.ManagerId and 
ED1.DateOfJoining = ED2.DateOfJoining and
ED1.City = ED2.city;

select * from employeedetails;

#10. Write an SQL query to find the nth highest salary from table.  Treat offset as n
select max(salary) from (select salary from EmployeeSalary order by salary desc limit 1 offset 2) as aTable;


#11. Write SQL query to find the 3rd highest salary from a table without using the TOP/limit keyword. 
SELECT Max(salary) as '3rd highest Salary' FROM EmployeeSalary WHERE salary < 
	(SELECT Max(salary) FROM EmployeeSalary WHERE salary NOT IN(
		SELECT Max(salary) fROM EmployeeSalary)); 


