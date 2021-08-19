<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<head>
    <title>Secret Admin Page</title>
</head>
<body>
<c:url var="secretUrl" value="/rainbowKittenSurprise"/>
<form:form action="${secretUrl}" method="POST">
    <fieldset>
        <div id="roleSelection">
            <label for="admin">Admin:</label>
            <input type="radio" name="role" value="admin" id="admin">
            <label for="employee">Employee:</label>
            <input type="radio" name="role" value="employee" id="employee">
            <label for="user">User:</label>
            <input type="radio" name="role" value="user" id="user">
        </div>
    </fieldset>
    <button type="submit" class="btn btn-default">Save User</button>
</form:form>


</body>
</html>
