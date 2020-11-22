<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 10-Nov-20
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.22/css/dataTables.jqueryui.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">



<%--    <style>--%>
<%--        body {--%>
<%--            color: #566787;--%>
<%--            background: #f5f5f5;--%>
<%--            font-family: 'Roboto', sans-serif;--%>
<%--        }--%>

<%--        .table-responsive {--%>
<%--            margin: 30px 0;--%>
<%--        }--%>

<%--        .table-wrapper {--%>
<%--            min-width: 1000px;--%>
<%--            background: #fff;--%>
<%--            padding: 45px;--%>
<%--            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);--%>
<%--        }--%>

<%--        .table-title {--%>
<%--            padding-bottom: 10px;--%>
<%--            margin: 0 0 10px;--%>
<%--            min-width: 100%;--%>
<%--        }--%>

<%--        .table-title h2 {--%>
<%--            margin: 8px 0 0;--%>
<%--            font-size: 22px;--%>
<%--        }--%>

<%--        .search-box {--%>
<%--            position: relative;--%>
<%--            display: flex;--%>
<%--        }--%>




<%--        .search-box input {--%>

<%--            border-radius: 20px;--%>
<%--        }--%>

<%--        .search-box input:focus {--%>
<%--            border-color: #3FBAE4;--%>
<%--        }--%>

<%--        .search-box i {--%>
<%--            color: #a0a5b1;--%>
<%--            position: absolute;--%>
<%--            font-size: 19px;--%>
<%--            top: 11px;--%>
<%--            left: 10px;--%>
<%--        }--%>

<%--        table.table tr th, table.table tr td {--%>
<%--            border-color: #e9e9e9;--%>
<%--        }--%>

<%--        table.table-striped tbody tr:nth-of-type(odd) {--%>
<%--            background-color: #fcfcfc;--%>
<%--        }--%>

<%--        table.table-striped.table-hover tbody tr:hover {--%>
<%--            background: #f5f5f5;--%>
<%--        }--%>

<%--        table.table th i {--%>
<%--            font-size: 13px;--%>
<%--            margin: 0 5px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        table.table td:last-child {--%>
<%--            width: 130px;--%>
<%--        }--%>

<%--        table.table td a {--%>
<%--            color: #a0a5b1;--%>
<%--            display: inline-block;--%>
<%--            margin: 0 5px;--%>
<%--        }--%>

<%--        table.table td a.view {--%>
<%--            color: #03A9F4;--%>
<%--        }--%>

<%--        table.table td a.edit {--%>
<%--            color: #FFC107;--%>
<%--        }--%>

<%--        table.table td a.delete {--%>
<%--            color: #E34724;--%>
<%--        }--%>

<%--        table.table td i {--%>
<%--            font-size: 19px;--%>
<%--        }--%>

<%--        .pagination {--%>
<%--            float: right;--%>
<%--            margin: 0 0 5px;--%>
<%--        }--%>

<%--        .pagination li a {--%>
<%--            border: none;--%>
<%--            font-size: 95%;--%>
<%--            width: 28px;--%>
<%--            height: 27px;--%>
<%--            color: #999;--%>
<%--            margin: 0 2px;--%>
<%--            line-height: 30px;--%>
<%--            border-radius: 30px !important;--%>
<%--            text-align: center;--%>
<%--            padding: 0;--%>
<%--        }--%>

<%--        .pagination li a:hover {--%>
<%--            color: #666;--%>
<%--        }--%>

<%--        .pagination li.active a {--%>
<%--            background: #03A9F4;--%>
<%--        }--%>

<%--        .pagination li.active a:hover {--%>
<%--            background: #0397d6;--%>
<%--        }--%>

<%--        .pagination li.disabled i {--%>
<%--            color: #ccc;--%>
<%--        }--%>

<%--        .pagination li i {--%>
<%--            font-size: 16px;--%>
<%--            padding-top: 6px--%>
<%--        }--%>

<%--        .hint-text {--%>
<%--            float: left;--%>
<%--            margin-top: 6px;--%>
<%--            font-size: 95%;--%>
<%--        }--%>

<%--        .message {--%>
<%--            text-align: center;--%>
<%--            color: orangered;--%>
<%--        }--%>

<%--        #search {--%>
<%--            padding-left: 5px;--%>
<%--        }--%>
<%--    </style>--%>

</head>
<script>
    // $(document).ready( function () {
    //     $('#tableStudent').DataTable();
    // } );
</script>

