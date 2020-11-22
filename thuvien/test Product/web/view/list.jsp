<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 10-Nov-20
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.22/css/dataTables.jqueryui.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">



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

</head>
<script>
    // $(document).ready( function () {
    //     $('#tableStudent').DataTable();
    // } );
</script>
<body>
<%--<%@ include file="header.jsp" %>--%>
<div class="container-fluid">
    <div class="body position-relative" style="top: 160px">
        <div class="text-center col-12">
            <a href="/view?action=create" role="button" class="btn btn-outline-dark float-left">Create New
                Product</a>
            <h2>List of Product</h2>
        </div>
        <form id="mainForm" method="post">
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
        </form>
        <c:if test="${messageInform != null}">
            <div class="alert alert-success col-4 d-flex justify-content-center" role="alert">
                    ${messageInform}
            </div>
        </c:if>
    </div>
</div>
<%--<%@ include file="../../footer.jsp" %>--%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
    window.setTimeout(function () {
        $(".alert").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 2000);

    $(document).ready(function () {
        $("#tableStudent").dataTable({
            "dom": "lrtip",
            "lengthChange": false,
            "pageLength": 5
        })
    });

    function editProduct(id) {
        document.getElementById(id + "Id1").style.display = "none";
        document.getElementById(id + "Name1").style.display = "none";
        document.getElementById(id + "Price1").style.display = "none";
        document.getElementById(id + "Amount1").style.display = "none";
        document.getElementById(id + "Color1").style.display = "none";
        document.getElementById(id + "Des1").style.display = "none";
        document.getElementById(id + "Cate1").style.display = "none";
        document.getElementById(id + "Action1").style.display = "none";

        document.getElementById(id + "Id2").style.display = "block";
        document.getElementById(id + "Name2").style.display = "block";
        document.getElementById(id + "Price2").style.display = "block";
        document.getElementById(id + "Amount2").style.display = "block";
        document.getElementById(id + "Color2").style.display = "block";
        document.getElementById(id + "Des2").style.display = "block";
        document.getElementById(id + "Cate2").style.display = "block";
        document.getElementById(id + "Action2").style.display = "block";
    }

    function editSkip(id) {
        document.getElementById(id + "Id1").style.display = "block";
        document.getElementById(id + "Name1").style.display = "block";
        document.getElementById(id + "Price1").style.display = "block";
        document.getElementById(id + "Amount1").style.display = "block";
        document.getElementById(id + "Color1").style.display = "block";
        document.getElementById(id + "Des1").style.display = "block";
        document.getElementById(id + "Cate1").style.display = "block";
        document.getElementById(id + "Action1").style.display = "block";

        document.getElementById(id + "Id2").style.display = "none";
        document.getElementById(id + "Name2").style.display = "none";
        document.getElementById(id + "Price2").style.display = "none";
        document.getElementById(id + "Amount2").style.display = "none";
        document.getElementById(id + "Color2").style.display = "none";
        document.getElementById(id + "Des2").style.display = "none";
        document.getElementById(id + "Cate2").style.display = "none";
        document.getElementById(id + "Action2").style.display = "none";
    }

    function editRest(id) {
        document.getElementById("mainForm").action = "/product?action=edit&id=" + id;
        document.getElementById("mainForm").submit();
    }
</script>
</body>
</html>

