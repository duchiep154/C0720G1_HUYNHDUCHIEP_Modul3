<%@ page import="model.Customer" %>
<%@ page import="dao.Manager" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 03-Nov-20
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  </head>
  <body>
  <table class="table">
    <%
      List<Customer> customerList = Manager.getCustomer();
      request.setAttribute("customerList", customerList);
    %>
    <thead>
    <tr>
      <th scope="col">TÊN</th>
      <th scope="col">NGÀY SINH</th>
      <th scope="col">ĐỊA CHỈ</th>
      <th scope="col">ẢNH</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var = "customer" items = "${requestScope.customerList}">

      <tr>
        <td><c:out value = "${customer.ten}"/></td>
        <td><c:out value = "${customer.ngaySinh}"/></td>
        <td><c:out value = "${customer.diaChi}"/></td>
        <td>
          <img style="height: 100px" src="<c:out value = "${customer.avatar}"/>">
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </body>
</html>
