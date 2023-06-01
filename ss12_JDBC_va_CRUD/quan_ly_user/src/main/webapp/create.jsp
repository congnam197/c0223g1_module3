<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/1/2023
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create User</title>
</head>
<body>
<center>
    <h1>Create New User Here</h1>

    <form action="/user-servlet?action=create" method="post" style="width: 50%">
        <fieldset>
            <table>
                <legend>Personalia:</legend>
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="email"></td>
                </tr>
                <tr>
                    <td><label for="country">Country</label></td>
                    <td><input type="text" id="country" name="country"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Create"></td>
                </tr>
            </table>
        </fieldset>
    </form>
    <h5><a href="/user-servlet">Back To Homepage</a></h5>
</center>
</body>
</html>
