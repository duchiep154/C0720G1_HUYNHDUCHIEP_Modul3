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
    <title>Create</title>

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
    <h1 class="text-center mt-3 mb-5">Mượn Sách</h1>
</div>

<div class="content container">
    <form method="post" action="/books">
        <div class="form-group row">
            <label class="col-form-label">Mã mượn sách</label>
            <input name="id" type="text" class="form-control" required pattern="^MX-\d{4}$">
        </div>
        <div class="form-group row">
            <label class="col-form-label">Tên sách</label>
            <input type="text" class="form-control" value="${tenSach}" readonly>
            <input name="sachId" type="hidden" class="form-control" required value="${idSach}" readonly>
        </div>
        <div class="form-group row">
            <label class="col-form-label">Tên học sinh</label>
            <select name="hocSinhId" class="form-control" style="width: 600px">
                <c:forEach items="${hocSinhList}" var="hocSinh">
                <option value="${hocSinh.id}">${hocSinh.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group row">
            <label class="col-form-label">Ngày mượn sách</label>
            <input name="ngayMuon" type="date" class="form-control" required>
        </div>
        <div class="form-group row">
            <label class="col-form-label">Ngày trả sách</label>
            <input name="ngayTra" type="date" class="form-control" required>
        </div>

        <div class="float-right">
            <a href="#" class="btn btn-outline-primary">Back</a>
            <button name="action" value="muon" type="submit" class="btn btn-outline-success">Mượn sách</button>
        </div>
    </form>

</div>

<div class="footer container">


</div>

<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
