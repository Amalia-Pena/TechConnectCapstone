<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "common/header.jspf" %>

<c:url var="gymSessionUrl" value="/gymSession"/>
<form: form action ="${gymSessionUrl}" method="GET" model attribute="user">
<button type="submit" class="btn btn-default">Start Workout</button>
</form:>


<%@ include file = "common/footer.jspf" %>
