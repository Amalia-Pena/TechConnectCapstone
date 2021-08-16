<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="gymMetricUrl" value="/gymMemberVisitMetrics"/>
<form:form action="${gymMetricUrl}">
    <div class="form-group">
        <p>Total Gym Time: ${allTimeMetric}</p>
    </div>

</form:form>

<%@ include file="common/footer.jspf" %>