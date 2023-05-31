<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/31/2023
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<div style="justify-items: center">
    <h2 style="text-align: center">DANH SACH SAN PHAM</h2>
    <div class="btn-group">
        <a href="/product-servlet?action=create" class="btn btn-primary">Them San Pham Moi</a>
    </div>
    <br>
    <table id="tableProduct" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>STT</th>
            <th>Ten San Pham</th>
            <th>Gia San Pham</th>
            <th>Mo Ta</th>
            <th colspan="2" width="100px">Thao Tac</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="product" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td width="48px">
                    <a href="/product-servlet?action=edit&id=${product.id}">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </a>
                </td>
                <td width="48px">
                    <a href="/product-servlet?action=remove&id=${product.id}">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>
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
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>
</body>
</html>