<body>
<div class="container">
    <div class="jumbotron">
        <h2> <a href="/student">List of Users</a> </h2>
        <p>ứng dụng xem thông tin user.</p>
    </div>

</div>
<h3 class="message"><c:out value="${message}"/></h3>

<div style="margin: 20px" class="row">
    <%--    <div class="col-md-6">--%>
    <%--        <a href="/users?action=create" role="button" class="btn btn-outline-dark">Create New User</a>--%>
    <%--    </div>--%>
    <div class="col-md-6">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelCreate" >
            Create New Student
        </button>
        <%--        <a href="/users?action=create" role="button" class="btn btn-outline-dark">Create New User</a>--%>
    </div>
    <div class="col-md-4">
        <form class="form-inline" action="/student">
            <div class="form-group">
                <select class="form-control" name="findBy">
                    <option value="byId">Id</option>
                    <option value="byName">Name</option>

                </select>
            </div>
            <input class="form-control mr-3" type="text" placeholder="Search" aria-label="Search" name="search">
            <input type="submit" value="search" name="action" class="btn btn-outline-dark">
        </form>
    </div>
    <div class="col-md-2">
        <form class="form-inline" action="/student">
            <label for="sortBy">Sort By: </label>
            <div class="form-group">
                <select class="form-control" name="sortBy" id="sortBy">
                    <option value="sortId">Id</option>
                    <option value="sortName">Name</option>
                </select>
            </div>
            <input type="submit" value="sort" name="action" class="btn btn-outline-dark">
        </form>
    </div>

</div>
<div style="margin: 20px">
    <table id="tableStudent" class="table table-sm table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Country</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items='${requestScope["listStudent"]}' var="student">
                <tr>
                    <td scope="row"><c:out value="${student.id}"/></td>
                    <td scope="row"><c:out value="${student.name}"/></td>
                    <td scope="row"><c:out value="${student.email}"/></td>
                    <td scope="row"><c:out value="${student.phone}"/></td>
                    <td scope="row">
                        <button type="button" class="btn btn-warning ml-2" onclick="editId(${student.id},'${student.name}','${student.email}','${student.phone}')" data-toggle="modal" data-target="#modelEdit" > edit</button>
                    </td>
                    <td scope="row">
                            <%--                <a  class="btn btn-danger" href="/users?action=delete&id=${user.id}">delete</a>--%>
                        <button type="button" class="btn btn-danger ml-2" onclick="deleteId(${student.id})" data-toggle="modal" data-target="#modeldelete">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


<!-- Modal create -->
<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">create new student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/student" method="post">
                <div class="modal-body">
                    <div class="form-group ">
                        <label for="name">Name</label>
                        <input type="text" id="name" class="form-control" name="name">
                    </div>
                    <div class="form-group ">
                        <label for="email">Email</label>
                        <input type="text" id="email" class="form-control" name="email">
                    </div>
                    <div class="form-group ">
                        <label for="phone">phone</label>
                        <input type="text" id="phone" class="form-control" name="phone">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <%--                        <input type="hidden" name="action" value="create">--%>
                    <button type="submit"  class="btn btn-primary" name="action" value="create">create user</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal delete-->
<div class="modal fade" id="modeldelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">delete student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/student">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="modalId">
                <div class="modal-body">
                    ban co muon xoa ko
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Button trigger modal -->


<!-- Modal edit-->
<div class="modal fade" id="modelEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">edit student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <form action="/student"  method="post">
                <div class="modal-body">

                    <div class="form-group ">

                        <input type="hidden" id="updateId" name="id" value=""/>

                    </div>
                    <div class="form-group ">
                        <label for="updateName">Name</label>
                        <input type="text" class="form-control" id="updateName"  name="name" value=""/>

                    </div>
                    <div class="form-group ">
                        <label for="updateEmail">Email</label>
                        <input type="text" id="updateEmail" class="form-control" name="email"/>
                    </div>
                    <div class="form-group ">
                        <label for="updatephone">phone</label>
                        <input type="text" id="updatephone" class="form-control" name="phone"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        Close
                    </button>
                    <button  class="btn btn-primary" name="action" value="edit">
                        Edit
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

<script>

    function deleteId(id) {
        console.log(id);
        document.getElementById("modalId").value = id;
    }
    function editId(id,name,email,phone) {
        console.log(id,name,email,phone);
        document.getElementById("updateId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updateEmail").value = email;
        document.getElementById("updatephone").value =phone;
    }
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            // "dom": 'lrtip',
            "lengthChange": true,
            "pageLength": 10
        });
    });

</script>

</html>
