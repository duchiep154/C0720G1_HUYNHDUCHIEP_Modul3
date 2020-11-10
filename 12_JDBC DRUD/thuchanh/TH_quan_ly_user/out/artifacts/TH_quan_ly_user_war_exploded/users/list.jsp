<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 05-Nov-20
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>trang list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</head>

<body>
<div class="container">
    <div class="jumbotron">
        <h2> <a href="/users">List of Users</a> </h2>
        <p>ứng dụng xem thông tin user.</p>
    </div>

</div>

<div style="margin-bottom: 10px" class="row">
    <div class="col-md-6">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelcreate" >
            Create New User
        </button>
<%--        <a href="/users?action=create" role="button" class="btn btn-outline-dark">Create New User</a>--%>
    </div>

    <div class="col-md-4">
        <form class="form-inline" action="/users">
            <div class="form-group">
                <select class="form-control" name="findBy">
                    <option value="byId">Id</option>
                    <option value="byName">Name</option>
                    <option value="byAddress">Country</option>
                </select>
            </div>
            <input class="form-control mr-3" type="text" placeholder="Search" aria-label="Search" name="search">
            <input type="submit" value="search" name="action" class="btn btn-outline-dark">
        </form>
    </div>
    <div class="col-md-2">
        <form class="form-inline" action="/users">
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
<table class="table table-sm table-bordered table-hover">
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
    <c:forEach items='${requestScope["listUser"]}' var="user">
        <tr>
            <td scope="row"><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td><a class="btn btn-warning" href="/users?action=edit&id=${user.id}">edit</a></td>
            <td><a  class="btn btn-danger" href="/users?action=delete&id=${user.id}">delete</a></td>
        </tr>


    </c:forEach>
    </tbody>
</table>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelcreate">
    create
</button>

<!-- Modal -->
<div class="modal fade" id="modelcreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <fieldset>
                        <legend>Create New User</legend>
                        <div class="form-group ">
                            <label for="name">Name</label>
                            <input type="text" id="name" class="form-control" name="name">
                        </div>

                        <div class="form-group ">
                            <label for="email">Email</label>
                            <input type="text" id="email" class="form-control" name="email">
                        </div>

                        <div class="form-group ">
                            <label for="country">country</label>
                            <input type="text" id="country" class="form-control" name="country">
                        </div>

                        <div class="form-group ">
                            <input type="submit" role="button" class="btn btn-outline-dark">
                            <a role="button" class="btn btn-outline-dark" href="/users">Back</a>
                        </div>
                    </fieldset>
                </form>

            </div>
            
        </div>
    </div>
</div>

b4

</body>

</html>
