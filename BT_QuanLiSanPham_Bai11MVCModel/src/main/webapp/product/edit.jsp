<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 27/06/2023
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test="${requestScope['message'] != null}">
        <span class="message"> ${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back To Product </a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>NameProduct</td>
                <td><input type="text" id="name" name="name" value="${requestScope["product"].getNameProduct()}"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="number" id="price" name="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Describe</td>
                <td><input type="text" id="Describe" name="Describe" value="${requestScope["product"].getDescribe()}"></td>
            </tr>
            <tr>
                <td>Producer</td>
                <td><input type="text" id="Producer" name="Producer" value="${requestScope["product"].getProducer()}"></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><input type="submit" value="Update Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
