<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/8/2020
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
          integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
          crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Information Student</title>

    <style>
        h1 {
            color: blue;
            text-align: center;
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
<div class="container">
    <h1>Information Student</h1>

    <form>
        <div class="form-group has-success">
            <label for="id">ID :</label>
            <input type="text" class="form-control" name="id" id="id" value="${student.id}" readonly/>
        </div>

        <div class="form-group has-success">
            <label for="name">Name :</label>
            <input type="text" class="form-control" name="name" id="name" value="${student.name}" readonly/>
        </div>

        <div class="form-group has-warning">
            <label for="age">Age :</label>
            <input type="text" class="form-control" name="age" id="age" value="${student.age}" readonly/>
            <p>${messageAge}</p>
        </div>

        <div class="form-group has-error">
            <label for="email">Email :</label>
            <input type="text" class="form-control" name="email" id="email" value="${student.email}" readonly/>
            <p>${messageEmail}</p>
        </div>

        <div class="form-group has-error">
            <label for="phone">Phone Number :</label>
            <input type="text" class="form-control" name="phone" id="phone" value="${student.phone}" readonly/>
            <p>${messagePhone}</p>
        </div>

        <div class="form-group has-success">
            <label for="address">Address :</label>
            <input type="text" class="form-control" name="address" id="address" value="${student.address}" readonly/>
        </div>

        <div class="form-group">
            <label>Class Name : </label>
            <span style="color: blue; font-weight: bold">
            <c:forEach var="classCodeGym" items="${classList}">
                <c:choose>
                    <c:when test="${classCodeGym.id.equals(student.idClass)}">
                        <c:out value="${classCodeGym.name}"></c:out>
                    </c:when>
                </c:choose>
            </c:forEach>
            </span>
        </div>
        <a href="/student" class="btn btn-info back">Back</a>
    </form>

</div>
</body>
</html>