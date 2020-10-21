select customers.customerNumber, customerName, phone, paymentDate, amount from customers
inner join payments
on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas'

-- Để tìm tất cả các đơn hàng thuộc từng khách hàng, bạn có thể sử dụng mệnh đề LEFT JOIN như sau:
select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
left join orders
on customers.customerNumber = orders.customerNumber 

-- Nếu bạn thay thế mệnh đề LEFT JOIN bởi mệnh đề INNER JOIN, bạn chỉ nhận được những khách hàng có đơn đặt hàng trong bảng đơn đặt hàng.

-- Để tìm tất cả khách hàng chưa đặt hàng bất kỳ sản phẩm nào, bạn có thể sử dụng truy vấn sau: 

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers LEFT JOIN orders
on customers.customerNumber = orders.customerNumber
where orderNumber is null
