<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 18-Nov-20
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>List muon Sach</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">

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

        .search-box input#keywordLandTypeDisplay {

            border-radius: 20px;
            padding-left: 35px;
            border-color: #ddd;
            box-shadow: none;
        }

        .search-box input#keywordFloorDisplay {

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

<div class="container">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 style="color: red">the muon sach</h1>
                    </div>
                </div>
<%--                <div class="row">--%>
<%--                    <div class="col-sm-2">--%>
<%--                        <div class="search-box">--%>
<%--                            <i class="material-icons">&#xE8B6;</i>--%>
<%--                            <input type="text" name="floorLand" class="form-control" id="keywordFloorDisplay"--%>
<%--                                   placeholder="Search by Floor">--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-sm-2">--%>
<%--                        <div class="search-box">--%>
<%--                            <i class="material-icons">&#xE8B6;</i>--%>
<%--                            <input type="text" name="priceLand" class="form-control" id="keywordPriceDisplay"--%>
<%--                                   placeholder="Search by Price">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-sm-6">--%>
<%--                        <div class="search-box">--%>
<%--                            <i class="material-icons">&#xE8B6;</i>--%>
<%--                            <input type="text" name="landTypeLand" class="form-control" id="keywordLandTypeDisplay"--%>
<%--                                   placeholder="Search by Type (1.appartment_2.building_3.office_4.house">--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-sm-1">--%>
<%--                        <input type="button" value="Search" class="btn btn-primary"--%>
<%--                               onclick="submitFormSearchLand()">--%>
<%--                    </div>--%>

<%--                    <div class="col-sm-1">--%>
<%--                        <a href="/land" class="btn btn-info back">Reset</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>

            <table id="tableLand" class="table table-striped table-hover table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>Mã Mượn Sách</th>
                    <th>Tên sách</th>
                    <th>Tác giả</th>
                    <th>Tên học sinh</th>
                    <th>Lớp</th>
                    <th>Trạng thái</th>
                    <th>Ngày mượn</th>
                    <th>Ngày trả</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${theMuonSachList}" var="theMuonSach">
                    <tr>
                        <form method="get" action="/home">
                            <td>
                                <c:out value="${theMuonSach.maMuonSach}"/>
                            </td>
                            <td>
                                <c:forEach var="book" items="${bookList}">
                                    <c:choose>
                                        <c:when test="${book.id.equals(theMuonSach.idBook)}">
                                            ${book.name}
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="book" items="${bookList}">
                                    <c:choose>
                                        <c:when test="${book.id.equals(theMuonSach.idBook)}">
                                            ${book.tacgia}
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="student" items="${studentList}">
                                    <c:choose>
                                        <c:when test="${student.id.equals(theMuonSach.idStudent)}">
                                            ${student.name}
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="student" items="${studentList}">
                                    <c:choose>
                                        <c:when test="${student.id.equals(theMuonSach.idStudent)}">
                                            ${student.lop}
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </td>
                            <td>
                                <c:out value="${theMuonSach.trangThai}"/>
                            </td>
                            <td>
                                <c:out value="${theMuonSach.ngayMuon}"/>
                            </td>
                            <td>
                                <c:out value="${theMuonSach.ngayTra}"/>
                            </td>
                            <td>
                                <a href="/home" onclick="onTraSach('${theMuonSach.id}')" class="btn btn-outline-danger" data-toggle="modal"
                                   data-target="#modelId">Trả</a>
                            </td>
                        </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <%--            <a href="/land" class="btn btn-info back">Back</a>--%>


        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/home">
                <div class="modal-body">
                    <input name="maMuonSach" type="hidden" id="maMuonSach">
                    Trả Sách
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button name="action" value="tra" type="submit" class="btn btn-primary">Trả Sách</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    function onTraSach(id) {
        document.getElementById("maMuonSach").value = maMuonSach;
    }
</script>
</html>
