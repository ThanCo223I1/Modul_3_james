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
    <title>Manager Staff</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        #hhh{
            text-align: center;
        }
       th{
            text-align: center;
        }
    </style>
</head>
<body>

<center>
    <h1>Manager Staff</h1>
    <form action="/staff?action=search" method="post">
        <input style="width: 300px;" type="text" class="search" name="search" id="search"
               placeholder="Search Name Staff ...">
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
    </form>

</center>

<h2 style="margin-left: 310px">
    <a href="/staff?action=create">Add New Staff</a>
</h2>
<div align="center">
    <form action="" method="get">
        <table border="1" cellpadding="5" width="800" style="text-align: center">
            <tr id="hhh">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Salary</th>
                <th>Department</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${staffList1}" var="staff">
                <tr>
                    <td>${staff.id}</td>
                    <td>${staff.name}</td>
                    <td>${staff.email}</td>
                    <td>${staff.address}</td>
                    <td>${staff.salary}</td>
                    <td>${staff.department}</td>
                    <td>
                        <div style="Display:flex; flex-direction: row">
                            <form action="/staff" method="post">
                                <input type="text" name="action" value="edit" hidden="hidden">
                                <input type="text" name="id" value="${staff.id}" hidden="hidden">
                                <button type="submit">Edit</button>
                            </form>
                            <div>
                                <button type="button" data-toggle="modal" data-target="#myModal">Delete</button>
                                <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;
                                                </button>
                                                <h4 class="modal-title">Bạn chắn chắn xóa</h4>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <form action="/staff" method="get">
                                                    <input type="text" name="action" value="delete" hidden="hidden">
                                                    <input type="text" name="id" value="${staff.id}" hidden="hidden">
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

<%--<a href="
>--%>