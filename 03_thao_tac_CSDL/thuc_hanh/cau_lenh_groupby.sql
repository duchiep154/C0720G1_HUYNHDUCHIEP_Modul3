-- Để biết được có bao nhiêu trạng thái của đơn hàng. Thực hiện như thế nào?
-- Sử dụng câu lệnh select status from orders thì sẽ trả về toàn bộ số bản ghi trong bảng đơn hàng, kể cả những bản ghi có trạng thái trùng nhau, tức là kết quả trả về như hình dưới, 
-- chúng ta sẽ không thể thực hiện việc đếm hay tự lọc bằng mắt để lấy về các trạng thái của đơn hàng vì số lượng bản ghi trả về rất nhiều.
-- Để giải quyết vấn đề trên chúng ta sử dụng mệnh đề group by với cột status như sau

select status from orders 
group by status

-- Bước 2: Sử dụng các hàm tập hợp với mệnh đề group by
-- Các hàm tập hợp (SUM, MAX, MIN, COUNT, AVG) cho phép tính toán một tập các hàng và trả về một giá trị duy nhất.
-- Mệnh đề group by thường được sử dụng với một hàm tập để thực hiện việc tính toán và trả về một giá trị cho mỗi nhóm.
-- Bài toán đặt ra như sau muốn biết có bao nhiêu đơn đặt hàng trong mỗi trạng thái, chúng ta có thể sử dụng hàm COUNT với mệnh đề GROUP BY như sau:

select status, COUNT(*) as 'So luong status'
from orders
group by status

-- Bước 3: Sử dụng group by với hàm tập hợp truy vấn trên hai bảng.
-- Hãy thực hiện tính tổng số tiền của các đơn hàng theo trạng thái đặt hàng.
-- Ta sẽ sử dụng lệnh inner join để kết nối 2 bảng và sử dụng hàm sum để tính tổng số tiền, nhóm theo trường status.
-- Lệnh truy vấn được như sau:

select status, sum(quantityOrdered * priceEach) as amount
from orders 
inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status

-- Bước 4: Một yêu cầu khác là tính tổng tiền của từng đơn hàng, thực hiện lệnh truy vấn sau:

select orderNumber, sum(quantityOrdered * priceEach) as total
from orderdetails
group by orderNumber;

-- Bước 5: GROUP BY với mệnh đề HAVING
-- Để lọc các nhóm được trả về bởi mệnh đề GROUP BY, chúng ta sử dụng mệnh đề HAVING.
-- Truy vấn sau đây sử dụng mệnh đề HAVING để bao gồm tổng doanh thu của những năm lớn hơn năm 2003.

select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
from orders 
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
where status = 'shipped'
group by year
having year > 2003

