<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 27/06/2023
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>LIST PRODUCT</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body{
            text-align: center;
        }
        h1{
            color: blue;
        }
        .search{
            height: 33px;
        }
    </style>
</head>
<body>
<h1>List Product</h1>
<p>
    <a href="/products?action=create">Create new product</a>
<form action="/products?action=search" method="post">
    <input type="text" class="search" name="search" id="search" placeholder="Search Product">
    <button type="submit" class="btn btn-info">
        <span class="glyphicon glyphicon-search"></span> Search
    </button>
</form>
</p>
<table border="1" class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Name Product</th>
        <th>Price</th>
        <th>Describe</th>
        <th>Producer</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${product}' var="product">
        <tr>
            <td> ${product.getId()}</td>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getNameProduct()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
