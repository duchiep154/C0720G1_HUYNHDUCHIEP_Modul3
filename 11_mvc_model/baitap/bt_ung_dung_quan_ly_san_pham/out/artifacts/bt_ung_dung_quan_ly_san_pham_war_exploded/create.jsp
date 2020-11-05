<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 05-Nov-20
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>create Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</head>
<body>
<form class="form" action="/home?action=create" method="post">
    <fieldset>
        <legend>Create New Customer</legend>
        <div class="form-group col-md-4">
            <label for="name">Name</label>
            <input type="text" id="name" class="form-control" name="name">
        </div>

        <div class="form-group col-md-4">
            <label for="price">Price</label>
            <input type="text" id="price" class="form-control" name="price">
        </div>

        <div class="form-group col-md-4">
            <label for="description">Description</label>
            <input type="text" id="description" class="form-control" name="description">
        </div>

        <div class="form-group col-md-4">
            <label for="producer">Producer</label>
            <input type="text" id="producer" class="form-control" name="producer">
        </div>

        <div class="form-group col-md-4">
            <input type="submit" role="button" class="btn btn-outline-dark">
            <a role="button" class="btn btn-outline-dark" href="/home">Back</a>
        </div>
    </fieldset>
</form>

</body>
</html>
