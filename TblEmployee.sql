USE [master]
GO
/****** Object:  Database [Training_EmpSample]    Script Date: 3/25/2019 6:42:18 PM ******/
CREATE DATABASE [Training_EmpSample]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeSalary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Training_EmpSample.mdf' , SIZE = 30720KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeSalary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Training_EmpSample_1.ldf' , SIZE = 84416KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Training_EmpSample] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Training_EmpSample].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Training_EmpSample] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Training_EmpSample] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Training_EmpSample] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Training_EmpSample] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Training_EmpSample] SET ARITHABORT OFF 
GO
ALTER DATABASE [Training_EmpSample] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Training_EmpSample] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Training_EmpSample] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Training_EmpSample] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Training_EmpSample] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Training_EmpSample] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Training_EmpSample] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Training_EmpSample] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Training_EmpSample] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Training_EmpSample] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Training_EmpSample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Training_EmpSample] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Training_EmpSample] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Training_EmpSample] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Training_EmpSample] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Training_EmpSample] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Training_EmpSample] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Training_EmpSample] SET RECOVERY FULL 
GO
ALTER DATABASE [Training_EmpSample] SET  MULTI_USER 
GO
ALTER DATABASE [Training_EmpSample] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Training_EmpSample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Training_EmpSample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Training_EmpSample] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Training_EmpSample] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Training_EmpSample', N'ON'
GO
ALTER DATABASE [Training_EmpSample] SET QUERY_STORE = OFF
GO
USE [Training_EmpSample]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Training_EmpSample]
GO
/****** Object:  User [test]    Script Date: 3/25/2019 6:42:24 PM ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GGKTECH\Domain Users]    Script Date: 3/25/2019 6:42:25 PM ******/
CREATE USER [GGKTECH\Domain Users] FOR LOGIN [GGKTECH\Domain Users]
GO
/****** Object:  User [GGK\venkatP]    Script Date: 3/25/2019 6:42:25 PM ******/
CREATE USER [GGK\venkatP] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GGKTECH\Domain Users]
GO
ALTER ROLE [db_owner] ADD MEMBER [GGK\venkatP]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [GGK\venkatP]
GO
/****** Object:  Schema [assign]    Script Date: 3/25/2019 6:42:27 PM ******/
CREATE SCHEMA [assign]
GO
/****** Object:  Schema [Govt]    Script Date: 3/25/2019 6:42:27 PM ******/
CREATE SCHEMA [Govt]
GO
/****** Object:  Schema [schema_1]    Script Date: 3/25/2019 6:42:28 PM ******/
CREATE SCHEMA [schema_1]
GO
USE [Training_EmpSample]
GO
/****** Object:  Sequence [dbo].[sequence_1]    Script Date: 3/25/2019 6:42:28 PM ******/
CREATE SEQUENCE [dbo].[sequence_1] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 10
 MINVALUE 1
 MAXVALUE 100
 CYCLE 
 CACHE 
