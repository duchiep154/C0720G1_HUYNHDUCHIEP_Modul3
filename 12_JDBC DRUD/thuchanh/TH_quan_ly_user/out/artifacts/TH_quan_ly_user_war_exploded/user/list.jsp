<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 05-Nov-20
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User List Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

</head>
<body>
<h1 style="align-content: center">User list</h1>
<div style="margin-bottom: 10px" class="row">
    <div class="col-md-6">
        <a href="/users?action=create" role="button" class="btn btn-outline-dark">Create New User</a>
    </div>
    <div class="col-md-6">
        <form class="form-inline" action="/users">
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
        <th scope="col">email</th>
        <th scope="col">country</th>
        <th scope="col">edit</th>
        <th scope="col">delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items='${requestScope["listUser"]}' var="user">
        <tr>
            <td scope="row"><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td><a class="btn btn-warning" href="/users?action=edit&id=${user.id}">edit</a></td>
            <td><a  class="btn btn-danger" href="/users?action=delete&id=${user.id}">delete</a></td>
        </tr>


    </c:forEach>
    </tbody>
</table>


</body>
</html>