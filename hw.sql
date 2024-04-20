create database Course2

use Course2

create table Students(
    [Id] int primary key identity(1,1),
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Age] int,
    [Email] NVARCHAR(100) unique,
    [Address] NVARCHAR(150)
    )

drop table StudentArchives

create table StudentArchives(
    [Id] int,
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Age] int,
    [Email] NVARCHAR(100) unique,
    [Address] NVARCHAR(150)
    
)

alter table StudentArchives
add [Operation] NVARCHAR(20),
[Date] DATETIME


create trigger trg_writeLogAfterDelete on Students
after delete
as
begin
    declare @name NVARCHAR(50) = (select [Name] from deleted)
    declare @surname NVARCHAR(50)  = (select [Surname] from deleted)
    declare @age NVARCHAR(50)  = (select [Age] from deleted)
    declare @email NVARCHAR(50)  = (select [Email] from deleted)
    declare @address NVARCHAR(50)  = (select [Address] from deleted)
    INSERT into StudentArchives ([Id], [Name], [Surname], [Age], [Email], [Address], [Operation], [Date])
    VALUES (@id, @name, @surname, @age, @email, @address, 'delete', GetDate())
    END

    select * from Students

    select * from StudentArchives

 delete Students where [Id] = 5

