
  CREATE DATABASE org;
  SHOW DATABASES;
  USE org;
  
  CREATE TABLE Project (
   id int,
   empID int primary key,
   cname varchar(255),
   start_date date,
   clintID int
  );
  drop table Project;
  INSERT INTO Project
         (id, empID, cname, start_date, clintID) VALUES
         (1, 1, 'A', '10-02-20', 3),
         (2, 2, 'B', '12-01-24', 1),
         (3, 3, 'C', '11-12-23', 5),
         (4, 4, 'D', '12-12-12', 2),
         (5, 5, 'E', '23-11-22', 4);
         
         select * from Project;
  
  
CREATE TABLE Employee (
   id int primary key,
   fname varchar(255),
   lname varchar(255),
   age int,
   email_id varchar(255),
   phone_no int3,
   city varchar(255),
   foreign key (id)
     references Project(empID)
  );   
  
  drop table Employee;
  
    INSERT INTO Employee
         (id, fname, lname, age, email_id, phone_no, city) VALUES
         (1, 'ajit', 'doval', 23, 'ajitdoval@gmail.com',232, 'patna'),
         (2, 'siddique', 'ahmad', 22, 'ahmadsiddique7073@gmail.com',232, 'aligarh'),
         (3, 'umar', 'khan', 33, 'umarkhan@gmail.com',132, 'sambhal'),
         (4, 'usman', 'ahmad', 34, 'usmanahmad@gmail.com',202, 'ara'),
         (5, 'ali', 'ahmad', 22, 'aliahmad@gmail.com',223,'gaya');
 select * from Employee;
 
 select * from Employee where age > (select avg(age) from Employee);
 select avg(age) from Employee;
 
 -- sub Query
 
 select max(age) from (select * from Employee where fname like '%a%') as temp;
 
 -- finding third oldest Employee
 -- coorelated sub query
 select * From Employee e1 where 3 = ( select count(age) from Employee e2 where e2.age>=e1.age);
 
 -- view 
 -- creating view 
 
  create view custom_view as select fname,age from Employee;
  
  
  
  -- alter view
  
  Alter view  custom_view as select fname, age, email_id from Employee;
  
  -- we can drop view
  
  Drop view if exists custom_view;
  
  CREATE TABLE clients (
   id int,
   f_name varchar(255),
   l_name varchar(255),
   age int,
   email_id varchar(255),
   phone_no int3,
   city varchar(255),
   empID int,
   foreign key (id)
     references Employee(id)
  );
    
     drop table clients;
     
     
     INSERT INTO clients
         (id, f_name, l_name, age, email_id, phone_no, city,empID) VALUES
         (1, 'makus', 'll', 13, 'ajaddoval@gmail.com',242, 'kolkata',3),
         (2, 'siddi', 'ahm', 12, 'ahmadsadsdiddique7073@gmail.com',132, 'kolkata',3),
         (3, 'umr', 'kan', 17, 'umarkhdadan@gmail.com',632, 'delhi',1),
         (4, 'usn', 'ahd', 14, 'usmanaasdshmad@gmail.com',292, 'hyderabad',5),
         (5, 'li', 'ahd', 15, 'aliahmadadd@gmail.com',203,'gaya',2);
     
      select * from clients;
      
      select * from clients where age in (select age from clients where age > 13);
      
      select * from Employee as e inner join Project as p on e.id=p.empID;
      
      select * from Employee as e , Project as p where e.id=p.empID;
      
      select e.id, e.fname,e.lname,p.id,p.empID from Employee as e inner join Project as p on e.id=p.empID;
      
      select e.id, e.phone_no,e.email_id,c.f_name,c.l_name from Employee as e inner join clients as c on e.id=c.id
      where e.city='patna' and c.city='kolkata';
     
     select e.fname , e.lname, p.id, p.cname from Employee as e 
     cross join 
     Project as p;
     
	
  
  SELECT *FROM Customer3;
  
  CREATE TABLE Order_detail2 (
   Customer_id int ,
   delivery_date DATE,
   order_id int primary key,
   foreign key (Customer_id)
        references Customer3(id) on delete cascade
  );
  
  INSERT INTO Order_detail2 VALUES
  (1233,'10-02-20',1233);
  
  SELECT *FROM Order_detail2;
  
  delete from Customer3 where id = '1233';
  
  delete from Order_detail2;
  drop table Order_detail2;
  drop table Customer3;
  
   CREATE TABLE account1 (
   id int primary key,
   name varchar(225) unique,
  -- constraint acc_balance check(balance > 900)
   balance int not null default 0
  );
  
  alter table account1 add interest int not null default 0;
  
  alter table account1 modify interest double not null default 1;
  
  alter table account1 change interest saving_interest float not null default 1;
  
  alter table account1 rename account2;
  
  alter table account1 drop column saving_interest;
  INSERT INTO account1 (id, name) VALUES
  (1,'A'),
  (2,'B'),
  (3,'C'),
  (4,'D');
  set sql_safe_updates =0;
  insert into account2 (id) values(12);
  delete from account2;
  select * from account2;
  desc account2;
  Drop table Customer3;
  
  replace into Customer3 (id, city) values (1233,'delhi');
   replace into Customer3 (id, city) values (1234,'delhi');
   replace into Customer3 set id= 1238, cname='dads',gender='M',city='patna';
   
   
   
   
   CREATE TABLE dept1 (
   empID int primary key,
   name varchar(255),
   role varchar(225)
   );
   
    CREATE TABLE dept2 (
   empID int primary key,
   name varchar(255),
   role varchar(225)
   );
   
   select * from dept1;
   
   select * from dept2;
   
   insert into dept1 (empID, name, role) values 
   (1,'siddique','manager'),
    (2,'siddique2','manager1'),
     (3,'siddique3','manager2'),
      (4,'siddique4','manager3'),
       (5,'siddique5','manager4');
   
   
    insert into dept2 (empID, name, role) values 
   (6,'siddique1','manager1'),
    (7,'siddique21','manager111'),
     (8,'siddique31','manager211');
      
   
   select * from dept1
   UNION
   select * from dept2;
   
   select * from dept1 where role = 'manager1';
   
   select * from dept1 inner join dept2 using(empID);
   
   SELECT 
    dept1.*
FROM
    dept1
        LEFT JOIN
    dept2 USING (empID)
WHERE
    dept2.empID IS NULL;
   
   
   
   
   
  
  
  