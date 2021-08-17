<%@ include file = "common/header.jspf" %>

<h1> Gym Sessions </h1>
<c:url var="workoutMetricUrl" value="/gymMemberWorkoutMetrics"/>

<table class="table">
    <thead class="table-light">
    <th>Session ID</th>
    <th>Check In</th>
    <th>Check Out</th>
    </thead>

    <tbody>
    <c:forEach items="${allGymSessions}" var="gymSession">
        <c:url var="equipmentUsageUrl" value="/gymSessionEquipmentMetrics?session_id=${gymSession.session_id}"/>

        <tr>
            <td><a href="${equipmentUsageUrl}"> Gym Session ${gymSession.session_id}</a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<%@ include file = "common/footer.jspf" %>
