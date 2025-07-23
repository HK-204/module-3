EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

alter table customers add index idx_customerName(customerName);

EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

alter table customers add index idx_full_name(contactFirstName, contactLastName);

explain select * from customers where contactFirstName = 'Jean' or contactLastName = 'King';

ALTER TABLE customers DROP INDEX idx_full_name;