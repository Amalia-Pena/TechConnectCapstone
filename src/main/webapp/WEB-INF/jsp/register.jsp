<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "common/header.jspf" %>
<c:url var="registerUrl" value="/register"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<c:url value="/css/registrationForm.css"/>" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="wrapper">
    <h1 class="main-header">Create an Account</h1>
    <div class="inner">
        <form:form action="${registerUrl}" method="POST" modelAttribute="user" enctype="multipart/form-data">
            <div class="user-details">
                <div class="form-group">
                    <div class="form-wrapper">
                        <label for="firstName" class="details">First Name</label>
                        <form:input class="form-control" path="firstName" placeholder="First Name"/>
                        <form:errors path="firstName" cssClass="text-danger"/>
                    </div>
                    <div class="form-wrapper">
                        <label for="lastName" class="details">Last Name</label>
                        <form:input class="form-control" path="lastName" placeholder="Last Name"/>
                        <form:errors path="lastName" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="form-wrapper">
                    <label for="username" class="details">Username</label>
                    <form:input class="form-control" path="username" placeholder="Username"/>
                    <form:errors path="username" cssClass="text-danger"/>
                </div>
                <div class="form-wrapper">
                    <label for="password" class="details">Password</label>
                    <form:password class="form-control" path="password" placeholder="Password"/>
                    <form:errors path="password" cssClass="text-danger"/>
                </div>
                <div class="form-wrapper">
                    <label for="confirmPassword" class="details">Confirm Password</label>
                    <form:password class="form-control" path="confirmPassword" placeholder="Confirm Password"/>
                    <form:errors path="passwordMatching" cssClass="text-danger"/>
                </div>
                <div class="form-wrapper">
                    <label for="email" class="details">Email</label>
                    <form:input class="form-control" path="email" placeholder="Email"/>
                    <form:errors path="email" cssClass="text-danger"/>
                </div>
                <div class="form-group">
                    <div class="form-wrapper">
                        <label for="height" class="details">Height (inches)</label>
                        <form:input type = "number" step = ".01" min = "0" max = "120" class="form-control" path="height"/>
                        <form:errors path="height" cssClass="text-danger"/>
                    </div>
                    <div class="form-wrapper">
                        <label for="weight" class="details">Weight (lbs)</label>
                        <form:input type = "number" step = ".01" min = "0" class="form-control" path="weight"/>
                        <form:errors path="weight" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="form-wrapper">
                    <label for="photoPathContainer" class="details">Photo</label>
                    <input type="file" class="form-control" id="photoPathContainer" name="photoPathContainer" value=""/>

                </div>
                <div class="form-wrapper">
                    <label for="description" class="details">Fitness Goals</label>
                    <textarea id="description" class="form-control" name="description" placeholder="Tell us about your fitness goals.." style="height:200px"></textarea>
                </div>
                <fieldset style="display:none">
                    <legend>Role</legend>
                    <form:errors path="role"/>
                    <div id ="roleSelection">
                        <label>
                            <form:radiobutton path="role" value="user" checked="checked"/>
                            User
                        </label>
                    </div>

                </fieldset>
                <button type="submit" class="btn btn-default">Save User</button>
            </div>
        </form:form>
    </div>
</div>

</body>
</html>

<%@ include file = "common/footer.jspf" %>