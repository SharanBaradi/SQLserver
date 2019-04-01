use Training_EmpSample;
--select * from tblEmployees;
--select * from tblPayEmployeeparamDetails;

--select * from tblPayEmployeeparamDetails where paramcode='basic';
--select * from tblPayEmployeeparamDetails where EmployeeNumber=44577

--select EmployeeNumber from tblPayEmployeeparamDetails  where employeenumber not in(select EmployeeNumber from tblPayEmployeeparamDetails where paramcode='bonus' group by EmployeeNumber )group by EmployeeNumber;

--select tblPayEmployeeparamDetails.EmployeeNumber from  tblEmployees join tblPayEmployeeparamDetails on tblemployees.EmployeeNumber=tblPayEmployeeparamDetails.EmployeeNumber
--where tblPayEmployeeparamDetails.Paramcode != any(select tblPayEmployeeparamDetails.Paramcode from tblPayEmployeeparamDetails where paramcode='bonus') 
--group by tblPayEmployeeparamDetails.EmployeeNumber;
select top (10) percent employeenumber,rank() over(order by centrecode) As RAnk
,Dense_rank() over(order by centrecode) As DRAnk
,Ntile(2120) over(order by centrecode) As Ntiles
,Row_number() over(order by centrecode) As Rno
from tblEmployees;
select SCHEMA_NAME();
