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

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    sales INT,
    PRIMARY KEY (order_id)
);
INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    (1001, 1, '2021-01-11', 35),
    (1002, 2, '2021-04-05', 15),
    (1003, 3, '2021-06-18', 20),
    (1004, 6, '2021-08-31', 10);


select * from customers; 
select * from orders;


-- Inner join
select * from customers inner join orders on id=customer_id;
select c.id, c.first_name, o.order_id, o.sales from customers as c inner join orders as o on c.id = o.customer_id;


-- Left join
select c.id, c.first_name, o.order_id, o.sales from customers as c left join orders as o on c.id = o.customer_id;


-- Right join
select c.id, c.first_name, o.order_id, o.sales from customers as c right join orders as o on c.id = o.customer_id;


-- Full join. Though mysql does not support 'full join' command. So We can do the same using the following commands
select c.id, c.first_name, o.order_id, o.sales from customers as c left join orders as o on c.id = o.customer_id
union
select c.id, c.first_name, o.order_id, o.sales from customers as c right join orders as o on c.id = o.customer_id;


-- Left anti join
select c.id, c.first_name, o.order_id, o.sales from customers as c left join orders as o on c.id = o.customer_id where o.order_id is null;


-- Right anti join
select c.id, c.first_name, o.order_id, o.sales from customers as c right join orders as o on c.id = o.customer_id where c.id is null;


-- Cross join
select * from customers cross join orders;


