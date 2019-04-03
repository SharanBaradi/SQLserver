use sharanbaradi;

select * from table7;

BEGIN try
select 1/0;
End TRY
BEGIN CATCH
raiserror()
throw;
--RAISERROR (15600,-1,-1, 'mysp_CreateCustomer');
--select ERROR_state() error,ERROR_SEVERITY() AS ErrorSeverity  
--    ,ERROR_STATE() AS ErrorState  
--    ,ERROR_PROCEDURE() AS ErrorProcedure  
--    ,ERROR_LINE() AS ErrorLine  
--    ,ERROR_MESSAGE() AS ErrorMessage;
select * from table2;
end catch
THROW 70000, 'heyy', 1


go
CREATE PROCEDURE table12 @city varchar(75)
AS
BEGIN
   SELECT * FROM table1 WHERE Company_City = @city
END
table12 @city = 'London'

GO
DECLARE @sqlCommand nvarchar(1000)
DECLARE @columnList varchar(75)
DECLARE @city varchar(75)

SET @columnList = '*'
SET @city = 'London'
SET @sqlCommand = 'SELECT ' + @columnList + ' FROM table1 WHERE Company_City = @city'

EXEC sp_executesql @sqlCommand, N'@city nvarchar(75)', @city = @city
go

select * from table1;
