-- CREATE DATABASE testDB;

CREATE TABLE Persons (
    PersonID int auto_increment primary key,
    Name varchar(50),
    age int,
    Address varchar(255)
);

drop table Persons;

insert into Persons (Name, age, Address) values ("Rajib", 25, "Mirpur-1");
insert into Persons (Name, age, Address) values ("Nipu", 22, "Kochukhet");
insert into Persons (Name, age, Address) values ("Papia", 23, "Hatirjheel");

insert into Persons (Name, age, Address) values ("Shams", 28, "Agargaon");

insert into Persons (PersonID, Name, age, Address) values (100, "Rita", 28, "Agargaon");

delete from Persons where PersonID=100;

select * from Persons;

insert into Persons (Name, age, Address) values ("Nila", 21, "Khilgaon");


create table newPerson as select PersonID, Name from Persons;

insert into Persons (Name, Address) values ("Manik", "Rajshahi");

select * from newPerson;

select * from Persons;

insert into Persons (Name, Age, Address) values ("Mim", 30, "Mirpur-2"), ("Kakoli", 24, "Naogaon"), ("Raj", 33, "Jatrabari");


drop table Student;
create table Student(
    StudentID int auto_increment primary key,
    Name varchar(100),
    Password varbinary(20),
    file1 tinyblob,     
    file2 blob,       
    file3 mediumblob,     
    file4 longblob       
) auto_increment = 10001 ;

-- tinyblob-  Max:255 bytes (icons/ small images/ short binary string)
-- blob-  Max:64KB (images/ short text files/ pdf files)
-- mediumblob-  Max:16MB (Big Images/ Pdf Books)
-- longblob-  Max:4GB (videos)

insert into Student (Name, Password, file1, file2, file3, file4) values ("Nasifa", "nasifa020","fsfsff","wrwqr","ryry", "msjccw"), ("Munia", "munia2025","fsfsff","wrwqr","ryry", "msjccw"), ("Mita", "mitaaaa","fsfsff","wrwqr","ryry", "msjccw");


select * from Student;


create table Text_test(
    Name tinytext,
    Degisnation text,
    Address mediumtext,
    Details longtext
);

-- tinytext-  max: 255 characters
-- text-   max: 65,535 bytes
-- mediumtext-   max: 16,777,215 characters
-- longtext-   max: 4,294,967,295 characters

drop table Text_test;
insert into Text_test (Name, Degisnation, Address, Details) values ("Naila", "gesgg gg rgrh rhr", "gryuqewrwr tetety y ", "rryryyzcqgbpjwjycgfnbj");
insert into Text_test (Name, Degisnation, Address, Details) values ("Maisha", "lojw cwc jevev", "Poigeg whfbwhf", "Aqpworn vyev przxfrsfv");

select * from Text_test;


create table bin_test(
    column_1 bit,
    column_2 bit(6)
);

-- BIT(size)-  default size is: 1 & max size is: 64. That's mean you can save 1 to 64 bits in bit(size) data-type.

insert into bin_test (column_1, column_2) values (B'0', B'110101');
insert into bin_test (column_1, column_2) values (B'1', B'101');

select bin(column_1),bin(column_2) from bin_test;
select * from bin_test;




create table int_test(
    column_1 tinyint,
    column_2 smallint,
    column_3 mediumint,
    column_4 int,
    column_5 bigint
)

-- tinyint—  size: 1 byte, range: -128 to 127
-- smallint—  size: 2 byte, range: -32768 to 32767
-- mediumint—  size: 3 byte, range:  -8388608 to 8388607
-- int—  size: 4 byte, range:  -2147483648 to 2147483647
-- bigint—  size: 8 byte, range:  -9223372036854775808 to 9223372036854775807

insert into int_test (column_1, column_2, column_3, column_4, column_5) values (45, 23411, 825000, 25819874, 857464545)

insert into int_test (column_1, column_2, column_3, column_4, column_5) value (-128, -32768, -8388608, -2147483648, -9223372036854775808)

insert into int_test (column_1, column_2, column_3, column_4, column_5) value (127, 32767, 8388607, 2147483647, 9223372036854775807)

select * from int_test;


create table decimal_test(
    column_1 float,
    column_2 double,
    column_3 decimal(5, 2)
);

-- float- 4 bytes
-- double- 8 bytes
-- decimal(size,d)- maximun size is: 65 & maximun d is: 30.   default size is: 10 & default d is:0

insert into decimal_test (column_1, column_2, column_3) values (6352.444, 2579844.52365, 586.687);

select * from decimal_test;


create table date_test(
    column_1 date
);
-- date—  Format: YYYY-MM-DD, range: '0-1-1' to '9999-12-31'
insert into date_test (column_1) values ("0-1-1");
insert into date_test (column_1) values ("2025-08-06"), ("2024-12-28");

select * from date_test;



create table time_test(
    column_1 time
);

-- date—  Format: hh:mm:ss, range: '-838:59:59' to '838:59:59', (which is more than 34 days)

insert into time_test (column_1) values ("20:18:30");
insert into time_test (column_1) values ("07:33:20");
insert into time_test (column_1) values ("-08:41:55");
insert into time_test (column_1) values ("-838:59:59");
insert into time_test (column_1) values ("838:59:59");
insert into time_test (column_1) values ("49:49:10");

select * from time_test;



create table datetime_test(
    column_1 datetime
);
-- date—  Format: YYYY-MM-DD hh:mm:ss, range: '0-01-01 00:00:00' to '9999-12-31 23:59:59'
insert into datetime_test (column_1) values ("2025-08-26 14:00:00");
insert into datetime_test (column_1) values ("0-01-01 6:20:00");
insert into datetime_test (column_1) values ("0-01-01 -16:20:00");

select * from datetime_test;



create table year_test(
    column_1 year
);
-- year—  range: 1901 to 2155
insert into year_test (column_1) values (2025);
insert into year_test (column_1) values (1901), (2155);

select * from year_test;



create table timestamp_test1(
    column_1 timestamp
);

-- timestamp—  range: '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC

insert into timestamp_test1 (column_1) values ("2024-06-17 22:14:00");

select * from timestamp_test1;



create table timestamp_test2(
    column_1 int,
    column_2 timestamp default current_timestamp
);

insert into timestamp_test2 (column_1) values (1);

select * from timestamp_test2;

set sql_safe_updates=0;
update timestamp_test2 set column_1=2 where column_1=1;



create table timestamp_test3(
    column_1 int,
    column_2 varchar(50),
    column_3 timestamp default current_timestamp on update current_timestamp
);

insert into timestamp_test3 (column_1, column_2) values (100, "rasel");
insert into timestamp_test3 (column_1, column_2) values (101, "Pakhi");

select * from timestamp_test3;

update timestamp_test3 set column_1=101 where column_1=102;
update timestamp_test3 set column_1=102 where column_2="Pakhi";