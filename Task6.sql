create table branch (
branch_id int,
location varchar(30),
address varchar(30)
);
 
insert into branch values(1,"Puducherry","no:20,adc street");
insert into branch values(2,"chennai","no:2,xyz street");
insert into branch values(3,"Bengaluru","no:78,staint colony");
insert into branch values(4,"coimbatore","no:10,anna nagar");
insert into branch values(5,"pune","no:46,raman street");
insert into branch values(6,"Hyderabad","no:21,bahathur street");

create table employee1(
 emp_id int primary key ,
 emp_Name varchar(30) not null,
 Job_desc varchar (30),
 salary int,
 branch_id int,
  foreign key (branch_id) references branch (branch_id)
 );

 Insert into employee1 values(1,"Anbu","MANAGER",800000,1);
 Insert into employee1 values(2,"Arun","HR",900000,2);
 Insert into employee1 values(3,"Barbie","Analyst",500000,1);
 Insert into employee1 values(4,"celeine","Developer",600000,5);
 Insert into employee1 values(5,"Deepika","Developer",600000,3);
 Insert into employee1 values(6,"Joy","Engineer",700000,3);
 
 select * from employee1 where branch_id=(select branch_id from branch where location="chennai");
 select * from employee1 where salary=(select min(salary) from employee1);
 /*EXISTS*/
 select branch_id ,location 
 from branch
 where EXISTS(
 select * from employee1
 where job_desc="Engineer"
 );
 /*IN*/
 select emp_name 
 from employee1
 where branch_id IN(
 select branch_id
 from branch
 where location="puducherry");
 
 /*=*/
 select emp_name
 from employee1
 where salary=(
 select MAX(salary)
 from employee1);
 
 
