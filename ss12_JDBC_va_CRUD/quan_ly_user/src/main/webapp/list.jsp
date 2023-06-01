<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/1/2023
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List User</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            color: cornflowerblue;
            box-shadow: 0 0 2px deepskyblue;
        }

        form {
            width: 30%;
        }
    </style>
</head>
<body>
<center>
    <h1>User Management</h1>

    <form action="/user-servlet" method="get">
        <input type="hidden" name="action" value="search">
        <span><input type="text" name="search" placeholder="search user by country"></span>
        <span> <button class="button" type="submit">Search</button></span>
    </form>
    <div class="justify-content-end row">
        <div class="col-2">
            <h4><a href="/user-servlet?action=create">AddUser</a></h4>
        </div>
        <div class="col-2">
            <h4><a href="/user-servlet?action=orderBy">Sort By Name</a></h4>
        </div>

    </div>
</center>
<div align="center">
    <table id="tableUser" class="table table-striped">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/user-servlet?action=edit&id=${user.id}"> <i class="fa-solid fa-pen-to-square"></i></a>
                </td>
                <td>
                    <button type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="remove(${user.id},'${user.name}')">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                    <a href="/user-servlet?action=delete&id=${user.id}"> </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button class="button"><a href="/user-servlet">Back To Homepage</a></button>
    <%--    Modal--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Delete User</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h3>Do you wanna remove
                        <span style="color:red" id="nameDelete"></span>?
                    </h3>
                </div>
                <div class="modal-footer">
                    <form action="/user-servlet?action=delete" method="post">
                        <input type="hidden" name="idDelete" id="idDelete">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="submit" class="btn btn-primary">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableUser').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        });
    });

    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }
</script>
</body>
</html>
