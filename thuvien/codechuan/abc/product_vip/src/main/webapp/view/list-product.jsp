
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>List Product</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 45px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
            min-width: 100%;
        }

        .table-title h2 {
            margin: 8px 0 0;
            font-size: 22px;
        }

        .search-box {
            position: relative;
            display: flex;
        }

        .search-box input#keywordPriceDisplay {

            border-radius: 20px;
            padding-left: 35px;
            border-color: #ddd;
            box-shadow: none;
        }

        .search-box input#keywordNameDisplay {

            border-radius: 20px;
            padding-left: 35px;
            border-color: #ddd;
            box-shadow: none;
        }

        .search-box input {

            border-radius: 20px;
        }

        .search-box input:focus {
            border-color: #3FBAE4;
        }

        .search-box i {
            color: #a0a5b1;
            position: absolute;
            font-size: 19px;
            top: 11px;
            left: 10px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child {
            width: 130px;
        }

        table.table td a {
            color: #a0a5b1;
            display: inline-block;
            margin: 0 5px;
        }

        table.table td a.view {
            color: #03A9F4;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #E34724;
        }

        table.table td i {
            font-size: 19px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 95%;
            width: 28px;
            height: 27px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 30px !important;
            text-align: center;
            padding: 0;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 6px;
            font-size: 95%;
        }

        .message {
            text-align: center;
            color: orangered;
        }

        p {
            color: red;
        }

        /*#search {*/
        /*    padding-left: 5px;*/
        /*}*/
    </style>

    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>

<h3 class="message">${messageComplete}</h3>

<div class="container-fluid">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 style="color: red">Product List</h1>
                        <p>
                            <%-- Create Chuyển Trang --%>
<%--                            <a href="/product?actionProduct=showCreateNewProduct"><h3>Create New Prodcut</h3></a>--%>


                                <%-- Create Modal--%>
                            <a href="#addProductModal" id="onlickProduct" class="btn btn-success" data-toggle="modal">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add New Product</span></a>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" name="nameProduct" class="form-control" id="keywordNameDisplay"
                                   placeholder="Search by Name">
                        </div>
                    </div>

                    <div class="col-sm-5">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" name="priceProduct" class="form-control" id="keywordPriceDisplay"
                                   placeholder="Search by Price">
                        </div>
                    </div>

                    <div class="col-sm-1">
                        <input type="button" value="Search" class="btn btn-primary"
                               onclick="submitFormSearchProduct()">
                    </div>

                    <div class="col-sm-1">
                        <a href="/product" class="btn btn-info back">Reset</a>
                    </div>
                </div>
            </div>

            <table id="tableProduct" class="table table-striped table-hover table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td><c:out value="${product.id}"/></td>
                        <td><c:out value="${product.name}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.quantity}"/></td>
                        <td>
                            <c:forEach var="color" items="${colorList}">
                                <c:choose>
                                    <c:when test="${color.id.equals(product.idColor)}">
                                        ${color.name}
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </td>
                        <td><c:out value="${product.description}"/></td>
                        <td>
                            <c:forEach var="category" items="${categoryList}">
                                <c:choose>
                                    <c:when test="${category.id.equals(product.idCategory)}">
                                        ${category.name}
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="/product?actionProduct=showDetailProduct&id=${product.id}" class="detail"
                               title="Detail"
                               data-toggle="tooltip"><i class="fa fa-eye" style="color: blue"></i></a>
                                <%-- Edit chuyển trang--%>
<%--                            <a href="/product?actionProduct=showEditProduct&id=${product.id}" class="edit"--%>
<%--                               title="Edit"--%>
<%--                               data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>--%>


                            <%--Edit Modal--%>
                            <a href="#" onclick="setProduct('${product.id}','${product.name}','${product.price}','${product.quantity}',
                                    '${product.idColor}','${product.description}','${product.idCategory}')"
                               class="edit"
                               id="onlickEditProduct"
                               data-toggle="modal" data-target="#editProductModal">
                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
<%--                            Edit Modal--%>

                            <a data-toggle="modal" data-target="#deleteProductModal" href="#"
                               onclick="setProductId('${product.id}')" class="delete" title="Delete"
                               data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <%--            <a href="/product" class="btn btn-info back">Back</a>--%>

            <div id="deleteProductModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/product">
                            <input type="hidden" name="actionProduct" value="deleteProduct"/>
                            <input type="hidden" name="id" id="idProduct"/>
                            <div class="modal-header">
                                <h4 class="modal-title">Delete Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="warning" style="width: 100%; color: red"/>
                                <p class="text-warning"><small style="color: blue">This action cannot be undone
                                    !</small>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-danger" value="Delete">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="addProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/product" method="post">
                <input type="hidden" name="actionProduct" value="createNewProduct" />

                <div class="modal-header">
                    <h4 class="modal-title">Add New Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

