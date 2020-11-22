<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/17/2020
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>

    <link rel="stylesheet" href="../css/bootstrap.css">

    <style>
        label {
            width: 150px;
        }

        input {
            width: 600px !important;
        }

        form {
            margin-left: 10%;
        }

        .float-right {
            margin-right: 27%;
        }
    </style>
</head>
<body>
<div class="header container">
    <h1 class="text-center mt-3 mb-5">Update</h1>
</div>

<div class="content container">
    <form>
        <div class="form-group row">
            <label class="col-form-label">Id</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">Name</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">...</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">...</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">...</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">...</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">...</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">...</label>
            <input type="text" class="form-control" required>
        </div>
        <div class="float-right">
            <a href="#" class="btn btn-outline-primary">Back</a>
            <button type="submit" class="btn btn-outline-success">Update</button>
        </div>
    </form>

</div>

<div class="footer container">


</div>

<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
