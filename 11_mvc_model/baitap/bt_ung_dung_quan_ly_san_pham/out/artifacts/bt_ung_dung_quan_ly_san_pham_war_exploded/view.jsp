<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 05-Nov-20
  Time: 10:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>viewProduct</title>
</head>
<body>
<div class="container-fluid">
    <h2>Detail Information</h2>
    <div class="row">
        <div class="col-xl-8">
            <table class="table table-sm table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>Information</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Id</td>
                    <td>${product.id}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${product.name}</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>${product.price}</td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>${product.description}</td>
                </tr>
                <tr>
                    <td>Producer</td>
                    <td>${product.producer}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-xl-4">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../image/iphone.jpg" class="d-block w-100 img-thumbnail" alt="Iphone">
                    </div>
                    <div class="carousel-item">
                        <img src="../image/iphone2.jpg" class="d-block w-100 img-thumbnail" alt="Iphone">
                    </div>
                    <div class="carousel-item">
                        <img src="../image/iphone3.jpg" class="d-block w-100 img-thumbnail" alt="Iphone">
                    </div>
                </div>
                <a class="carousel-control-prev carousel " href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon " aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon " aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <a role="button" href="/product?action=edit&id=${product.id}" class="btn btn-outline-dark">Edit <span class="fas fa-edit"></span></a>
    <a role="button" href="/home" class="btn btn-outline-dark">Back to Product List</a>
</div>

</body>
</html>
