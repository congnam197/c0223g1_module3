<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1 style="text-align: center">Product Discount Calculator</h1>
<form action="/display-discount" method="post">
    <label for="description">Product Description</label>
    <input type="text" name="description" id="description"><br><br>
    <label for="price"> List Price</label>
    <input type="number" name="price" id="price"><br><br>
    <label for="discount"> Discount Percent</label>
    <input type="number" name="discount" id="discount"><br><br>
    <button type="submit" name="Submit">Calculate Discount</button>
</form>
</body>
</html>