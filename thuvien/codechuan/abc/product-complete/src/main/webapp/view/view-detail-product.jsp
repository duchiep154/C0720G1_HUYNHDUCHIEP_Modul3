<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/8/2020
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
          integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
          crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Information Product</title>

    <style>

        h1 {
            color: deeppink;
            text-align: center;
        }

        p {
            color: red;
        }

        .form-control {
            font-weight: bold;
            color: blue;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>Information Product</h1>

    <form>
        <div class="form-group has-success">
            <label for="id">ID :</label>
            <input type="text" class="form-control" name="id" id="id" value="${product.id}" readonly/>
        </div>

        <div class="form-group has-success">
            <label for="name">Name :</label>
            <input type="text" class="form-control" name="name" id="name" value="${product.name}" readonly/>
        </div>

        <div class="form-group has-warning">
            <label for="price">Price :</label>
            <input type="text" class="form-control" name="price" id="price" value="${product.price}" readonly/>
            <p>${messagePrice}</p>
        </div>

        <div class="form-group has-error">
            <label for="quantity">Quantity :</label>
            <input type="text" class="form-control" name="quantity" id="quantity" value="${product.quantity}" readonly/>
            <p>${messageQuantity}</p>
        </div>

        <div class="form-group has-success">
            <label for="color">Color :</label>
            <input type="text" class="form-control" name="color" id="color" value="${product.color}" readonly/>
        </div>

        <div class="form-group has-warning">
            <label for="description">Description :</label>
            <input type="text" class="form-control" name="description" id="description" value="${product.description}" readonly/>
        </div>

        <div class="form-group">
            <label>Category : </label>
            <span style="color: blue; font-weight: bold">
            <c:forEach var="category" items="${categoryList}">
                <c:choose>
                    <c:when test="${category.id.equals(product.idCategory)}">
                        <c:out value="${category.name}"></c:out>
                    </c:when>
                </c:choose>
            </c:forEach>
            </span>
        </div>
        <a href="/product" class="btn btn-info back">Back</a>
    </form>

</div>
</body>
</html>