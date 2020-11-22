<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/14/2020
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">--%>
    <%--    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"--%>
    <%--            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"--%>
    <%--            crossorigin="anonymous"></script>--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"--%>
    <%--            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"--%>
    <%--            crossorigin="anonymous"></script>--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"--%>
    <%--            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"--%>
    <%--            crossorigin="anonymous"></script>--%>

    <link rel="stylesheet" href="../css/bootstrap.css">

</head>
<body>

<div>

    <a href="/books"><h1 class="text-center mb-5 mt-2">Book List</h1></a>
    <div class="row col-12">
        <div class="col-4">
            <a href="/books?action=create" class="btn btn-outline-success" style="margin-left: 50%">Create New Book</a>
        </div>
        <div class="col-8 form-group">
            <form action="/books" method="get" class="row ml-auto">
                <button class="btn btn-outline-primary mr-2" style="margin-left: 30%; width: 150px" name="action"
                        value="search">Search
                </button>
                <input type="text" name="nameOrId" placeholder="Name or Author" class="form-control col-4">
            </form>
        </div>
    </div>
</div>

<div class="content">
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Cost<a href="/books?action=sort&sort=${sort}" value="sort" class="btn btn-outline-primary ml-2"
                           style="font-size: 10px">\//\</a></th>
                <th>Description</th>
                <th>
                    <a style="text-decoration: none" id="searchKey" href="#">
                        <select class="form-control" style="width: 150px;" onchange="onSearch(this)">
                            <option value="category">Category</option>
                            <option value="all">All</option>
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category.key}">${category.value}</option>
                            </c:forEach>
                        </select>
                    </a>
                </th>
                <th>Author</th>
                <th>Publisher</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>

