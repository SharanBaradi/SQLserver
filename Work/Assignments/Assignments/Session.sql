
--select EmployeeType from tblEmployees order by name;
--select EmployeeType,count(EmployeeType) from tblEmployees where 1=1 group by EmployeeType;
--select count(*) from INFORMATION_SCHEMA;
--SELECT count(null) ;
--select name from tblEmployees where name LIKE '%RAM%' or name like '%shyam%' or name like '%abdul%';
--use SharanBaradi;
--create table tablename(Age int); 
--Alter Table Tablename Add Name varchar(50);
--insert into tablename select age,name from tblEmployees;
--use SharanBaradi;
--create table MyKeys(ID int not null,name varchar(50),DeptID int,Primary KEY (Id));
--insert into MyKeys values(2,'Navya',3);
--select * from mykeys;
--drop table dupkeys;
--create table DupKeys(ID int,name varchar(50),DeptID int);
--insert into DupKeys values(null,'Navya',3);
--delete from DupKeys;
--ALter table dupkeys add ClassId int not null;
--ALter table dupkeys add primary key(ClassId);
--alter table dupkeys drop primary key;
--select * from dupkeys;

use Training_EmpSample;
/*select * from tblServiceTypes;
select * from tblServiceStatus;
select * from tblCentreMaster;
select count(*) from tblEmployees group by name;
select * from tblEmployees;
 select max(presentbasic),name from tblEmployees group by name,DepartmentCode;
 --select name from tblEmployees where Max(PresentBAsic)>0;
 --select name from tblemployees,(select rtrim(ltrim(tblEmployees.name)) as names from tblemployees) as a where left(a.names,1)=Right(a.names,1) and a.names=name;
 select name ,departmentcode,presentbasic from tblEmployees as a where PresentBasic =any(select max(presentbasic) from tblEmployees as b where a.departmentcode=b.departmentcode group by b.DepartmentCode) order by DepartmentCode


----SELECT name,SUBSTRING(name,case when name like '%.%' then CHARINDEX('.', name)+1 else 1 end, CHARINDEX(' ', name) - 1 ) AS Firstname,     
----       SUBSTRING(name,
----                 CHARINDEX(' ', name) + 1,
----                 CHARINDEX(' ', name)) AS secondname
----FROM tblEmployees 
select * from tblEmployees as e right join tblServiceTypes as st on e.ServiceType=st.ServiceType;
select e.name,st.servicetype,st.Description from  tblServiceTypes as st left join tblEmployees as e on e.ServiceType=st.ServiceType;

use SharanBaradi
--select * from table1;
--select * from table2;

--SELECT  company.company_id,company.company_name,
--foods.item_id,foods.item_name
--FROM table1 as company,table2 as foods;






select * from table1 as one outer apply table2 as two ;
 
 select * from table3;


