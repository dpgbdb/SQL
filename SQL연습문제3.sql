#날짜 : 2022/08/31
#이름 : 김동민
#내용 : SQL 연습문제3

 #실습3-1
 create database `java2_college`;
 create user 'java2_admin3'@'%' identified by '1234';
 grant all privileges on java2_college.* TO 'java2_admin3'@'%';
 flush privileges;
 #실습3-2
 create table`Student`(
	`stdNo` varchar(8) primary key,
    `stdName` varchar(20) not null,
    `stdHp` varchar(13) unique not null,
    `stdYear` tinyint not null,
    `stdAddress` varchar(100)
 );
 create table`Lecture`(
	`lecNo` int primary key,
    `lecName` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10)
    );
create table `Register`(
	`regStdNo` varchar(8) not null,
    `regLecNo` int not null,
    `regMidScore` int,
    `regFinalScore`int,
    `regTotalScore` int,
    `regGrade` char(1)
    );
 #실습3-3
 insert into `Student` values('20201016','김유신','010-1234-1001',3,null);
 insert into `Student` values('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');
 insert into `Student` values('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
 insert into `Student` values('20210326','강감찬','010-1234-1004',2,'서울시 영등포구');
 insert into `Student` values('20220416','이순신','010-1234-1005',1,'부산시 부산진구');
 insert into `Student` values('20220521','송상현','010-1234-1006',1,'부산시 동래구');
 
 insert into `Lecture` values(159,'인지행동심리학',3,40,'본304');
 insert into `Lecture` values(167,'운영체제론',3,25,'본B05');
 insert into `Lecture` values(234,'중급 영문법',3,20,'본201');
 insert into `Lecture` values(239,'세법개론',3,40,'본204');
 insert into `Lecture` values(248,'빅데이터 개론',3,20,'본B01');
 insert into `Lecture` values(253,'컴퓨팅사고와 코딩',2,10,'본B02');
 insert into `Lecture` values(349,'사회복지 마케팅',2,50,'본301');

insert into `Register` values('20201126','234',null,null,null,null);
insert into `Register` values('20201016','248',null,null,null,null);
insert into `Register` values('20201016','253',null,null,null,null);
insert into `Register` values('20201126','239',null,null,null,null);
insert into `Register` values('20210216','349',null,null,null,null);
insert into `Register` values('20210326','349',null,null,null,null);
insert into `Register` values('20201016','167',null,null,null,null);
insert into `Register` values('20220416','349',null,null,null,null);
 #실습3-4
 select * from`Lecture`;
 #실습3-5
 select*from`student`;
 #실습3-6
 select * from `register`;
 #실습3-7
 select * from `student` where `stdYear`=3;
 #실습3-8
 select *from `lecture` where `lecCredit`=2;
 #실습3-9
 update `register` set `regMidscore` =36,`regFinalScore`=42 where `regStdNo`='20201126' and `regLecNo`=234;
 update `register` set `regMidscore` =24,`regFinalScore`=62 where  `regLecNo`=248;
 update `register` set `regMidscore` =25,`regFinalScore`=40 where  `regLecNo`=253;
 update `register` set `regMidscore` =37,`regFinalScore`=57 where `regStdNo`='20201126' and `regLecNo`=239;
 update `register` set `regMidscore` =28,`regFinalScore`=68 where `regStdNo`='20210216' and `regLecNo`=349;
 update `register` set `regMidscore` =16,`regFinalScore`=65 where `regStdNo`='20210326' and `regLecNo`=349;
 update `register` set `regMidscore` =18,`regFinalScore`=38 where `regStdNo`='20201016' and `regLecNo`=167;
 update `register` set `regMidscore` =25,`regFinalScore`=58 where `regStdNo`='20220416' and `regLecNo`=349;
  
 #실습3-10
 update`register` set 
	`regTotalScore`=`regMidScore` + `regFinalScore`,
    `regGrade`= if (`regTotalScore`>= 90, 'A',
					if (`regTotalScore`>= 80, 'B',
						if (`regTotalScore`>= 70, 'C',
							if (`regTotalScore`>= 60, 'D','F'))));
			select *from `register`;
	
#실습3-11
select * from `register` order by `regTotalScore` desc;
 #실습3-12
 select * from `register`where `regLecNo`=349 order by `regTotalScore` desc;
 #실습3-13
 select * from `lecture` where `lectime`>=30;
 #실습3-14
 select `lecName`,`lecClass` from `Lecture` ;
 #실습3-15
 select `stdNo`,`stdName` from `student`; 
 #실습3-16
 select * from `Student` where `stdAddress` is null;
 #실습3-17
 select * from `Student` where `stdAddress` like '부산시 %';
 #실습3-18
 select * from `Student` as a left join `Register` as b on a.stdNo = b.regStdNo;
 #실습3-19
 select
	`StdNo`,`StdName`,`regLecNo`,`regMidScore`,`regFinalScore`,`regTotalScore`,`regGrade`
 from`student` as a, `register` as b where a.stdNo=b.regStdNo;
 #실습3-20
 select `stdName`,`stdNo`,`regLecNo`
 from `student` as a
 join `register` as b
 where a.stdNo = b.regStdNo and `regLecNo`='349';
 #실습3-21
 select
	`stdNo`,
    `stdName`,
    COUNT(`stdNo`) As`수강신청 건수`,
    SUM(`regTotalScore`) as `종합점수`,
	SUM(`regTotalScore`)/ COUNT(`stdNo`) as `평균`
    from `student` as a
    join`register` as b
    on a.stdNo=b.regStdNo
    group by `stdNo` order by `수강신청 건수` desc;
 #실습3-22
 select * from `register` as a
 join `Lecture` as b on a.regLecNo=b.lecNo;
 #실습3-23
 select `regStdNo`,`regLecNo`,`lecName`,`regMidScore`,`regFinalScore`,`regTotalScore`,`regGrade`
 from `lecture` as a join `register` as b on a.lecNo=b.regLecNo;
 #실습3-24
 select
	COUNT(*)as`사회복지 마케팅 수강 신청건수`,
    AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
    from `register` as a join `lecture`as b on a.regLecNo=b.lecNo
    where `lecName`='사회복지 마케팅';
 #실습3-25
 select `regStdNo`,`lecName`
 from`Register` AS a JOin `Lecture` as b on a.regLecNo=b.lecNo where `regGrade`='A';
 #실습3-26
 select * from `student`as a join `register` as b on a.stdNo=b.regStdNo join `lecture` as c on b.regLecNo=c.lecNo order by `StdNo` asc;
 #실습3-27
 select
 `stdNo`,`stdName`,`lecNo`,`LecName`,`regMidScore`,`regFinalScore`,`regTotalScore`,`regGrade`
 from `student`as a join `register` as b on a.stdNo=b.regStdNo join `lecture` as c on b.regLecNo=c.lecNo order by `regTotalScore`desc;
 #실습3-28
 select `stdno`,`stdname`,`lecname`,`regtotalscore`,`reggrade`from`student`as a join `register` as b on a.stdNo=b.regStdNo join `lecture` as c on b.regLecNo=c.lecNo where `regGrade`='F';
 #실습3-29
 select `stdno`,`stdname`,sum(`lecCredit`)AS `이수학점`from `student`as a join `register` as b on a.stdNo=b.regStdNo join `lecture` as c on b.regLecNo=c.lecNo where `regTotalScore`>=60 group by`stdNo`;
 #실습3-30
 select
 `stdNo`,`stdName`, group_concat(`lecName`) AS`신청과목`,
 group_concat(if(`regTotalScore`>=60,`lecName`,null)) AS `이수과목`
 from `student`as a join `register` as b on a.stdNo=b.regStdNo join `lecture` as c on b.regLecNo=c.lecNo group by `stdNo`;