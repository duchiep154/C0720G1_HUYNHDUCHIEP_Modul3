<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 19-Nov-20
  Time: 2:49 PM
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
    <title>edit benh an</title>

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


<body>
<div class="container-fluid">
    <h1>Information benh an</h1>

    <h3 class="message">${messageComplete}</h3>

    <form action="/home" method="post">
        <input type="hidden" name="action" value="edit" />

        <div class="form-group has-success">
            <label for="maBenhAn">maBenhAn</label>
            <input type="text" class="form-control" name="maBenhAn" id="maBenhAn" value="${benhAn.maBenhAn}" readonly/>
        </div>

        <div class="form-group has-success">
            <label for="maBenhNhan">maBenhNhan</label>
            <input type="text" class="form-control" name="maBenhNhan" id="maBenhNhan" value="${benhAn.maBenhNhan}" readonly/>
        </div>

        <div class="form-group has-warning">
            <label for="tenBenhNhan">ten benh nhan :</label>
            <input type="text" class="form-control" name="tenBenhNhan" id="tenBenhNhan" value="
            <c:forEach var="benhNhan" items="${benhNhanList}">
                <c:choose>
                    <c:when test="${benhNhan.maBenhNhan.equals(benhAn.maBenhNhan)}">
                        ${benhNhan.tenBenhNhan}
                    </c:when>
                </c:choose>
            </c:forEach>"
             required />
            <p>${messagePrice}</p>
        </div>

        <div class="form-group has-error">
            <label for="ngayNhapVien">Ngay nhap vien :</label>
            <input type="date" class="form-control" name="ngayNhapVien" id="NgayNhapVien" value="${benhAn.ngayNhapVien}" required/>
            <p>${message}</p>
        </div>
        <div class="form-group has-error">
            <label for="ngayRaVien">Ngay nhap vien :</label>
            <input type="date" class="form-control" name="ngayRaVien" id="NgayRaVien" value="${benhAn.ngayRaVien}" required/>
            <p>${message}</p>
        </div>

        <div class="form-group has-success">
            <label for="lyDo">ly do:</label>
            <input type="text" class="form-control" name="lyDo" id="lyDo" value="${benhAn.lyDo}" required/>
        </div>

        <div class="form-group has-warning">
            <label for="phuongPhapTri">phuong phap dieu tri :</label>
            <input type="text" class="form-control" name="phuongPhapTri" id="phuongPhapTri" value="${benhAn.phuongPhapTri}" required/>
        </div>
        <div class="form-group has-warning">
            <label for="bacSi">bacSi :</label>
            <input type="text" class="form-control" name="bacSi" id="bacSi" value="${benhAn.bacSi}" required/>
        </div>



        <input type="submit" class="btn btn-info" value="edit" /><span>
            <a href="/home" class="btn btn-info back">Back</a></span>

    </form>

</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</html>
