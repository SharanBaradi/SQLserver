use Training_EmpSample;
--SELECT * FROM tblEmployees;

--1.One Part Name //contains only A-Z,space,.  not contains two part names  
SELECT Name FROM tblEmployees WHERE Name NOT LIKE'%[^A-Z .]%'  AND Name NOT LIKE'[A-Z]% [A-Z]%';

--2.Three Part Name //contains only A-Z,space,. and a space between consecutive words  
SELECT Name FROM tblEmployees WHERE Name LIKE '[A-Z]% [A-Z]% [A-Z]%' and Name NOT LIKE'%[^A-Z .]%';

--3.First Middle Or last name as Ram //Logic : No Letter Before and after RAM
SELECT Name FROM tblEmployees WHERE Name Like 'RAM %'or Name Like '%[^A-Z]RAM[^A-Z]%';

--4.employee types in the organization.
SELECT  Distinct(EmployeeType) FROM tblEmployees order by EmployeeType;

/*
5.
i.Greater than 30000.
ii. Less than 3000.
iii. Between 3000 and 5000.
*/
SELECT Name,FatherName,DOB From tblEmployees where PresentBasic>30000;
SELECT Name,FatherName,DOB From tblEmployees where PresentBasic<3000;
SELECT Name,FatherName,DOB From tblEmployees where PresentBasic between 3000 and 5000;

-- Method2
SELECT Name,FatherName,DOB,PresentBasics=
CASE 
	WHEN PresentBasic > 30000 THEN 'greater than 30000'
    WHEN PresentBasic < 3000 THEN 'Less than 3000'
    WHEN PresentBasic BETWEEN 3000 and 5000 THEN 'Between 3000 and 5000'
END FROM tblEmployees where PresentBasic<3000 or PresentBasic>30000 or PresentBasic between 3000 and 5000 order by PresentBasic;

/*
--6.
All the details of employees whose Name
i. Ends with 'KHAN'
ii. Starts with 'CHANDRA'
iii. Is 'RAMESH' and their initial will be in the rage of alphabets a-t.
*/
Select * FROM tblEmployees WHERE Name Like '%KHAN';
Select * FROM tblEmployees WHERE Name Like 'CHANDRA%';
Select * FROM tblEmployees WHERE Name Like '[A-T].RAMESH %';

--Method2

--Select * FROM tblEmployees WHERE Name Like '[A-T].RAMESH %' or  Name Like 'CHANDRA%' or Name Like '%KHAN';

--7.All employews where reminder of employee number by 10 is a power of two
Select * FROM tblEmployees WHERE EmployeeNumber%10 in (1,2,4,8);

--8.All employees sorted by Service Type and Name with in a given Center
Select * FROM tblEmployees Order By servicetype,Name;



