select * from customers;

-- String functions
select 
firstname,
country,
upper(firstname) as uppercase_name,
lower(firstname) as lowercase_name,
length(firstname) as lenttg_name,
concat(firstname, ' ', country) as name_country
from customers;


select 
'123-254-7894' as order_number,
replace('123-254-7894','-','#') as new_number;


select 
'123-254-7894' as order_number,
replace('123-253-7894','3-','0#') as new_number;


select 
trim(' Sajib') as name1,
trim('Sajib ') as name2,
trim(' Samina ') as name3,
trim('Samina      ') as name4,
trim(' S ami na   ') as name5


select
firstname,
left(firstname,2) as first_2_char,
right(firstname,2) as last_2_char,
substring(firstname,3,2) as sub_char
from customers;



-- Numeric functions
select max(score) as maximun_score from customers;
select min(score) as minimum_number from customers;
select avg(score) as average_number from customers;
select 
45.649,
round(45.649, 2) as round_1,
round(45.649, 1) as round_2,
round(45.649, 0) as round_3,
round(45.649, -1) as round_4,
round(6472.96, -3) as round_5;
select asin(.25) as test1;
select sin(0.25268025514207865) as test2;
select atan(2.5) as test3;
select tan(1.1902899496825317) as test4;
select acos(.50) as test5;
select cos(1.0471975511965979) as test6;
SELECT CEIL(25.75);
SELECT CEILING(25.32);
select count(customerid) from customers;
SELECT DEGREES(1.5);   --converts a value in radians to degrees.
select 10 div 5;
select 18 div 5;
select exp(1);
select exp(0);
select floor(27.89);
select greatest(12, 47, 41, 6, 27);
select greatest(12, 55, 41.69, 6, 27.1);
select least(12, 47, 41, 6, 27);
select log(2,8);
select log10(4.5);
select log10(100);
select mod(18, 4);
select pi();
select pow(4,2);
select power(3,3);
select radians(180); --converts a degree value into radians.
select rand() -- returns a random number between 0 (inclusive) and 1 (exclusive).

select sign(255.7);  -- If number > 0, it returns 1;   If number = 0, it returns 0,  If number < 0, it returns -1
select sign(-8);
select sign(0);

select sqrt(64);
select sum(score) from customers;



-- date functions
select 
year(orderdate) as year1,
month(orderdate) as month1,
day(orderdate) as day1
from orders;

select 
current_date as date2,
current_time as time2,
current_timestamp as date_time
from orders;

select 
date('2025-01-05 23:22:04') as date3,
time('2025-01-05 23:22:04') as time3,
hour('2025-01-05 13:22:04') as hour3,
minute('2025-01-05 13:22:04') as minute3,
second('2025-01-05 13:22:04') as second3,
datediff('2025-05-01','2025-01-05') as difference_day,
datediff('2025-09-01 23:22:04','2025-02-25 11:14:00') as difference_day2,
timestampdiff(hour,'2025-02-25 11:14:00','2025-09-01 23:22:04') as hour_diffarence,
timestampdiff(minute,'2025-02-25 11:14:00','2025-09-01 23:22:04') as minute_diffarence,
timestampdiff(second,'2025-02-25 11:14:00','2025-09-01 23:22:04') as second_diffarence;

select
date_format('2025-02-25 11:14:00', '%W') as formated_date_week,
date_format('2025-02-25 11:14:00', '%M') as formated_date_month,
date_format('2025-02-25 11:14:00', '%e') as formated_date_day,
date_format('2025-02-25 11:14:00', '%e') as formated_date_year,
date_format('2025-02-25 11:14:00', '%W, %M %e, %Y') as formated_date;

select
date_format('2025-02-25 21:14:00', '%H') as formated_hour,
date_format('2025-02-25 21:14:00', '%i') as formated_minute,
date_format('2025-02-25 21:14:36', '%s') as formated_second,
date_format('2025-02-25 21:14:36', '%H %i %s') as formated_second;