GO
/****** Object:  UserDefinedFunction [dbo].[Add_Date]    Script Date: 3/25/2019 6:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Add_Date](@date1 date)
returns date
as
begin
return dateadd(year,1,dateadd(month,3,dateadd(day,15,@date1)))
end
GO
/****** Object:  UserDefinedFunction [dbo].[Add_Date1]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Add_Date1](@date1 date)
returns date
as
begin
return dateadd(day,1,EOMONTH(dateadd(year,1,dateadd(month,3,dateadd(day,15,@date1)))))
end
GO
/****** Object:  UserDefinedFunction [dbo].[Add_Date2]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Add_Date2](@date1 date)
returns date
as
begin
return dateadd(day,1,dateadd(year,1,dateadd(month,3,dateadd(day,15,@date1))))
end
GO
/****** Object:  UserDefinedFunction [dbo].[bonus]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   function [dbo].[bonus]( @empno int)
returns numeric(12,2)
as
 begin 
 return ( select (CASE WHEN (ST.Description='CHECKER' OR ST.Description='EMPLOYEE') 
	 THEN 
	 CASE WHEN (PresentBasic*12)>0 AND (PresentBasic*12)<60000
		  THEN CASE WHEN (PresentBasic*12*0.15)>9000
			         THEN 9000
		        ELSE (PresentBasic*12*0.15)
				END
	 WHEN (PresentBasic*12)>60000 AND (PresentBasic*12)<100000
		 THEN CASE WHEN (PresentBasic*12*0.15)>13800
					THEN 13800
				   WHEN (PresentBasic*12*0.15)<9000
					THEN 9000
			  ELSE (PresentBasic*12*0.15)
			  END
	 WHEN (PresentBasic*12)>100000
		  THEN CASE WHEN (PresentBasic*12*0.08)<13800
		              THEN 13800
				ELSE (PresentBasic*12*0.08)
				END
	END
	ELSE (PresentBasic*12*0.12)
	END
	)BONUS
	
from 
tblEmployees e	inner join tblServiceTypes st on st.ServiceType=e.ServiceType 
where EmployeeNumber=@empno)
end
GO
/****** Object:  UserDefinedFunction [dbo].[bonusforanEmployee]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[bonusforanEmployee](@Name varchar(50)) returns bigint
begin
return (select Bonus
from (select 0.15*PresentBasic*12 as Bonus,Name,EmployeeNumber,PresentBasic,ServiceType from tblEmployees) as a inner join tblservicetypes as b 
on a.ServiceType=b.ServiceType 
where (Bonus between 0 and 9000) and (PresentBasic*12 between 0 and 60000) and (b.Description='CHECKER' or b.Description='EMPLOYEE') and Name=@Name
union all
select Bonus
from (select 0.12*PresentBasic as Bonus,Name,EmployeeNumber,PresentBasic,ServiceType from tblEmployees) as a inner join tblservicetypes as b 
on a.ServiceType=b.ServiceType
where (Bonus between 9000 and 13800) and (PresentBasic*12 between 60001 and 100000) and (b.Description='CHECKER' or b.Description='EMPLOYEE') and Name=@Name
union all
select Bonus
from (select 0.08*PresentBasic*12 as Bonus,Name,EmployeeNumber,PresentBasic,ServiceType from tblEmployees) as a inner join tblservicetypes as b 
on a.ServiceType=b.ServiceType
where (Bonus>13800) and (PresentBasic*12>100000) and 
(b.Description='CHECKER' or b.Description='EMPLOYEE') and Name=@Name
union all
select Bonus
from (select 0.12*PresentBasic*12 as Bonus,Name,EmployeeNumber,PresentBasic,ServiceType from tblEmployees) as a inner join tblservicetypes as b 
on a.ServiceType=b.ServiceType 
where (Bonus>=0) and (PresentBasic*12>=0) and (b.Description='ROLLER' or b.Description='PACKER')
and Name=@Name);
end
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateBonus]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculateBonus] (@ServiceType varchar(10),@PresentBasic numeric(12,2))
RETURNS  numeric(10,2)
AS  
BEGIN  
	Declare @Bonus numeric(10,2)
   if @ServiceType='Checker' or @ServiceType='Employee'
	begin
		if @PresentBasic Between 0 and 60000
			set @Bonus=15*@PresentBasic/100
		else if @PresentBasic Between 60001 and 100000
			set @Bonus=12*@PresentBasic/100
		else 
			if 8*@PresentBasic/100>13800
				set @Bonus=8*@PresentBasic/100
			else
				set @Bonus=13800
	end
	else if @ServiceType='Roller' or @ServiceType='Packer'
		set @Bonus=12*@PresentBasic/100
	return @Bonus
END;  
GO
/****** Object:  UserDefinedFunction [dbo].[date_diff]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[date_diff](@date1 date,@date2 date)
returns varchar(30)
as
begin
	DECLARE @date datetime, @tmpdate datetime, @years int, @months int, @days int
	
	SET @tmpdate = @date1

	SET @years = DATEDIFF(yy, @tmpdate, @date2) - CASE WHEN (MONTH(@date1) > MONTH(@date2)) OR (MONTH(@date1) = MONTH(@date2) AND DAY(@date1) > DAY(@date2)) THEN 1 ELSE 0 END
	SET @tmpdate = DATEADD(yy, @years, @tmpdate)
	SET @months = DATEDIFF(m, @tmpdate, @date2) - CASE WHEN DAY(@date1) > DAY(@date2) THEN 1 ELSE 0 END
	SET @tmpdate = DATEADD(m, @months, @tmpdate)
	SET @days = DATEDIFF(d, @tmpdate, @date2)

	return concat(@years,' ',@months,' ',@days)
end
GO
/****** Object:  UserDefinedFunction [dbo].[fnBonusCalculation]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBonusCalculation]
(
@BasicPay numeric(12,2),
@ServiceType varchar(20)
)

RETURNS numeric(12,2)

	BEGIN
		declare @Bonus numeric(12,2)

					if @ServiceType = 'CHECKER' or @ServiceType = 'EMPLOYEE' 
					begin
						if @BasicPay between 0 and 60000 
							set @Bonus = (15.0/100)*@BasicPay
				

						if @BasicPay between  60001 and 100000
							set @Bonus = (12.0/100)*@BasicPay
				

						if @BasicPay >100000
						begin 
							set @Bonus = (8.0/100)*@BasicPay
								if @Bonus < 13800   --just checking the minimum bonus is 13800
									set @Bonus = 13800
						end
		
				   end

					if @ServiceType = 'PACKER' or @ServiceType = 'ROLLER'
						set @Bonus = (12.0/100)*@BasicPay

		RETURN  @Bonus

        

	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnemp]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnemp]

(@empid int )

RETURNS int

	BEGIN

		RETURN (SELECT @empid)

        

	END
GO
/****** Object:  UserDefinedFunction [dbo].[fun_bonus]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create   function [dbo].[fun_bonus]
  (@empno int)
  returns float
  as
  begin
   return(select  
    case 
   when tblServiceTypes.Description='checker' or tblServiceTypes.Description='employee' 
		 then
			case when presentbasic between 0 and 6000 and (presentbasic*15)/100<=9000
				 then  (presentbasic*15)/100 
				 when presentBasic between 6000 and 10000 and (presentbasic*12)/100 between 9000 and 13800 
				 then  (presentbasic*12)/100
				 when presentBasic > 10000 and (Presentbasic*8)/100<=13800
				 then (Presentbasic*8)/100
			end 
		 when
		  tblServiceTypes.Description='ROLLER' or tblServiceTypes.Description='PACKER' 
		 then
			case when presentbasic>=0
				 then (presentbasic*12)/100
	       end  
		   end 	  
	from tblEmployees
	join tblServiceTypes on tblServiceTypes.ServiceType=tblEmployees.ServiceType
	where employeenumber=@empno)
	end
GO
/****** Object:  UserDefinedFunction [dbo].[get_Date_Diff]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_Date_Diff](@date1 date,@date2 date)
returns varchar(50)
as
begin
return CONCAT(DATEDIFF(year,@date1,@date2),' years ',DATEDIFF(MONTH,@date1,@date2)%12,' months ')
end
GO
/****** Object:  UserDefinedFunction [dbo].[get_Date_Diff1]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_Date_Diff1](@date1 date)
returns varchar(50)
as
begin
	declare @date2 date = Convert(date,getdate())
	return CONCAT(DATEDIFF(year,@date1,@date2),' years ',DATEDIFF(MONTH,@date1,@date2)%12,' months ')
end
GO
/****** Object:  UserDefinedFunction [dbo].[get_Date_DiffD]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_Date_DiffD](@date1 date)
returns int
as
begin
	declare @date2 date = Convert(date,getdate())
	return CONVERT(int,DATEDIFF(month,@date1,@date2)%365)
end
GO
/****** Object:  UserDefinedFunction [dbo].[get_Date_DiffM]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_Date_DiffM](@date1 date)
returns int
as
begin
	declare @date2 date = Convert(date,getdate())
	return CONVERT(int,DATEDIFF(month,@date1,@date2)%12)
end
GO
/****** Object:  UserDefinedFunction [dbo].[get_Date_DiffY]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[get_Date_DiffY](@date1 date)
returns int
as
begin
	declare @date2 date = Convert(date,getdate())
	return CONVERT(int,DATEDIFF(year,@date1,@date2))
end
GO
/****** Object:  UserDefinedFunction [dbo].[getname]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getname] ( @code smallint )
RETURNS int
AS
BEGIN
    RETURN (     select EmployeeNumber from tblEmployees where DesignationCode=@code)
END
GO
/****** Object:  UserDefinedFunction [dbo].[retbonus]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   function [dbo].[retbonus]( @empno int)
returns numeric(12,2)
as
 begin 
 return ( select (CASE WHEN (ST.Description='CHECKER' OR ST.Description='EMPLOYEE') 
	 THEN 
	 CASE WHEN (PresentBasic*12)>0 AND (PresentBasic*12)<60000
		  THEN CASE WHEN (PresentBasic*12*0.15)>9000
			         THEN 9000
		        ELSE (PresentBasic*12*0.15)
				END
	 WHEN (PresentBasic*12)>60000 AND (PresentBasic*12)<100000
		 THEN CASE WHEN (PresentBasic*12*0.15)>13800
					THEN 13800
				   WHEN (PresentBasic*12*0.15)<9000
					THEN 9000
			  ELSE (PresentBasic*12*0.15)
			  END
	 WHEN (PresentBasic*12)>100000
		  THEN CASE WHEN (PresentBasic*12*0.08)<13800
		              THEN 13800
				ELSE (PresentBasic*12*0.08)
				END
	END
	ELSE (PresentBasic*12*0.12)
	END
	)BONUS
	
from 
tblEmployees e	inner join tblServiceTypes st on st.ServiceType=e.ServiceType 
where EmployeeNumber=@empno)
end
GO
/****** Object:  Table [dbo].[Emp]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp](
	[empid] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[mgrid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[withcondition]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[withcondition]
as
select * from emp where  salary > 14000 with check option
GO
/****** Object:  Table [dbo].[tblServiceTypes]    Script Date: 3/25/2019 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceTypes](
	[ServiceType] [tinyint] NOT NULL,
	[Description] [varchar](15) NOT NULL,
 CONSTRAINT [P_ServiceTypes] PRIMARY KEY CLUSTERED 
(
	[ServiceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_ServiceTypes_Name] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 3/25/2019 6:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployees](
	[LetterNumber] [varchar](25) NULL,
	[LetterDate] [datetime] NULL,
	[DOJ] [datetime] NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[CentreCode] [int] NOT NULL,
	[BranchCode] [int] NULL,
	[CategoryCode] [tinyint] NOT NULL,
	[DepartmentCode] [smallint] NULL,
	[SectionCode] [smallint] NULL,
	[EmployeeType] [tinyint] NOT NULL,
	[ServiceType] [tinyint] NOT NULL,
	[ServiceStatus] [tinyint] NOT NULL,
	[OfficiatingDesignationCode] [smallint] NULL,
	[FatherName] [varchar](30) NULL,
	[DOB] [datetime] NULL,
	[CertificateType] [tinyint] NULL,
	[CertificateNo] [varchar](25) NULL,
	[CertificateDate] [datetime] NULL,
	[Age] [tinyint] NULL,
	[Sex] [char](1) NULL,
	[LicenceNumber] [varchar](25) NULL,
	[ExpiryDate] [datetime] NULL,
	[Name] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Religion] [tinyint] NULL,
	[Nationality] [tinyint] NULL,
	[ExtraCurricum] [varchar](400) NULL,
	[MotherLanguage] [tinyint] NULL,
	[ApplicationNumber] [int] NULL,
	[ApplicationDate] [datetime] NULL,
	[LocationType] [tinyint] NOT NULL,
	[LocationCode] [int] NULL,
	[FunctionalDesignation] [smallint] NOT NULL,
	[DesignationCode] [smallint] NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[IsFDActive] [bit] NULL,
	[ReportingToFD] [smallint] NULL,
	[DeputationLocationType] [smallint] NULL,
	[DeputationLocationCode] [int] NULL,
	[ConfirmDate] [datetime] NULL,
	[DivisionCode] [tinyint] NOT NULL,
	[SectorCode] [smallint] NOT NULL,
	[GodownCode] [smallint] NULL,
	[AreaCode] [tinyint] NOT NULL,
	[PANNumber] [varchar](25) NULL,
	[IssueDate] [datetime] NULL,
	[JoiningBasic] [numeric](12, 2) NULL,
	[PresentBasic] [numeric](12, 2) NULL,
	[StatusCode] [tinyint] NULL,
	[IsMPBuffer] [bit] NULL,
	[OwnResidence] [bit] NULL,
	[TerminationStatus] [bit] NULL,
	[IsSuspended] [bit] NULL,
	[RetirementDate] [datetime] NULL,
	[SeqNo] [int] NOT NULL,
	[BloodGroup] [varchar](10) NULL,
	[InActiveNNo] [varchar](25) NULL,
 CONSTRAINT [P_Employees] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[tbl_valued_bonus_calculation]    Script Date: 3/25/2019 6:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  function  [dbo].[tbl_valued_bonus_calculation] (@one int)
returns table
as
return
select distinct EmployeeNumber,Name,PresentBasic,st.Description,
	(case when (PresentBasic>0 and PresentBasic<60000) and st.Description='checker' then PresentBasic*0.15
		 when st.Description='checker' and (PresentBasic>60001 and PresentBasic<100000) and ((PresentBasic*0.12)>9000 and (PresentBasic*0.12)<13800)  then PresentBasic*0.12
		 when st.Description='checker' and (PresentBasic>100001) and ((PresentBasic*0.08)>13800) then PresentBasic*0.08
		 when (st.Description='roller' or  st.Description='packer') and (PresentBasic>0) and ((PresentBasic*0.12)>0) then PresentBasic*0.12		 
		 else 0
		 end
	)BONUS
from 
tblEmployees e	inner join tblServiceTypes st on st.ServiceType=e.ServiceType 
where EmployeeNumber>1
GO
/****** Object:  UserDefinedFunction [dbo].[page]    Script Date: 3/25/2019 6:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create  function  [dbo].[page] (@pagesize int,@pageno int)
returns table
as
return

select employeenumber,name,DOJ,DOB 
 from tblEmployees order by EmployeeNumber
 offset (@pageno-1)*@pagesize rows fetch next @pagesize rows only
GO
/****** Object:  View [dbo].[TEMP_VIEW]    Script Date: 3/25/2019 6:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TEMP_VIEW] as
select tbl.Name, case 
		when tbl.ServiceType=1 and tbl.EmployeeType=1 and DATEDIFF(year,tbl.DOJ,getdate())>=10 and DATEDIFF(year,GETDATE(),tbl.RetirementDate)>=15 and DATEDIFF(year,tbl.DOB,tbl.RetirementDate)>=60 then 'Eligible'
		when tbl.ServiceType=1 and tbl.EmployeeType=2 and DATEDIFF(year,tbl.DOJ,getdate())>=12 and DATEDIFF(year,GETDATE(),tbl.RetirementDate)>=14 and DATEDIFF(year,tbl.DOB,tbl.RetirementDate)>=55 then 'Eligible'
		when tbl.ServiceType=1 and tbl.EmployeeType=3 and DATEDIFF(year,tbl.DOJ,getdate())>=12 and DATEDIFF(year,GETDATE(),tbl.RetirementDate)>=12 and DATEDIFF(year,tbl.DOB,tbl.RetirementDate)>=55 then 'Eligible'
	    when (tbl.ServiceType=2 or tbl.ServiceType=3 or tbl.ServiceType=4) and DATEDIFF(year,tbl.DOJ,getdate())>=15 and DATEDIFF(year,GETDATE(),tbl.RetirementDate)>=20 and DATEDIFF(year,tbl.DOB,tbl.RetirementDate)>=65 then 'Eligible'
		end  
as 'Bonus_Eligibility'  
from tblEmployees tbl;
GO
/****** Object:  View [dbo].[sample]    Script Date: 3/25/2019 6:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sample]
as 
select * from dbo.tblEmployees
GO
/****** Object:  Table [dbo].[tblCentreMaster]    Script Date: 3/25/2019 6:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCentreMaster](
	[RefNoteNumber] [char](25) NULL,
	[CentreCode] [int] NOT NULL,
	[CentreName] [varchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[DistrictCode] [smallint] NULL,
	[SectorCode] [smallint] NULL,
	[ZoneCode] [smallint] NOT NULL,
	[CentreCategory] [smallint] NOT NULL,
	[CentreType] [varchar](50) NULL,
	[PFNumber] [varchar](25) NULL,
	[StorageCapacity] [int] NULL,
	[LicenceNumber] [varchar](25) NULL,
	[IssueDate] [datetime] NOT NULL,
	[AddressCode] [smallint] NULL,
	[AgreementCode] [varchar](15) NULL,
	[CompanyCode] [smallint] NOT NULL,
	[DivisionCode] [tinyint] NOT NULL,
	[AreaCode] [tinyint] NULL,
	[LeafAvailability] [varchar](10) NULL,
	[Accomodation] [bit] NULL,
	[ESIApplicable] [bit] NULL,
	[IsOwnCentre] [bit] NULL,
	[ThumbAttendance] [bit] NULL,
	[Period] [tinyint] NULL,
	[CentreSize] [varchar](10) NULL,
	[PackingType] [char](1) NULL,
	[RollerWiseBidiType] [char](1) NULL,
	[CentreClosed] [tinyint] NULL,
 CONSTRAINT [P_CentreMaster] PRIMARY KEY CLUSTERED 
(
	[CentreCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[sal_calculation]    Script Date: 3/25/2019 6:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  function  [dbo].[sal_calculation] ()
returns table
as
return(
SELECT cal2.EMployeeNumber,cal2.CentreName,cal2.PresentBasic,cal2.VDA,cal2.HRA,cal2.Conveyance,(cal2.PresentBasic+cal2.VDA+cal2.HRA+cal2.Conveyance) AS GrossPay,
cal2.PF,(cal2.PresentBasic+cal2.VDA+cal2.HRA+cal2.Conveyance)-cal2.PF AS Netpay
FROM(
SELECT cal.EMployeeNumber,cal.CentreName,PresentBasic,cal.VDA,
	(CASE WHEN cal.CentreCode=12
				THEN (PresentBasic*0.4)+cal.VDA
		  WHEN cal.CentreCode=22
				THEN (PresentBasic*0.25)+cal.VDA
		  ELSE ((PresentBasic*0.15)+cal.VDA)
	END) AS HRA,
	cal.Conveyance,cal.PF 
	FROM(
	SELECT EmployeeNumber,CM.CentreCode,CM.CentreName,PresentBasic,
			(CASE WHEN ((PresentBasic*0.06)+200)>10000
					   THEN 10000
				   ELSE ((PresentBasic*0.06)+200) END) AS VDA,
			 (CASE WHEN (PresentBasic*0.04)>800
					   THEN 800
				   ELSE (PresentBasic*0.04) END) AS Conveyance,
			 (CASE WHEN (DATEDIFF(YEAR,DOB,GETDATE())<58 AND ServiceStatus=4) 
					   THEN CASE WHEN (PresentBasic*0.1)>6500
									  THEN 6500
								 ELSE (PresentBasic*0.1)
							END
				   ELSE 0
			 END) AS PF 
		FROM dbo.tblEmployees AS EMP JOIN 
        dbo.tblCentreMaster AS CM ON CM.CentreCode=EMP.CentreCode AND PresentBasic<>0.00) AS cal) AS cal2);
GO
/****** Object:  Table [dbo].[tblPayEmployees]    Script Date: 3/25/2019 6:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayEmployees](
	[NoteNumber] [varchar](25) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[LocationType] [tinyint] NULL,
	[LocationCode] [int] NULL,
	[GrossPay] [numeric](12, 2) NULL,
	[Deductions] [numeric](12, 2) NULL,
	[NetPay] [numeric](12, 2) NULL,
	[ActualGrossPay] [numeric](12, 2) NULL,
	[DesignationCode] [smallint] NULL,
	[Servicetype] [tinyint] NULL,
	[EmployeeType] [tinyint] NULL,
	[ServiceStatus] [tinyint] NULL,
	[CentreCode] [int] NULL,
	[TotalPaidDays] [numeric](6, 2) NULL,
	[LastPayAbsentDays] [numeric](6, 2) NULL,
	[TotalWorkedDays] [numeric](6, 2) NULL,
	[isPaid] [bit] NULL,
	[ActualPaidDays] [numeric](6, 2) NULL,
	[ActualNet] [numeric](12, 2) NULL,
	[Arrers] [numeric](10, 2) NULL,
	[ArrersPaid] [bit] NULL,
	[EffectiveFrom] [datetime] NULL,
	[EmpDays] [numeric](5, 2) NULL,
	[SPPEDays] [numeric](5, 2) NULL,
	[SPPEPdays] [numeric](5, 2) NULL,
	[WagePaymentNNO] [varchar](25) NULL,
	[WagePaymentNoteNo] [datetime] NULL,
	[PaymentPeriodDays] [numeric](6, 2) NULL,
	[DaysAbsent] [numeric](6, 2) NULL,
	[DayString] [varchar](200) NULL,
	[RollerBidi] [int] NULL,
	[PackerGoodBags] [int] NULL,
	[packerGoodBidis] [int] NULL,
	[PackerChatBags] [int] NULL,
	[PackerChatBidis] [int] NULL,
 CONSTRAINT [PK_tblPayEmployees] PRIMARY KEY NONCLUSTERED 
(
	[NoteNumber] ASC,
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_PayEmployees] UNIQUE CLUSTERED 
(
	[NoteNumber] ASC,
	[EmployeeNumber] ASC,
	[EffectiveFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayEmployeeparamDetails]    Script Date: 3/25/2019 6:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayEmployeeparamDetails](
	[NoteNumber] [varchar](25) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[ParamCode] [varchar](6) NOT NULL,
	[TransValue] [smallint] NULL,
	[ActualAmount] [numeric](12, 2) NULL,
	[Amount] [numeric](12, 2) NULL,
	[EmployerShare] [numeric](12, 2) NULL,
	[PayType] [char](1) NULL,
	[EffectiveFrom] [datetime] NULL,
	[CalculatedOn] [numeric](15, 2) NULL,
	[PersonServiceStatus] [tinyint] NULL,
	[ParamCalculationRate] [numeric](15, 2) NULL,
	[EarnedCalculatedOn] [numeric](15, 2) NULL,
 CONSTRAINT [PK_tblPayEmployeeparamDetails] PRIMARY KEY NONCLUSTERED 
(
	[NoteNumber] ASC,
	[EmployeeNumber] ASC,
	[ParamCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_PayEmployeeparamDetails] UNIQUE CLUSTERED 
(
	[NoteNumber] ASC,
	[EmployeeNumber] ASC,
	[EffectiveFrom] ASC,
	[ParamCode] ASC,
	[PersonServiceStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Salary]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Salary](@Employeeno int)
returns table
as
return
select a.EmployeeNumber,a.Name,d.CentreName,Basic,VDA,Conveyance,HRA,PF,e.Deductions,e.NetPay/*,CentreName,BASIC,VDA,HRA,Conveyance,GrossPay,PF,Deductions,NetPay*/
from
(select EmployeeNumber,Name,PresentBasic as Basic from tblEmployees) as a
join
(select EmployeeNumber,Name,(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) as VDA from tblEmployees) as b
on a.EmployeeNumber=b.EmployeeNumber
join
(select EmployeeNumber,(case when 0.04*PresentBasic>800 then 800 else 0.04*PresentBasic end) as Conveyance from tblEmployees)as c
on b.employeeNUmber=c.EmployeeNumber
join
(select tblEmployees.EmployeeNumber,ParamCode,CentreName,(case when CentreName='HYDERABAD' then (0.4*c1.Amount1)+(case when 200+(0.06*PresentBasic)>10000 
then 10000 else 200+(0.06*PresentBasic) end)
when CentreName='Nizamabad' then 0.25*c1.Amount1+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) 
else 0.15*c1.Amount1+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) end)
as HRA from tblEmployees
join tblCentreMaster as b1 on tblEmployees.CentreCode=b1.CentreCode join (select EmployeeNumber,ParamCode,sum(case when ParamCode='HRA' then Amount else 0 end) 
as Amount1 from tblPayEmployeeparamDetails
where ParamCode='HRA' group by EmployeeNumber,ParamCode) as c1 on tblEmployees.Employeenumber=c1.EmployeeNumber)as d
on c.EmployeeNumber=d.EmployeeNumber
join
(select a4.EmployeeNumber,Age,(case when (b3.Deductions*0.1)<=(0.1*PresentBasic) and (b3.Deductions*0.1)<=6500 then b3.Deductions*0.1 else 6500 end) as PF,b3.Deductions,b3.NetPay
from tblEmployees as a4 join tblPayEmployees as b3 on a4.EmployeeNumber=b3.EmployeeNumber) as e on b.EmployeeNumber=e.EmployeeNumber﻿
GO
/****** Object:  UserDefinedFunction [dbo].[SalaryCalc]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[SalaryCalc](@Employeeno int)
returns table
as
return
select distinct a.EmployeeNumber,a.Name,d.CentreName,Basic,VDA,Conveyance,HRA,PF,e.Deductions,e.NetPay
from
(select EmployeeNumber,Name,PresentBasic as Basic from tblEmployees) as a
join
(select EmployeeNumber,Name,(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) as VDA from tblEmployees) as b
on a.EmployeeNumber=b.EmployeeNumber
join
(select EmployeeNumber,(case when 0.04*PresentBasic>800 then 800 else 0.04*PresentBasic end) as Conveyance from tblEmployees)as c
on b.employeeNUmber=c.EmployeeNumber
join
(select tblEmployees.EmployeeNumber,ParamCode,CentreName,(case when CentreName='HYDERABAD' then (0.4*c1.Amount1)+(case when 200+(0.06*PresentBasic)>10000 
then 10000 else 200+(0.06*PresentBasic) end)
when CentreName='Nizamabad' then 0.25*c1.Amount1+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) 
else 0.15*c1.Amount1+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) end)
as HRA from tblEmployees
join tblCentreMaster as b1 on tblEmployees.CentreCode=b1.CentreCode join (select EmployeeNumber,ParamCode,sum(case when ParamCode='HRA' then Amount else 0 end) 
as Amount1 from tblPayEmployeeparamDetails
where ParamCode='HRA' group by EmployeeNumber,ParamCode) as c1 on tblEmployees.Employeenumber=c1.EmployeeNumber)as d
on c.EmployeeNumber=d.EmployeeNumber
join
(select a4.EmployeeNumber,Age,(case when (b3.Deductions*0.1)<=(0.1*PresentBasic) and (b3.Deductions*0.1)<=6500 then b3.Deductions*0.1 else 6500 end) as PF,b3.Deductions,b3.NetPay
from tblEmployees as a4 join tblPayEmployees as b3 on a4.EmployeeNumber=b3.EmployeeNumber) as e on b.EmployeeNumber=e.EmployeeNumber﻿ 
where a.EmployeeNumber=@Employeeno
GO
/****** Object:  UserDefinedFunction [dbo].[f1]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f1](
@presentbasic int,
@r1 int)
returns table
as
return
select presentbasic,r1 from (select presentbasic,row_number() over(order by presentbasic desc) as r1 from tblEmployees) as a where presentbasic=@presentbasic and r1=@r1
GO
/****** Object:  Table [dbo].[tblDesignations]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDesignations](
	[DesignationCode] [smallint] NOT NULL,
	[Description] [varchar](100) NULL,
	[CategoryCode] [tinyint] NOT NULL,
	[ServiceType] [tinyint] NOT NULL,
	[EmployeeType] [tinyint] NOT NULL,
	[HigherDesgnCode] [smallint] NULL,
	[AppraisalForm] [tinyint] NOT NULL,
 CONSTRAINT [P_Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Employeedetails2]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Employeedetails2] as
select a.EmployeeNumber,a.CentreCode,a.designationcode,a.Divisioncode,a.SectorCode,a.GodownCode,a.DepartmentCode,b.HigherDesgnCode,a.SectionCode from tblEmployees as a join tblDesignations as b
on a.Designationcode=b.DesignationCode
GO
/****** Object:  View [dbo].[empview]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[empview]
as
select * from EMP e
 join Library l on e.id = l.empid
GO
/****** Object:  View [dbo].[simpleview]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[simpleview]
as
select * from emp
GO
/****** Object:  View [dbo].[test_view_name]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[test_view_name] 
as
select * from test
GO
/****** Object:  View [dbo].[TestView]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestView]
AS
SELECT ID,
		Val
FROM dbo.Temp1
GO
/****** Object:  Table [dbo].[a]    Script Date: 3/25/2019 6:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a](
	[id] [int] NOT NULL,
	[id1] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aa]    Script Date: 3/25/2019 6:42:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aa](
	[a] [int] NULL,
	[b] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aaa]    Script Date: 3/25/2019 6:42:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaa](
	[LetterNumber] [varchar](25) NULL,
	[LetterDate] [datetime] NULL,
	[DOJ] [datetime] NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[CentreCode] [int] NOT NULL,
	[BranchCode] [int] NULL,
	[CategoryCode] [tinyint] NOT NULL,
	[DepartmentCode] [smallint] NULL,
	[SectionCode] [smallint] NULL,
	[EmployeeType] [tinyint] NOT NULL,
	[ServiceType] [tinyint] NOT NULL,
	[ServiceStatus] [tinyint] NOT NULL,
	[OfficiatingDesignationCode] [smallint] NULL,
	[FatherName] [varchar](30) NULL,
	[DOB] [datetime] NULL,
	[CertificateType] [tinyint] NULL,
	[CertificateNo] [varchar](25) NULL,
	[CertificateDate] [datetime] NULL,
	[Age] [tinyint] NULL,
	[Sex] [char](1) NULL,
	[LicenceNumber] [varchar](25) NULL,
	[ExpiryDate] [datetime] NULL,
	[Name] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Religion] [tinyint] NULL,
	[Nationality] [tinyint] NULL,
	[ExtraCurricum] [varchar](400) NULL,
	[MotherLanguage] [tinyint] NULL,
	[ApplicationNumber] [int] NULL,
	[ApplicationDate] [datetime] NULL,
	[LocationType] [tinyint] NOT NULL,
	[LocationCode] [int] NULL,
	[FunctionalDesignation] [smallint] NOT NULL,
	[DesignationCode] [smallint] NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[IsFDActive] [bit] NULL,
	[ReportingToFD] [smallint] NULL,
	[DeputationLocationType] [smallint] NULL,
	[DeputationLocationCode] [int] NULL,
	[ConfirmDate] [datetime] NULL,
	[DivisionCode] [tinyint] NOT NULL,
	[SectorCode] [smallint] NOT NULL,
	[GodownCode] [smallint] NULL,
	[AreaCode] [tinyint] NOT NULL,
	[PANNumber] [varchar](25) NULL,
	[IssueDate] [datetime] NULL,
	[JoiningBasic] [numeric](12, 2) NULL,
	[PresentBasic] [numeric](12, 2) NULL,
	[StatusCode] [tinyint] NULL,
	[IsMPBuffer] [bit] NULL,
	[OwnResidence] [bit] NULL,
	[TerminationStatus] [bit] NULL,
	[IsSuspended] [bit] NULL,
	[RetirementDate] [datetime] NULL,
	[SeqNo] [int] NOT NULL,
	[BloodGroup] [varchar](10) NULL,
	[InActiveNNo] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aaaa]    Script Date: 3/25/2019 6:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaaa](
	[b] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignment]    Script Date: 3/25/2019 6:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignment](
	[id] [int] NOT NULL,
	[name] [varchar](200) NOT NULL,
	[IgnoreThisDuplicate] [int] NULL,
 CONSTRAINT [pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignment1]    Script Date: 3/25/2019 6:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignment1](
	[id] [int] NULL,
	[name] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b]    Script Date: 3/25/2019 6:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b1]    Script Date: 3/25/2019 6:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b1](
	[idy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bb]    Script Date: 3/25/2019 6:42:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bb](
	[a] [int] NULL,
	[b] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bonus1]    Script Date: 3/25/2019 6:42:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bonus1](
	[id] [int] NULL,
	[paramcode] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/25/2019 6:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cj]    Script Date: 3/25/2019 6:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cj](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cj1]    Script Date: 3/25/2019 6:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cj1](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Constraint1]    Script Date: 3/25/2019 6:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constraint1](
	[id] [int] NULL,
	[code] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Constraints]    Script Date: 3/25/2019 6:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constraints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/25/2019 6:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_id] [int] NULL,
	[First_name] [varchar](10) NULL,
	[Last_name] [varchar](25) NULL,
	[Email] [varchar](30) NULL,
	[Address] [varchar](40) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](10) NULL,
	[Zipcode] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[demo]    Script Date: 3/25/2019 6:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[demo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nme] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 3/25/2019 6:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[District_Id] [int] NOT NULL,
	[DistrictName] [varchar](50) NULL,
	[State_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[District_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district_66]    Script Date: 3/25/2019 6:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district_66](
	[district_Id] [int] NOT NULL,
	[District_Name] [varchar](50) NULL,
	[State_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[district_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp1]    Script Date: 3/25/2019 6:42:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp1](
	[id] [int] NULL,
	[name] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emplo]    Script Date: 3/25/2019 6:42:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emplo](
	[LetterNumber] [varchar](25) NULL,
	[LetterDate] [datetime] NULL,
	[DOJ] [datetime] NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[CentreCode] [int] NOT NULL,
	[BranchCode] [int] NULL,
	[CategoryCode] [tinyint] NOT NULL,
	[DepartmentCode] [smallint] NULL,
	[SectionCode] [smallint] NULL,
	[EmployeeType] [tinyint] NOT NULL,
	[ServiceType] [tinyint] NOT NULL,
	[ServiceStatus] [tinyint] NOT NULL,
	[OfficiatingDesignationCode] [smallint] NULL,
	[FatherName] [varchar](30) NULL,
	[DOB] [datetime] NULL,
	[CertificateType] [tinyint] NULL,
	[CertificateNo] [varchar](25) NULL,
	[CertificateDate] [datetime] NULL,
	[Age] [tinyint] NULL,
	[Sex] [char](1) NULL,
	[LicenceNumber] [varchar](25) NULL,
	[ExpiryDate] [datetime] NULL,
	[Name] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Religion] [tinyint] NULL,
	[Nationality] [tinyint] NULL,
	[ExtraCurricum] [varchar](400) NULL,
	[MotherLanguage] [tinyint] NULL,
	[ApplicationNumber] [int] NULL,
	[ApplicationDate] [datetime] NULL,
	[LocationType] [tinyint] NOT NULL,
	[LocationCode] [int] NULL,
	[FunctionalDesignation] [smallint] NOT NULL,
	[DesignationCode] [smallint] NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[IsFDActive] [bit] NULL,
	[ReportingToFD] [smallint] NULL,
	[DeputationLocationType] [smallint] NULL,
	[DeputationLocationCode] [int] NULL,
	[ConfirmDate] [datetime] NULL,
	[DivisionCode] [tinyint] NOT NULL,
	[SectorCode] [smallint] NOT NULL,
	[GodownCode] [smallint] NULL,
	[AreaCode] [tinyint] NOT NULL,
	[PANNumber] [varchar](25) NULL,
	[IssueDate] [datetime] NULL,
	[JoiningBasic] [numeric](12, 2) NULL,
	[PresentBasic] [numeric](12, 2) NULL,
	[StatusCode] [tinyint] NULL,
	[IsMPBuffer] [bit] NULL,
	[OwnResidence] [bit] NULL,
	[TerminationStatus] [bit] NULL,
	[IsSuspended] [bit] NULL,
	[RetirementDate] [datetime] NULL,
	[SeqNo] [int] NOT NULL,
	[BloodGroup] [varchar](10) NULL,
	[InActiveNNo] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empqq]    Script Date: 3/25/2019 6:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empqq](
	[NoteNumber] [varchar](25) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[LocationType] [tinyint] NULL,
	[LocationCode] [int] NULL,
	[GrossPay] [numeric](12, 2) NULL,
	[Deductions] [numeric](12, 2) NULL,
	[NetPay] [numeric](12, 2) NULL,
	[ActualGrossPay] [numeric](12, 2) NULL,
	[DesignationCode] [smallint] NULL,
	[Servicetype] [tinyint] NULL,
	[EmployeeType] [tinyint] NULL,
	[ServiceStatus] [tinyint] NULL,
	[CentreCode] [int] NULL,
	[TotalPaidDays] [numeric](6, 2) NULL,
	[LastPayAbsentDays] [numeric](6, 2) NULL,
	[TotalWorkedDays] [numeric](6, 2) NULL,
	[isPaid] [bit] NULL,
	[ActualPaidDays] [numeric](6, 2) NULL,
	[ActualNet] [numeric](12, 2) NULL,
	[Arrers] [numeric](10, 2) NULL,
	[ArrersPaid] [bit] NULL,
	[EffectiveFrom] [datetime] NULL,
	[EmpDays] [numeric](5, 2) NULL,
	[SPPEDays] [numeric](5, 2) NULL,
	[SPPEPdays] [numeric](5, 2) NULL,
	[WagePaymentNNO] [varchar](25) NULL,
	[WagePaymentNoteNo] [datetime] NULL,
	[PaymentPeriodDays] [numeric](6, 2) NULL,
	[DaysAbsent] [numeric](6, 2) NULL,
	[DayString] [varchar](200) NULL,
	[RollerBidi] [int] NULL,
	[PackerGoodBags] [int] NULL,
	[packerGoodBidis] [int] NULL,
	[PackerChatBags] [int] NULL,
	[PackerChatBidis] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Example]    Script Date: 3/25/2019 6:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Example](
	[SurrogateKey] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamSchedule]    Script Date: 3/25/2019 6:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSchedule](
	[ClassNo] [int] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 3/25/2019 6:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Grade_Id] [int] NOT NULL,
	[GradeName] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Grade_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade_66]    Script Date: 3/25/2019 6:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade_66](
	[Grade_Id] [int] NOT NULL,
	[GradeName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Grade_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ij]    Script Date: 3/25/2019 6:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ij](
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ij1]    Script Date: 3/25/2019 6:42:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ij1](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ind]    Script Date: 3/25/2019 6:42:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ind](
	[me] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JJ1]    Script Date: 3/25/2019 6:42:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JJ1](
	[ss] [varchar](10) NOT NULL,
	[kk] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Krishna]    Script Date: 3/25/2019 6:42:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Krishna](
	[Id] [int] NULL,
	[Name] [varchar](100) NULL,
	[Branch] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager]    Script Date: 3/25/2019 6:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager](
	[managername] [varchar](20) NULL,
	[managerid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master]    Script Date: 3/25/2019 6:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master](
	[Id] [int] NULL,
	[Name] [varchar](1) NULL,
	[Branch] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 3/25/2019 6:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msdb]    Script Date: 3/25/2019 6:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msdb](
	[Id] [int] NULL,
	[Name] [varchar](1) NULL,
	[Branch] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nam]    Script Date: 3/25/2019 6:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nam](
	[ID] [int] NULL,
	[Name] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[names]    Script Date: 3/25/2019 6:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[names](
	[firstname] [varchar](25) NULL,
	[middlename] [varchar](25) NULL,
	[lastname] [varchar](25) NULL,
	[localdido] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/25/2019 6:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Order_date] [date] NULL,
	[Amount] [money] NULL,
	[customer_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 3/25/2019 6:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[ID] [int] NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[Age] [int] NULL,
	[ID1] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[primaryex]    Script Date: 3/25/2019 6:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[primaryex](
	[id] [int] NOT NULL,
	[lastname] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[primaryexam]    Script Date: 3/25/2019 6:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[primaryexam](
	[id] [int] NOT NULL,
	[lastname] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[primaryexample]    Script Date: 3/25/2019 6:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[primaryexample](
	[id] [int] NOT NULL,
	[lastname] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/25/2019 6:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NULL,
	[Rate] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevenueDivision]    Script Date: 3/25/2019 6:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueDivision](
	[Revenue_Id] [int] NOT NULL,
	[RevenueDivisionName] [varchar](50) NULL,
	[District_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Revenue_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevenueDivision_66]    Script Date: 3/25/2019 6:42:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueDivision_66](
	[RevenueDivisionId] [int] NOT NULL,
	[districtid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RevenueDivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[s]    Script Date: 3/25/2019 6:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[s](
	[id] [int] NULL,
	[name] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[s1]    Script Date: 3/25/2019 6:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[s1](
	[id] [int] NULL,
	[name] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[s2]    Script Date: 3/25/2019 6:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[s2](
	[id] [int] NULL,
	[name] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sal]    Script Date: 3/25/2019 6:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sal](
	[id] [int] NULL,
	[departmentcode] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sample1]    Script Date: 3/25/2019 6:42:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sample1](
	[id] [int] NOT NULL,
	[id1] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 3/25/2019 6:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[School_Id] [int] NOT NULL,
	[SchoolName] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[UpToGrade] [varchar](10) NULL,
	[Revenue_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[School_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_66]    Script Date: 3/25/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_66](
	[School_Id] [int] NOT NULL,
	[SchoolName] [varchar](50) NULL,
	[Locations] [varchar](50) NULL,
	[UpToGrade] [varchar](50) NULL,
	[Revenue_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[School_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 3/25/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[State_Id] [int] NOT NULL,
	[StateName] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[State_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State_66]    Script Date: 3/25/2019 6:43:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State_66](
	[state_id] [int] NOT NULL,
	[statename] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/25/2019 6:43:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_Id] [int] NOT NULL,
	[StudentName] [varchar](50) NULL,
	[Grade_Id] [int] NULL,
	[School_Id] [int] NULL,
	[PhoneNumber] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_66]    Script Date: 3/25/2019 6:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_66](
	[student_id] [int] NOT NULL,
	[studentname] [varchar](30) NULL,
	[Grade_Id] [int] NULL,
	[School_id] [int] NULL,
	[phonenumber] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_academic_history]    Script Date: 3/25/2019 6:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_academic_history](
	[student_id] [int] NULL,
	[Grade_id] [int] NULL,
	[School_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_school_66]    Script Date: 3/25/2019 6:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_school_66](
	[student_id] [int] NULL,
	[school_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 3/25/2019 6:43:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[ID] [int] NULL,
	[NAME] [char](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t]    Script Date: 3/25/2019 6:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t](
	[x] [int] NULL,
	[y] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t1]    Script Date: 3/25/2019 6:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t1](
	[names] [varchar](89) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t11]    Script Date: 3/25/2019 6:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t11](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t12]    Script Date: 3/25/2019 6:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t12](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ta]    Script Date: 3/25/2019 6:43:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ta](
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab]    Script Date: 3/25/2019 6:43:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab1]    Script Date: 3/25/2019 6:43:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab2]    Script Date: 3/25/2019 6:43:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabs1]    Script Date: 3/25/2019 6:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabs1](
	[id] [int] NOT NULL,
	[name] [varchar](89) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabs2]    Script Date: 3/25/2019 6:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabs2](
	[id] [int] NULL,
	[name] [varchar](90) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag1]    Script Date: 3/25/2019 6:43:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag1](
	[id] [int] NULL,
	[userid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tav1]    Script Date: 3/25/2019 6:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tav1](
	[id] [int] NULL,
	[userid] [int] NULL,
	[active] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb]    Script Date: 3/25/2019 6:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb](
	[name] [varchar](35) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_employee_new]    Script Date: 3/25/2019 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employee_new](
	[emp_id] [int] NOT NULL,
	[emp_name] [varchar](100) NULL,
	[emp_department] [varchar](100) NULL,
	[emp_gender] [varchar](10) NULL,
	[emp_DOB] [date] NULL,
	[emp_salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDistricts]    Script Date: 3/25/2019 6:43:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDistricts](
	[stateId] [int] NULL,
	[district_name] [varchar](100) NULL,
	[districtId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[districtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeTypes]    Script Date: 3/25/2019 6:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeTypes](
	[EmployeeType] [tinyint] NOT NULL,
	[Description] [varchar](15) NOT NULL,
 CONSTRAINT [P_EmployeeTypes] PRIMARY KEY CLUSTERED 
(
	[EmployeeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocations]    Script Date: 3/25/2019 6:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocations](
	[LocationType] [tinyint] NOT NULL,
	[LocTypeName] [varchar](100) NOT NULL,
	[LocationCode] [int] NOT NULL,
	[LocCodeName] [varchar](100) NOT NULL,
	[HeadCentre] [int] NULL,
 CONSTRAINT [PK_tblLocations] PRIMARY KEY CLUSTERED 
(
	[LocationType] ASC,
	[LocationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbllocIncharge]    Script Date: 3/25/2019 6:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbllocIncharge](
	[DivisionCode] [tinyint] NULL,
	[SectorCode] [smallint] NULL,
	[CentreCode] [int] NULL,
	[SectionCode] [smallint] NULL,
	[DepartmentCode] [smallint] NULL,
	[locationIncharge] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblmandal]    Script Date: 3/25/2019 6:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmandal](
	[RevenueDivisionsId] [int] NULL,
	[MandalId] [int] IDENTITY(1,1) NOT NULL,
	[Mandal] [varchar](100) NULL,
	[pincode] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MandalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayEmployees1]    Script Date: 3/25/2019 6:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayEmployees1](
	[NoteNumber] [varchar](25) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[LocationType] [tinyint] NULL,
	[LocationCode] [int] NULL,
	[GrossPay] [numeric](12, 2) NULL,
	[Deductions] [numeric](12, 2) NULL,
	[NetPay] [numeric](12, 2) NULL,
	[ActualGrossPay] [numeric](12, 2) NULL,
	[DesignationCode] [smallint] NULL,
	[Servicetype] [tinyint] NULL,
	[EmployeeType] [tinyint] NULL,
	[ServiceStatus] [tinyint] NULL,
	[CentreCode] [int] NULL,
	[TotalPaidDays] [numeric](6, 2) NULL,
	[LastPayAbsentDays] [numeric](6, 2) NULL,
	[TotalWorkedDays] [numeric](6, 2) NULL,
	[isPaid] [bit] NULL,
	[ActualPaidDays] [numeric](6, 2) NULL,
	[ActualNet] [numeric](12, 2) NULL,
	[Arrers] [numeric](10, 2) NULL,
	[ArrersPaid] [bit] NULL,
	[EffectiveFrom] [datetime] NULL,
	[EmpDays] [numeric](5, 2) NULL,
	[SPPEDays] [numeric](5, 2) NULL,
	[SPPEPdays] [numeric](5, 2) NULL,
	[WagePaymentNNO] [varchar](25) NULL,
	[WagePaymentNoteNo] [datetime] NULL,
	[PaymentPeriodDays] [numeric](6, 2) NULL,
	[DaysAbsent] [numeric](6, 2) NULL,
	[DayString] [varchar](200) NULL,
	[RollerBidi] [int] NULL,
	[PackerGoodBags] [int] NULL,
	[packerGoodBidis] [int] NULL,
	[PackerChatBags] [int] NULL,
	[PackerChatBidis] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayMaster]    Script Date: 3/25/2019 6:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayMaster](
	[NoteNumber] [varchar](25) NOT NULL,
	[NoteDate] [datetime] NULL,
	[CentreCode] [int] NULL,
	[ParamCode] [varchar](6) NULL,
	[Fromdate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[PayedServiceType] [smallint] NULL,
	[PayedEmployeeType] [smallint] NULL,
	[PayedServiceStatus] [smallint] NULL,
	[LocationType] [tinyint] NULL,
	[LocatonCode] [int] NULL,
	[StateCode] [tinyint] NULL,
 CONSTRAINT [P_PayMaster] PRIMARY KEY CLUSTERED 
(
	[NoteNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRevenueDivisions]    Script Date: 3/25/2019 6:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRevenueDivisions](
	[RevenueDivisionsId] [int] IDENTITY(1,1) NOT NULL,
	[districtId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RevenueDivisionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServiceStatus]    Script Date: 3/25/2019 6:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceStatus](
	[ServiceStatus] [tinyint] NOT NULL,
	[Description] [varchar](15) NOT NULL,
 CONSTRAINT [P_ServiceStatus] PRIMARY KEY CLUSTERED 
(
	[ServiceStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_ServiceStatus_Name] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblstate]    Script Date: 3/25/2019 6:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblstate](
	[state_name] [varchar](100) NULL,
	[stateId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStateMaster]    Script Date: 3/25/2019 6:43:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStateMaster](
	[StateCode] [tinyint] NOT NULL,
	[StateName] [varchar](50) NULL,
 CONSTRAINT [P_StateMaster] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_StateMaster_Name] UNIQUE NONCLUSTERED 
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblstreet]    Script Date: 3/25/2019 6:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblstreet](
	[villageId] [int] NULL,
	[streetNum] [int] NOT NULL,
	[Street] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[streetNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblvillage]    Script Date: 3/25/2019 6:43:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblvillage](
	[MandalId] [int] NULL,
	[villageId] [int] IDENTITY(1,1) NOT NULL,
	[Village] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[villageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDS]    Script Date: 3/25/2019 6:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDS](
	[lower_limit] [bigint] NULL,
	[upper_limit] [bigint] NULL,
	[tax_rate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_table_new]    Script Date: 3/25/2019 6:43:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_table_new](
	[rownumber] [int] NULL,
	[employeenumber] [int] NULL,
	[paramcode] [varchar](6) NULL,
	[presentbasic] [numeric](12, 2) NULL,
	[ranks] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_table]    Script Date: 3/25/2019 6:43:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nchar](10) NOT NULL,
	[Code] [int] NOT NULL,
 CONSTRAINT [PK_Test_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test1]    Script Date: 3/25/2019 6:43:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test1](
	[id] [int] NULL,
	[count] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test11]    Script Date: 3/25/2019 6:43:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test11](
	[a] [int] NULL,
	[B] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test12]    Script Date: 3/25/2019 6:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test12](
	[a] [varchar](30) NULL,
	[B] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test13]    Script Date: 3/25/2019 6:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test13](
	[a] [varchar](30) NULL,
	[B] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test14]    Script Date: 3/25/2019 6:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test14](
	[a] [varchar](30) NULL,
	[B] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test15]    Script Date: 3/25/2019 6:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test15](
	[a] [varchar](30) NULL,
	[B] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test2]    Script Date: 3/25/2019 6:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test2](
	[id] [int] NULL,
	[count] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test20]    Script Date: 3/25/2019 6:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test20](
	[a] [int] NULL,
	[B] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test21]    Script Date: 3/25/2019 6:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test21](
	[a] [int] NULL,
	[B] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test3]    Script Date: 3/25/2019 6:43:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test3](
	[id] [decimal](18, 0) NULL,
	[name] [varchar](300) NULL,
	[count]  AS ([id])
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[timestamp1]    Script Date: 3/25/2019 6:43:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timestamp1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ts] [timestamp] NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uc]    Script Date: 3/25/2019 6:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uc](
	[id] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uc1]    Script Date: 3/25/2019 6:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uc1](
	[id] [int] NULL,
	[name] [varchar](25) NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdatedProducts]    Script Date: 3/25/2019 6:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdatedProducts](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NULL,
	[Rate] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[val]    Script Date: 3/25/2019 6:43:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[val](
	[id] [int] NULL,
	[name] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xyz]    Script Date: 3/25/2019 6:43:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xyz](
	[Id] [int] NULL,
	[Name] [varchar](1) NULL,
	[Branch] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [t_col]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [t_col] ON [dbo].[aaaa]
(
	[b] ASC
)
WHERE ([b]<>(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_MyCol_Filtered]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_MyCol_Filtered] ON [dbo].[Constraint1]
(
	[id] ASC
)
WHERE ([id]<>(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_tbl_TestUnique_ID9]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_tbl_TestUnique_ID9] ON [dbo].[tag1]
(
	[id] ASC,
	[userid] ASC
)
WHERE ([userID]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_tbl_TestUnique_ID90]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_tbl_TestUnique_ID90] ON [dbo].[tag1]
(
	[id] ASC,
	[userid] ASC
)
WHERE ([userID]<>(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_tbl_TestUnique_ID]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_tbl_TestUnique_ID] ON [dbo].[tav1]
(
	[id] ASC,
	[userid] ASC,
	[active] ASC
)
WHERE ([userID]<>(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_tbl_TestUnique_ID2]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_tbl_TestUnique_ID2] ON [dbo].[tav1]
(
	[id] ASC,
	[userid] ASC,
	[active] ASC
)
WHERE ([userID]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_NAME]    Script Date: 3/25/2019 6:43:34 PM ******/
CREATE NONCLUSTERED INDEX [INDEX_NAME] ON [dbo].[tblEmployees]
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ind] ADD  DEFAULT ('INDIAN') FOR [me]
GO
ALTER TABLE [dbo].[tblCentreMaster] ADD  CONSTRAINT [D_CentreMaster_Acco]  DEFAULT ((0)) FOR [Accomodation]
GO
ALTER TABLE [dbo].[tblCentreMaster] ADD  CONSTRAINT [D_CentreMaster_ESI]  DEFAULT ((0)) FOR [ESIApplicable]
GO
ALTER TABLE [dbo].[tblCentreMaster] ADD  CONSTRAINT [D_CentreMaster_IsOwn]  DEFAULT ((0)) FOR [IsOwnCentre]
GO
ALTER TABLE [dbo].[tblCentreMaster] ADD  CONSTRAINT [D_CentreMaster_Thumb]  DEFAULT ((0)) FOR [ThumbAttendance]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [D_Employees_JBasic]  DEFAULT ('0') FOR [JoiningBasic]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [D_Employees_PBasic]  DEFAULT ('0') FOR [PresentBasic]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [D_Employees_IsMPBuf]  DEFAULT ((0)) FOR [IsMPBuffer]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [D_Employees_OwnResidence]  DEFAULT ((0)) FOR [OwnResidence]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [D_Employees_TermStat]  DEFAULT ((0)) FOR [TerminationStatus]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [D_Emp_IsSuspended]  DEFAULT ((0)) FOR [IsSuspended]
GO
ALTER TABLE [dbo].[tblEmployees] ADD  CONSTRAINT [DF_tblEmployees_GenerationNo]  DEFAULT ((0)) FOR [SeqNo]
GO
ALTER TABLE [dbo].[uc1] ADD  DEFAULT ((0)) FOR [id]
GO
ALTER TABLE [dbo].[b]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[a] ([id])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([State_Id])
REFERENCES [dbo].[State] ([State_Id])
GO
ALTER TABLE [dbo].[district_66]  WITH CHECK ADD FOREIGN KEY([State_Id])
REFERENCES [dbo].[State_66] ([state_id])
GO
ALTER TABLE [dbo].[ij1]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[ij] ([id])
GO
ALTER TABLE [dbo].[RevenueDivision]  WITH CHECK ADD FOREIGN KEY([District_Id])
REFERENCES [dbo].[District] ([District_Id])
GO
ALTER TABLE [dbo].[sample1]  WITH CHECK ADD FOREIGN KEY([id1])
REFERENCES [dbo].[sample1] ([id])
GO
ALTER TABLE [dbo].[School]  WITH CHECK ADD FOREIGN KEY([Revenue_ID])
REFERENCES [dbo].[RevenueDivision] ([Revenue_Id])
GO
ALTER TABLE [dbo].[school_66]  WITH CHECK ADD FOREIGN KEY([Revenue_Id])
REFERENCES [dbo].[RevenueDivision_66] ([RevenueDivisionId])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Grade_Id])
REFERENCES [dbo].[Grade] ([Grade_Id])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([School_Id])
REFERENCES [dbo].[School] ([School_Id])
GO
ALTER TABLE [dbo].[Student_66]  WITH CHECK ADD FOREIGN KEY([Grade_Id])
REFERENCES [dbo].[Grade_66] ([Grade_Id])
GO
ALTER TABLE [dbo].[Student_66]  WITH CHECK ADD FOREIGN KEY([School_id])
REFERENCES [dbo].[school_66] ([School_Id])
GO
ALTER TABLE [dbo].[student_academic_history]  WITH CHECK ADD FOREIGN KEY([Grade_id])
REFERENCES [dbo].[Grade_66] ([Grade_Id])
GO
ALTER TABLE [dbo].[student_academic_history]  WITH CHECK ADD FOREIGN KEY([School_id])
REFERENCES [dbo].[school_66] ([School_Id])
GO
ALTER TABLE [dbo].[student_academic_history]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Student_66] ([student_id])
GO
ALTER TABLE [dbo].[student_school_66]  WITH CHECK ADD FOREIGN KEY([school_id])
REFERENCES [dbo].[school_66] ([School_Id])
GO
ALTER TABLE [dbo].[student_school_66]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Student_66] ([student_id])
GO
ALTER TABLE [dbo].[tblDistricts]  WITH CHECK ADD FOREIGN KEY([stateId])
REFERENCES [dbo].[tblstate] ([stateId])
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblCentreMaster] FOREIGN KEY([CentreCode])
REFERENCES [dbo].[tblCentreMaster] ([CentreCode])
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblCentreMaster]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblDesignations] FOREIGN KEY([DesignationCode])
REFERENCES [dbo].[tblDesignations] ([DesignationCode])
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblDesignations]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblLocations] FOREIGN KEY([LocationType], [LocationCode])
REFERENCES [dbo].[tblLocations] ([LocationType], [LocationCode])
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblLocations]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblServiceStatus] FOREIGN KEY([ServiceStatus])
REFERENCES [dbo].[tblServiceStatus] ([ServiceStatus])
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblServiceStatus]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblServiceTypes] FOREIGN KEY([ServiceType])
REFERENCES [dbo].[tblServiceTypes] ([ServiceType])
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblServiceTypes]
GO
ALTER TABLE [dbo].[tblmandal]  WITH CHECK ADD FOREIGN KEY([RevenueDivisionsId])
REFERENCES [dbo].[tblRevenueDivisions] ([RevenueDivisionsId])
GO
ALTER TABLE [dbo].[tblPayEmployeeparamDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblPayEmployeeparamDetails_tblPayEmployees] FOREIGN KEY([NoteNumber], [EmployeeNumber])
REFERENCES [dbo].[tblPayEmployees] ([NoteNumber], [EmployeeNumber])
GO
ALTER TABLE [dbo].[tblPayEmployeeparamDetails] CHECK CONSTRAINT [FK_tblPayEmployeeparamDetails_tblPayEmployees]
GO
ALTER TABLE [dbo].[tblPayEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblPayEmployees_tblCentreMaster] FOREIGN KEY([CentreCode])
REFERENCES [dbo].[tblCentreMaster] ([CentreCode])
GO
ALTER TABLE [dbo].[tblPayEmployees] CHECK CONSTRAINT [FK_tblPayEmployees_tblCentreMaster]
GO
ALTER TABLE [dbo].[tblPayEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblPayEmployees_tblDesignations] FOREIGN KEY([DesignationCode])
REFERENCES [dbo].[tblDesignations] ([DesignationCode])
GO
ALTER TABLE [dbo].[tblPayEmployees] CHECK CONSTRAINT [FK_tblPayEmployees_tblDesignations]
GO
ALTER TABLE [dbo].[tblPayEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblPayEmployees_tblLocations] FOREIGN KEY([LocationType], [LocationCode])
REFERENCES [dbo].[tblLocations] ([LocationType], [LocationCode])
GO
ALTER TABLE [dbo].[tblPayEmployees] CHECK CONSTRAINT [FK_tblPayEmployees_tblLocations]
GO
ALTER TABLE [dbo].[tblPayEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblPayEmployees_tblServiceStatus] FOREIGN KEY([ServiceStatus])
REFERENCES [dbo].[tblServiceStatus] ([ServiceStatus])
GO
ALTER TABLE [dbo].[tblPayEmployees] CHECK CONSTRAINT [FK_tblPayEmployees_tblServiceStatus]
GO
ALTER TABLE [dbo].[tblPayEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblPayEmployees_tblServiceTypes] FOREIGN KEY([Servicetype])
REFERENCES [dbo].[tblServiceTypes] ([ServiceType])
GO
ALTER TABLE [dbo].[tblPayEmployees] CHECK CONSTRAINT [FK_tblPayEmployees_tblServiceTypes]
GO
ALTER TABLE [dbo].[tblPayMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblPayMaster_tblCentreMaster] FOREIGN KEY([CentreCode])
REFERENCES [dbo].[tblCentreMaster] ([CentreCode])
GO
ALTER TABLE [dbo].[tblPayMaster] CHECK CONSTRAINT [FK_tblPayMaster_tblCentreMaster]
GO
ALTER TABLE [dbo].[tblPayMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblPayMaster_tblCentreMaster1] FOREIGN KEY([CentreCode])
REFERENCES [dbo].[tblCentreMaster] ([CentreCode])
GO
ALTER TABLE [dbo].[tblPayMaster] CHECK CONSTRAINT [FK_tblPayMaster_tblCentreMaster1]
GO
ALTER TABLE [dbo].[tblPayMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblPayMaster_tblLocations] FOREIGN KEY([LocationType], [LocatonCode])
REFERENCES [dbo].[tblLocations] ([LocationType], [LocationCode])
GO
ALTER TABLE [dbo].[tblPayMaster] CHECK CONSTRAINT [FK_tblPayMaster_tblLocations]
GO
ALTER TABLE [dbo].[tblPayMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblPayMaster_tblStateMaster] FOREIGN KEY([StateCode])
REFERENCES [dbo].[tblStateMaster] ([StateCode])
GO
ALTER TABLE [dbo].[tblPayMaster] CHECK CONSTRAINT [FK_tblPayMaster_tblStateMaster]
GO
ALTER TABLE [dbo].[tblRevenueDivisions]  WITH CHECK ADD FOREIGN KEY([districtId])
REFERENCES [dbo].[tblDistricts] ([districtId])
GO
ALTER TABLE [dbo].[tblstreet]  WITH CHECK ADD FOREIGN KEY([villageId])
REFERENCES [dbo].[tblvillage] ([villageId])
GO
ALTER TABLE [dbo].[tblvillage]  WITH CHECK ADD FOREIGN KEY([MandalId])
REFERENCES [dbo].[tblmandal] ([MandalId])
GO
ALTER TABLE [dbo].[t]  WITH CHECK ADD  CONSTRAINT [x] CHECK  (([x]=(1)))
GO
ALTER TABLE [dbo].[t] CHECK CONSTRAINT [x]
GO
ALTER TABLE [dbo].[tav1]  WITH NOCHECK ADD  CONSTRAINT [uk_tav] CHECK  (([userid]='0'))
GO
ALTER TABLE [dbo].[tav1] CHECK CONSTRAINT [uk_tav]
GO
ALTER TABLE [dbo].[tav1]  WITH NOCHECK ADD  CONSTRAINT [uk_tav1] CHECK  (([userid]='0'))
GO
ALTER TABLE [dbo].[tav1] CHECK CONSTRAINT [uk_tav1]
GO
ALTER TABLE [dbo].[tav1]  WITH NOCHECK ADD  CONSTRAINT [uk_tav2] CHECK  (([userid]=(0)))
GO
ALTER TABLE [dbo].[tav1] CHECK CONSTRAINT [uk_tav2]
GO
ALTER TABLE [dbo].[tav1]  WITH NOCHECK ADD  CONSTRAINT [uk_tav9] CHECK  (([userid]<>(0)))
GO
ALTER TABLE [dbo].[tav1] CHECK CONSTRAINT [uk_tav9]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH NOCHECK ADD  CONSTRAINT [C_Employees_Sex] CHECK  ((upper([Sex])='M' OR upper([Sex])='F'))
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [C_Employees_Sex]
GO
ALTER TABLE [dbo].[uc]  WITH CHECK ADD CHECK  (([id]>(0)))
GO
ALTER TABLE [dbo].[uc1]  WITH CHECK ADD CHECK  (([id]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee_2008]    Script Date: 3/25/2019 6:43:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE TABLE Employee_2008
--(
--        EmpID INT PRIMARY KEY NOT NULL IDENTITY,
--        EmpName VARCHAR(255) NOT NULL,
--        Title VARCHAR(255) NOT NULL,
--        HierarchicalLevel HIERARCHYID --Note the new data type here
--)
--GO
--Insert the Root node first in the table
--HIERARCHYID::GetRoot() is static method which returns the root node of a hierarchy
--INSERT INTO Employee_2008 (EmpName, Title, HierarchicalLevel)
--VALUES ('Akram', 'Chief Technology Officer', HIERARCHYID::GetRoot())
--GO
--Let's see the data in the table
--SELECT EmpID, EmpName, Title, HierarchicalLevel, HierarchicalLevel.ToString() AS [Position] 
--FROM Employee_2008
--GO
--Insert the first child node of the root node
--Get the root node we wish to insert a descendant of
--DECLARE @CTONode HIERARCHYID
--SELECT @CTONode = HIERARCHYID::GetRoot() FROM Employee_2008
--INSERT INTO Employee_2008 (EmpName, Title, HierarchicalLevel)
--VALUES ('Ranjit', 'DEV Manager', @CTONode.GetDescendant(NULL, NULL))
--GO

--Now let's insert the second child node of the root node
--Get the root node we wish to insert a descendant of
--DECLARE @CTONode HIERARCHYID
--SELECT @CTONode = HIERARCHYID::GetRoot() FROM Employee_2008
---- Determine the last child position
--DECLARE @LastChildPosition HIERARCHYID
--SELECT @LastChildPosition = MAX(HierarchicalLevel) FROM Employee_2008
--WHERE HierarchicalLevel.GetAncestor(1) = @CTONode
--INSERT INTO Employee_2008 (EmpName, Title, HierarchicalLevel)
--VALUES ('Adil', 'TEST Manager', @CTONode.GetDescendant(@LastChildPosition, NULL))
--GO

--Let's see the data in the table
--SELECT EmpID, EmpName, Title, HierarchicalLevel, HierarchicalLevel.ToString() AS [Position] FROM Employee_2008
--GO
CREATE
PROCEDURE [dbo].[AddEmployee_2008] 
(@ReportsToID INT, @EmpName VARCHAR(255), @Title VARCHAR(255))
AS
BEGIN
        -- Get the root node we wish to insert a descendant of
        DECLARE @ReportsToNode HIERARCHYID
        SELECT @ReportsToNode = HierarchicalLevel FROM Employee_2008
        WHERE EmpID = @ReportsToID
        -- Determine the last child position
        DECLARE @LastChildPosition HIERARCHYID
        SELECT @LastChildPosition = MAX(HierarchicalLevel) FROM Employee_2008
        WHERE HierarchicalLevel.GetAncestor(1) = @ReportsToNode

        INSERT INTO Employee_2008 (EmpName, Title, HierarchicalLevel)
        VALUES (@EmpName, @Title, @ReportsToNode.GetDescendant(@LastChildPosition, NULL))
END
GO
/****** Object:  StoredProcedure [dbo].[basic]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   procedure [dbo].[basic] 
 as
 begin 
 select sum(amount) from tblPayEmployeeparamDetails where paramcode = 'basic'
 end 
GO
/****** Object:  StoredProcedure [dbo].[bonus_calculation]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[bonus_calculation] 
as
begin 
select distinct EmployeeNumber,Name,PresentBasic,st.Description,
	(case when (PresentBasic>0 and PresentBasic<60000) and st.Description='checker' then PresentBasic*0.15
		 when st.Description='checker' and (PresentBasic>60001 and PresentBasic<100000) and ((PresentBasic*0.12)>9000 and (PresentBasic*0.12)<13800)  then PresentBasic*0.12
		 when st.Description='checker' and (PresentBasic>100001) and ((PresentBasic*0.08)>13800) then PresentBasic*0.08
		 when (st.Description='roller' or  st.Description='packer') and (PresentBasic>0) and ((PresentBasic*0.12)>0) then PresentBasic*0.12		 
		 else 0
		 end
	)BONUS
from 
tblEmployees e	inner join tblServiceTypes st on st.ServiceType=e.ServiceType 
end
GO
/****** Object:  StoredProcedure [dbo].[bonus_caluclation]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[bonus_caluclation]
	as
	begin
	select distinct employeenumber,name,presentbasic,tblServiceTypes.Description,dbo.fun_bonus(employeenumber)as bonus
	from tblEmployees
	join tblServiceTypes on tblServiceTypes.ServiceType=tblEmployees.ServiceType
	end

GO
/****** Object:  StoredProcedure [dbo].[bonuscal]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bonuscal] 
AS
SELECT employeeNumber,  Name, PresentBasic,tblemployees.ServiceType,description ,
case
 when description='checker' or Description='regular'
 then
   case
   when PresentBasic between 0 and 60000 and (PresentBasic*15)/100<=9000
   then (PresentBasic*15)/100
   when PresentBasic between 60000 and 100000 and (PresentBasic*12)/100 between 9000 and 13800
   then (PresentBasic*12)/100
   when PresentBasic > 100000 and (PresentBasic*8)/100<=13800
   then (PresentBasic*8)/100
   end
 when Description='rollers' or Description='packers'
 then 
  case when presentbasic>=0
   then (presentbasic*12)/100
   end
 when description <>'rollers'or description<>'packers'or description<>'checkers' or description<>'regular'
 then 0
 end as bonus
FROM tblEmployees join tblServiceTypes on(tblEmployees.ServiceType=tblServiceTypes.ServiceType)
GO
/****** Object:  StoredProcedure [dbo].[bonuscalc]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[bonuscalc] 
as
begin
select EmployeeNumber,Name,PresentBasic,
(case when (ST.Description='CHECKER' OR ST.Description='EMPLOYEE') 
	 then 
	 case when (PresentBasic*12)>0 AND (PresentBasic*12)<60000
		  then case when (PresentBasic*12*0.15)>9000
			         then 9000
		        else (PresentBasic*12*0.15)
				end
	 when (PresentBasic*12)>60000 AND (PresentBasic*12)<100000
		 then case when (PresentBasic*12*0.15)>13800
					then 13800
				   when (PresentBasic*12*0.15)<9000
					then 9000
			  else (PresentBasic*12*0.15)
			  end
	 when (PresentBasic*12)>100000
		  then case when (PresentBasic*12*0.08)<13800
		              then 13800
				else (PresentBasic*12*0.08)
				end
	end
	else (PresentBasic*12*0.12)
	end) as Bonus,
ST.Description from dbo.tblEmployees  as EMP
JOIN dbo.tblServiceTypes as ST on EMP.ServiceType=ST.ServiceType AND EMP.PresentBasic<>0.00;
end
 
GO
/****** Object:  StoredProcedure [dbo].[BonusCalculation]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[BonusCalculation]
@BasicPay numeric(12,2),
@ServiceType varchar(20), 
@Bonus numeric(12,2) out
as
begin



		if @ServiceType = 'CHECKER' or @ServiceType = 'EMPLOYEE' 
		begin
				if @BasicPay between 0 and 60000 
					set @Bonus = (15.0/100)*@BasicPay
				

				if @BasicPay between  60001 and 100000
					set @Bonus = (12.0/100)*@BasicPay
				

				if @BasicPay >100000
				begin 
					set @Bonus = (8.0/100)*@BasicPay
						if @Bonus < 13800
							set @Bonus = 13800
				end
		
		end

		if @ServiceType = 'PACKER' or @ServiceType = 'ROLLER'
			set @Bonus = (12.0/100)*@BasicPay
			
end
GO
/****** Object:  StoredProcedure [dbo].[BonusCalculator]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BonusCalculator]
	@ServiceType varchar(50),
	@PresentBasicYearly float,
	@Bonus float OUTPUT
AS
	IF @PresentBasicYearly<0
		SET @Bonus = 0
	ELSE
	BEGIN
	IF @ServiceType = 'CHECKER' or @ServiceType = 'EMPLOYEE'
	BEGIN
		IF @PresentBasicYearly >=0 and @PresentBasicYearly <=60000
		BEGIN
			SET @Bonus = (@PresentBasicYearly * 15)/100
		END
		ELSE IF @PresentBasicYearly >=60001 and @PresentBasicYearly <=100000
		BEGIN
			SET @Bonus = (@PresentBasicYearly * 12)/100
		END
		ELSE
		BEGIN
			SET @Bonus = (@PresentBasicYearly * 8)/100
		END
	END
	ELSE
	BEGIN
		SET @Bonus = (@PresentBasicYearly * 12)/100
	END
	END
GO
/****** Object:  StoredProcedure [dbo].[details]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[details] @tblname nvarchar(100)
As 
begin
	Declare @sql_string nvarchar(max)
	set @sql_string =N'select * from '+@tblname
	exec sp_executesql @sql_string 
end
GO
/****** Object:  StoredProcedure [dbo].[display]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[display]
@noOfRows int
AS
BEGIN
DECLARE @Total int;
SET @Total=(SELECT COUNT(*) FROM dbo.tblEmployees);
DECLARE @Page int;
SET @Page=0;
WHILE(@Total>((@Page)*(@noOfRows)))
BEGIN
	SELECT EmployeeNumber,Name,DOJ,DOB FROM dbo.tblEmployees ORDER BY EmployeeNumber OFFSET @Page*@noOfRows ROWS FETCH NEXT @noOfRows ROWS ONLY;
	SET @Page=@Page+1;
END
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayDetailsByPage]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayDetailsByPage]
@numberOfRows int
AS
BEGIN
DECLARE @TotalRows int;
SET @TotalRows=(SELECT COUNT(*) FROM dbo.tblEmployees);
DECLARE @Page int;
SET @Page=0;
WHILE(@TotalRows>((@Page)*(@numberOfRows)))
BEGIN
	SELECT EmployeeNumber,Name,DOJ,DOB FROM dbo.tblEmployees ORDER BY EmployeeNumber OFFSET @Page*@numberOfRows ROWS FETCH NEXT @numberOfRows ROWS ONLY;
	SET @Page=@Page+1;
END
END
GO
/****** Object:  StoredProcedure [dbo].[displayrows]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[displayrows]
@noOfRows int
as
begin
declare @Total int;
set @Total=(select COUNT(*) FROM dbo.tblEmployees);
declare @Page int;
set @Page=0;
while(@Total>((@Page)*(@noOfRows)))
begin
	select EmployeeNumber,Name,DOJ,DOB FROM dbo.tblEmployees order by EmployeeNumber OFFSET @Page*@noOfRows ROWS FETCH NEXT @noOfRows ROWS ONLY;
	set @Page=@Page+1;
end
end
GO
/****** Object:  StoredProcedure [dbo].[EmployeeHierarchy]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create a recursive stored procedure(SP) which will take EmpID as 
--an input, recursively traverse the hierarchy to find out all
--child nodes and sub-child nodes and store it in a temporary table
CREATE PROC [dbo].[EmployeeHierarchy](@EmpID INT)
AS
BEGIN
        DECLARE @LocalEmpID INT, @EmpName VARCHAR(30)
        INSERT ##Emp 
        SELECT EmpID, EmpName, (SELECT EmpName FROM Employees_2000_2005 WHERE EmpID = emp.ReportsTo) AS Manager FROM Employees_2000_2005 emp WHERE EmpID = @EmpID

        SET @LocalEmpID = (SELECT MIN(EmpID) FROM Employees_2000_2005 WHERE ReportsTo = @EmpID)

        WHILE @LocalEmpID IS NOT NULL
        BEGIN
                EXEC EmployeeHierarchy @LocalEmpID
                SET @LocalEmpID = (SELECT MIN(EmpID) FROM dbo.Employees_2000_2005 WHERE ReportsTo = @EmpID  AND EmpID > @LocalEmpID)
        END
END
GO
/****** Object:  StoredProcedure [dbo].[GetBonus]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBonus]	
	@ServiceType varchar(10),
	@PresentBasic numeric(12,2),
	@Bonus numeric(10,2) output
as
	if @ServiceType='Checker' or @ServiceType='Employee'
	begin
		if @PresentBasic Between 0 and 60000
			set @Bonus=15*@PresentBasic/100
		else if @PresentBasic Between 60001 and 100000
			set @Bonus=12*@PresentBasic/100
		else 
			if 8*@PresentBasic/100>13800
				set @Bonus=8*@PresentBasic/100
			else
				set @Bonus=13800
	end
	else if @ServiceType='Roller' or @ServiceType='Packer'
		set @Bonus=12*@PresentBasic/100
GO
/****** Object:  StoredProcedure [dbo].[one]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[one]
as
begin
	select employeenumber,name,presentbasic,tblServiceTypes.description,
	case when tblServiceTypes.Description='checker' or tblServiceTypes.Description='employee' 
		 then
			case when presentbasic between 0 and 6000 and (presentbasic*15)/100<=9000
				 then (presentbasic*15)/100 
				 when PresentBasic between 6000 and 10000 and (PresentBasic*12)/100 between 9000 and 13800 
				 then (PresentBasic*12)/100
				 when PresentBasic > 10000 and (PresentBasic*8)/100<=13800
				 then (PresentBasic*8)/100
			end 
		 when tblServiceTypes.Description='ROLLER' or tblServiceTypes.Description='PACKER' 
		 then
			case when presentbasic>=0
				 then (presentbasic*12)/100
			end
	end as bonus
	from tblEmployees
	join tblServiceTypes on tblServiceTypes.ServiceType=tblEmployees.ServiceType
end
GO
/****** Object:  StoredProcedure [dbo].[p]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[p] @n int
 as

DECLARE  emp_cursor CURSOR FOR     
SELECT *    
FROM [tblPayEmployees]
order by grosspay

  declare @i int
  set @i=1

  OPEN emp_cursor 
WHILE @@FETCH_STATUS = 0 and @i<5    
BEGIN    
     print 'SELECT * FROM [tblPayEmployees] 
    FETCH NEXT FROM emp_cursor  '	
    set @i=@i+1   	     
END 
CLOSE emp_cursor;    
DEALLOCATE emp_cursor;
GO
/****** Object:  StoredProcedure [dbo].[p1]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[p1] @n int
as select * from [tblPayEmployees] where employeenumber=@n
GO
/****** Object:  StoredProcedure [dbo].[p2]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[p2] as
select PresentBasic from tblEmployees order by presentBasic desc
GO
/****** Object:  StoredProcedure [dbo].[pagination]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pagination]
@PageNumber INT, 
@RowsPerPage INT
AS
SELECT  rank() over (order by EmployeeNumber) as [S.NO],NAME,EmployeeNumber,DOJ, DOB
FROM tblemployees where @RowsPerPage in (10,25, 50, 100)
ORDER BY EmployeeNumber
OFFSET (@PageNumber- 1)*@RowsPerPage+1 ROWS 
FETCH NEXT @RowsPerPage  ROWS ONLY
GO
/****** Object:  StoredProcedure [dbo].[pname]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   procedure [dbo].[pname] 
 as
 begin
 select * from tblPayEmployees
 exec basic
 end
GO
/****** Object:  StoredProcedure [dbo].[pp]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   procedure [dbo].[pp]
 as begin print 'hai'
 end
GO
/****** Object:  StoredProcedure [dbo].[Proc_BonusCalculation]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Proc_BonusCalculation]
as
select *,
case when Description='checker' or Description='employee' 
then 
   case when PresentBasic between 0 and 60000 
        then
	    case when (15*(0.01)*(PresentBasic)<9000)
        then 15*(0.01)*(PresentBasic)
		else
		 9000
		end
       when PresentBasic between 60000 and 100000 
	   then 
	   case when (12*(0.01)*(PresentBasic)between 9000 and 13800)
        then 12*(0.01)*(PresentBasic)
		when  (12*(0.01)*(PresentBasic)<9000)
		then 9000
		else
		 13800
		end
		else
		 case when(8*(0.01)*(PresentBasic)>13800)
         then 8*(0.01)*(PresentBasic)
		 else
		  13800
	end
end
when Description='roller' or Description='packer'
then 
  12*(0.01)*(PresentBasic) 
end as Bonus
from tblServiceTypes
join 
(select EmployeeNumber,Name,PresentBasic,servicetype from tblemployees) test
on tblServiceTypes.servicetype=test.servicetype
GO
/****** Object:  StoredProcedure [dbo].[procedure1]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procedure1] as
select presentbasic,row_number() over(order by presentbasic desc) as a from tblEmployees
procedure1
GO
/****** Object:  StoredProcedure [dbo].[psalaryCalculation]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[psalaryCalculation] as
select a.EmployeeNumber,a.Name,d.CentreName,Basic,VDA,Conveyance,HRA,PF,e.Deductions,e.NetPay/*,CentreName,BASIC,VDA,HRA,Conveyance,GrossPay,PF,Deductions,NetPay*/
from
(select EmployeeNumber,Name,PresentBasic as Basic from tblEmployees) as a
join
(select EmployeeNumber,Name,(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) as VDA from tblEmployees) as b
on a.EmployeeNumber=b.EmployeeNumber
join
(select EmployeeNumber,(case when 0.04*PresentBasic>800 then 800 else 0.04*PresentBasic end) as Conveyance from tblEmployees)as c
on b.employeeNUmber=c.EmployeeNumber
join
(select tblEmployees.EmployeeNumber,ParamCode,CentreName,(case when CentreName='HYDERABAD' then (0.4*c1.Amount1)+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end)
when CentreName='Nizamabad' then 0.25*c1.Amount1+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) 
else 0.15*c1.Amount1+(case when 200+(0.06*PresentBasic)>10000 then 10000 else 200+(0.06*PresentBasic) end) end)
as HRA from tblEmployees
join tblCentreMaster as b1 on tblEmployees.CentreCode=b1.CentreCode join (select EmployeeNumber,ParamCode,sum(case when ParamCode='HRA' then Amount else 0 end) 
as Amount1 from tblPayEmployeeparamDetails
where ParamCode='HRA' group by EmployeeNumber,ParamCode) as c1 on tblEmployees.Employeenumber=c1.EmployeeNumber)as d
on c.EmployeeNumber=d.EmployeeNumber
join
(select a4.EmployeeNumber,Age,(case when (b3.Deductions*0.1)<=(0.1*PresentBasic) and (b3.Deductions*0.1)<=6500 then b3.Deductions*0.1 else 6500 end) as PF,b3.Deductions,b3.NetPay
from tblEmployees as a4 join tblPayEmployees as b3 on a4.EmployeeNumber=b3.EmployeeNumber) as e on b.EmployeeNumber=e.EmployeeNumber
GO
/****** Object:  StoredProcedure [dbo].[salarycal]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[salarycal]
as
select distinct tblemployees.EmployeeNumber,presentbasic,loccodename,vda. vda, 
case
when LocCodeName='hyderabad'
then (40*PresentBasic)+vda
when LocCodeName='Nizamabad'
then (25*presentbasic)+vda
when LocCodeName<>'hyderabad' or LocCodeName<>'nizamabad'
then 15*PresentBasic 
end as hra,
case
when (4*PresentBasic)/100<=800
then 4*presentbasic/100 
end as conveyance from tblemployees join tblLocations on(tblLocations.LocationType=tblEmployees.LocationType) join (select employeenumber,case
when 200+((presentbasic*6)/100)<=10000
then 200+((presentbasic*6)/100) 
end as vda from tblEmployees) vda on (tblEmployees.EmployeeNumber=vda.EmployeeNumber)
GO
/****** Object:  StoredProcedure [dbo].[salaryCalculation]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[salaryCalculation] @Code varchar(50) as
select EmployeeNumber,Name,PresentBasic from tblEmployees where @Code='Basic'
union all
select c.EmployeeNumber,Name,200+0.06*PresentBasic from tblEmployees as c 
where 200+(0.06*PresentBasic)<=10000 and @Code='VDA'
GO
/****** Object:  StoredProcedure [dbo].[SalaryCalculator]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SalaryCalculator]
	@Basic float,
	@CentreCode int,
	@Age int,
	@VDA float output,	
	@HRA float output,
	@Conveyence float output,
	@PF float output
AS
	SET @VDA = 200 + @Basic * 6 /100
	IF @VDA > 10000
		SET @VDA = 10000

	IF @CentreCode = 12
		SET @HRA = @Basic*40/100 + @VDA
	ELSE IF @CentreCode = 13
		SET @HRA = @Basic*25/100 + @VDA
	ELSE 
		SET @HRA = @Basic*15/100

	SET @Conveyence = @Basic*4/100
	IF @Conveyence > 800
		SET @Conveyence = 800

	IF @Age < 59
		SET @PF = @Basic*10/100
	IF @PF > 6500
		SET @PF = 6500
GO
/****** Object:  StoredProcedure [dbo].[six_two]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Display employeeNumber, Employee Name, Place (centre Name), BASIC, VDA, HRA, Conveyance, Gross Pay, PF,
--Deductions and Net Pay
 

create   procedure [dbo].[six_two] 
as
begin
 select e.EmployeeNumber,e.Name,cm.CentreName,e.PresentBasic BASIC,
 --vda =200+6% of basic when max vda less than 10000
 (case when pepd.ParamCode='VDA' and amount<=10000 then (200+0.06*e.presentbasic) else amount end) VDA,

 --40% of HRA + VDA for Employee working at Hyderabad
 --25% of HRA + VDA for Employee working at Nizamabad
 --15% for employees working in other locations
 (case when l.locCodeName='Hyderabad' then 
							(0.4*(case when pepd.paramcode='hra' then amount else 0 end)+
							 (case when pepd.paramcode='vda' then amount else 0 end)) 
       when l.locCodeName='Nizamabad' then 
							(0.25*(case when pepd.paramcode='hra' then amount else 0 end)+
							 (case when pepd.paramcode='vda' then amount else 0 end)) 
	   else (0.15*(case when pepd.paramcode='hra' then amount else 0 end)+
							 (case when pepd.paramcode='vda' then amount else 0 end))  
	   end )HRA,
--4% of basic with max up to 800pm
	(case when pepd.paramcode='basic' and pepd.amount<=3200 then amount*0.04 else 0 end) Conveyance,
--For all employees Confirmed employees whose age is below 58 Years are eligible
--for a deduction of 10% as PF from their salary.
--It would be 10% of Basic. maximum of 6500% can be deducted for PF
   (case when datediff(year,e.DOB,getdate())<58 and e.presentbasic<65000 then 0.1*presentbasic else 0 end)PF,
   pe.grosspay,pe.deductions,pe.netpay


 from [dbo].[tblLocations] l 
 inner join tblEmployees e on e.LocationCode=l.locationCode
 inner join tblPayEmployeeparamDetails pepd on e.employeenumber=pepd.EmployeeNumber
 inner join tblCentreMaster cm on cm.centrecode=e.centrecode
 inner join tblpayemployees pe on pe.employeenumber=e.employeenumber
 where l.loccodename='Hyderabad'

 end


 exec six_two


GO
/****** Object:  StoredProcedure [dbo].[Sp_PayDetails]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Sp_PayDetails]  
@Month Int, @Year Int,@ServiceStatus Varchar(100),@ServiceType Varchar(100),@CentreCode varchar(300),
@EmpGrouping Varchar(20)
as  
Set NoCount On 
/*
Select 'Select *  From ' + Name From Sys.SysObjects where Xtype='U'


Select *  From tblEmployeeTypes
Select *  From tblStateMaster
Select *  From tblServiceStatus
Select *  From tblServiceTypes
Select *  From tblDesignations
Select *  From tblCentreMaster
Select *  From tblLocations
Select *  From tblPayMaster
Select *  From tblPayEmployees where 1=2
Select *  From tblPayEmployeeparamDetails
Select *  From tblEmployees



*/




