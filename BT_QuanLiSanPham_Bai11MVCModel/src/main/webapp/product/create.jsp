<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 27/06/2023
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>CREATE NEW PRODUCTS</title>
    <style>
        .messenge {
            color: green;
        }
        .container{
            border: 1px solid;
            width: 100%;
            box-shadow: red 2px 2px 3px 3px;
        }
        body{
            text-align: center;
        }
        table{
            text-align: center;
        }
    </style>
</head>
<body>
<h1>CREATE NEW PRODUCTS</h1>
<p>
    <c:if test="${requestScope['messenge'] != null}">
        <span class="messenge">${requestScope["messenge"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back To Products List</a>
</p>
<form  method="post">
    <div class="container">
        <table>
            <thead>
            <tr>
                <td>NameProduct:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Describe:</td>
                <td><input type="text" name="Describe" id="Describe"></td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="Producer" id="Producer"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create Product"></td>
            </tr>
            </thead>
        </table>
    </div>
</form>
</body>
</html>
