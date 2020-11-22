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
    <title>List</title>

    <link rel="stylesheet" href="../css/bootstrap.css">

    <style>
        #modalUpdate label {
            width: 100px;
            margin-left: 15px;
        }

        #modalUpdate input {
            width: 350px;
        }
    </style>
</head>
<body>

<div class="header container">
    <h1 class="text-center mt-3 mb-5">List</h1>
    <form class="form-inline">
        <div class="ml-2">
            <button class="btn btn-outline-success">Create</button>
        </div>
        <div class="form-group offset-8">
            <button class="btn btn-outline-success mr-2">Search</button>
            <input class="form-control" type="text" placeholder="Enter">
        </div>
    </form>
</div>

<div class="content container">
    <table class="table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Tên sách</th>
            <th>Tác giả</th>
            <th>Số lượng</th>
            <th>Mô tả</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sachList}" var="sach">
        <tr>
            <form method="get" action="/books">
                <td>
                    <label>${sach.id}</label>
                    <input class="form-control" style="display: none" readonly>
                </td>
                <td>
                    <label>${sach.name}</label>
                    <input class="form-control" style="display: none" required>
                </td>
                <td>
                    <label>${sach.tacGia}</label>
                    <input class="form-control" style="display: none">
                </td>
                <td>
                    <label>${sach.soLuong}</label>
                    <input class="form-control" style="display: none">
                </td>
                <td>
                    <label>${sach.moTa}</label>
                    <input class="form-control" style="display: none">
                </td>
                <td>
                    <a href="/books?action=muon&tenSach=${sach.name}&idSach=${sach.id}&soLuong=${sach.soLuong}"  class="btn btn-outline-danger">Mượn</a>
                </td>
            </form>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/books?action=listMuonSach" class="btn-outline-primary btn" >Danh sách mượn sách</a>
    <h1 class="mt-5" style="color: red">${error}</h1>
</div>


<div class="footer container">

</div>





<script>


</script>
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