<%--                        <c:forEach items="${bookList}" var="book">--%>
<%--                            <tr>--%>
<%--                                <td>${book.id}</td>--%>
<%--                                <td>${book.name}</td>--%>
<%--                                <td>${book.cost}</td>--%>
<%--                                <td>${book.description}</td>--%>
<%--                                <td>${categoryList.get(book.categoryId)}</td>--%>
<%--                                <td>${authorList.get(book.authorId)}</td>--%>
<%--                                <td>${publisherList.get(book.publisherId)}</td>--%>
<%--                                <td><a class="btn btn-outline-primary" data-toggle="modal" data-target="#modalUpdate"--%>
<%--                                       onclick="onUpdate(${book.id},'${book.name}',${book.cost},'${book.description}',${book.categoryId}, ${book.authorId}, ${book.publisherId})">Update</a>--%>
<%--                                </td>--%>
<%--                                <td><a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#modalDelete"--%>
<%--                                       onclick="onDelete(${book.id})">Delete</a></td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>

            <c:forEach items="${bookList}" var="book">
                <form action="/books" method="post">
                    <tr>
                        <td><label class="setLabel${book.id}">${book.id}</label>
                            <input name="id" type="hidden" class="setInput${book.id} form-control" value="${book.id}">
                        </td>
                        <td><label class="setLabel${book.id}" ondblclick="onA(${book.id})">${book.name}</label>
                            <input name="name" type="text" style="display: none; width: 150px;"
                                   class="setInput${book.id} form-control" value="${book.name}">
                        </td>
                        <td><label class="setLabel${book.id}">${book.cost}</label>
                            <input name="cost" type="text" style="display: none; width: 80px;"
                                   class="setInput${book.id} form-control" value="${book.cost}">
                        </td>
                        <td><label class="setLabel${book.id}">${book.description}</label>
                            <input name="description" type="text" style="display: none; width: 120px;"
                                   class="setInput${book.id} form-control" value="${book.description}">
                        </td>
                        <td><label class="setLabel${book.id}">${categoryList.get(book.categoryId)}</label>
                            <select style="display: none; width: 170px;" name="categoryId"
                                    class="form-control col-8 setInput${book.id}" id="setCategoryId${book.id}">
                                <c:forEach items="${categoryList}" var="category">
                                    <option value="${category.key}" ${category.key == book.categoryId ? 'selected' : '' }>${category.value}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><label class="setLabel${book.id}">${authorList.get(book.authorId)}</label>
                            <select style="display: none; width: 170px;" name="authorId"
                                    class="form-control col-8 setInput${book.id}" id="setAuthorId${book.id}">
                                <c:forEach items="${authorList}" var="author">
                                    <option value="${author.key}" ${author.key == book.authorId ? 'selected' : '' }>${author.value}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><label class="setLabel${book.id}">${publisherList.get(book.publisherId)}</label>
                            <select style="display:none; width: 170px;" name="publisherId"
                                    class="form-control col-8 setInput${book.id}" id="setPublisherId${book.id}">
                                <c:forEach items="${publisherList}" var="publisher">
                                    <option value="${publisher.key}" ${publisher.key == book.publisherId ? 'selected' : '' }>${publisher.value}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <button type="button" class="btn btn-outline-primary"
                                    onclick="onSet(${book.id})"
                                    id="setButton${book.id}a">Update
                            </button>
                            <button name="action" value="update" style="display: none" type="submit"
                                    class="btn btn-outline-primary"
                                    id="setButton${book.id}b">Update
                            </button>
                        </td>
                        <td><a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#modalDelete"
                               onclick="onDelete(${book.id})">Delete</a></td>
                    </tr>

                </form>
            </c:forEach>


            </tbody>
        </table>

        <h2 class="text-center" style="color: red"><c:if test="${message != null}">${message}</c:if></h2>
        <p style="color: red" class="text-center"><c:if test="${messageId != null}">${messageId}</c:if></p>
        <p style="color: red" class="text-center"><c:if test="${messageName != null}">${messageName}</c:if></p>
        <p style="color: red" class="text-center"><c:if test="${messageCost != null}">${messageCost}</c:if></p>

        <ul class="pagination">
            <c:forEach begin="1" end="${totalPage}" var="i">
                <li class="page-item"><a id="${i}" class="page-link active" href="books?page=${i}">${i}</a></li>
            </c:forEach>
        </ul>
        <%---------------%>
        <%--        <nav aria-label="Page navigation example">--%>
        <%--            <ul class="pagination">--%>
        <%--                <c:if test="${currentPage > 1}">--%>
        <%--                    <li class="page-item"><a class="page-link" href="books?page=${currentPage-1}">Previous</a></li>--%>
        <%--                </c:if>--%>

        <%--                <c:if test="${totalPage >= 3}">--%>
        <%--                    <c:if test="${currentPage == 1}">--%>
        <%--                        <li class="page-item active"><a id="${i}" class="page-link active" href="books?page=${currentPage}">${currentPage}</a></li>--%>
        <%--                        <li class="page-item"><a id="${i}" class="page-link" href="books?page=${currentPage + 1}">${currentPage + 1}</a></li>--%>
        <%--                        <li class="page-item"><a id="${i}" class="page-link" href="books?page=${currentPage + 2}">${currentPage + 2}</a></li>--%>
        <%--                    </c:if>--%>

        <%--                    <c:if test="${currentPage > 1 && currentPage < totalPage}">--%>
        <%--                        <li class="page-item"><a id="${i}" class="page-link" href="books?page=${currentPage - 1}">${currentPage - 1}</a></li>--%>
        <%--                        <li class="page-item active"><a id="${i}" class="page-link active" href="books?page=${currentPage}">${currentPage}</a></li>--%>
        <%--                        <li class="page-item"><a id="${i}" class="page-link" href="books?page=${currentPage + 1}">${currentPage +1}</a></li>--%>
        <%--                    </c:if>--%>

        <%--                    <c:if test="${currentPage == totalPage}">--%>
        <%--                        <li class="page-item"><a id="${i}" class="page-link" href="books?page=${currentPage - 2}">${currentPage - 2}</a></li>--%>
        <%--                        <li class="page-item"><a id="${i}" class="page-link" href="books?page=${currentPage - 1}">${currentPage - 1}</a></li>--%>
        <%--                        <li class="page-item active"><a id="${i}" class="page-link active" href="books?page=${currentPage}">${currentPage}</a></li>--%>
        <%--                    </c:if>--%>
        <%--                </c:if>--%>

        <%--                <c:if test="${currentPage < totalPage}">--%>
        <%--                    <li class="page-item"><a class="page-link" href="books?page=${currentPage + 1}">Next</a></li>--%>
        <%--                </c:if>--%>

        <%--            </ul>--%>
        <%--        </nav>--%>
        <%---------------%>
        <c:if test="${sort != null}"><a href="/books" class="btn btn-outline-primary">Back</a></c:if>
        <c:if test="${search != null}"><a href="/books" class="btn btn-outline-primary">Back</a></c:if>

    </div>
