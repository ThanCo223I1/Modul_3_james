<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background-image: url("https://hungphatsaigon.vn/wp-content/uploads/2022/07/hinh-nen-anime-1.jpg");

        }

        table {
            padding: 20px;
            background-color: gainsboro;
            border: 1px solid;

        }
    </style>
</head>
<body>
<table>
    <tr>
        <td colspan="2" style="text-align: center"><h1>REGISTER</h1></td>
        <td></td>
    </tr>
    <tr>
        <td id="1">First Name</td>
        <td><input type="text" placeholder="First Name"></td>
    </tr>
    <br>
    <tr>
        <td>First Name</td>
        <td><input type="text" placeholder="First Name"></td>
    </tr>
    <br>

    <tr>
        <td>Email*</td>
        <td><input type="text" placeholder="Email"></td>
    </tr>
    <br>
    <tr>
        <td>Password*</td>
        <td><input type="text" placeholder="Password"></td>
    </tr>
    <br>
    <tr>
        <td>Confirm Password*</td>
        <td><input type="text" placeholder="Confirm Password"></td>
    </tr>
    <br>
    <tr>
        <td>Date of Birth*</td>
        <td><input type="text" placeholder="dd/mm/yyyy"></td>
    </tr>
    <br>
    <tr>
        <td>Phone number</td>
        <td><input type="text" placeholder="Phone number"></td>
    </tr>
    <br>
    <tr>
        <td></td>
        <td>Your phone number won't be disclosed anywhere</td>
    </tr>
    <br>
    <tr>
        <td>Gender</td>
        <td><input type="radio" id="femaleRadio" value="Female">Female
            <input type="radio" id="maleRadio" value="Male">Male
        </td>
    </tr>
    <br>
    <tr>
        <td></td>
        <td>*Required fields</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <button type="submit" class="btn btn-primary btn-block" style="width: 300px; height: 20px" ><h2>Register</h2></button>
        </td>
        <td></td>
    </tr>

</table>

</body>
</html>