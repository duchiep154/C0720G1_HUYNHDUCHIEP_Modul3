<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 13-Nov-20
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
    <title>Update Product</title>

    <style>
        .message {
            text-align: center;
            color: deeppink;
        }

        h1 {
            text-align: center;
        }

        .btn {
            background-color: violet
        }

        .back {
            margin-left: 10px;
        }

        input {
            font-weight: bold;
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
<jsp:include page="_header.jsp"></jsp:include>

<body>
<div class="container">
    <h1>Information Product</h1>

    <h3 class="message">${messageComplete}</h3>

    <form action="/home" method="post">
        <input type="hidden" name="action" value="edit" />

        <div class="form-group has-success">
            <label for="id">ID :</label>
            <input type="text" class="form-control" name="id" id="id" value="${product.id}" readonly/>
        </div>

        <div class="form-group has-success">
            <label for="name">Name :</label>
            <input type="text" class="form-control" name="name" id="name" value="${product.name}" required/>
        </div>

        <div class="form-group has-warning">
            <label for="price">Price :</label>
            <input type="text" class="form-control" name="price" id="price" value="${product.price}" required/>
            <p>${messagePrice}</p>
        </div>

        <div class="form-group has-error">
            <label for="quantity">Quantity :</label>
            <input type="text" class="form-control" name="quantity" id="quantity" value="${product.quantity}" required/>
            <p>${messageQuantity}</p>
        </div>

        <div class="form-group has-success">
            <label for="color">Color :</label>
            <input type="text" class="form-control" name="color" id="color" value="${product.color}" required/>
        </div>

        <div class="form-group has-warning">
            <label for="description">Description :</label>
            <input type="text" class="form-control" name="description" id="description" value="${product.description}" required/>
        </div>

        <div class="form-group">
            <label>Select Category : </label>
            <label for="category"></label><select name="category" id="category" required>
            <c:forEach var="category" items="${categoryList}">
                <c:choose>
                    <c:when test="${category.id.equals(product.idCategory)}">
                        <option value="<c:out value='${category.id}'/>" selected><c:out value="${category.name}"></c:out></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${category.id}">${category.name}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        </div>

        <input type="submit" class="btn btn-info" value="edit" /><span>
            <a href="/home" class="btn btn-info back">Back</a></span>

    </form>

</div>
</body>
<jsp:include page="_footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</html>