<%--                <div class="form-group has-success">--%>
<%--                    <label for="id">ID :</label>--%>
<%--                    <input type="text" class="form-control" name="id" id="id" value="${product.id}" required/>--%>
<%--                </div>--%>

                <div class="form-group has-success">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" id="name" value="${product.getName()}" />
                    <p>${messageName}</p>
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

                <div class="form-group">
                    <label>Select Color : </label>
                    <label for="color"></label><select name="idColor" id="color" required>
                    <c:forEach var="color" items="${colorList}">
                        <c:choose>
                            <c:when test="${color.id.equals(product.idColor)}">
                                <option value="<c:out value='${color.id}'/>" selected><c:out value="${color.name}"></c:out></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${color.id}">${color.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                </div>

                <div class="form-group has-error">
                    <label for="description">Description :</label>
                    <input type="text" class="form-control" name="description" id="description" value="${product.description}" required/>
                </div>

                <div class="form-group">
                    <label>Select Category : </label>
                    <label for="category"></label><select name="idCategory" id="category" required>
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
                <input type="submit" class="btn btn-info" value="Create New" /><span>
            <a href="/product" class="btn btn-info back">Back</a></span>
            </form>
        </div>
    </div>
</div>

<div id="editProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/product" method="post">
                <input type="hidden" name="actionProduct" value="updateProduct"/>

                <div class="modal-header">
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <div class="form-group has-success">
                    <label for="idEdit">ID :</label>
                    <input type="text" class="form-control" name="id" id="idEdit" value="${product.id}" readonly/>
                </div>

                <div class="form-group has-success">
                    <label for="nameEdit">Name :</label>
                    <input type="text" class="form-control" name="name" id="nameEdit" value="${product.name}" />
                    <p>${messageName}</p>
                </div>

                <div class="form-group has-error">
                    <label for="priceEdit">Price :</label>
                    <input type="text" class="form-control" name="price" id="priceEdit" value="${product.price}" required/>
                    <p>${messagePrice}</p>
                </div>

                <div class="form-group has-error">
                    <label for="quantityEdit">Quantity :</label>
                    <input type="text" class="form-control" name="quantity" id="quantityEdit" value="${product.quantity}" required/>
                    <p>${messageQuantity}</p>
                </div>

                <div class="form-group">
                    <label>Select Color : </label>
                    <label for="colorEdit"></label><select name="idColor" id="colorEdit" required>
                    <c:forEach var="color" items="${colorList}">
                        <c:choose>
                            <c:when test="${color.id.equals(product.idColor)}">
                                <option value="<c:out value='${color.id}'/>" selected>
                                    <c:out value="${color.name}"></c:out></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${color.id}">${color.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                </div>

                <div class="form-group has-error">
                    <label for="descriptionEdit">Description :</label>
                    <input type="text" class="form-control" name="description" id="descriptionEdit" value="${product.description}" required/>
                </div>

                <div class="form-group">
                    <label>Select Category : </label>
                    <label for="categoryEdit"></label><select name="idCategory" id="categoryEdit" required>
                    <c:forEach var="category" items="${categoryList}">
                        <c:choose>
                            <c:when test="${category.id.equals(product.idCategory)}">
                                <option value="<c:out value='${category.id}'/>" selected>
                                    <c:out value="${category.name}"></c:out></option>
                            </c:when>
                            <c:otherwise>
                                <option value="${category.id}">${category.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                </div>

                <input type="submit" class="btn btn-info" value="Update"/><span>
            <a href="/product" class="btn btn-info back">Back</a></span>
            </form>
        </div>
    </div>
</div>

<form method="post" action="/product" id="formSearchProduct">
    <input type="hidden" name="actionProduct" value="searchProduct">
    <input type="hidden" name="nameProduct" id="keywordNameHidden"/>
    <input type="hidden" name="priceProduct" id="keywordPriceHidden"/>
    <input hidden type="submit" value="Search"/>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>

<script>
    function setProductId(id) {
        document.getElementById("idProduct").value = id;
        document.getElementById("warning").value = "Are you sure you want to delete Product have id is " + id + " ?";
    }

    function submitFormSearchProduct() {
        let keywordNameHidden = document.getElementById("keywordNameHidden");
        let keywordNameDisplay = document.getElementById("keywordNameDisplay");
        keywordNameHidden.value = keywordNameDisplay.value;

        let keywordPriceHidden = document.getElementById("keywordPriceHidden");
        let keywordPriceDisplay = document.getElementById("keywordPriceDisplay");
        keywordPriceHidden.value = keywordPriceDisplay.value;

        document.getElementById("formSearchProduct").submit();
    }

    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

<script>
    function setProduct(id, name, price, quantity, idColor, description, idCategory) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("priceEdit").value = price;
        document.getElementById("quantityEdit").value = quantity;
        document.getElementById("colorEdit").value = idColor;
        document.getElementById("descriptionEdit").value = description;
        document.getElementById("categoryEdit").value = idCategory;
    }
</script>

<script>
    let message = '<%=request.getAttribute("messageComplete")%>';
    // let message = document.getElementById("messageID").value;

    if (message === "Wrong Validate Create !") {
        document.getElementById("onlickProduct").click();
    }

    if (message === "Wrong Validate Edit !") {
        document.getElementById("onlickEditProduct").click();
    }
</script>

<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>

</body>
</html>