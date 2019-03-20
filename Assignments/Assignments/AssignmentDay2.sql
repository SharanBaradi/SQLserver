use Training_EmpSample;
--1.Write a query to find the all the names which are similar in pronouncing as suresh, sort the result in the order of similarity 
Select Name from tblEmployees where Difference('Suresh',name) = 4 or name LIKE '%SURESH%' order by name;


--2. Display all names from tblemployees append with INDIAN at the end without using Concatenation 

select stuff(name,len(name)+2,6,'INDIAN') from dbo.tblEmployees

--3.Display all the names from tblemployees , replace all matches of Ram with Shyam,  Shyam with Beam, Abdul with Subbul 

select Replace(Replace(Replace(Name,' Abdul ',' Subbul '),' Shyam ',' Beam '),' Ram ',' Shyam ') As Names from tblEmployees
where name LIKE '%RAM%' or name like '%shyam%' or name like '%abdul%';
 --Method 2
select 
(case 
when Name Like 'RAM[^A-Z]%' or Name Like '%[^A-Z]RAM[^A-Z]%' then Replace(Name,'RAM','SHYAM')
when Name Like 'SHYAM[^A-Z]%' or Name Like '%[^A-Z]SHYAM[^A-Z]%' then Replace(Name,'SHYAM','BEAM')
when Name Like 'ABDUL[^A-Z]%' or Name Like '%[^A-Z]ABDUL[^A-Z]%' then Replace(Name,'ABDUL','SUBBUL')
else Name
END) As Name from tblEmployees;

--4.Write a query to update the age of all employees. 

--5.Write a query to get Total Present basic  for all departments in all locations where total Present basic is greater than 30000,  data should be sorted by department 

select sum(PresentBasic) As TotalPresentBasic,DepartmentCode,LocationCode from tblEmployees 
group by DepartmentCode,LocationCode 
having sum(PresentBasic) > 30000
order by DepartmentCode;

--6.write a query to Get Max , Min and Average age of employees, service of employees by service Type , Service Status for each Centre (display in years and Months)   

select Avg(age) as Average,MIN(age) as Minimum,MAX(age) as Maximum,a.servicetype 
,(select st.Description from tblEmployees as a,tblServiceTypes as st
,tblServiceStatus as ss where st.ServiceType= a.ServiceStatus)
from tblEmployees as a,tblServiceTypes as st,tblServiceStatus as ss 
group by a.servicetype,a.CentreCode;

--7.Select all departments in all locations where Total Salary of a Department is Greater than thrice the Average Salary for the department 

select sum(PresentBasic) As TotalSalary,DepartmentCode,LocationCode from tblEmployees
group by LocationCode,DepartmentCode having sum(presentbasic) > 3 * Avg(PresentBasic)
order by LocationCode,DepartmentCode;


--8.Select all departments in all locations where Total Salary of a Department is Greater than twice the Average Salary for the department. 
--And max basic for the department is at least thrice the Min basic for the department 

select sum(PresentBasic) As TotalSalary,DepartmentCode,LocationCode from tblEmployees
group by LocationCode,DepartmentCode having sum(presentbasic) > 2 * Avg(PresentBasic) and Max(PresentBasic) >= 3 * Min(PresentBasic)
order by LocationCode,DepartmentCode;


--9.Select all the centers where max Length of the employee name is twice the min length of the employee name 

select Centre.CentreName,Centre.CentreCode,max(len(name)) as MaxLength,min(len(name)) as MinLength from dbo.tblEmployees as Emp,dbo.tblCentreMaster as Centre
where Emp.CentreCode=Centre.CentreCode group by Centre.CentreName,Centre.CentreCode having Max(Len(name))=2*min(len(name))


--10.write a query to Get Max , Min and Average service of employees by service Type , Service Status for each Centre (display in mille seconds) 
select * from tblCentreMaster;
select * from tblServiceStatus;
select * from tblServiceTypes;
select * from tblEmployees;

select ,s.Description as serviceType,ss.Description as ServiceStatus,c.CentreName
from dbo.tblEmployees as EMP,dbo.tblServiceTypes as ST,dbo.tblServiceStatus as SS,dbo.tblCentreMaster as Centre
where Emp.CentreCode=Centre.CentreCode group by Centre.CentreCode,emp.ServiceStatus,emp.ServiceType;

select max(e.Age) as maximum_age,min(e.Age) as Minimum_age,AVG(datediff_big(millisecond,e.DOJ,GETDATE())) as Average_service,
s.Description as serviceType,ss.Description as ServiceStatus,c.CentreName
from dbo.tblEmployees as e,dbo.tblServiceTypes as s,dbo.tblCentreMaster as c,dbo.tblServiceStatus as ss
where e.ServiceType=s.ServiceType and e.CentreCode=c.CentreCode 
and e.ServiceStatus=ss.ServiceStatus group by c.CentreName,s.Description,ss.Description


--11 write a query to find out employees whose names have Leading or Trailing spaces 
Select Name From tblEmployees where name like '[ ]%[A-Z]%' or name like '%[A-Z]%[ ]' ;


