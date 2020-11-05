<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 04-Nov-20
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form class="form-select-button" method="post">
    <div class="form-select-button">
        <h3>Are you sure?</h3>
        <fieldset>
            <legend>Customer information</legend>
            <table class="table table-hover">
                <tr>
                    <td scope="col">Name: </td>
                    <td scope="col">${requestScope["customer"].getName()}</td>
                </tr>
                <tr>
                    <td scope="col">Email: </td>
                    <td scope="col">${requestScope["customer"].getEmail()}</td>
                </tr>
                <tr>
                    <td scope="col">Address: </td>
                    <td scope="col">${requestScope["customer"].getAddress()}</td>
                </tr>
                <tr>
                    <td scope="col"><input class="btn btn-primary" type="submit" value="Delete customer"></td>
                    <td scope="col"><a href="/customers">Back to customer list</a></td>
                </tr>
            </table>
        </fieldset>
    </div>
</form>
</body>
</html>