<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/29/2023
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display</title>
</head>
<style>
    div {
        font-family: Arial;
        text-align: center;
        border: 1px solid dimgrey;
        width: 60%;
        margin: 50px;
    }
</style>
<body>
<div>
    <h1>Product Discount Calculator</h1>
    Product Description: ${Description} <br>
    Discount: ${Discount} %<br>
    Price: ${Price} Usd<br>
    Discount Amount: ${DiscountAmount} Usd <br>
</div>
</body>
</html>
