<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/30/2023
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />

</head>
<body>
<c:import url="navbar.jsp"></c:import>
<div style="justify-items: center">
    <h1>Danh Sách Khách Hàng</h1>
    <table id="tableCustomer" class="table table-striped table-bordered" style="width: 100%">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Ngày Sinh</th>
            <th>Địa Chỉ</th>
            <th>Ảnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="customer" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${customer.name}</td>
                <td>${customer.dayOfBirth}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.image}" width="74px" height="50px"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom":'lrtip',
            "lengthChange":false,
            "pageLength":6
            });
    });
</script>
</body>
</html>
