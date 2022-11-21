/* Q.1  CODE */
create table shopping_history (product varchar(80) not null , quantity int not null , unit_price int not null);
insert into shopping_history values('milk',3,10);
insert into shopping_history values('bread',2,20);
insert into shopping_history values('milk',5,30);
insert into shopping_history values('Ghee',3,100);
insert into shopping_history values('Curd',4,25);
insert into shopping_history values('Ghee',4,150);
insert into shopping_history values('Egg',3,30);
insert into shopping_history values('Curd',9,20);
insert into shopping_history values('Egg',4,10);
select * from shopping_history;

select product , (unit_price*quantity) as total_price from shopping_history group by product order by product desc ;

/* Q.2  CODE – Part1 */
create table phones ( name varchar(20) unique , phone_number int primary key);
insert into phones values ('Jack' , 1234);
insert into phones values ('Lena' , 3333);
insert into phones values ('Mark' , 9999);
insert into phones values ('Anna' , 7582);

create table calls ( id int primary key , caller int , callee int , duration int );
insert into calls values(25,1234,7582,8);
insert into calls values(7,9999,7582,1);
insert into calls values(18,9999,3333,4);
insert into calls values(2,7582,3333,3);
insert into calls values(3,3333,1234,1);
insert into calls values(21,3333,1234,1);

Select x.name from (select a.name, a.phone_number,
(ifnull(caller_duration,0) + ifnull(c.callee_duration,0)) as total_duration
From phones a
Left join 
(Select caller, sum(duration) as caller_duration from calls group by caller ) b
on a.phone_number = b.caller
Left join 
(Select callee, sum(duration) as callee_duration from calls group by callee ) c
on a.phone_number = c.callee 
) x
where x.total_duration>=10
order by x.name ;

/* Q.2 PART-2 */
create table phoness ( name varchar(20) unique , phone_number int primary key);
insert into phoness values ('Jhon' , 6356);
insert into phoness values ('Adisson' , 4315);
insert into phoness values ('Kate' , 8003);
insert into phoness values ('Ginny' ,9831);

create table callss ( idd int  , caller int , callee int , duration int );
insert into callss values(65,8003,9831,7);
insert into callss values(100,9831,8003,3);
insert into callss values(145,4315,9831,18);

 
select x.name from  (select p.name ,p.phone_number, (ifnull(a.callee_duration,0) + ifnull(b.caller_duration,0)) as total_duration  from phoness p
left join 
(select callee , sum(duration) as callee_duration from callss group by callee ) a
on p.phone_number = a.callee
left join
(select caller , sum(duration) as caller_duration from callss group by caller ) b
on p.phone_number = b.caller ) x
where x.total_duration>=10 order by x.name;

Q.3 CODE – PART1
Create table transactions(amount int not null ,dates date not null);
insert into transactions values(1000, '2020-01-05');
insert into transactions values(-10, '2020-01-14');
insert into transactions values(-75,'2020-01-20');
insert into transactions values(-5,'2020-01-25');
insert into transactions values(-4,'2020-01-29');
insert into transactions values(2000,'2020-03-10');
insert into transactions values(-75,'2020-03-12');
insert into transactions values(-20,'2020-03-15');
insert into transactions values(40,'2020-03-15');
insert into transactions values(-50,'2020-03-17');
insert into transactions values(200,'2020-10-10');
insert into transactions values(-200,'2020-10-10');

select (sum(a.monthly_transaction)+ b.debit_card_fine ) as account_balance from 
 (select sum(amount) as monthly_transaction , monthname(dates) as month_name from transactions group by month_name)  a ,
(select (-5*(12-count(month_name))) as debit_card_fine from
(select count(amount) as monthly_credit_transactions, sum(amount) as credit_card_transaction_amount ,
monthname(dates) as month_name from transactions where amount<0 group by month_name) x
 where x.monthly_credit_transactions>=3 and x.credit_card_transaction_amount<=-100) b  ;




/* Q.3 PART-2 */
Create table transactions(amount int not null ,dates date not null);
insert into transactions values(1, '2020-06-29');
insert into transactions values(35, '2020-02-20');
insert into transactions values(-50,'2020-02-03');
insert into transactions values(-1,'2020-02-26');
insert into transactions values(-200,'2020-08-01');
insert into transactions values(-44,'2020-02-07');
insert into transactions values(-5,'2020-02-25');
insert into transactions values(1,'2020-06-29');
insert into transactions values(1,'2020-06-29');
insert into transactions values(-100,'2020-12-29');
insert into transactions values(-100,'2020-12-30');
insert into transactions values(-100,'2020-12-31');
drop table transactions;
select (sum(a.monthly_transaction)+ b.debit_card_fine ) as account_balance from 
 (select sum(amount) as monthly_transaction , monthname(dates) as month_name from transactions group by month_name)  a ,
(select (-5*(12-count(month_name))) as debit_card_fine from
(select count(amount) as monthly_credit_transactions, sum(amount) as credit_card_transaction_amount ,
monthname(dates) as month_name from transactions where amount<0 group by month_name) x
 where x.monthly_credit_transactions>=3 and x.credit_card_transaction_amount<=-100) b  ;

Q3. PART-3
Create table transactions(amount int not null ,dates date not null);
insert into transactions values(6000, '2020-04-03');
insert into transactions values(5000, '2020-04-02');
insert into transactions values(4000,'2020-04-01');
insert into transactions values(3000,'2020-03-01');
insert into transactions values(2000,'2020-02-01');
insert into transactions values(1000,'2020-01-01');


select (sum(a.monthly_transaction)+ b.debit_card_fine ) as account_balance from 
 (select sum(amount) as monthly_transaction , monthname(dates) as month_name from transactions group by month_name)  a ,
(select (-5*(12-count(month_name))) as debit_card_fine from
(select count(amount) as monthly_credit_transactions, sum(amount) as credit_card_transaction_amount ,
monthname(dates) as month_name from transactions where amount<0 group by month_name) x
 where x.monthly_credit_transactions>=3 and x.credit_card_transaction_amount<=-100) b  ;
