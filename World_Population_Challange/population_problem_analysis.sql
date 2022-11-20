create table population ( country varchar(150) ,
area int ,
birth_rate decimal(38,2) ,
death_rate decimal(38,2) ,
infant_mortality_rate decimal(38,2) ,
internet_users int ,
life_exp_at_birth decimal(38,2) ,
mater178l_mortality_rate int ,
net_migration_rate decimal(38,2) ,
population int ,
population_growth_rate decimal(38,2));
load data local infile 
'C:/Users/Admin/Desktop/SQL_Projet_assg_data/population_data.csv'
into table population
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
select * from population;

/*  Answer1 - Highest population country  */
select country  from population order by population desc limit 1  ;

/*  Answer2 - Least population country  */
select country  from population order by population asc limit 1  ;

/*  Answer3 - Highest population growth country  */
select country ,population_growth_rate from population order by population_growth_rate desc limit 1  ;

/*Answer4 - Which country has an extraordinary number for the population?(means we need to find which country has highest population */
select country  from population order by population desc limit 1  ;

/*  Answer5 - most densely populated country in the world  */
select country ,(population/area)  as population_density from population order by (population/area) desc limit 1;
