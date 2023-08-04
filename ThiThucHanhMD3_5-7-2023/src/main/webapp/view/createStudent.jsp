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
    <title>Student Management</title>
</head>
<body>
<center>
    <h1>Management Student</h1>
    <h2>
        <a href="/student">List All Student</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Add New Student
                </h2>
            </caption>
            <c:if test="${student != null}">
                <input type="hidden" name="id" value="<c:out value='${student.id}'/>"/>
            </c:if>
            <tr>
                <th>Name:</th>
                <td>
                    <input  placeholder="Enter Name" type="text" name="name" size="45"
                           value="<c:out value='${student.name}'/>"
                    />
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input placeholder="Enter Email" type="text" name="email" size="45"
                           value="<c:out value='${student.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Birth Day:</th>
                <td>
                    <input placeholder="Enter date of birth as DD//MM//YYYY" type="text" name="birthDay" size="45"
                           value="<c:out value='${student.birthDay}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input placeholder="Enter address" type="text" name="address" size="45"
                           value="<c:out value='${student.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>phone Number:</th>
                <td>
                    <input placeholder="Enter Phone Number" type="text" name="phoneNumber" size="45"
                           value="<c:out value='${student.phoneNumber}' />"/>
                </td>
            </tr>
            <tr>
                <th>Class Room:</th>
                <td>
                    <input placeholder="Open this select menu" type="text" name="classRoom" size="45"
                           value="<c:out value='${student.classRoom}' />"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Submit"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
