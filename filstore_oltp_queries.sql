use sakila;

select * 
from sakila.actor a
join sakila.actor b
where a.first_name = b.last_name
;

update sakila.actor
set last_name = 'GRACE'
where last_name = 'DAVIS'
;

select * 
from sakila.customer
where first_name = 'MARY'
;

update sakila.customer
set address_id = 6
where first_name = 'MARY'
and create_Date = '2025-01-20 08:43:29'
and customer_id = 1
;

insert into sakila.customer
select * 
from sakila.customer
where first_name = 'MARY'
;

alter table sakila.customer
drop primary key
;

select * 
from sakila.rental;

select *
from sakila.payment
;

select c.first_name, sum(amount)
from sakila.payment p
join sakila.customer c
on p.customer_id = c.customer_id
group by c.first_name
;

select customer_id, sum(amount)
from sakila.payment p
group by customer_id
;

ALTER TABLE `sakila`.`payment` 
DROP FOREIGN KEY `fk_payment_customer`;
ALTER TABLE `sakila`.`payment` 
DROP INDEX `idx_fk_customer_id` ;
;

create database dw_filmstore;

create table dw_filmstore.d_customer as 
select c.first_name, c.last_name, c.email, 
a.address, a.address2, ct.city, a.district, ctry.country, a.location, a.phone, a.postal_code, c.create_date
from sakila.customer c
join sakila.address a on c.address_id = a.address_id
join sakila.city ct on a.city_id = ct.city_id
join sakila.country ctry on ct.country_id = ctry.country_id
;

select * from film_text;








