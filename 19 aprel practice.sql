use  Company

Select *
from Employees

create table Employers
(
    [Id] int primary key identity(1,1),
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Email] NVARCHAR(100) unique,
    [Age] int,

)

insert into Employers
    ([Name], [Surname], [Email], [Age])
values
    ('Nisa', 'Narimanova', 'nnarimanova@gmail.com', 26),
    ('Matanat', 'Aliyeva', 'matanat@gmail.com', 22)

select *
from Employers


    select [Name]
    from Employees
UNION
    select [Name]
    from Employers


    select [Name]
    from Employees
union all
    select [Name]
    from Employers


    select [Name]
    from Employees
INTERSECT
    select [Name]
    from Employers

    select [Name] from Employees
EXCEPT
    select [Name]  from Employers

    select [Name] from Employers
    EXCEPT
    select [Name] from Employees



    create table Doctors(
         [Id] int primary key identity(1,1),
        [Name] NVARCHAR(50),
        [Address] NVARCHAR(100)
    )

    delete from Doctors


 truncate table Doctors

 select * from Employees


select Count(*) as 'Count', Age
From Employees
Group By Age

select * from Employees

select Count(*) as 'Count', Age
From Employees
Group By Age
Order BY Age Desc


declare @counter int
set @counter = 1
while(@counter <= 10)
BEGIN
print 'the counter value is = ' + CONVERT(NVARCHAR, @counter)
set @counter = @counter + 1 
end


select GETDATE() as 'Time' 


create table StudentLogs(
    [Id] int primary key identity(1,1),
    [StudentId] int,
    [Operation] NVARCHAR(20),
    [Date] DATETIME
)

drop table StudentLogs

create table EmployeeLog(
    [Id] int primary key identity(1,1),
    [StudentId] int,
    [Operation] NVARCHAR(20),
    [Date] DATETIME 
)

select * from EmployeeLog

create trigger trg_writeLogAfterCreate on Employees
after insert
AS
begin
insert into EmployeeLog([StudentId], [Operation], [Date])
select [Id], 'Insert', GetDate() from inserted
end

insert into Employees([Name], [Age], [Email], [CityId])
values ('Omer Elesgerli',16, 'omer@gmail.com', 1 )


select * from Employees
select * from EmployeeLog


create trigger trg_writeLogAfterEdit on Employees
after update
as 
BEGIN
    insert into EmployeeLog([StudentId], [Operation], [Date])
    select [Id], 'Update', GetDate() from deleted
END

select * from Employees

update Employees
set [Email] = 'test@gmail.com'
where [Id] = 2

select * from Employees
select * from EmployeeLog


create table UpdatedEmployeeLog(
    [EmployeeName] NVARCHAR(50),
    [OldEmail] NVARCHAR(100),
    [NewEmail] NVARCHAR (100)
  
    )

alter table UpdatedEmployeeLog
add  [Operation] NVARCHAR(20),
    [Date] DATETIME


    create trigger trg_writeLogAfterUpdate
    on Employees
    after Update
    AS
    BEGIN
    declare @oldEmail NVARCHAR(50) = (select [Email] from deleted)
    declare @name NVARCHAR(50) = (select [Name] from deleted)
    declare @newEmail NVARCHAR(50) = (select [Email] from inserted)
    insert into UpdatedEmployeeLog([EmployeeName], [OldEmail], [NewEmail], [Operation], [Date])
    values (@name, @oldEmail, @newEmail, 'Update', GETDATE())
    END

    




