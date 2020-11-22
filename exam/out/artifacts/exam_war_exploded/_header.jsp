<%--
  Created by IntelliJ IDEA.
  User: beut1
  Date: 12-Nov-20
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="/home?action=showThe">the muon sach <span class="sr-only">(current)</span></a>
            </li>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="/home?action=showCreate">create</a>--%>

<%--            </li>--%>

        </ul>
<%--        <div class="col-sm-4">--%>
<%--            <div class="search-box">--%>
<%--                <i class="material-icons">&#xE8B6;</i>--%>
<%--                <form class="form-inline" action="/home" method="post">--%>
<%--                    <div class="form-group">--%>
<%--                        <select class="form-control" name="findBy">--%>
<%--                            <option value="byName">Name</option>--%>
<%--                            <option value="byPrice">Price</option>--%>
<%--                            <option value="byQuantity">Quantity</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <input class="form-control mr-3" type="text" placeholder="search" aria-label="search" name="search">--%>
<%--                    <input type="submit" value="search" name="action" class="btn btn-outline-dark">--%>
<%--                </form>--%>
<%--            </div>--%>
        </div>
    </div>
    <script>
        function submitFormSearchProduct() {
            let keywordHidden = document.getElementById("keywordProductHidden");
            let keywordDisplay = document.getElementById("keywordProductDisplay");
            keywordHidden.value = keywordDisplay.value;
            document.getElementById("formSearchProduct").submit();
        }
    </script>
<%--    <form class="form-inline" action="/home">--%>
<%--        <div class="form-group">--%>
<%--            <select class="form-control" name="findBy">--%>
<%--                <option value="byName">Name</option>--%>
<%--                <option value="byPrice">Price</option>--%>
<%--                <option value="byQuantity">Quantity</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <input class="form-control mr-3" type="text" placeholder="search" aria-label="search" name="search">--%>
<%--        <input type="submit" value="search" name="action" class="btn btn-outline-dark">--%>
<%--    </form>--%>
</nav>
