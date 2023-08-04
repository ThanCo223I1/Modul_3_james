<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/06/2023
  Time: 09:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Product</title>
  <style>
    .container{
      border: 1px solid;
      width: 300px;
      text-align: center;
      box-shadow: red 2px 2px 3px 3px;
    }
  </style>
</head>
<body>
<a href="/products">Back To Product List</a><br>
<table class="container">
  <tr>
    <th>Product</th>
    <th>Product Details</th>
  </tr>
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
</table>
</body>
</html>
