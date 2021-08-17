<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "common/header.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="addEmployeeUrl" value="/createEmployee"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/css/createEmployee.css"/>" rel="stylesheet" type="text/css" />

</head>



<body>
<div class="wrapper">
    <h1 class="main-header">Add Employee</h1>
    <div class="inner">

<form:form action="${addEmployeeUrl}" method="POST" modelAttribute="user" enctype="multipart/form-data">
    <div class="user-details">
        <div class="form-group">
            <div class="form-wrapper">
        <label for="username">Username</label>
        <form:input class="form-control" path="username" placeholder="Username"/>
        <form:errors path="username" cssClass="bg-danger"/>
    </div>
    <div class="form-wrapper">
        <label for="password">Password</label>
        <form:password class="form-control" path="password"/>
        <form:errors path="password" cssClass="bg-danger"/>
    </div>
        </div>
    <div class="form-wrapper">
        <label for="confirmPassword">Confirm Password</label>
        <form:password class="form-control" path="confirmPassword"/>
        <form:errors path="passwordMatching" cssClass="bg-danger"/>
    </div>

    <div class="form-wrapper">
        <label for ="firstName">First Name</label>
        <form:input class="form-control" path ="firstName"/>
        <form:errors path = "firstName" cssClass="bg-danger"/>
    </div>

    <div class="form-wrapper">
        <label for ="lastName">Last Name</label>
        <form:input class="form-control" path ="lastName"/>
        <form:errors path = "lastName" cssClass="bg-danger"/>
    </div>

    <div class="form-wrapper">
        <label for ="email">Email</label>
        <form:input class="form-control" path ="email"/>
        <form:errors path = "email" cssClass="bg-danger"/>
    </div>

    <div class="form-wrapper">
        <label for="photoPathContainer">Photo</label>
        <!--Added for adding image to DB -->
        <input type="file" class="form-control" id="photoPathContainer" name="photoPathContainer" value=""/>

    </div>

    <div class="form-group">
        <div class="form-wrapper">
        <label for ="height">Height (inches)</label>
        <form:input type = "number" step = "0.01" min = "0" max = "120" class="form-control" path ="height" />
        <form:errors path = "height" cssClass="bg-danger"/>
    </div>

    <div class="form-wrapper">
        <label for ="weight">Weight (lbs)</label>
        <form:input type = "number" step = "0.01" min = "0" class="form-control" path ="weight"/>
        <form:errors path = "weight" cssClass="bg-danger"/>
    </div>
    </div>


    <fieldset style="display:none">
        <legend>Role</legend>
        <form:errors path="role" cssClass="bg-danger"/>
        <div class="radioSelection">
            <label>
                <form:radiobutton path="role" value="employee" checked="checked"/>
                Employee
            </label>
        </div>
        <div class="radioSelection">
            <label>
                <form:radiobutton path="role" value="admin"/>
                Administrator
            </label>
        </div>
    </fieldset>

    <button type="submit" class="btn btn-default">Save Employee</button>
    </div>
</form:form>
        </div>
    </div>

</body>
</html>

<%@ include file = "common/footer.jspf" %>