<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/06/2023
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete Product</title>
    <a href="/products">Back to customer list</a>
</head>
<body>
<h1>Delete Product</h1>
<form method="post">
    <h3>Are you sure you want to delete?</h3>
    <table>
        <tr>
            <td>NameProduct</td>
            <td>${requestScope["product"].getNameProduct()}</td>
        </tr>
        <tr>
            <td>Price</td>
            <td>${requestScope["product"].getPrice()}</td>
        </tr>
        <tr>
            <td>Describe</td>
            <td>${requestScope["product"].getDescribe()}</td>
        </tr>
        <tr>
            <td>Producer</td>
            <td>${requestScope["product"].getProducer()}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td><input type="submit" value="delete product"></td>
        </tr>
    </table>
</form>
</body>
</html>
