/* dw_filmstore  */
use dw_filmstore;

create table dw_filmstore.d_customer as 
select c.customer_id, c.first_name, c.last_name, c.email, 
a.address, a.address2, ct.city, a.district, ctry.country, a.location, a.phone, a.postal_code, c.create_date
from sakila.customer c
join sakila.address a on c.address_id = a.address_id
join sakila.city ct on a.city_id = ct.city_id
join sakila.country ctry on ct.country_id = ctry.country_id
order by customer_id
;

drop table d_customer
;

select * from d_customer
;

select * from sakila.film

create table actor
as 
select *
from sakila.actor a
;

create table d_film
as
select f.film_id, f.title, f.description, f.length, f.rating, f.release_year, f.rental_duration, f.rental_rate, f.replacement_cost, f.special_features,
	l.name as language_name, ol.name as original_language_name, c.name as category_name, ft.title as fttitle, ft.description as ftdesc
from sakila.film f
left join sakila.film_category fc
	on f.film_id = fc.film_id
left join sakila.category c
	on fc.category_id = c.category_id
left join sakila.language l
	on f.language_id = l.language_id
left join sakila.language ol
	on f.original_language_id = ol.language_id
left join sakila.film_text ft
	on f.film_id = ft.film_id
;
    

customer, address, city, country

actor

film, film_category, category, film_text, language

store, staff, address, city, country

payment

rental

film_actor
