#날짜:2022/09/01
#이름:김동민
#내용:SQL연습문제4

#실습4-1
create database `java2_BookStore`;
create user 'java2_admin4'@'%' identified by'1234';
grant all privileges on `java2_BookStore`.* TO 'java2_admin4'@'%';
flush privileges;
#실습4-2
create table `Customer` (
	`custId` int AUTO_INCREMENT primary key,
    `name` varchar(10) not null,
    `address` varchar(20),
    `phone` char(13)
);
create table `Book`(
	`bookId` int primary key,
    `bookName` varchar(20) not null,
    `publisher` varchar(20) not null,
    `price` int
);
create table `Order`(
	`orderId`int auto_increment primary key,
    `custId`int not null,
    `bookId` int not null,
    `salePrice` int not null,
    `orderDate`date not null
);
#실습4-3
insert into `Customer` values('1','박지성','영국 맨체스타','000-5000-0001');
insert into `Customer` values('2','김연아','대한민국 서울','000-6000-0001');
insert into `Customer` values('3','장미란','대한민국 강원도','000-7000-0001');
insert into `Customer` values('4','추신수','미국 클리블랜드','000-8000-0001');
insert into `Customer` values('5','박세리','대한민국 대전',null);

insert into `Book` values('1','축구의 역사','굿스포츠','7000');
insert into `Book` values('2','축구아는 여자','나무수','13000');
insert into `Book` values('3','축구의 이해','대한미디어','22000');
insert into `Book` values('4','골프 바이블','대한미디어','35000');
insert into `Book` values('5','피겨 교본','굿스포츠','8000');
insert into `Book` values('6','역도 단계별기술','굿스포츠','6000');
insert into `Book` values('7','야구의 추억','이상미디어','20000');
insert into `Book` values('8','야구를 부탁해','이상미디어','13000');
insert into `Book` values('9','올림픽 이야기','삼성당','7500');
insert into `Book` values('10','Olympic Champions','pearson','13000');

insert into `Order` values('1','1','1','6000','2014-07-01');
insert into `Order` values('2','1','3','21000','2014-07-03');
insert into `Order` values('3','2','5','8000','2014-07-03');
insert into `Order` values('4','3','6','6000','2014-07-04');
insert into `Order` values('5','4','7','20000','2014-07-05');
insert into `Order` values('6','1','2','12000','2014-07-07');
insert into `Order` values('7','4','8','12000','2014-07-07');
insert into `Order` values('8','3','10','13000','2014-07-08');
insert into `Order` values('9','2','10','7000','2014-07-09');
insert into `Order` values('10','3','8','13000','2014-07-10');
#실습4-4
select `custid`,`name`,`address`from `Customer`; 
#실습4-5
select`bookname`,`price`from`book`;
#실습4-6
select`price`,`bookname`from`book`;
#실습4-7
select*from `book`;
#실습4-8
select `publisher`from`book`;
#실습4-9
select distinct `publisher`from`Book`;
#실습4-10
select *from `book` where `price` >=20000;
#실습4-11
select *from `book` where `price` <20000;
#실습4-12
select *from `book` where `price` >=10000 and `price`<=20000;
#실습4-13
select `bookid`,`bookname`,`price`from `book` where `price` >=15000 and `price`<=30000;
#실습4-14
select*from`book` where `bookid` ='2' or `bookid` ='3' or `bookid` ='5'; 
#실습4-15
select*from`book` where mod(`bookId`,2)=0; 
#실습4-16
select*from `Customer` where `name` like '박%';
#실습4-17
select*from `Customer` where `address` like '대한민국 %';
#실습4-18
select * from `Customer` where `phone` is not null;
#실습4-19
select * from `book` where `publisher`='굿스포츠' or `publisher`='대한미디어';
#실습4-20
select `publisher` from `book` where `bookname`='축구의 역사';
#실습4-21
select `publisher` from`Book` where `bookname` like '%축구%';
#실습4-22
select * from `Book` where `bookname` like '_구%';
#실습4-23
select * from`Book` where `bookname` like '%축구%' and `price`>=20000;
#실습4-24
select * from`Book` order by `bookName`asc;
#실습4-25
select * from `Book` order by `price` asc , `bookName`asc;
#실습4-26
select * from `Book` order by `price` desc , `publisher`asc;
#실습4-27
select * from `Book` order by `price` desc limit 3;
#실습4-28
select * from `Book` order by `price` asc limit 3;
#실습4-29
select sum(`saleprice`) as `총판매액` from `Order` ;
#실습4-30
select sum(`saleprice`) as `총판매액`, avg(`saleprice`) as `평균값`,
 min(`saleprice`) as `최저가`, max(`saleprice`) as `최고가` from `Order`;
#실습4-31
select count(`orderId`) as `판매건수`from`Order`;
#실습4-32
update`book` set `bookname`=replace(`bookname`,'야구','농구') where `bookname` like '%야구%';
#실습4-33
select `custid`,count(`custid`) as `수량`from`order` where `saleprice`>=8000  group by `custid` having `수량`>=2;
#실습4-34
select *from `customer` as a join `order` as b on a.custId=b.custId order by a.`custId` asc;
#실습4-35
select *from `customer` as a join `order` as b on a.custId=b.custId order by a.`custId` asc;
#실습4-36
select `name`,`saleprice`from `customer` as a join `order` as b on a.custId=b.custId order by a.`custId` asc;
#실습4-37
select `name`,sum(`saleprice`)from `customer` as a join `order` as b on a.custId=b.custId group by `name` order by `name` asc;
#실습4-38
select `name`,`bookname` from `customer` as a join `order` as b on a.custId=b.custId join `book` as c on b.bookId=c.bookId;
#실습4-39
select `name`,`bookname` from `customer` as a join `order` as b on a.custId=b.custId join `book` as c on b.bookId=c.bookId where `salePrice`=20000;
#실습4-40
select`name`,`saleprice`from `Customer` as a left join`Order` as b on a.custid=b.custid;
#실습4-41
select`bookname`from `book` where `price`=(select max(`price`)from`book`);
#실습4-42
select`name`from `Customer` as a left join`Order` as b on a.custid=b.custid where b.`custid` is null ;
#실습4-43
select sum(`saleprice`) as `총매출` from `Customer` as a left join`Order` as b on a.custid=b.custid where `name`='김연아';
#실습4-44
insert into `book` values (
'11','스포츠의학','한솔의학서적',null
);

#실습4-45
update `customer` set `address`='대한민국 부산' where `custId` =5;

#실습4-46
delete from `customer` where`custid`=5;
#실습4-30
#실습4-30
#실습4-30
#실습4-30