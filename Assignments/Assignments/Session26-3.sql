use Training_EmpSample;

select * from tblPayEmployees where employeenumber=64;

Select * ,(select sum(case when A.Notenumber > B.NoteNumber then 1 else 0 End) from dbo.tblPayEmployees as B)
from tblPayEmployees as A order by employeenumber,Notenumber;

Select employeenumber,sum(grosspay) over(partition by employeenumber order by notenumber) AS  CumulativeSum,* from tblPayEmployees;
Select employeenumber,sum(grosspay) over(partition by employeenumber ) AS  CumulativeSum from tblPayEmployees;

Select employeenumber,min(grosspay) over(partition by employeenumber) AS  min,* from tblPayEmployees;

select B.rows,* from tblPayEmployees as A join (select EmployeeNumber,row_number() over(partition by employeenumber order by employeenumber) as rows from tblPayEmployees) AS B
on A.Employeenumber = b.employeenumber where Rows=1;

