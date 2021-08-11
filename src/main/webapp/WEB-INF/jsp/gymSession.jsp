<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "common/header.jspf" %>


<form: form action ="${gymSessionUrl}" method="GET" model attribute="user">
<button type="submit" class="btn btn-default">Start Workout</button>
</form:>


<%@ include file = "common/footer.jspf" %>