SELECT 
 *,

case when @EmpGrouping Like 'No%' Then 
 Row_Number() Over (partition by CentreCode,ServiceType,ServiceStatus  Order by EmployeeNumber) 
else  
	Row_Number() Over (partition by CentreCode,ServiceStatus  Order by EmployeeNumber)   
end  ServiceStatusSno  


FROM 
(
	Select A.CentreCode,     
	B.ServiceType ,B.ServiceStatus ,B.DesignationCode ,B.EmployeeNumber,
	C.ParamCode , C.Amount * TransValue amount
	From tblPayMaster A
	Inner Join tblPayEmployees B  On A.NoteNumber = B.NoteNumber 
	inner Join tblPayEmployeeParamDetails  C On A.NoteNumber = C.NoteNumber and B.EmployeeNumber =  C.EmployeeNumber 
	where Cast(Month(ToDate) as int) =@Month  and Cast(year(ToDate) as int) =@Year
	and  ',' +  @ServiceType + ',' Like '%,' + Cast(B.ServiceType as varchar ) + ',%'
	and  ',' +  @ServiceStatus + ',' Like '%,' + Cast(B.ServiceStatus  as varchar ) + ',%'
	and  ',' +  @CentreCode + ',' Like '%,' + Cast(A.CentreCode  as varchar )+ ',%'
	and a.paramCode=''
) p

