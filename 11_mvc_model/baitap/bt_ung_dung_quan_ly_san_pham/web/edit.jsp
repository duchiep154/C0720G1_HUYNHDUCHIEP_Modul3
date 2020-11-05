<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 05-Nov-20
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>edit product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</head>
<body>
<form class="form" action="/home?action=edit" method="post">
    <fieldset>
        <legend>Update Information</legend>
        <div class="form-group col-md-4">
            <label>id</label>
            <input class="form-control" type="text" value="<c:out value="${product.id}"/>"name="id">
        </div>
        <div class="form-group col-md-4">
            <label>Name</label>
            <input class="form-control" type="text" value="<c:out value="${product.name}"/>"name="name">
        </div>

        <div class="form-group col-md-4">
            <label>Price</label>
            <input class="form-control" type="text" value="<c:out value="${product.price}"/>"name="price">
        </div>

        <div class="form-group col-md-4">
            <label>Description</label>
            <%--            <textarea class="form-control" id="description" name="description" value='${product.description}' rows="3"></textarea>--%>
            <input class="form-control" type="text" value="<c:out value="${product.description}"/>"name="description">
        </div>

        <div class="form-group col-md-4">
            <label>Producer</label>
            <input class="form-control" type="text" value="<c:out value="${product.producer}"/>"name="producer">
        </div>

        <div class="form-group col-md-4">
            <input class="btn btn-outline-dark" type="submit" value="edit">
            <a role="button" href="/home" class="btn btn-outline-dark">Back</a>
        </div>
    </fieldset>


</form>

</body>
</html>
