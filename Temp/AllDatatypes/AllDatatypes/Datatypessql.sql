Use Sharan;

--Drop table DataTypes;
--create table DataTypes(INTS int,CHARS Char(55),VARS Varchar(55),DATETIMES DATETIME,DATES DATE,TIMES TIME,TIMESTAMPS TIMESTAMP,MONEYS Money,
--SMONEYS SMALLMONEY,SMINTS smallint,TINTS ,BITS Bit,BIGINTS BIGINT, DECS Decimal,NUMS NUMERIC,FLOATS Float,REALS REAL);


--INSERT INTO Datatypes(INTS ,CHARS ,VARS) VALUES(1024,'sai','sharan');


--update DataTypes set SMINTS=2200 where INTS=1024;
--update DataTypes set TINTS=255 ,smints=32767,BITS=0 ,BIGINTS=9223372036854775807 , DECS=999999999999999918  ,NUMS=-1,FLOATS=-1.79E + 308 ,REALS=-3.40E + 38  where INTS=22;


--INSERT INTO Datatypes (INTS ,CHARS ,VARS ,DATETIMES ,DATES ,TIMES  ,MONEYS ,SMONEYS ,SMINTS ,TINTS ,BITS ,BIGINTS , DECS ,NUMS ,FLOATS ,REALS )
--Values( , '','','','','', ,,,,,,,,,);

--INSERT INTO Datatypes (INTS ,CHARS ,VARS ,DATETIMES ,DATES ,TIMES  ,MONEYS ,SMONEYS ,SMINTS ,TINTS ,BITS ,BIGINTS , DECS ,NUMS ,FLOATS ,REALS )
--Values( 1, 'mahesh','babu','2019-02-01 11:22:33.000','2019-02-01','11:22:33.0000000',922337203685477.5807 ,-214748.3648,32767,255,0,9223372036854775807,999999999999999918,-1,306.21,34.6);

INSERT INTO Datatypes (INTS ,CHARS ,VARS ,DATETIMES ,DATES ,TIMES  ,MONEYS ,SMONEYS ,SMINTS ,TINTS ,BITS ,BIGINTS , DECS ,NUMS ,FLOATS ,REALS )
Values( 3, 'dhoni','mahender','2009-3-01 11:32:33','2012-03-01','10:22:33',203685477.5807 ,-28.3648,32767,01,0,972036854775807,918,0,306,3.6);

select * FROM DataTypes;