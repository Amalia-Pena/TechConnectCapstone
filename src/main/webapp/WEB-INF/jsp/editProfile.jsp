<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<c:url var="profileUrl" value="/editProfile"/>
<form:form action="${profileUrl}" method="POST" modelAttribute="user" enctype="multipart/form-data">
    <c:url var="profileUrl" value="/profile"/>
    <c:url var="profileImg" value="/profile/image?userName=${user.username}"/>
    <td><img height="50" width="50" src="${profileImg}" alt="None"/></td>
    <div class="form-group">
        <label for="photoPathContainer">Photo</label>
        <!--Added for adding image to DB -->
        <input type="file" class="form-control" id="photoPathContainer" name="photoPathContainer" value=""/>
    </div>
    <label>
        <input type="checkbox" name="radioButton" id="radioButton" value="delete" unchecked/>
        Delete Profile Picture?
    </label>
    <div class="form-group">
        <label for="firstName">First Name</label>
        <form:input class="form-control" path="firstName" value="${user.firstName}"/>
        <form:errors path="firstName" cssClass="bg-danger"/>
    </div>
    <div class="form-group">
        <label for="lastName">Last Name</label>
        <form:input class="form-control" path="lastName" value="${user.lastName}"/>
        <form:errors path="lastName" cssClass="bg-danger"/>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <form:input class="form-control" path="email" value="${user.email}"/>
        <form:errors path="email" cssClass="bg-danger"/>
    </div>
    <div class="form-group">
        <label for="height">Height (inches)</label>
        <form:input type="number" step=".01" min="0" max="120" class="form-control" path="height"
                    value="${user.height}"/>
        <form:errors path="height" cssClass="bg-danger"/>
    </div>
    <div class="form-group">
        <label for="weight">Weight (lbs)</label>
        <form:input type="number" step=".01" min="0" class="form-control" path="weight" value="${user.weight}"/>
        <form:errors path="weight" cssClass="bg-danger"/>
    </div>

    <button type="submit" class="btn btn-default">Save</button>
</form:form>

<%@ include file="common/footer.jspf" %>
