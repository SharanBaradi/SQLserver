use Training_EmpSample;

--select * from tblpayemployeeparamdetails;
--select distinct paramcode,EmployeeNumber from tblpayemployeeparamdetails

--1 Write a Query to find a list of employees and Payments where the employee is paid VDA but not  HRA  2 
select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='vda')
Except
select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='hra')


--2 Write a Query to find a list of employees and Payments  where the employee is Paid VDA and HRA  

select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='vda')
intersect
select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='hra')

--3 Write a Query to find a list of employees and Payments  where the employee is Paid VDA or HRA  

select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='vda')
union
select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='hra')

--4 Write a Query to find a list of employees and Payments  where the employee is Paid VDA or HRA  

select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='hra' 
union
select Distinct employeenumber from tblpayemployeeparamdetails where paramcode='vda')

select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails 
where paramcode='hra' or paramcode='vda' )

--5 Write a Query to find a list of employees and Payments  where the employee is Paid VDA , NHF and LWW  but not PF 

select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails 
where paramcode='VDA' 
intersect
select Distinct employeenumber from tblpayemployeeparamdetails 
where paramcode='NFH' 
intersect
select Distinct employeenumber from tblpayemployeeparamdetails 
where  paramcode='LWW'
except 
select Distinct employeenumber from tblpayemployeeparamdetails 
where paramcode='pf')

--7 Write a Query to find a list of employees and Payments  
--where the employee is not Paid one or more of the following perks PF,HRA,VDA 

select * from tblpayemployeeparamdetails 
where EmployeeNumber in
(select Distinct employeenumber from tblpayemployeeparamdetails 
where paramcode='PF' or paramcode='HRA' or  paramcode='VDA')


select employeenumber,paramcode from tblPayEmployeeparamDetails group by employeenumber,paramcode 
order by employeenumber,paramcode ;

select * from tblPayEmployeeparamDetails A join tblPayEmployeeparamDetails B 
on A.EmployeeNumber = b.EmployeeNumber


--8. Write a query to display sum of BASIC + VDA + HRA for an employee Payment 
--where the employee has been paid PF in the payment 

select employeenumber,sum(amount) as Total from tblpayemployeeparamdetails group by notenumber,employeenumber order by employeenumber;

select employeenumber,
sum(case 
when paramcode='Basic' then Amount
when paramcode='VDA' then Amount
when paramcode='HRA' then Amount
else 0
end
) 
as Total from tblpayemployeeparamdetails

group by Notenumber,employeenumber order by employeenumber;



select employeenumber 
as Total from tblpayemployeeparamdetails
group by Notenumber,employeenumber order by employeenumber;

use SharanBaradi;
select * from table1;
select * into table7 from table1;
select * from table7;
go
Declare @Table TABLE(    
id int,  
Name varchar(20)    
) 
select * from @table
insert into @table values(1,'name1');
select * from @table  





select 