use SharanBaradi;
/*insert into table1 values(1,'A','x')
insert into table1 values(2,'B','XX')
insert into table1 values(3,'C','XXX')
insert into table1 values(4,'D','XXXX')
insert into table1 values(5,'E','XXXXX')
insert into table1 values(6,'F','XXXXX')

insert into table2 values(11,'AA','9',1)
insert into table2 values(22,'BB','99',2)
insert into table2 values(33,'CC','999',3)
insert into table2 values(44,'DD','9999',4)
insert into table2 values(55,'EE','99999',5)
insert into table2 values(66,'ff','999999',6)
insert into table2 values(77,'GG','9999999',7)
select * from table1;
select * from table2;
insert into table1 values(null,'xnxx',null)
insert into table2 values(null,'ynyy',null,null)

*/
delete from table1 where Company_ID is null;


SELect * from table1 a join table2 b on a.Company_ID=b.COMPANY_ID;
SELect * from table1 a left join table2 b on a.Company_ID=b.COMPANY_ID;
SELect * from table1 a right join table2 b on a.Company_ID=b.COMPANY_ID;
SELect * from table1 a full join table2 b on a.Company_ID=b.COMPANY_ID;

SELect * from table1 a left outer join table2  b on a.Company_ID=b.COMPANY_ID; 
SELect * from table1 a cross apply (select * from table2 b where a.COMPANY_ID=b.COMPANY_ID) as c;
SELect * from table1 a outer apply (select * from table2 b where a.COMPANY_ID=b.COMPANY_ID) as c;