Use Sakila

-- Select all the actors with the first name ‘Scarlett’
select * from actor
where first_name = 'Scarlett';
-- 2 Actors are named Scarlett 

-- How many films (movies) are available for rent and how many films have been rented?
select * from inventory;
select count(distinct inventory_id) from inventory;
-- 4581 movie in inventory
select * from rental;
select count(distinct rental_id) from rental;
-- 16 044 has been rented between 2005/05/24 and  2005/08/23

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select * from film;
select min(length) as min_duration from film;
select max(length) as max_duration from film;
-- min_duration = 46mn and max_duration = 185mn

-- What's the average movie duration expressed in format (hours, minutes)?
select length from film;
select convert(varchar, avg(length), 8) from film;
-- 1h55mn

-- How many distinct (different) actors' last names are there?
select count(distinct last_name) from actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
select * from rental;
select datediff(min(return_date), max(return_date)) from rental;
-- operating 100 days, I don't know where to get the data

-- Show rental info with additional columns month and weekday. Get 20 results.
select *, date_format(convert(rental_date, date), "%M") as month, date_format(convert(rental_date, date), "%W") as Weekday from rental
limit 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select 
*, 
date_format(convert(rental_date, date), "M") as month,
date_format(convert(rental_date, date), "W") as Weekday,
case
when date_format(convert(rental_date, date), "W") = 'Saturday' then 'weekend'
when date_format(convert(rental_date, date), "W") = 'Sunday' then 'weekend'
else 'Workday'
end as Day
from rental;

select 
*, 
date_format(convert(rental_date, date), '%M') as month, 
date_format(convert(rental_date, date), '%W') as Weekday, 
case 
when date_format(convert(rental_date, date), '%M') = 'Saturday' then 'weekend' 
when date_format(convert(rental_date, date), '%M') = 'Sunday' then 'weekend' 
else 'Workday' 
end as Day 
from rental;



-- Get release years.
select *, EXTRACT(year FROM(convert(rental_date, date))) as Year from rental;

-- Get all films with ARMAGEDDON in the title.
select title from film
where title like '%ARMAGEDDON%';

select title from film 
where title regexp 'ARMAGEDDON$' or title regexp '^ARMAGEDDON'
limit 100;


-- Get all films which title ends with APOLLO.
select * from film
where title like '%APOLLO';

-- Get 10 the longest films.
select title, length from film
order by length desc
limit 10;

-- How many films include Behind the Scenes content?
select title, special_features from film
where special_features like '%Behind the Scenes';

select count(special_features like '%Behind the Scenes%') from film
group by count(special_features like '%Behind the Scenes%')

-- 538 films

