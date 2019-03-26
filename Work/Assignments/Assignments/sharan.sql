use sharanbaradi;
/*
Select * into SharanBaradi.dbo.tblPayEmployees from Training_EmpSample.dbo.tblPayEmployees

create table table1(Company_ID int, Company_Name varchar(50),Company_City varchar(50));

insert into table1 values(18 ,'Order All','Boston')
insert into table1 values( 15,'Jack Hill Ltd','London')
insert into table1 values( 16,'Akas Foods ','Delhi')
insert into table1 values( 17,'Foodies','London')
insert into table1 values(19 ,'sip-n-Bite.','New York ')
insert into table1 values( 15,'Jack Hill Ltd2','London2')
--insert into table1 values( ,'','')

create table table2(ITEM_ID  int, ITEM_NAME varchar(50),ITEM_UNIT int,COMPANY_ID int );
insert into table2 values( 1,'Chex Mix', 1, 16);
insert into table2 values( 6,'Cheez-It ',2 , 15);
insert into table2 values( 2,'BN Biscuit',3 , 15);
insert into table2 values( 3,'Mighty Munch',4 , 17);
insert into table2 values( 4,' Pot Rice',5,15);
insert into table2 values( 5,'Jaffa Cakes',6, 18);
insert into table2(ITEM_ID,ITEM_NAME,ITEM_UNIT) values( 7,'Salt n Shake',7);
--insert into table2 values( ,'', , ,);


create table table3(Company_Name varchar(50),Company_City varchar(50));

insert into table3 values('Order All','Boston')
insert into table3 values( 'Jack Hill Ltd','London')
insert into table3 values('Akas Foods ','Delhi')
insert into table3 values( 'Foodies','London')
insert into table3 values('sip-n-Bite.','New York ')
--insert into table3 values( ,'','')

select * from table1;
select * from table2;
select * from table2;

select * from table1 as one join table2 as two on one.company_id=two.Company_id ;
select * from table1 as one full join table2 as two on one.company_id=two.Company_id ;
select * from table1 as one left  join table2 as two on one.company_id=two.Company_id ;

select * from table1 as one left join table2 as two on one.company_id=two.Company_id ;
select * from table1 as one right join table2 as two on one.company_id=two.Company_id ;

select * from table1 as one cross join table2 as two ;

select * from table1 as one cross join table2 as two left join table2 on one.company_id=two.Company_id;
select * from table1 as one outer apply table2 as two ;
select * from table1,table2 where table1.Company_ID = table2.COMPANY_ID or table2.Company_ID 
not in(table1.COMPANY_ID) ;


 ALTER TABLE table3
ALTER COLUMN Company_Name int;
select * from table3;
select * from table1 where 
*/

select * from tblPayEmployees order by employeenumber;

select * from tblPayEmployees where employeenumber=64;

Select sum(grosspay),*
from tblPayEmployees as A order by employeenumber,Notenumber;

Select employeenumber,sum(grosspay) over(partition by employeenumber order by notenumber) AS  CumulativeSum,* from tblPayEmployees;
Select employeenumber,sum(grosspay) over(partition by employeenumber ) AS  CumulativeSum from tblPayEmployees;

Select 
min(grosspay) over(partition by employeenumber) AS  [min],
max(grosspay) over(partition by employeenumber) AS  [max],
avg(grosspay) over(partition by employeenumber) AS  [avg],
* from tblPayEmployees;

--select * from tblPayEmployees;
select * into sharanbaradi.dbo.tblPayEmployees from Training_EmpSample.dbo.tblPayEmployees;

select B.rows,* from tblpay as A join (select EmployeeNumber,row_number() over(partition by employeenumber order by employeenumber) as rows from tblPayEmployees) AS B
on A.Employeenumber = b.employeenumber where B.rows>1;

drop table tblpay;
select * into tblpay from tblPayEmployees;

select * from tblPayEmployees;
select * from tblPay;



with cte
as
(
select row_number() over(partition by employeenumber order by notenumber) as rownumber,EmployeeNumber from tblpay 
)
delete from cte where rownumber>1 ;

create table idname(id int,[name] varchar(50))

--DROP TABLE EMPLOYEES;
--create table Employees
--(
--  EmployeeID int NOT NULL PRIMARY KEY,
--  Name varchar(50) NOT NULL,
--  ManagerID int NULL
--)
--insert into Employees values (1, 'A', NULL)
--insert into Employees values (2, 'B',  1)
--insert into Employees values (3, 'C',  1)
--insert into Employees values (4, 'D',  2)
--insert into Employees values (5, 'E',  2)
--insert into Employees values (6, 'F',  3)
--insert into Employees values (7, 'G',  3)
--insert into Employees values (8, 'H',  5)
--insert into Employees values (9, 'I',  6)
--insert into Employees values (10, 'J', 7)
--insert into Employees values (11, 'K', 4)

select * from employees;

with cte
as
(
select Employeeid,ManagerId from
)


