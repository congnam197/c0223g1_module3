create database quan_ly_user;
use quan_ly_user;
create table users(
id int(3) not null  primary key auto_increment,
`name` varchar(120) not null,
email varchar(120) not null,
country varchar(120)
);

insert into users(name, email, country)
 values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country)
 values('Kante','kante@che.uk','Kenia');
 insert into users(name, email,country)
 values ('Cong Nam', 'namff@gmail.com','Viet Nam');
 insert into users (name, email, country)
 values('Lisa', 'lisa@hqbl.kp','Korea');