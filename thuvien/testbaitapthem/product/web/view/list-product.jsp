<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 08-Nov-20
  Time: 9:17 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
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

        .search-box input#keywordProductDisplay {

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

        #search {
            padding-left: 5px;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });



    </script>
</head>
<body>

<h3 class="message"><c:out value="${message}"/></h3>

<div class="container-fluid">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8">
                        <a href="/product"><h1 style="color: red">Product List</h1></a>
                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelCreate">
                            Create Product
                        </button>
<%--                        <p>--%>
<%--                            <a href="/product?actionProduct=showCreateNewProduct"><h3>Create New Product</h3></a>--%>
<%--                        </p>--%>
                    </div>
                    <div class="col-sm-4">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" name="nameProduct" class="form-control" id="keywordProductDisplay"
                                   placeholder="Search by Name">
                            <input type="button" value="Search" class="btn btn-primary"
                                   onclick="submitFormSearchProduct()">
                        </div>
                    </div>
                </div>
            </div>

            <table id="tableProduct" class="table table-striped table-bordered table-hover" style="width:100%">
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
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.quantity}</td>
                            <td>${product.color}</td>
                            <td>${product.description}</td>
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
                                   data-toggle="tooltip"><i class="fa fa-eye" style="color: #0000ff"></i></a>

                                <a data-toggle="modal" data-target="#modelEdit"  href="#"
                                   onclick="editProductId('${product.id}','${product.name}','${product.price}','${product.quantity}','${product.color}','${product.color}','${product.description}','${product.idCategory}')" class="edit"
                                      title="Edit"
                                    data-toggle="tooltip" >
                                  <i class="material-icons">&#xE254;</i>
                                </a>

                                <a data-toggle="modal" data-target="#deleteProductModal" href="#"
                                   onclick="setProductId('${product.id}')"
                                    class="delete" title="Delete"
                                   data-toggle="tooltip">
                                    <i class="material-icons">&#xE872;</i>
                                </a>

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
                                <input type="text" id="warning" style="width: 100%; color: red" />
                                <p class="text-warning"><small style="color: #0000ff">This action cannot be undone !</small>
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
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="modelEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">update product information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div>
                <div class="modal-body">
                    <form action="/product" method="post">
                            <input type="hidden" name="actionProduct" value="updateProduct" />
                                <div class="form-group has-success">
                                    <label for="idProductEdit">ID :</label>
                                    <input type="text" class="form-control" name="id" id="idProductEdit" value="${product.id}" readonly/>
                                </div>
                                <div class="form-group has-success">
                                    <label for="nameProduct">Name :</label>
                                    <input type="text" class="form-control" name="name" id="nameProduct" value="${product.name}" required/>
                                </div>
                                <div class="form-group has-warning">
                                    <label for="priceProduct">Price :</label>
                                    <input type="text" class="form-control" name="price" id="priceProduct" value="${product.price}" required/>
                                    <p>${messagePrice}</p>
                                </div>

                                <div class="form-group has-error">
                                    <label for="quantityProduct">Quantity :</label>
                                    <input type="text" class="form-control" name="quantity" id="quantityProduct" value="${product.quantity}" required/>
                                    <p>${messageQuantity}</p>
                                </div>

                                <div class="form-group has-success">
                                    <label for="colorProduct">Color :</label>
                                    <input type="text" class="form-control" name="color" id="colorProduct" value="${product.color}" required/>
                                </div>

                                <div class="form-group has-warning">
                                    <label for="descriptionProduct">Description :</label>
                                    <input type="text" class="form-control" name="description" id="descriptionProduct" value="${product.description}" required/>
                                </div>

                                <div class="form-group">
                                    <label>Select Category : </label>
                                    <label for="category"></label>
                                    <select name="category" id="category" required>
                                        <c:forEach var="category" items="${categoryList}">
                                            <c:choose>
                                                <c:when test="${category.id.equals(product.idCategory)}">
                                                    <option value="<c:out value='${category.id}'/>" selected ><c:out value="${category.name}"> </c:out></option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" value="update">Save</button>
                                </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/product" method="post">
                    <input type="hidden" name="actionProduct" value="createNewProduct" />

                    <div class="form-group has-success">
                        <label for="id">ID :</label>
                        <input type="text" class="form-control" name="id" id="id" value="${product.id}" required/>
                        <p>${messageID}</p>
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
                        <label for="categoryNew"></label>
                        <select name="category" id="categoryNew" required>
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
                    <div>
                            <input type="submit" class="btn btn-info" value="Create New" />
                            <span>
                             <a href="/product" class="btn btn-info back">Back</a>
                            </span>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<form method="post" action="/product" id="formSearchProduct">
    <input type="hidden" name="actionProduct" value="searchProduct">
    <input type="hidden" name="nameProduct" id="keywordProductHidden"/>
    <input hidden type="submit" value="Search"/>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>

<script>
    function setProductId(id) {
        document.getElementById("idProduct").value = id;
        document.getElementById("warning").value = "Are you sure you want to delete Product have id is " + id + " ?";
    }
    function editProductId(id,name,price,quantity,color,description,idCategory) {
        console.log(id,name,price,quantity,color,description,idCategory);
        document.getElementById("idProductEdit").value=id;
        document.getElementById("nameProduct").value=name;
        document.getElementById("priceProduct").value=price;
        document.getElementById("quantityProduct").value=quantity;
        document.getElementById("colorProduct").value=color;
        document.getElementById("descriptionProduct").value=description;
        document.getElementById("idCategory").value=idCategory;

    }

    function submitFormSearchProduct() {
        let keywordHidden = document.getElementById("keywordProductHidden");
        let keywordDisplay = document.getElementById("keywordProductDisplay");
        keywordHidden.value = keywordDisplay.value;
        document.getElementById("formSearchProduct").submit();
    }

    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>

<script>
    $(document).ready(function (){
        $('#modelCreate').on('hidden.bs.modal', function (e) {
            alert('thanh cong');
        });

    });

</script>

</body>
</html>
