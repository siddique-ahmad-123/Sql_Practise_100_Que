 CREATE DATABASE practise;
  SHOW DATABASES;
  USE practise;
  

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
        SELECT * FROM Bonus;
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 SELECT * FROM Title;
 
 
 
 
 

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME  AS WORKER_NAME from Worker;


-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 
select upper(FIRST_NAME) from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT DEPARTMENT FROM Worker;
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

SELECT substring(fIRST_NAME,1,3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.

SELECT instr(FIRST_NAME,'B') FROM Worker WHERE FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(first_name) from Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(first_name) from Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct department,length(department) from Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

 select replace(first_name,'a','A') from Worker ;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.

select concat(first_name,' ', last_name) as complete_name from Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from Worker order by first_name; -- by default ascending order

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.

select * from Worker order by first_name , department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from Worker where first_name in ('Vipul' , 'satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select * from Worker where first_name not in ('Vipul','Satish');


-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.

select * from Worker where department = 'Admin';
select * from Worker where department like 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from Worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

 select * from Worker where first_name like '_____h';
 

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from Worker where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from Worker where  year(joining_date) = 2014 and month(joining_date)=02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select department,count(department) from Worker where department='Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.

select concat(first_name,' ',last_name) as full_name from Worker where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select department,count(worker_id) as no_of_worker  from Worker group by department order by count(worker_id)  desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

select * from Worker as w inner join Title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.

select worker_title,count(worker_title) as titles  from Title group by worker_title having count(worker_title)>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
-- select * from worker where MOD (WORKER_ID, 2) != 0; 

 select * from Worker where MOD (WORKER_ID, 2) != 0; 

-- Q-27. Write an SQL query to show only even rows from a table. 

select * from Worker where MOD (WORKER_ID, 2) = 0; 

-- Q-28. Write an SQL query to clone a new table from another table.

  create table worker_clone like Worker;
  insert into worker_clone select * from Worker;
  select * from worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.

select Worker.* from Worker  inner join worker_clone  using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS

select * from Worker left join worker_clone using(worker_id) where worker_clone.worker_id is null;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL

select current_date();
select now();


-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

select * from Worker order by salary desc limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select * from Worker order by salary desc limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.

SELECT 
    *
FROM
    Worker AS w1
WHERE
    4 = (SELECT 
            COUNT(DISTINCT (w2.salary))
        FROM
            Worker AS w2
        WHERE
            w2.salary >= w1.salary);
  
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

select w1.* from Worker as w1 , Worker as w2 where w1.salary=w2.salary and w1.worker_id != w2.worker_id;  

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from Worker;
select * from Worker as w1 where 2 = (select count(distinct w2.salary) from Worker as w2 where w2.salary>= w1 .salary);

select max(salary) from Worker where salary not in(select max(salary) from Worker);

select * from Worker order by salary desc limit 2,1;  

-- Q-37. Write an SQL query to show one row twice in results from a table.

select * from Worker
union all
select * from Worker order by worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

select worker_id from Worker  where worker_id not in (select worker_ref_id from Bonus where worker_ref_id);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

select * from Worker where worker_id <= (select count(worker_id)/2 from Worker); 


-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

select department, count(department) as depCount from Worker group by department having depCount<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

select department, count(department) as depCount from Worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.

select * from Worker where worker_id = (select max(worker_id) from Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.

select * from Worker where worker_id = (select min(worker_id) from Worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.

(select * from Worker order by worker_id desc limit 5) order by worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

 select w.department,w.first_name,w.salary from (select max(salary) as maxsal, department from Worker group by department)  temp
 inner join Worker w on temp.department = w.department and  temp.maxsal = w.salary; 
 

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery

SELECT DISTINCT
    salary
FROM
    Worker w1
WHERE
    3 >= (SELECT 
            COUNT(DISTINCT salary)
        FROM
            Worker w2
        WHERE
            w1.salary <= w2.salary)
ORDER BY salary DESC;


-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

SELECT DISTINCT
    salary
FROM
    Worker w1
WHERE
    3 >= (SELECT 
            COUNT(DISTINCT salary)
        FROM
            Worker w2
        WHERE
            w1.salary >= w2.salary)
ORDER BY salary ;

select salary from Worker order by salary limit 3;


-- Q-48. Write an SQL query to fetch nth max salaries from a table.
 
 SELECT DISTINCT
    salary
FROM
    Worker w1
WHERE
    n >= (SELECT 
            COUNT(DISTINCT salary)
        FROM
            Worker w2
        WHERE
            w1.salary <= w2.salary)
ORDER BY salary ;
  

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select department , sum(salary) as salary from Worker group by department order by salary desc;


-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
       
       select first_name, salary  from Worker order by salary desc limit 1;
       
       select first_name, salary  from Worker where salary = (select max(salary) from Worker);


 

