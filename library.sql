create database library;
use library;
create table books(bookId int primary key,
bookName varchar(30) not null,
authorname varchar(30));
create table members(rollno int primary key,
name varchar(30),
departent varchar(30));
create table issue(IssueID int primary key,
 bookID int,
 MemberID int,
 IssueDate date ,ReturnDate date,
 foreign key(bookID) references books(bookId),
 foreign key(MemberID) references members(rollno));
 
--  inserting into books
insert into books values(1,"DBMS","Korth")
insert into members values(1,"Rahul","CSE");
insert into issue values(1,1,1,"2026-10-01",NULL);
-- If you already ran your 3 single inserts, clear them first:
-- delete from issue; delete from members; delete from books;

insert into books values
(2,'Java Complete','Herbert Schildt'),
(3,'Python Basics','Mark Lutz'),
(4,'Operating Systems','Galvin'),
(5,'Computer Networks','Tanenbaum'),
(6,'Data Structures','Tenenbaum'),
(7,'C Programming','Kernighan'),
(8,'Algorithms','Cormen'),
(9,'Software Engineering','Pressman'),
(10,'Artificial Intelligence','Russell');

insert into members values
(2,'Anjali','ECE'),
(3,'Sneha','IT'),
(4,'Kiran','CSE'),
(5,'Priya','ECE'),
(6,'Arjun','IT'),
(7,'Meena','CSE'),
(8,'Vikram','MECH'),
(9,'Divya','IT'),
(10,'Suresh','CIVIL');

insert into issue values
(2,2,2,'2026-08-10','2026-08-20'),
(3,1,3,'2026-08-15',NULL),
(4,3,1,'2026-09-01',NULL),
(5,1,4,'2026-09-05','2026-09-15'),
(6,4,5,'2026-09-10',NULL),
(7,2,1,'2026-09-12','2026-09-22'),
(8,5,6,'2026-09-28',NULL),
(9,1,7,'2026-09-30','2026-10-05'),
(10,3,1,'2026-10-03',NULL);

-- ● Find overdue books. 

select b.bookName,i.ReturnDate from 
books b join issue i on b.bookId=i.bookID
where i.ReturnDate is NULL;

-- ● Find books never issued. 
 select * from books where bookId not in 
 (select bookID from issue);

-- Find member who borrowed maximum books.
select * from members where rollno=(select MemberID from issue group by MemberId having count(bookId)=(select max(b_c) from (select 
MemberID,count(bookID) b_c from issue group by MemberId) t));
-- Find most popular book. 
select * from books where bookId=(select bookId from 
(select bookID,count(*) from issue 
group by bookId limit 1) t);
-- Count available books. 
select count(*) from (select * from books where bookId not in (select BookID from issue)) t;
select * from issue;












 
 
 
 
 
 
 
 
 