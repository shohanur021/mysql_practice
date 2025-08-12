create database testdb2;

create table Teacher(
    TeacherID int auto_increment primary key,
    Token varchar(50) not null unique
);
insert into Teacher (Token) values ("AK120");
insert into Teacher (Token) values ("Ak121");
select * from Teacher;



create table Customers(
    CustomerID int auto_increment primary key,
    CustomerName varchar(50),
    ContactName varchar(50),
    Address varchar(50),
    City varchar(30),
    PostalCode varchar(20),
    Country tinytext
) auto_increment = 101;

insert into Customers (CustomerName, ContactName, Address, City, PostalCode, Country) values 
("Alfreds Futterkiste", "Maria Anders", "Obere Str. 57", "Berlin", "12209", "Germany"),
("Ana Trujillo Emparedados y helados", "Ana Trujillo", "Avda. de la Constitución 2222", "México D.F.", "05021", "Mexico"),
("Antonio Moreno Taquería", "Antonio Moreno", "Mataderos 2312", "México D.F.", "05023", "Mexico"),
("Around the Horn", "Thomas Hardy", "120 Hanover Sq.", "London", "WA1 1DP", "UK"),
("Berglunds snabbköp", "Christina Berglund", "Berguvsvägen 8", "Luleå", "S-958 22", "Sweden");

select * from Customers;

select * from Customers where CustomerID > 102 and CustomerID < 105;




create table Students(
    id int auto_increment primary key,
    name varchar(50),
    country tinytext,
    marks int
) auto_increment=1001;

insert into Students (name, country, marks) values 
("Rani", "Japan", 540),
("Puja", "Malta", 420),
("Manik", "Zambia", 480),
("Papia", "Bangladesh", 220),
("Ritu", "Japan", 435),
("Shitol", "Australia", 512),
("Rahul", "UK", 330),
("Rani", "Australia", 470),
("Nehal", "UK", 501),
("Kriti", "Japan", 565),
("Nupur", "Australia", 396);

select * from Students;
select * from Students order by country asc;
select * from Students order by country desc;
select * from Students order by country asc, marks desc;
select * from Students where marks>400 order by country asc, marks asc;
select id, name from Students where country="Japan";
select country, sum(marks) from Students group by country;
select country, sum(marks) as total_mark from Students group by country;
select country, count(country) from Students group by country;
select country, max(marks) from Students group by country;
select country, min(marks) from Students group by country;
select country, avg(marks) from Students group by country;

SELECT country, CAST(AVG(marks) AS UNSIGNED) as average_mark
FROM Students
GROUP BY country;

select country, sum(marks) as total_mark, count(id) as total_student from Students group by country;

select country, sum(marks) from Students group by country having sum(marks)>500;
select country, sum(marks) as total_mark from Students group by country having total_mark>500;

select country, avg(marks) as average_mark
from Students
where marks!=0
group by country
having average_mark>450;


select distinct country from Students;
select distinct country from Students where marks>450;
select count(*) from (select distinct country from Students) as temp;


select * from Students limit 4;
select id, name, marks from Students limit 4;

select * from Students order by marks desc limit 3;