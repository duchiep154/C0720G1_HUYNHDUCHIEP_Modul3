<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 19-Nov-20
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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

        /*#search {*/
        /*    padding-left: 5px;*/
        /*}*/
    </style>




</head>
<body>

<h3 class="message">${messageComplete}</h3>
<h1> danh sach benh an</h1>
<div class="container-fluid">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">

            </div>

            <table id="tableProduct" class="table table-striped table-hover table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th scope="col">mã bệnh án</th>
                    <th scope="col">mã bệnh nhân</th>
                    <th scope="col">tên bệnh nhân</th>
                    <th scope="col">ngày nhập viện</th>
                    <th scope="col">ngày ra viện</th>
                    <th scope="col">lý do</th>
                    <th scope="col">phuong phap dieu tri</th>
                    <th scope="col">bac si</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${benhAnList}" var="benhAn">
                    <tr>
                        <td><c:out value="${benhAn.maBenhAn}"/></td>
                        <td><c:out value="${benhAn.maBenhNhan}"/></td>
                        <td>

                            <c:forEach var="benhNhan" items="${benhNhanList}">
                                <c:choose>
                                    <c:when test="${benhNhan.maBenhNhan.equals(benhAn.maBenhNhan)}">
                                        ${benhNhan.tenBenhNhan}
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </td>
                        <td>${benhAn.ngayNhapVien}</td>
                        <td>${benhAn.ngayRaVien}</td>
                        <td>${benhAn.lyDo}</td>
                        <td>${benhAn.phuongPhapTri}</td>
                        <td>${benhAn.bacSi}</td>

                        <td>
                            <a href="/home?action=detail&maBenhAn=${benhAn.maBenhAn}" class="detail"
                               title="Detail"
                               data-toggle="tooltip"><i class="fa fa-eye" style="color: blue"></i></a>

                            <a href="/home?action=showEdit&maBenhAn=${benhAn.maBenhAn}" class="edit"
                               title="Edit"
                               data-toggle="tooltip"><i
                                    class="material-icons">&#xE254;</i></a>

                            <a data-toggle="modal" data-target="#deleteModal" href="#"
                               onclick="setMaBenhAn('${benhAn.maBenhAn}')" class="delete" title="Delete"
                               data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <%--            <a href="/product" class="btn btn-info back">Back</a>--%>

            <div id="deleteModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/home">
                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="maBenhAn" id="maBenhAn"/>
                            <div class="modal-header">
                                <h4 class="modal-title">Delete benh an</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="warning" style="width: 100%; color: red" />
                                <p class="text-warning"><small style="color: blue">This action cannot be undone !</small>
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
<%--<form method="post" action="/home" id="formSearchProduct">--%>
<%--    <input type="hidden" name="action" value="search">--%>
<%--    <input type="hidden" name="nameProduct" id="keywordProductHidden"/>--%>
<%--    <input hidden type="submit" value="search"/>--%>
<%--</form>--%>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script>
    function setMaBenhAn(maBenhAn) {
        console.log(maBenhAn)
        document.getElementById("maBenhAn").value = maBenhAn;
        document.getElementById("warning").value = "Are you sure you want to delete benh an have maBenhAn is " + maBenhAn + " ?";

    }
    function submitFormSearchProduct() {
        let keywordHidden = document.getElementById("keywordProductHidden");
        let keywordDisplay = document.getElementById("keywordProductDisplay");
        keywordHidden.value = keywordDisplay.value;
        document.getElementById("formSearchProduct").submit();
    }
</script>
</html>