--12 Write a query to find out employees who have more than one space between two parts of the Name. 
SELECT Name FROM tblEmployees 
WHERE Name LIKE'[A-Z]% [A-Z]%' and Name NOT LIKE '[A-Z]% [A-Z]% [A-Z]%' 
and Name not Like '%[A-Z] [A-Z]%' and Name not Like '%[A-Z]. [A-Z]%';
--method 2
select name,len(name) from tblEmployees where charindex('  ',ltrim(rtrim(name)))>0;

--13 
--Write a Query to parse employee names and display them by eliminating all trailing, Leading Spaces ,
-- and multiple a separators between two words, Also replace all non-space separators with a space.
 
select name,replace(replace(rtrim(ltrim(name)),'  ',' '),'.',' ') from tblEmployees;
 
 

--14.Write a query to find out Max Number of words in all the employee Names . (Clue Previous queries expressions is an input to the Current Query ) 

select name,Len(replace(replace(rtrim(ltrim(name)),'.',' '),'  ',' '))-Len(replace(replace(rtrim(ltrim(name)),'.',''),' ',''))+1  from tblEmployees;


--15.Write a Query to List all employees whose name Starts and Ends with the same Character 

select name from tblEmployees where left(ltrim(name),1)=Right(rtrim(name),1);

--Method2
select name from tblEmployees where left(ltrim(case when name like '%.%' then replace(name,substring(name,1,CHARINDEX('.',name)),'') else name end),1)=right(rtrim(name),1)

--16.Write a Query to List all employees whose First and Second name Starts with the same Character 

SELECT name FROM tblEmployees 
where left(SUBSTRING(name,case when name like '%.%' then CHARINDEX('.', name)+1 else 1 end, CHARINDEX(' ', name) - 1 ),1) 
= left(SUBSTRING(name,CHARINDEX(' ', name) + 1, CHARINDEX(' ', name)),1);


--17.Write a Query to List all employees whose First Character of all the words in the name starts with the same Character (Assume there are not more than 5 words in any name ) 

select name,value from dbo.tblEmployees 
cross apply STRING_SPLIT(rtrim(case when name like '%.%' then replace(name,substring(name,1,CHARINDEX('.',name)),'') else name end),' ') 
where left(ltrim(value),1)=right(rtrim(value),1) and len(value)>1

--select name from dbo.tblEmployees 
--where left(ltrim(case when name like '%.%' then replace(name,substring(name,1,CHARINDEX('.',name)),'') else name end),1)
-- = all (select left(value,1) from STRING_SPLIT(rtrim(case when name like '%.%' then replace(name,substring(name,1,CHARINDEX('.',name)),'') else name end),' ')) 
--and charindex(' ',ltrim(rtrim(name)))!=0

--18.Write a query to list out all the employees where any of the words (Excluding Initials) in the Name starts and ends with the same character.  (Assume there are not more than 5 words in any name )     
Select name,value from tblemployees cross apply 
string_split(replace(replace(rtrim(ltrim(name)),'.',' '),'  ',' '),' ') 

--19 
--Write a Query to List out all employees where the present basic is perfectly rounded of to 100. Ex. If Basic A is 2011, Basic of B is  2100 , Basic of C is  2101 and Basic of D is  2200 . Then Only B and D should be displayed  1. Write Using ROUND  2. Write Using floor 3. write using Mod (%) 4. write using Ceiling 

--20 write a query to find out all the departments where All employees have their Present Basic rounded of to 100 21 write a query to find out all the departments where no employee has the Present Basic rounded of to 100 

--22 
--As per the companies rule if an employee has put up service of 1 Year 3 Months and 15 days in office, Then She/he would be eligible for  Bonus. the Bonus would be Paid on first of the Next month after which  a person has attained eligibility.   Find out the eligibility date for all the employees. And also find out the age of the Employee On the date of Payment of First bonus. Display the  Age in Years, Months and Days.  Also Display the week day Name, week of the year , Day of the year and  week of the month of the date on which the person has attained the eligibility.   

--23 Company Has decided to Pay a bonus to all its employees. The criteria is as follows  1. Service Type  1.  Employee Type  1. Minimum service is 10 .  
--Minimum service left should be 15 Years  . Retirement age will be 60 Years  2. Service Type  1.  Employee Type  2. Minimum service is 12 .  
--Minimum service left should be 14 Years  . Retirement age will be 55 Years  3. Service Type  1.  Employee Type  3. Minimum service is 12 .  
--Minimum service left should be 12 Years  . Retirement age will be 55 Years  3. for  Service Type 2,3,4 Minimum Service should Be 15 and 
--Minimum service left should be 20 Years   . Retirement age will be 65 Years  Write a query to find out the employees who are eligible for bonus. 24 
--write a query to display the currentdate in all possible formats using convert function     

--25 
--Use TablpayemployeeParamDetails to write the below query: please understand the significance of each column in the table also 
--Check out the different values for paramcode in the table.  
 
--write a query to find out all the employees who has the net payment less than the actual basic that he should have earned,  in any of the payments  
 