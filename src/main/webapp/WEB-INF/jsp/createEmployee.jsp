<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "common/header.jspf" %>

<c:url var="addEmployeeUrl" value="/createEmployee"/>
<h1>Create Employee</h1>
<form:form action="${addEmployeeUrl}" method="POST" modelAttribute="user">
    <div class="form-group">
        <label for="username">Username</label>
        <form:input class="form-control" path="username" placeholder="Username"/>
        <form:errors path="username" cssClass="bg-danger"/>
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <form:password class="form-control" path="password"/>
        <form:errors path="password" cssClass="bg-danger"/>
    </div>
    <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <form:password class="form-control" path="confirmPassword"/>
        <form:errors path="passwordMatching" cssClass="bg-danger"/>
    </div>

    <div class="form-group">
        <label for ="firstName">First Name</label>
        <form:input class="form-control" path ="firstName"/>
        <form:errors path = "firstName" cssClass="bg-danger"/>
    </div>

    <div class="form-group">
        <label for ="lastName">Last Name</label>
        <form:input class="form-control" path ="lastName"/>
        <form:errors path = "lastName" cssClass="bg-danger"/>
    </div>

    <div class="form-group">
        <label for ="email">Email</label>
        <form:input class="form-control" path ="email"/>
        <form:errors path = "email" cssClass="bg-danger"/>
    </div>

    <div class="form-group">
        <label for="photoPathContainer">Photo</label>
        <!--Added for adding image to DB -->
        <input type="file" class="form-control" id="photoPathContainer" name="photoPathContainer" value=""/>

    </div>

    <div class="form-group">
        <label for ="height">Height (inches)</label>
        <form:input type = "number" step = "0.01" min = "0" max = "120" class="form-control" path ="height" />
        <form:errors path = "height" cssClass="bg-danger"/>
    </div>

    <div class="form-group">
        <label for ="weight">Weight (lbs)</label>
        <form:input type = "number" step = "0.01" min = "0" class="form-control" path ="weight"/>
        <form:errors path = "weight" cssClass="bg-danger"/>
    </div>


    <fieldset>
        <legend>Role</legend>
        <form:errors path="role" cssClass="bg-danger"/>
        <div class="radio">
            <label>
                <form:radiobutton path="role" value="employee" checked="checked"/>
                Employee
            </label>
        </div>
        <div class="radio">
            <label>
                <form:radiobutton path="role" value="admin"/>
                Administrator
            </label>
        </div>
    </fieldset>

    <button type="submit" class="btn btn-default">Save Employee</button>
</form:form>

<%@ include file = "common/footer.jspf" %>