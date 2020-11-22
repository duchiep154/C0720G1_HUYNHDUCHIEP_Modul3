
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Customer</title>
</head>
<body>
<h1>Delete Employee</h1>
<p>
    <a href="/employee?actionFurama=employeeList">Back to Employee List</a>
</p>
<form method="post" action="/employee">
    <input type="hidden" name="actionFurama" value="deleteEmployee">
    <input type="hidden" name="idEmployee" value="${employee.getId()}">
    <h3>Do you really want to delete this Employee ?</h3>
    <fieldset>
        <legend>Employee information</legend>
        <table>
            <tr>
                <td>ID :</td>
                <td>${employee.getID()}</td>
            </tr>
            <tr>
                <td>Name :</td>
                <td>${employee.getName()}</td>
            </tr>
            <tr>
                <td>Birthday :</td>
                <td>${employee.getBirthDay()}</td>
            </tr>
            <tr>
                <td>ID Card :</td>
                <td>${employee.getIdCard()}</td>
            </tr>
            <tr>
                <td>Salary :</td>
                <td>${employee.getSalary()}</td>
            </tr>
            <tr>
                <td>Phone Number :</td>
                <td>${employee.getPhone()}</td>
            </tr>
            <tr>
                <td>Email :</td>
                <td>${employee.getEmail()}</td>
            </tr>
            <tr>
                <td>Address :</td>
                <td>${employee.getAddress()}</td>
            </tr>
            <tr>
                <td>Position :</td>
                <td>${employee.getIdPosition()}</td>
            </tr>
            <tr>
                <td>Education Degree:</td>
                <td>${employee.getIdEducationDegree()}</td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td>${employee.getUserName()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete Employee"></td>
            </tr>
        </table>
    </fieldset>
</form>
</div>
</body>
</html>
