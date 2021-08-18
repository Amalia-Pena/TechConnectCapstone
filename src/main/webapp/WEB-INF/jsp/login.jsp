<%@ include file = "common/header.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="loginUrl" value="/login"/>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Login Page</title>
    <link href="<c:url value="/css/form.css"/>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form action="${loginUrl}" method="POST">
        <div class="container-box">
            <h1>Login</h1>
            <div class="text-box">
                <i class="fas fa-user"></i>
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" style="color:black">
            </div>
            <div class="text-box">
                <i class="fas fa-lock"></i>
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" style="color:black">
            </div>

            <button type="submit" class="btn btn-default">Login</button>

        </div>
    </form>
</body>
</html>


