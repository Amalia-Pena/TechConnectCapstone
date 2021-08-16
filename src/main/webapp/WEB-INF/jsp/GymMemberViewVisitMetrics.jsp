<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="gymMetricUrl" value="/gymMemberVisitMetrics"/>
<form:form action="${gymMetricUrl}">
    <div class="form-group">
        <p>Total Gym Time: ${allTimeMetric}</p>
    </div>
    <div class="form-group">
        <p>Average Gym Time: ${allTimeMetric}</p>
    </div>
    <div>
        <h1>Daily Visit Metrics</h1>
        <table class="table">
            <thead class="table-light">
            <th>Day</th>
            <th>Average Visit Duration</th>
            </thead>
            <tbody>
            <c:forEach items="${exerciseClass}" var="exerciseClass">
                <tr>
                    <td>${exerciseClass.class_id}</td>
                    <td>${exerciseClass.instructor_id}</td>
                    <td>${exerciseClass.class_name}</td>
                    <td>${exerciseClass.class_description}</td>
                    <td>${exerciseClass.class_start_date}</td>
                    <td>${exerciseClass.class_end_date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</form:form>

<%@ include file="common/footer.jspf" %>