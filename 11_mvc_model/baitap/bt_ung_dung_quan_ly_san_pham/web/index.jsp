<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 05-Nov-20
  Time: 8:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>ProductList</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
  </head>
  <body>

  <h1>Customers</h1>
  <div style="margin-bottom: 10px" class="row">
    <div class="col-md-6">
      <a href="/home?action=create" role="button" class="btn btn-outline-dark">Create New Product</a>
    </div>
    <div class="col-md-6">
      <form class="form-inline" action="/home">
        <input class="form-control mr-3" type="text" placeholder="Search" aria-label="Search" name="search">
        <input type="submit" value="search" name="action" class="btn btn-outline-dark">
      </form>
    </div>
  </div>
    <table class="table table-hover">
    <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">name</th>
      <th scope="col">price</th>
      <th scope="col">description</th>
      <th scope="col">producer</th>
      <th scope="col">edit</th>
      <th scope="col">delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items='${requestScope["productList"]}' var="product">
      <tr>
<%--        <td><a href="/?action=view&id=${product.getId()}">${product.getName()}</a></td>--%>
        <td>${product.getId()}</td>
        <td>${product.getName()}</td>
        <td>${product.getPrice()}</td>
        <td>${product.getDescription()}</td>
        <td>${product.getProducer()}</td>
        <td><a class="btn btn-warning" href="/home?action=edit&id=${product.getId()}">edit</a></td>
        <td><a  class="btn btn-danger" href="/customers?action=delete&id=${product.getId()}">delete</a></td>
      </tr>


    </c:forEach>
    </tbody>
  </table>
  </body>
</html>
