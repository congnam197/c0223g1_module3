<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/29/2023
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<h2>VietNamese Dictionary</h2>
<form action="/DictionaryServlet" method="post"></form>
<input type="text" name="search" placeholder="Enter your word: "/>
<input type = "submit" id = "submit" value = "Search"/>
</body>
</html>
