<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Nhân Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
</head>
<body>
<h1>Danh Sách Nhân Viên</h1>
<p>
    <a href="/nhanviens?action = createNhanVien">Create new customer</a>
</p>
<table>
    <tr>
        <td>Tên</td>
        <td>Ngày Sinh</td>
        <td>Địa Chỉ</td>
        <td>Hình Ảnh</td>
        <td>Thêm Nhân Viên</td>
        <td>Sửa Nhân Viên</td>
        <td>Xóa Nhân Viên</td>
    </tr>
    <c:forEach items="${requestScope['nhanviens']}" var="nhanvien">
        <tr>
            <td><a href="/nhanviens?action = view&id=${nhanvien.getId()}">${nhanvien.getName()}</a></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>