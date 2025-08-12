use mydatabase;

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

-- Retrive all customers who are from Germany
select * from customers where country='Germany';

-- Retrive all customers who are not from Germany
select * from customers where country!='Germany';

-- Retrive all customers with a score grater than 500
select * from customers where score>500;

-- Retrive all customers with a score grater than or equal 500 
select * from customers where score>=500;

-- Retrive all customers with a score less than 500
select * from customers where score<500;

-- Retrive all customers with a score less than or equal 500
select * from customers where score<=500;

-- Retrive all customers who are not from USA and have a score grater than 500
select * from customers where country='USA' and score>500;

-- Retrive all customers who are not from USA or have a score grater than 500
select * from customers where country='USA' or score>500;

-- Retrive all customers who are not from Germany (using not operator)
select * from customers where not country='Germany';

-- Retrive all customers with a score grater than 500 (using not operator)
select * from customers where not score<=500;

-- Retrive all customers whose score falls in the range between 100 to 500
select * from customers where score between 100 and 500;

-- Retrive all customers from either Germany or USA
Select * from customers where country in ('Germany', 'USA');
select * from customers where country='Germany' or country='USA';

-- Retrieve all customers from any country except the USA.
select * from customers where country not in ('USA');
select * from customers where country!='USA';

-- Finding all customers whose first_name start with'M'
select * from customers where first_name like 'Ma%';

-- Finding all customers whose first_name end with 'n'
select * from customers where first_name like '%n';

-- Finding all customers whose first_name contains 'r'
select * from customers where first_name like '%r%';

-- Finding all customers whose first_name contains 'r' or 'i'
select * from customers where first_name like '%r%' or '%i%';

-- Finding all customers whose first_name has 'r' in the 3rd position
select * from customers where first_name like '__r%';