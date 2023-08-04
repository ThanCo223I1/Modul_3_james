<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/07/2023
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Staff</title>
</head>
<center>

    <body>
    <caption><h1>Create Staff</h1></caption>
    <p>
        <a href="/staff">Back To Staff</a>
    </p>
    <form action="#" method="post">
        <div align="center">
            <table border="1" cellpadding="5">
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" id="email"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" id="address"></td>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><input type="number" name="salary" id="salary"></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td><input type="text" name="department" id="department"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create Staff"></td>
                </tr>
            </table>
        </div>
    </form>
    </body>
</center>
</html>
