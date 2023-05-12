create database bai_1;

create table class(
idclass int primary key,
nameclass varchar(20));

select * from class;

create table teachers(
idteacher int primary key,
nameteacher varchar(20),
ageteacher int,
countryteacher varchar(20));

select * from teachers;
 