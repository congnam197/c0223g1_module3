%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/1/2023
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Edit New User Here</h1>

    <form action="/user-servlet?action=edit" method="post" style="width: 50%">
        <fieldset>
            <table>
                <legend>Personalia:</legend>
                <tr>
                    <td><label for="id">ID:</label></td>
                    <td><input type="text" id="id" name="id" value="${id}" readonly></td>
                </tr>
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><input type="text" id="name" name="name" value="${name}"></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="text" id="email" name="email" value="${email}"></td>
                </tr>
                <tr>
                    <td><label for="country">Country</label></td>
                    <td><input type="text" id="country" name="country" value="${country}"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Edit"></td>
                </tr>
            </table>
        </fieldset>
    </form>
    <h5><a href="/user-servlet">Back To Homepage</a></h5>
</center>
</body>
</html>
