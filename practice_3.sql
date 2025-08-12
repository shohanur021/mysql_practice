drop database if exists MyDatabase;
create database MyDatabase;
use MyDatabase;

-- Custom value set (It will not stored in database)
select id, first_name, "happy" as comment from customers;


-- create a table called Persons. with columns: id, person_name, birth_date, phone.
drop table if exists Persons;
create table Persons(
    id int not null,
    person_name varchar(50) not null,
    birth_date date,
    phone varchar(15) not null,
    constraint pk_person primary key(id)
)

-- Add a column named 'email' in the Persons table.
alter table Persons add email varchar(50) not null;

select * from Persons;

-- Remove the column named 'phone' from the Persons table.
alter table Persons drop column phone;


drop table if exists customers;
CREATE TABLE customers (
    id INT NOT NULL,
    first_name VARCHAR(50),
    country VARCHAR(50),
    score INT,
    PRIMARY KEY (id)
);
INSERT INTO customers (id, first_name, country, score) VALUES
    (1, 'Maria', 'Germany', 350),
    (2, ' John', 'USA', 900),
    (3, 'Georg', 'UK', 750),
    (4, 'Martin', 'Germany', 500),
    (5, 'Peter', 'USA', 0);


select * from customers;

insert into customers (id, first_name) values 
(8, "Manik"),
(9, "Raju");

-- Change the score of row(6th) to 0
update customers set score=0 where id=6;

-- Change the country & score of row(7th) to 'UK' & 0
update customers set country='UK', score=0 where id=7;

-- Change all the null values of the score to 0
update customers set score=0 where score is null;


-- Delete all customers whose ID is greater than 7
delete from customers where id>7;

-- Delete all data from the table
truncate table customers;

