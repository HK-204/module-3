create database demo;
use demo;

create table products(
	Id int auto_increment primary key,
    productCode varchar(50),
    productName varchar(100),
    productPrice decimal(10, 2),
    productAmount int,
    productDescription text,
    productStatus varchar(20)
);

insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values
	('P001', 'Ikea desk', 1200.00, 10, 'Desk Ikea for study', 'active'),
    ('P002', 'AIM Erd', 1100.00, 8, 'AIM Erd for 27 inch', 'active'),
    ('P003', 'MacBook Pro', 2000.00, 5, 'Apple MacBook Pro 14"', 'inactive'),
    ('P004', 'Asus ZenBook', 900.00, 12, 'Asus ZenBook 14', 'active');
    
create unique index idx_pcode on products(productCode);
create index idx_nameprice on products(productName, productPrice);
explain select * from products where productCode = 'P003';
explain select * from products where productName = 'AIM Erd' and productPrice = 1100.00;

create view view_products as
select productCode, productName, productPrice, productStatus from products;

create or replace view view_products as
select productCode, productName, productPrice, productAmount, productStatus from products;

drop view view_products

delimiter //
create procedure GetAllProducts()
begin
	select * from products;
end //
delimiter ;

delimiter //
create procedure AddProducts(
	in pCode varchar(50),
    in pName varchar(100),
    in pPrice decimal(10, 2),
    in pAmount int,
    in pDescription text,
    in pStatus varchar(20)
)
begin 
	insert into Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    values (pCode, pName, pPrice, pAmount, pDescription, pStatus);
end //
delimiter ;

delimiter //
create procedure UpdateProductById(
	in pId int,
    in pCode varchar(50),
    in pName varchar(100),
    in pPrice decimal(10, 2),
    in pAmount int,
    in pDescription text,
    in pStatus varchar(20)
)
begin
	update Products
    set productCode = pCode,
		productName = pName,
        productPrice = pPrice,
        productAmount = pAmount,
        productDescription = pDescription,
        productStatus = pStatus
	where Id = pId;
end //
delimiter ;

delimiter //
create procedure DeleteProductById(
	in pId int
)
begin 
	delete from Products where Id = pId;
end //
delimiter ;
