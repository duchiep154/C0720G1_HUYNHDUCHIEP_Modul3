<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/18/2020
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thống kê</title>
    <link rel="stylesheet" href="../css/bootstrap.css">

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
                <form method="get" action="/books">
                    <td>
                        <label>${theMuonSach.id}</label>
                    </td>
                    <td>
                        ${sachList.get(theMuonSach.sachId).name}
                    </td>
                    <td>
                        ${sachList.get(theMuonSach.sachId).tacGia}
                    </td>
                    <td>
                        ${hocSinhList.get(theMuonSach.hocSinhId).name}
                    </td>
                    <td>
                        ${hocSinhList.get(theMuonSach.hocSinhId).lop}
                    </td>
                    <td>
                            ${theMuonSach.trangThai == true ? "Đang cho mượn" : "Đã trả"}
                    </td>
                    <td>
                        <label>${theMuonSach.ngayMuon}</label>
                        <input class="form-control" style="display: none">
                    </td>
                    <td>
                        <label>${theMuonSach.ngayTra}</label>
                        <input class="form-control" style="display: none">
                    </td>
                    <td>
                        <a href="/books" onclick="onTraSach('${theMuonSach.id}','${theMuonSach.sachId}')" class="btn btn-outline-danger"
                           data-toggle="modal"
                           data-target="#modelId">Trả</a>
                    </td>
                </form>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/books" class="btn btn-outline-primary">Back</a>
</div>


<!-- Button trigger modal -->


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
            <form method="post" action="/books">
                <div class="modal-body">
                    <input name="id" type="hidden" id="id">
                    <input name="sachId" type="hidden" id="sachId">
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

<div class="footer container">

</div>

<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script>
    function onTraSach(id, sachId) {
        document.getElementById("id").value = id;
        document.getElementById("sachId").value = sachId;
    }
</script>
</body>
</html>
