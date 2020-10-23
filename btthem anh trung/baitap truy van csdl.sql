use `bai tap them 20/10`;

-- THAO TÁC DỮ LIỆU
-- 01 Viết câu lệnh UPDATE để cập nhật Price với điều kiện: Các mặt hàng có Price <= 1000 thì tăng thêm 10
SELECT * FROM baitapthem2210.products;
 update products set price= price + 10
 where products.price <=1000;
 
 -- 02 Viết câu lệnh UPDATE để cập nhật DISCOUNT với điều kiện: Các mặt hàng có Discount <= 10 thì tăng thêm 5
 SELECT * FROM baitapthem2210.products;
 update products set discount= discount + 5
 where products.discount <=10;
 
 -- 03 Viết câu lệnh XOÁ tất cả các mặt hàng có Stock là 0
 SELECT * FROM baitapthem2210.products;
 DELETE  FROM `products` WHERE (products.stock = '0');
 
 -- C TRUY VẤN DỮ LIỆU
 -- 01 Hiển thị tất cả các mặt hàng có giảm giá <= 10
 select * from products where products.discount <= 10;
 
 -- 02 Hiển thị tất cả các mặt hàng có tồn kho <= 5 
 select * from products where products.stock <=5;
 
 -- 03 Hiển thị tất cả các mặt hàng có Giá bán sau khi đã giảm giá <= 1000
 select * from products where products.price * ((100-products.discount)/100) <=1000;
 
 -- 04 Hiển thị tất cả các khách hàng có địa chỉ ở Đà Nẵng
 select * from customers where customers.address like "Đà Nẵng";
 
 -- 05 Hiển thị tất cả các khách hàng có năm sinh 1990
 select * from customers where  year(customers.birthday)=1990;
 
 -- 06 Hiển thị tất cả các khách hàng có sinh nhật là hôm nay
 
 select * from customers where day(customers.birthday)=day(now()) and month(customers.birthday)=month(now());
 
 -- 07 Hiển thị tất cả các đơn hàng có trạng thái là DONE
 select * from orders where orders.status like "Done";
 
 -- 08 Hiển thị tất cả các đơn hàng có trạng thái là COMPLETED trong ngày hôm nay
 
-- select * from orders where orders.status like "Completed"  chưa xong
 
 -- 09 Hiển thị tất cả các đơn hàng có trạng thái là CANCELED
 select * from orders where orders.status like "Canceled";
 
 -- 10 Hiển thị tất cả các đơn hàng có trạng thái là CANCELED trong ngày hôm nay
 
 -- 11 Hiển thị tất cả các đơn hàng có hình thức thanh toán là CASH
 select * from orders where orders.payment_method like "Cash";
 
 -- 12 Hiển thị tất cả các đơn hàng có hình thức thanh toán là CREADIT CARD
  select * from orders where orders.payment_method like "CREADIT CARD";
  
-- 13 Hiển thị tất cả các đơn hàng có địa chỉ giao hàng là Hà Nội
select * from orders where orders.address_receiver like "Hà Nội";

-- 14 Hiển thị tất cả các nhân viên có sinh nhật là hôm nay

 select * from employees where day(employees.birthday)=day(now()) and month(employees.birthday)=month(now());
 
 -- 15 Hiển thị tất cả các nhà cung cấp có tên là: (Yamaha, SAMSUNG, Nestle, APPLE)
 
 select * from suppliers where suppliers.name IN('Yamaha','SamSung','Nestle','Apple');
 