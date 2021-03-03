create database Book;
CREATE DATABASE IF NOT EXISTS Book DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
use Book;
create table books (
book_name VARCHAR(100) NOT NULL,
book_number INT UNSIGNED,
PRIMARY KEY (book_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table books default character set utf8mb4 collate=utf8mb4_general_ci;
ALTER TABLE books convert to CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
INSERT INTO books(book_name,book_number) VALUES ("毛泽东选集",3);
create table users (
ID INT UNSIGNED AUTO_INCREMENT,
permission VARCHAR(5) NOT NULL default 'user',
passwd VARCHAR(32) NOT NULL,
book_name VARCHAR(20),
book_start_time DATETIME,
book_end_time DATETIME,
book_return_time DATETIME,
PRIMARY KEY (ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO users(ID,permission,passwd) VALUES("1520182953","admin","passwd");
alter table users 
change column permission 
permission VARCHAR(10) default 'user';
INSERT INTO users(ID,passwd) VALUES("1520182950","123456");
delimiter $
create procedure getpermission(name char(20))
begin
select permission from users where name=users.ID;#获取用户权限
end $
call getpermission('1520182953');

delimiter $
create procedure getbooknum(name char(50))
begin
select book_number from books where book_name=name;#得到书的数量
end $
call getbooknum('毛泽东选集');

delimiter $
create procedure borrow(name char(50))
begin
update books set book_number = IF(book_number < 1, 0, book_number -1) where name = book_name;#不为0则减1，jsp处判断是否为0，如果为0则报错
#加入借书日期和还书日期
end $
call borrow("毛泽东选集");

delimiter $
create procedure return_book(name char(50))
begin
update books set book_number=book_name +1 where name = book_name;
#清空借书日期和还书日期
end $ 
use 学生管理;
DESC 课程;
use Book;
SELECT DATE_ADD(curdate(),INTERVAL 1 WEEK);
SELECT DATE_ADD('2008-01-02', INTERVAL 31 DAY);
select * from books;
INSERT INTO users(ID,passwd) VALUES("1520182953",md5('passwd'));
update users set passwd=md5('passwd') where users.ID=1520182953;
update users SET book_name='《毛泽东选集》',book_start_time=curdate(),book_end_time=(SELECT DATE_ADD(curdate(),INTERVAL 1 WEEK)) where users.ID=1520182953;
insert into books(book_name,book_number) values ('《毛泽东选集》',10);
select * from users;
select book_number from books where book_name='computer';
select ID,book_name,book_start_time,book_end_time,book_return_time from users where users.ID=1520182953;
