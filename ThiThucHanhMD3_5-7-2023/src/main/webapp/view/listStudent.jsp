<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/07/2023
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Manager Student</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<center>
    <h1>Manager Student</h1>
    <form action="/student?action=search" method="post">
        <input style="width: 300px;" type="text" class="search" name="search" id="search"
               placeholder="Search Name Student ...">
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
    </form>

</center>
<h4 style="margin-left: 320px">
    <a href="/student?action=create">Add New Student</a>
</h4>
<div align="center">
    <form action="" method="get">
        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Birth Day</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Class Room</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${studentList}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.birthDay}</td>
                    <td>${student.address}</td>
                    <td>${student.phoneNumber}</td>
                    <td>${student.classRoom}</td>
                    <td>
                        <div style="Display:flex; flex-direction: row">
                            <form action="/student" method="get">
                                <input type="text" name="action" value="edit" hidden="hidden">
                                <input type="text" name="id" value="${student.id}" hidden="hidden">
                                <button type="submit" style="text-align: center">Edit</button>
                            </form>
                            <div>
                                <button style="text-align: center" type="button" data-toggle="modal"
                                        data-target="#myModal${student.id}">Delete
                                </button>
                                <div class="modal fade" id="myModal${student.id}" role="dialog ">
                                    <div class="modal-dialog modal-lg" style="width: 300px; text-align: center">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                </button>
                                                <h4 class="modal-title">Bạn chắn chắn xóa</h4>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    Close
                                                </button>
                                                <form action="/student" method="get">
                                                    <input type="text" name="action" value="delete" hidden="hidden">
                                                    <input type="text" name="id" value="${student.id}" hidden="hidden">
                                                    <button type="submit" class="btn btn-default">Ok</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
