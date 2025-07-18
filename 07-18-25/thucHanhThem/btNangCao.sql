-- 1
select CATE.name, CI.city, sum(PAY.amount) from city CI
join address AD on CI.city_id = AD.city_id
join customer CS on AD.address_id = CS.address_id
join payment PAY on CS.customer_id = PAY.customer_id
join rental R on PAY.rental_id = R.rental_id
join inventory I on R.inventory_id = I.inventory_id
join film F on I.film_id = F.film_id
join film_category FCATE on F.film_id = FCATE.film_id
join category CATE on FCATE.category_id = CATE.category_id
group by CATE.name, CI.city
having sum(PAY.amount) > 10
order by sum(PAY.amount) desc;

-- 1
select 
	s.staff_id,
    case
		when hour(p.payment_date) between 6 and 9 then 'sang'
        when hour(p.payment_date) between 10 and 12 then 'trua'
        when hour(p.payment_date) between 13 and 17 then 'chieu'
        when hour(p.payment_date) between 18 and 23 then 'toi'
        else 'khac'
	end time_slot,
    sum(p.amount) as total_revenue
from staff s
join payment p on s.staff_id = p.staff_id
group by s.staff_id, time_slot
having sum(p.amount) > 200
order by s.staff_id desc, sum(p.amount) desc;

-- 2
select 
	c.customer_id, 
    concat(c.first_name, ' ', last_name) as full_name,
    sum(p.amount) as total_payment,
    case
		when sum(p.amount) > 200 then 'VIP'
        when sum(p.amount) > 100 then 'Tiem nang'
        when sum(p.amount) <= 100 then 'Moi'
	end status
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, full_name
having total_payment > 0
order by total_payment desc;

-- 3
select 
	s.store_id,
	f.film_id,
    f.title,
    case
		when max(r.return_date) is null then 'Dang thue'
        else 'Co san'
	end stock_status,
    count(distinct
		case
			when r.return_date is null then i.inventory_id
		end) as rented_count,
	count(distinct i.inventory_id) -  count(distinct
		case
			when r.return_date is null then i.inventory_id
		end) as available_count
from film f
join inventory i on f.film_id = i.film_id
join store s on i.store_id = s.store_id
left join rental r on i.inventory_id = r.inventory_id
group by s.store_id, f.film_id, f.title
order by s.store_id, f.film_id;