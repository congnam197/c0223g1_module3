<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/31/2023
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove product</title>
</head>
<body>
<form action="/product-servlet?action=edit " method="post">
    <fieldset>
        <legend>Thong Tin San Pham:</legend>
        Id san pham : <input type="text" value="${id}" name="id" readonly><br><br>
        Ten San Pham: <input type="text" name="name" value="${name}" size="50"/><br><br>
        Gia: <input type="text" name="price" value="${price}" size="50"/><br><br>
        Mo Ta: <input type="text" name="description" value="${description}" size="100"/><br><br>
        <button type="submit">Hoan Thanh Chinh Sua</button>
    </fieldset>
</form>
<a href="/product-servlet">Xem Danh Sach San Pham</a>
</body>
</html>
