<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 10-Nov-20
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</head>
<body>
<form class="was-validated" action="/student?action=update" method="post">
    <fieldset>
        <legend>Update Information</legend>
        <input type="hidden" name="id" value="<c:out value='${student.id}' />"/>
        <div class="form-group col-md-4">
            <label for="name2">Name</label>
            <input type="text" class="form-control" id="name2" placeholder="Enter name" name="name" size="45"
                   value="<c:out value='${student.name}' />"   required
            />
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>

        </div>

        <div class="form-group col-md-4">
            <label for="email2">Email</label>
            <input type="text" id="email2" class="form-control" name="email" placeholder="Enter email" size="45"
                   value="<c:out value='${student.email}' />" required
            />
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="form-group col-md-4">
            <label for="phone">phone</label>
            <input type="text" id="phone" class="form-control" name="phone" placeholder="enter phone" size="15"
                   value="<c:out value='${student.phone}' />" required
            />
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="form-group col-md-4">
            <input type="submit" value="Update" class="btn btn-primary">
            <a role="button" href="/student" class="btn btn-outline-dark">Back</a>
        </div>
    </fieldset>
</form>


</body>
</html>
