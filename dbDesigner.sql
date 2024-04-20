create database Course_DBdesigner

use Course_DBdesigner

create table Countries(
    [Id] int primary key identity(1,1),
    [Name] NVARCHAR(255)
)

create table Cities(
    [Id] int primary key identity(1,1),
    [Name] NVARCHAR(255),
    [CountryId] int,
    foreign key (CountryId) references Cities(Id)
)