PIVOT
(
Sum(Amount)
FOR ParamCode IN ( [BASIC],[DA],[VDA],[HRA],[CNV],[BONUS],[LWW],[NFH],
[DBHATA], [ADMNAL],[THRA],[SDA],[DEPALW],[TRA], [PF],[ESI],[ATLD],[LOANPY]
)
) AS pvt





-- Sp_PayDetails  1, 2007,'2,4,5','1,3,4','1,2,3,4,5','No'
GO
/****** Object:  StoredProcedure [dbo].[sp_SalariedEmployees]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SalariedEmployees]
	@var1 int,
	@var2 int
	AS
	BEGIN
		SELECT Name, PresentBasic FROM tblEmployees ORDER BY PresentBasic DESC
		OFFSET @var1 ROWS
		FETCH NEXT @var2 - @var1 - 1 ROWS ONLY
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_Top_N_SalariedEmployees]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_Top_N_SalariedEmployees]
	@var int
	AS
	BEGIN
		SELECT Name, PresentBasic FROM tblEmployees ORDER BY PresentBasic DESC
		OFFSET 0 ROWS
		FETCH NEXT @var ROWS ONLY
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_Top_Nth_SalariedEmployee]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Top_Nth_SalariedEmployee]
	@var int
	AS
	BEGIN
		SELECT Name, PresentBasic FROM tblEmployees ORDER BY PresentBasic DESC
		OFFSET @var-1 ROWS
		FETCH FIRST 1 ROW ONLY
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_Top_Nth_SalariedEmployees]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_Top_Nth_SalariedEmployees]
	@var int
	AS
	BEGIN
		SELECT * FROM
		(SELECT Name, PresentBasic, ROW_NUMBER() OVER(ORDER BY PresentBasic desc) AS RowNumber
		FROM tblEmployees) AS derived
		WHERE RowNumber = @var
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_TopSalariedEmployees]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TopSalariedEmployees]
	@var int
	AS
	BEGIN
		SELECT * FROM
		(SELECT Name, PresentBasic, ROW_NUMBER() OVER(ORDER BY PresentBasic desc) AS RowNumber
		FROM tblEmployees) AS derived
		WHERE RowNumber <= @var
	END
GO
/****** Object:  StoredProcedure [dbo].[spbonus]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spbonus] 
as
begin
select EmployeeNumber,Name,PresentBasic,
(case when (ST.Description='CHECKER' OR ST.Description='EMPLOYEE') 
	 then 
	 case when (PresentBasic*12)>0 AND (PresentBasic*12)<60000
		  then case when (PresentBasic*12*0.15)>9000
			         then 9000
		        else (PresentBasic*12*0.15)
				end
	 when (PresentBasic*12)>60000 AND (PresentBasic*12)<100000
		 then case when (PresentBasic*12*0.15)>13800
					then 13800
				   when (PresentBasic*12*0.15)<9000
					then 9000
			  else (PresentBasic*12*0.15)
			  end
	 when (PresentBasic*12)>100000
		  then case when (PresentBasic*12*0.08)<13800
		              then 13800
				else (PresentBasic*12*0.08)
				end
	end
	else (PresentBasic*12*0.12)
	end) as Bonus,
ST.Description from dbo.tblEmployees  as EMP
JOIN dbo.tblServiceTypes as ST on EMP.ServiceType=ST.ServiceType AND EMP.PresentBasic<>0.00;
end
 
GO
/****** Object:  StoredProcedure [dbo].[spBonusCal]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBonusCal]  
AS  
BEGIN 
	
		Select EmployeeNumber, Name, PresentBasic, t2.Description, 'Bonus' = 
			Case 
				when (PresentBasic between 0 and 60000) AND t2.Description IN ('CHECKER', 'EMPLOYEE') THEN PresentBasic*0.15 
				when (PresentBasic between 60001 and 100000) AND t2.Description IN ('CHECKER', 'EMPLOYEE') THEN PresentBasic*0.12
				when PresentBasic >= 100001 AND t2.Description IN ('CHECKER', 'EMPLOYEE') THEN PresentBasic*0.08
				when PresentBasic >= 0 AND t2.Description IN ('ROLLER', 'PACKER') THEN PresentBasic*0.12
			END
		from tblEmployees t1
		join
		[dbo].[tblServiceTypes] t2 on t1.ServiceType = t2.ServiceType
END 
GO
/****** Object:  StoredProcedure [dbo].[spsalary]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsalary]
AS
BEGIN
SELECT cal2.EMployeeNumber,cal2.CentreName,cal2.PresentBasic,cal2.VDA,cal2.HRA,cal2.Conveyance,(cal2.PresentBasic+cal2.VDA+cal2.HRA+cal2.Conveyance) AS GrossPay,
cal2.PF,(cal2.PresentBasic+cal2.VDA+cal2.HRA+cal2.Conveyance)-cal2.PF AS Netpay
FROM(
SELECT cal.EMployeeNumber,cal.CentreName,PresentBasic,cal.VDA,
	(CASE WHEN cal.CentreCode=12
				THEN (PresentBasic*0.4)+cal.VDA
		  WHEN cal.CentreCode=22
				THEN (PresentBasic*0.25)+cal.VDA
		  ELSE ((PresentBasic*0.15)+cal.VDA)
	END) AS HRA,
	cal.Conveyance,cal.PF 
	FROM(
	SELECT EmployeeNumber,CM.CentreCode,CM.CentreName,PresentBasic,
			(CASE WHEN ((PresentBasic*0.06)+200)>10000
					   THEN 10000
				   ELSE ((PresentBasic*0.06)+200) END) AS VDA,
			 (CASE WHEN (PresentBasic*0.04)>800
					   THEN 800
				   ELSE (PresentBasic*0.04) END) AS Conveyance,
			 (CASE WHEN (DATEDIFF(YEAR,DOB,GETDATE())<58 AND ServiceStatus=4) 
					   THEN CASE WHEN (PresentBasic*0.1)>6500
									  THEN 6500
								 ELSE (PresentBasic*0.1)
							END
				   ELSE 0
			 END) AS PF 
		FROM dbo.tblEmployees AS EMP JOIN 
        dbo.tblCentreMaster AS CM ON CM.CentreCode=EMP.CentreCode AND PresentBasic<>0.00) AS cal) AS cal2
END
GO
/****** Object:  StoredProcedure [dbo].[ss]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   procedure [dbo].[ss] @id int
 as 
 begin 
 select presentbasic from tblEmployees where employeenumber=@id
 end
GO
/****** Object:  StoredProcedure [dbo].[TblP]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TblP] as
select * from dbo.SalaryCalc(49)
TblP
GO
/****** Object:  StoredProcedure [dbo].[TestProc]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE VIEW TestView
--AS
--SELECT ID,
--		Val
--FROM dbo.Temp1

--SELECT * FROM Temp1
--SELECT * FROM TestView

--INSERT INTO Temp1
--SELECT 500

--SELECT * FROM Temp1
--SELECT * FROM TestView

CREATE PROCEDURE [dbo].[TestProc]
AS
SELECT * FROM Temp1
GO
/****** Object:  StoredProcedure [dbo].[udp_BonusCalculation2218]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[udp_BonusCalculation2218] 
AS
BEGIN
SELECT EmployeeNumber,Name,PresentBasic,
(CASE WHEN (EMP.ServiceType=1 OR EMP.ServiceType=4) 
	 THEN 
	 CASE WHEN (PresentBasic*12)>0 AND (PresentBasic*12)<60000
		  THEN CASE WHEN (PresentBasic*12*0.15)>9000
			         THEN 9000
		        ELSE (PresentBasic*12*0.15)
				END
	 WHEN (PresentBasic*12)>60000 AND (PresentBasic*12)<100000
		 THEN CASE WHEN (PresentBasic*12*0.15)>13800
					THEN 13800
				   WHEN (PresentBasic*12*0.15)<9000
					THEN 9000
			  ELSE (PresentBasic*12*0.15)
			  END
	 WHEN (PresentBasic*12)>100000
		  THEN CASE WHEN (PresentBasic*12*0.08)<13800
		              THEN 13800
				ELSE (PresentBasic*12*0.08)
				END
	END
	ELSE (PresentBasic*12*0.12)
	END) AS Bonus,
ST.Description FROM dbo.tblEmployees  AS EMP
JOIN dbo.tblServiceTypes AS ST ON EMP.ServiceType=ST.ServiceType AND EMP.PresentBasic<>0.00;
END
GO
/****** Object:  StoredProcedure [dbo].[udp_SalaryCaluculation2218]    Script Date: 3/25/2019 6:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[udp_SalaryCaluculation2218]
AS
BEGIN
SELECT CALCI2.EMployeeNumber,CALCI2.CentreName,CALCI2.PresentBasic,CALCI2.VDA,CALCI2.HRA,CALCI2.Conveyance,
(CALCI2.PresentBasic+CALCI2.VDA+CALCI2.HRA+CALCI2.Conveyance) AS GrossPay,
CALCI2.PF,(CALCI2.PresentBasic+CALCI2.VDA+CALCI2.HRA+CALCI2.Conveyance)-CALCI2.PF AS Netpay FROM(
SELECT CALCI1.EMployeeNumber,CALCI1.CentreName,PresentBasic,CALCI1.VDA,
	(CASE WHEN CALCI1.CentreCode=12
				THEN (PresentBasic*0.4)+CALCI1.VDA
		  WHEN CALCI1.CentreCode=22
				THEN (PresentBasic*0.25)+CALCI1.VDA
		  ELSE ((PresentBasic*0.15)+CALCI1.VDA)
	END) AS HRA,
	CALCI1.Conveyance,CALCI1.PF FROM
		(SELECT EmployeeNumber,CM.CentreCode,CM.CentreName,PresentBasic,
			(CASE WHEN ((PresentBasic*0.06)+200)>10000
					   THEN 10000
				   ELSE ((PresentBasic*0.06)+200) END) AS VDA,
			 (CASE WHEN (PresentBasic*0.04)>800
					   THEN 800
				   ELSE (PresentBasic*0.04) END) AS Conveyance,
			 (CASE WHEN (DATEDIFF(YEAR,DOB,GETDATE())<58 AND ServiceStatus=4) 
					   THEN CASE WHEN (PresentBasic*0.1)>6500
									  THEN 6500
								 ELSE (PresentBasic*0.1)
							END
				   ELSE 0
			 END) AS PF 
		FROM dbo.tblEmployees AS EMP JOIN 
dbo.tblCentreMaster AS CM ON CM.CentreCode=EMP.CentreCode AND PresentBasic<>0.00) AS CALCI1) AS CALCI2
END
GO
USE [master]
GO
ALTER DATABASE [Training_EmpSample] SET  READ_WRITE 
GO
