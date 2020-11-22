<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create New Employee</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .login-container {
            margin-top: 5%;
            margin-bottom: 5%;
        }

        .login-form-1 {
            padding: 5%;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }

        .login-form-1 h3 {
            text-align: center;
            color: #333;
        }

        .login-form-2 {
            margin-top: 0;
            padding: 5%;
            background: #00c3cc47;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }

        .login-form-2 h2 {
            text-align: center;
            color: #333333;
        }

        .login-container form {
            padding: 10%;
        }

        .btnSubmit {
            width: 50%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;
        }

        .login-form-1 .btnSubmit {
            font-weight: 600;
            color: #fff;
            background-color: #0062cc;
        }

        .login-form-2 .btnSubmit {
            font-weight: 600;
            color: #0062cc;
            background-color: #fff;
        }

        .login-form-2 .ForgetPwd {
            color: #fff;
            font-weight: 600;
            text-decoration: none;
        }

        .login-form-1 .ForgetPwd {
            color: #0062cc;
            font-weight: 600;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container login-container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 login-form-2">
            <h2>Create New Employee</h2>
            <p class="message" style="color: red; text-align: center">${message}</p>
            <form method="post" action="/employee">
                <input type="hidden" name="actionFurama" value="createNewEmployee"/>
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <input type="text" class="form-control" name="name" id="name" value="${employee.name}"/>
                    </div>
                    <div class="form-group">
                        <label>BirthDay: </label>
                        <input type="text" class="form-control" name="birthDay" id="birthDay" value="${employee.birthDay}"/>
                    </div>
                    <div class="form-group">
                        <label>ID Card: </label>
                        <input type="text" class="form-control" name="idCard" id="idCard" value="${employee.idCard}"/>
                    </div>
                    <div class="form-group">
                        <label>Salary: </label>
                        <input type="text" class="form-control" name="salary" id="salary" value="${employee.salary}"/>
                    </div>
                    <div class="form-group">
                        <label>Phone Number: </label>
                        <input type="text" class="form-control" name="phone" id="phone" value="${employee.phone}"/>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <input type="text" class="form-control" name="email" id="email" value="${employee.email}">
                    </div>
                    <div class="form-group">
                        <label>Address: </label>
                        <input type="text" class="form-control" name="address" id="address" value="${employee.address}"/>
                    </div>
                    <div class="form-group">
                        <label>Position: </label>
                        <select name="position" id="position">
                            <option>${employee.idPosition}</option>
                            <c:forEach var="position" items="${positions}">
                                <option value="${position.id}">${position.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Education Degree: </label>
                        <select name="educationDegree" id="educationDegree" required>
                            <option>${employee.idEducationDegree}</option>
                            <c:forEach var="educationDegree" items="${educationDegrees}">
                                <option value="${educationDegree.id}">${educationDegree.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>User Name:</label>
                        <select name="user" id="user" required>
                            <option>${employee.userName}</option>
                            <c:forEach var="user" items="${users}">
                                <option value="${user.name}">${user.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btnSubmit" value="Create New"/>
                        <a href="/furama"><input class="btnSubmit" value="Home" style="float: left; text-align: center"></a>

                    </div>
                    <div style="margin-left: 120px">
                        <a href="/employee?actionFurama=employeeList"><input class="btnSubmit" value="Back to List" style="float: left; text-align: center"></a>
                    </div>
                </form>
            </form>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>