<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator-servlet" method="post">
    <fieldset style="width: 40%">
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>Fist operand</td>
                <td>
                    <input type="number" name="number1">
                </td>
            </tr>
            <tr>
                <td>Operator</td>
                <td>
                    <select name="operator">
                        <option selected value='+'>Addition</option>
                        <option value='-'>Subtraction</option>
                        <option value='*'>Multiplication</option>
                        <option value='/'>Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand</td>
                <td>
                    <input type="number" name="number2">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" name="submit">Calculator</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>