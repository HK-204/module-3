-- 1
explain select * from customer where first_name = 'WILLIAMS';
create index idx_first_name on customer(first_name);
drop index idx_first_name on customer;

-- 2
create index idx_sid_lname on customer(store_id, last_name);

-- 3
select last_name from customer
order by last_name;
create index idx_lname on customer(last_name);

-- 4
delimiter //
create procedure sp_list_actors()
begin
	select * from actor;
end //
delimiter ;

-- 5
delimiter //
create procedure sp_rental_by_customer(
	in c_id int
)
begin
	select * from rental
    where customer_id = c_id;
end //
delimiter ;

-- 6
delimiter //
create procedure sp_total_payment(
	in c_id int,
    out sum_payment decimal(10, 2)
)
begin
	select sum(amount) into sum_payment from payment
    where customer_id = c_id;
end //
delimiter ;

-- 7
create view v_film_short_info as
select title, description, release_year from film;

-- 8
create view v_customer_payment as
select c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date from customer c
join payment p on c.customer_id = p.customer_id;

-- 9
create view v_active_customers as
select * from customer
where active = 1
with check option;