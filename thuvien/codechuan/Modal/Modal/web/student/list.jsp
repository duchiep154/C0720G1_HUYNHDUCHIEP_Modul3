<%--
  Created by IntelliJ IDEA.
  User: No Name VN
  Date: 8/28/2020
  Time: 7:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-between mb-2 mt-2">
            <h3>Student List</h3>
            <a href="/student?action=create" class="btn btn-success" role="button">Create New</a>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>address</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${studentListServlet}">
            <tr>
                <td scope="row">${student.id}</td>
                <td>${student.name}</td>
                <td>${student.address}</td>
                <td>
                    <a href="/student?action=edit&id=${student.id}">edit</a>
<%--                <td><a href="/student?action=delete&id=${student.id}">delete</a></td>--%>
                    <button type="button" class="btn btn-primary ml-2" onclick="onDelete(${student.id})" data-toggle="modal" data-target="#modelDelete">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal Delete-->
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/student">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="modalId">
                <div class="modal-body">
                    Body modal....
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Button trigger modal create -->
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelCreate">
    Create
</button>

<!-- Modal Create-->
<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal Create</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/student" method="post">
                    <div class="form-group">
                        <label for="studentName">Student Name</label>
                        <input type="text" name="studentName" id="studentName" class="form-control" placeholder="Input name">
                    </div>
                    <div class="form-group">
                        <label for="studentAddress">Student Address</label>
                        <input type="text" name="studentAddress" id="studentAddress" class="form-control" placeholder="Input address">
                    </div>
                    <div>
                        <input type="hidden" name="action" value="create">
                        <button type="submit" class="btn btn-primary" id="btnSubmit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<script>
    function onDelete(id) {
        console.log(id);
        document.getElementById("modalId").value = id;
    }
</script>
</body>
</html>
