delimiter //
drop procedure if exists `finnAllCustomers`//
create procedure findAllCustomers()
begin
	select * from customers;
end //
delimiter ;