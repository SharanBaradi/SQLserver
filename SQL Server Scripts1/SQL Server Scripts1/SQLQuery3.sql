use sharan;
--select * from Orders;
--select * from Customer;
select * from OrderItem;
--select * from Product;
--select * from Supplier;
SELECT ProductId 
          FROM OrderItem 
         WHERE Quantity = 1;