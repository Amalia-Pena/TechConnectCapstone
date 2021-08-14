<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<h1>Welcome to the site!</h1>

<c:url var="gymSessionUrl" value="/gymSession"/>
<c:url var="equipmentLogUrl" value="/equipmentSelection"/>
<c:if test="${gymSession == null}">
    <form:form action="${equipmentLogUrl}" method="GET" modelAttribute="user">
        <button type="submit" class="btn btn-default">Start Workout</button>
    </form:form>
</c:if>


<c:if test="${gymSession != null}">
    <form:form action="${gymSessionUrl}" method="POST" modelAttribute="user">
        <button type="submit" class="btn btn-default">End Workout</button>
    </form:form>
</c:if>


<%@ include file="common/footer.jspf" %>