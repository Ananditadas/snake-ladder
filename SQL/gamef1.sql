create database GAME;
use GAME;
create table FACT(F_ID varchar(20) primary key,facts varchar(50000));
show tables;
describe FACT;
create table LEVEL1(LEV_ID varchar(20) primary key,fromi varchar(20),toi varchar(20),level1 varchar(20),time1 varchar(20));
describe LEVEL1;
create table Class (C_ID varchar(20) primary key,class int(100));
describe Class;
create table Topic(T_ID varchar(20) primary key,topics varchar(50000),C_ID varchar(20),foreign key C_ID(C_ID) references Class(C_ID));
describe Topic;
create table QUESTION(Q_ID varchar(20) primary key,ques varchar(1000),F_ID varchar(20),LEV_ID varchar(20),T_ID varchar(20),ca varchar(60000),flag varchar(20),foreign key F_ID(F_ID) references FACT(F_ID),foreign key LEV_ID(LEV_ID) references LEVEL1(LEV_ID),foreign key T_ID(T_ID) references Topic(T_ID));
describe QUESTION;
create table OPTION1(OPT_ID varchar(30) primary key,Q_ID varchar(20),OP1 varchar(10000),OP2 varchar(10000),OP3 varchar(10000),OP4 varchar(10000),foreign key Q_ID(Q_ID) references QUESTION(Q_ID));
show tables;
insert into FACT(F_ID,facts) values ('F001','Decimal number addition starts from right hand side'); 
insert into FACT(F_ID,facts) values ('F002','Simple Interest is calculated by multipying principal,rate of interest and time and then dividing by 100');
select * from FACT;
insert into LEVEL1(LEV_ID,fromi,toi,level1) values ('L1','0','30','1');
insert into LEVEL1(LEV_ID,fromi,toi,level1) values ('L2','31','60','2');
select * from LEVEL1;
insert into Class(C_ID,class) values ('C001',5);
insert into Class(C_ID,class) values ('C002',6);
insert into Class(C_ID,class) values ('C003',7);
insert into Class(C_ID,class) values ('C004',8);
select * from Class;
insert into Topic(T_ID,topics,C_ID)values('T001','Unitary method','C001');
insert into Topic(T_ID,topics,C_ID)values('T002','Multiplication','C003');
insert into Topic(T_ID,topics,C_ID)values('T003','Decimals','C002');
insert into Topic(T_ID,topics,C_ID)values('T004','Mensuration','C004');
select * from Topic;
insert into QUESTION(Q_ID,ques,F_ID,LEV_ID,T_ID,ca)values('Q001','State:0.5+0.6','F001','L1','T003','1.1');
insert into QUESTION(Q_ID,ques,F_ID,LEV_ID,T_ID,ca)values('Q002','Add:32.6+11.6','F001','L1','T003','40.3');
insert into QUESTION(Q_ID,ques,F_ID,LEV_ID,T_ID,ca)values('Q003','If p=12,r=6%,t=2,find S.I??','F002','L1','T004','127');
insert into QUESTION(Q_ID,ques,F_ID,LEV_ID,T_ID,ca)values('Q004','If p=114,r=2.5%,t=6 months,find S.I??','F002','L1','T004','64');
select * from QUESTION;
insert into OPTION1(OPT_ID,Q_ID,OP1,OP2,OP3,OP4) values('OP1','Q001','1.1','1.2','1.3','1.4');
insert into OPTION1(OPT_ID,Q_ID,OP1,OP2,OP3,OP4) values('OP2','Q002','39.6','40.2','41.3','45.7');
insert into OPTION1(OPT_ID,Q_ID,OP1,OP2,OP3,OP4) values('OP3','Q003','112','11','36','7');
insert into OPTION1(OPT_ID,Q_ID,OP1,OP2,OP3,OP4) values('OP4','Q004','62','50','34','99');
select * from OPTION1;












