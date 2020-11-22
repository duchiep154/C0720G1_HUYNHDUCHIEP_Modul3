<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create New Contract</title>
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
            <h2>Create New Contract</h2>
            <p class="message" style="text-align: center; color: red">${message}</p>
            <form method="post" action="/contract">
                <input type="hidden" name="actionFurama" value="createNewContract"/>
                <form>
                    <div class="form-group">
                        <label>Start Date: </label>
                        <input type="date" class="form-control" name="startDate" id="startDate" placeholder="Start Date"
                               value=""/>
                    </div>
                    <div class="form-group">
                        <label>End Date: </label>
                        <input type="date" class="form-control" name="endDate" id="endDate" placeholder="End Date"
                               value=""/>
                    </div>
                    <div class="form-group">
                        <label>Deposit: </label>
                        <input type="text" class="form-control" name="deposit" id="deposit"
                               placeholder="Enter deposit here" value=""/>
                    </div>
                    <div class="form-group">
                        <label>Total Money: </label>
                        <input type="text" class="form-control" name="totalMoney" id="totalMoney"
                               placeholder="Enter total money here" value=""/>
                    </div>
                    <div class="form-group">
                        <label>Employee: </label>
                        <select name="employee" id="employee">
                            <c:forEach var="employee" items="${employees}">
                                <option value="${employee.id}">${employee.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Customer: </label>
                        <select name="customer" id="customer">
                            <c:forEach var="customer" items="${customers}">
                                <option value="${customer.id}">${customer.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Service: </label>
                        <select name="service" id="service">
                            <c:forEach var="service" items="${services}">
                                <option value="${service.id}">${service.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btnSubmit" value="Create New Contract"/>
                        <a href="/furama"><input class="btnSubmit" value="Home" style="float: left; text-align: center"></a>
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