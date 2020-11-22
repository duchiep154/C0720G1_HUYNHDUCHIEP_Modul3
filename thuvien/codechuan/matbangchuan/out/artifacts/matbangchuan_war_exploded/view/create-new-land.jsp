<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/9/2020
  Time: 9:00 AM
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
    <title>Create New Land</title>

    <style>
        .messageComplete {
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

    <h3 class="messageComplete">${messageComplete}</h3>

    <form action="/land" method="post">
        <input type="hidden" name="actionLand" value="createNewLand" />

        <div class="form-group has-success">
            <label for="id">ID :</label>
            <input type="text" class="form-control" name="id" id="id" value="${land.id}" required/>
            <p>${messageID}</p>
        </div>

        <div class="form-group has-success">
            <label for="area">Area :</label>
            <input type="text" class="form-control" name="area" id="area" value="${land.area}" required/>
            <p>${messageArea}</p>
        </div>

        <div class="form-group has-warning">
            <label for="floor">Floor :</label>
            <input type="text" class="form-control" name="floor" id="floor" value="${land.floor}" required/>
            <p>${messageFloor}</p>
        </div>

        <div class="form-group has-error">
            <label for="price">Price :</label>
            <input type="text" class="form-control" name="price" id="price" value="${land.price}" required/>
            <p>${messagePrice}</p>
        </div>

        <div class="form-group has-error">
            <label for="startDate">Start Date :</label>
            <input type="date" class="form-control" name="startDate" id="startDate" value="${land.startDate}" required/>
        </div>

        <div class="form-group has-error">
            <label for="endDate">End Date :</label>
            <input type="date" class="form-control" name="endDate" id="endDate" value="${land.endDate}" required/>
        </div>

        <div class="form-group">
            <label>Select Land Type : </label>
            <label for="landType"></label><select name="idLandType" id="landType" required>
                <c:forEach var="landType" items="${landTypeList}">
                    <c:choose>
                        <c:when test="${landType.id.equals(land.idLandType)}">
                            <option value="<c:out value='${landType.id}'/>" selected><c:out value="${landType.name}"></c:out></option>
                        </c:when>
                        <c:otherwise>
                            <option value="${landType.id}">${landType.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Select Land Status : </label>
            <label for="landStatus"></label><select name="idLandStatus" id="landStatus" required>
            <c:forEach var="landStatus" items="${landStatusList}">
                <c:choose>
                    <c:when test="${landStatus.id.equals(land.idLandStatus)}">
                        <option value="<c:out value='${landStatus.id}'/>" selected><c:out value="${landStatus.name}"></c:out></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${landStatus.id}">${landStatus.name}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        </div>

        <input type="submit" class="btn btn-info" value="Create New" /><span>
            <a href="/land" class="btn btn-info back">Back</a></span>
    </form>

</div>
</body>
</html>