<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/14/2020
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 class="text-center mb-5">Create New Book</h1>
<div class="container">
    <form method="post" action="/books">
        <small style="color: red; margin-left: 10%; font-size: 100%"><c:if test="${messageId != ''}">${messageId}</c:if></small>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">ID</label>
            <input type="text" class="form-control col-8" name="id">
        </div>
        <small style="color: red; margin-left: 10%; font-size: 100%"><c:if test="${messageName != ''}">${messageName}</c:if></small>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">Name</label>
            <input type="text" class="form-control col-8" name="name">
        </div>
        <small style="color: red; margin-left: 10%; font-size: 100%"><c:if test="${messageCost != ''}">${messageCost}</c:if></small>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">Cost</label>
            <input type="text" class="form-control col-8" name="cost">
        </div>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">Description</label>
            <input type="text" class="form-control col-8" name="description">
        </div>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">ID</label>
            <select name="categoryId" class="form-control col-8">
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.key}">${category.value}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">Author</label>
            <select name="authorId" class="form-control col-8">
                <c:forEach items="${authorList}" var="author">
                    <option value="${author.key}">${author.value}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group row">
            <label style="width: 100px" class="col-form-label">Publisher</label>
            <select name="publisherId" class="form-control col-8">
                <c:forEach items="${publisherList}" var="publisher">
                    <option value="${publisher.key}">${publisher.value}</option>
                </c:forEach>
            </select>
        </div>
        <div class="row ml-auto">
            <a href="/books" class="btn btn-outline-primary mr-2" style="margin-left: 62%">Back</a>
            <button type="submit" name="action" value="create" class="btn btn-outline-success">Create</button>
        </div>
    </form>
</div>


</body>
</html>
