<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 11-Nov-20
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.22/css/dataTables.jqueryui.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
</head>
<div class="container">
    <h1>Information Product</h1>

    <h3 class="message">${messageComplete}</h3>

    <form action="/view" method="post">
        <input type="hidden" name="action" value="create" />
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
                    <c:when test="${category.idCategory.equals(product.idCategory)}">
                        <option value="<c:out value='${category.idCategory}'/>" selected><c:out value="${category.categoryName}"></c:out></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${category.idCategory}">${category.categoryName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        </div>

        <input type="submit" class="btn btn-info" value="Create New" /><span>
            <a href="/view" class="btn btn-info back">Back</a></span>

    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
</html>
