<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<head>
    <title>Secret Admin Page</title>
</head>
<body>
<c:url var="secretUrl" value="/rainbowKittenSurprise"/>
<form:form action="${secretUrl}" method="POST">
    <h1>Administrative Utilities</h1>
    <fieldset>
        <div id="roleSelection">
            <label for="admin">Admin:</label>
            <input type="radio" name="role" value="admin" id="admin">
            <p></p>
            <label for="employee">Employee:</label>
            <input type="radio" name="role" value="employee" id="employee">
            <p></p>
            <label for="user">User:</label>
            <input type="radio" name="role" value="user" id="user">
        </div>
    </fieldset>
    <p></p>
    <label for="data"> Create dummy data?</label>
    <input type="checkbox" value="yes" name="data" id="data">
    <p></p>
    <button type="submit" class="btn btn-default">Submit</button>
</form:form>


</body>
</html>
