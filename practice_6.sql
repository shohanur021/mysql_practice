drop table if exists customers;
CREATE TABLE customers (
  customerid INT NOT NULL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  country VARCHAR(50),
  score INT
);

INSERT INTO customers (customerid,firstname,lastname,country,score) VALUES
  (1, 'Jossef', 'Goldberg', 'Germany', 350),
  (2, 'Kevin', 'Brown', 'USA', 900),
  (3, 'Mary', NULL, 'USA', 750),
  (4, 'Mark', 'Schwarz', 'Germany', 500),
  (5, 'Anna', 'Adams', 'USA', NULL);

select * from customers;

CREATE TABLE employees (
  employeeid INT NOT NULL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  department VARCHAR(50),
  birthdate DATE,
  gender CHAR(1),
  salary INT,
  managerid INT,
  INDEX (managerid),
  CONSTRAINT fk_employees_manager
    FOREIGN KEY (managerid)
    REFERENCES employees (employeeid)
    ON DELETE SET NULL
);

INSERT INTO employees (employeeid,firstname,lastname,department,birthdate,gender,salary,managerid) VALUES
  (1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
  (2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
  (3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
  (4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
  (5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);

select * from employees;

CREATE TABLE products (
  productid INT NOT NULL PRIMARY KEY,
  product VARCHAR(50),
  category VARCHAR(50),
  price INT
);

INSERT INTO products (productid,product,category,price) VALUES
  (101, 'Bottle', 'Accessories', 10),
  (102, 'Tire', 'Accessories', 15),
  (103, 'Socks', 'Clothing', 20),
  (104, 'Caps', 'Clothing', 25),
  (105, 'Gloves', 'Clothing', 30);

select * from products;


drop table if exists orders;
CREATE TABLE orders (
  orderid INT NOT NULL PRIMARY KEY,
  productid INT,
  customerid INT,
  salespersonid INT,
  orderdate DATE,
  shipdate DATE,
  orderstatus VARCHAR(50),
  shipaddress VARCHAR(255),
  billaddress VARCHAR(255),
  quantity INT,
  sales INT,
  creationtime TIMESTAMP,
  INDEX (productid),
  INDEX (customerid),
  INDEX (salespersonid),
  CONSTRAINT fk_orders_product
    FOREIGN KEY (productid)
    REFERENCES products (productid)
    ON DELETE SET NULL,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customerid)
    REFERENCES customers (customerid)
    ON DELETE SET NULL,
  CONSTRAINT fk_orders_employee
    FOREIGN KEY (salespersonid)
    REFERENCES employees (employeeid)
    ON DELETE SET NULL
);

INSERT INTO orders (
  orderid,productid,customerid,salespersonid,
  orderdate,shipdate,orderstatus,shipaddress,
  billaddress,quantity,sales,creationtime
) VALUES
  (1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered', '9833 Mt. Dias Blv.', '1226 Shoe St.', 1, 10, '2025-01-01 12:34:56'),
  (2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped', '250 Race Court', NULL, 1, 15, '2025-01-05 23:22:04'),
  (3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '2025-01-10 18:24:08'),
  (4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', '', 2, 60, '2025-01-20 05:50:33'),
  (5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered', NULL, NULL, 1, 25, '2025-02-01 14:02:41'),
  (6, 104, 3, 5, '2025-02-05', '2025-02-10', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '2025-02-06 15:34:57'),
  (7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered', '136 Balboa Court', '', 2, 30, '2025-02-16 06:22:01'),
  (8, 101, 4, 3, '2025-02-18', '2025-02-27', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '2025-02-18 10:45:22'),
  (9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped', '3768 Door Way', '', 2, 20, '2025-03-10 12:59:04'),
  (10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped', NULL, NULL, 0, 60, '2025-03-16 23:25:15');

  select * from orders;

  CREATE TABLE orders_archive (
  orderid INT,
  productid INT,
  customerid INT,
  salespersonid INT,
  orderdate DATE,
  shipdate DATE,
  orderstatus VARCHAR(50),
  shipaddress VARCHAR(255),
  billaddress VARCHAR(255),
  quantity INT,
  sales INT,
  creationtime TIMESTAMP,
  INDEX (productid),
  INDEX (customerid),
  INDEX (salespersonid)
);

INSERT INTO orders_archive (
  orderid,productid,customerid,salespersonid,
  orderdate,shipdate,orderstatus,shipaddress,
  billaddress,quantity,sales,creationtime
) VALUES
  (1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56'),
  (2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04'),
  (3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08'),
  (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', '', 2, 60, '2024-04-20 05:50:33'),
  (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', '', 2, 60, '2024-04-20 14:50:33'),
  (5, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41'),
  (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57'),
  (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05'),
  (6, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55'),
  (7, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15');

select * from orders_archive;


-- combind columns
select o.orderID, o.sales, c.firstname as customerFirstName, c.lastname as customerLastName, p.product as productName, p.price, e.firstname as employeeFirstName, e.lastname as employeeLastName
from orders as o 
left join customers as c on o.customerID = c.customerID
left join products as p on o.productid = p.productid
left join employees as e on o.salespersonid = e.employeeid;


-- combind rows (set operator)
select firstname, lastname from customers
union
select firstname, lastname from employees;


select customerid, lastname from customers
union
select employeeid, lastname from employees;


select customerid as ID, lastname from customers
union
select employeeid, lastname from employees;


-- union all
select firstname, lastname from customers
union all
select firstname, lastname from employees;


-- Return unique rows in the 1st table that are not in 2nd table
select firstname, lastname from customers
except
select firstname, lastname from employees;

select firstname, lastname from employees
except
select firstname, lastname from customers;


-- Retrun common rows betwwen two tables
select firstname, lastname from employees
intersect
select firstname, lastname from customers;





select 'orders' as sourceID, orderid, productid, customerid, salespersonid, orderdate, shipdate, orderstatus, shipaddress, billaddress, quantity, sales, creationtime from orders
union
select 'orders_archeive' as sourceID, orderid, productid, customerid, salespersonid, orderdate, shipdate, orderstatus, shipaddress, billaddress, quantity, sales, creationtime from orders_archive
order by orderid;
