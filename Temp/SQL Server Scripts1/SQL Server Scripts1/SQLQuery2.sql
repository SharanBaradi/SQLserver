use sharan;


--select Country FROM Customer Group BY Country ;
--create table table1(Id Int,Names varchar(50));
--create table table2(Id Int,Names varchar(50));

--insert into table1 values(1,'sai');
--insert into table1 values(2,'sharan');
--insert into table1 values(3,'sai');
--insert into table1 values(4,'mahi');
--insert into table1 values(5,'sharan');
--insert into table1 values(6,'sharan');
----insert into table1 values(7,'sai');
update table1 set names='mahi' where id=4;
--select * from table1;
----insert into table2 values(1,'sai');
----insert into table2 values(2,'sharan');
----insert into table2 values(3,'sai');
----insert into table2 values(4,'mahi');
----insert into table2 values(5,'sharan');
----insert into table2 values(6,'sharan');
----insert into table2 values(7,'sai');

--select * From table1;
--select * From table2;

--create table demo(deci decimal(5,2),num numeric(6,2));
--insert into demo values(322.23,41444.5);
--select * from demo;
--select * from table1 where id =All(Select id from table2 where names='sharan');
--SELECT id 
--          FROM table2 where names='mahi';
--SELECT *
--  FROM table1
-- WHERE Id !< Any
--       (SELECT id 
--          FROM table2 where names='mahi');
select sum(id) from table1) ;

