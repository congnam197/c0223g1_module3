<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/31/2023
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<form action="/product-servlet?action=create " method="post">
    <fieldset>
        <legend>Thong Tin San Pham:</legend>
        Ten San Pham: <input type="text" name="name" size="50"/><br><br>
        Gia: <input type="text" name="price" size="50"/><br><br>
        Mo Ta: <input type="text" name="description" size="100"/><br><br>
        <button type="submit">Submit</button>
    </fieldset>
</form>
<div class="btn-group">
    <a href="/product-servlet">Xem Danh Sach San Pham</a>
</div>
</body>
</html>
