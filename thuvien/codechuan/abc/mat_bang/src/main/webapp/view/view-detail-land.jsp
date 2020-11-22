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
    <title>Information Land</title>

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
    <h1>Information Land</h1>

    <form>
        <div class="form-group has-success">
            <label for="id">ID :</label>
            <input type="text" class="form-control" name="id" id="id" value="${land.id}" readonly/>
            <p>${messageID}</p>
        </div>

        <div class="form-group has-success">
            <label for="area">Area :</label>
            <input type="text" class="form-control" name="area" id="area" value="${land.area}" readonly/>
        </div>

        <div class="form-group has-warning">
            <label for="floor">Floor :</label>
            <input type="text" class="form-control" name="floor" id="floor" value="${land.floor}" readonly/>
            <%--            <p>${messageAge}</p>--%>
        </div>

        <div class="form-group has-error">
            <label for="price">Price :</label>
            <input type="text" class="form-control" name="price" id="price" value="${land.price}" readonly/>
            <%--            <p>${messageEmail}</p>--%>
        </div>

        <div class="form-group has-error">
            <label for="startDate">Start Date :</label>
            <input type="date" class="form-control" name="startDate" id="startDate" value="${land.startDate}" readonly/>
            <%--            <p>${messagePhone}</p>--%>
        </div>

        <div class="form-group has-error">
            <label for="endDate">End Date :</label>
            <input type="date" class="form-control" name="endDate" id="endDate" value="${land.endDate}" readonly/>
            <%--            <p>${messagePhone}</p>--%>
        </div>

        <div class="form-group">
            <label>Land Type : </label>
            <c:forEach var="landType" items="${landTypeList}">
                <c:choose>
                    <c:when test="${landType.id.equals(land.idLandType)}">
                        <c:out value="${landType.name}"></c:out>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>

        <div class="form-group">
            <label>Land Status : </label>
            <c:forEach var="landStatus" items="${landStatusList}">
                <c:choose>
                    <c:when test="${landStatus.id.equals(land.idLandStatus)}">
                        <c:out value="${landStatus.name}"></c:out>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
        <a href="/land" class="btn btn-info back">Back</a>
    </form>

</div>
</body>
</html>