</div>
<div class="footer"></div>


<!-- Modal Delete-->
<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/books">
                <div class="modal-body">
                    <input type="hidden" id="deleteId" name="id">
                    <h2>Are you sure ?</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="action" value="delete">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal Update-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/books">
                    <input type="hidden" name="id" id="updateId">
                    <div class="form-group row">
                        <label class="col-form-label col-3">Name</label>
                        <input type="text" class="form-control col-8" name="name" id="updateName">
                    </div>
                    <small style="color: red; margin-left: 25%; font-size: 100%"><c:if
                            test="${messageCost != null}">${messageCost}</c:if></small>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Cost</label>
                        <input type="text" class="form-control col-8" name="cost" id="updateCost">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Description</label>
                        <input type="text" class="form-control col-8" name="description" id="updateDescription">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">ID</label>
                        <select name="categoryId" class="form-control col-8" id="updateCategoryId">
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category.key}">${category.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Author</label>
                        <select name="authorId" class="form-control col-8" id="updateAuthorId">
                            <c:forEach items="${authorList}" var="author">
                                <option value="${author.key}">${author.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Publisher</label>
                        <select name="publisherId" class="form-control col-8" id="updatePublisherId">
                            <c:forEach items="${publisherList}" var="publisher">
                                <option value="${publisher.key}">${publisher.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="update">Save</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script>
    function onDelete(id) {
        document.getElementById("deleteId").value = id;
    }

    function onUpdate(id, name, cost, description, categoryId, authorId, publisherId) {
        document.getElementById("updateId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updateCost").value = cost;
        document.getElementById("updateDescription").value = description;
        document.getElementById("updateCategoryId").value = categoryId;
        document.getElementById("updateAuthorId").value = authorId;
        document.getElementById("updatePublisherId").value = publisherId;
    }


    function onSort() {
        document.getElementById("sort").value = 'asc';

    }

    function onSearch(key) {
        if (key.value === "all") {
            document.getElementById("searchKey").href = '/books';
        } else {
            document.getElementById("searchKey").href = '/books?action=search-by-category&category-id=' + key.value;
        }
    }

    function onSet(id) {
        $(".setInput" + id).show();
        $(".setLabel" + id).hide();

        $("#setButton"+id+"a").hide();
        $("#setButton"+id+"b").show();

    }

    <%--$(document).ready(function () {--%>
    <%--    if ('${messageCost}' != '') {--%>
    <%--        document.getElementById("updateId").value = '${id}';--%>
    <%--        document.getElementById("updateName").value = '${name}';--%>
    <%--        document.getElementById("updateCost").value = '${cost}';--%>
    <%--        document.getElementById("updateDescription").value = '${description}';--%>
    <%--        document.getElementById("updateCategoryId").value = '${categoryId}';--%>
    <%--        document.getElementById("updateAuthorId").value = '${authorId}';--%>
    <%--        document.getElementById("updatePublisherId").value = '${publisherId}';--%>
    <%--        $('#modalUpdate').modal('show');--%>
    <%--    }--%>
    <%--});--%>


</script>
</body>
</html>
