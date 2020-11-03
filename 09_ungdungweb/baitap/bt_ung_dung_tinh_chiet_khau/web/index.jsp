<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 02-Nov-20
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Ứng dụng Product Discount Calculator</title>
</head>
<body>
<h1>Ứng dụng Product Discount Calculator</h1>
<form action="/product" method="post">
  <input type="text" name="product_description" placeholder="Mô Tả SP">
  <input type="text" name="list_price" placeholder="Giá Niêm Yết SP">
  <input type="text" name="discount_percent" placeholder="Tỷ lệ chiết khấu (%)">
  <input type="submit" value="Calculate Discount">
</form>
</body>
</html>
