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
    <c:forEach items="${allGymSessions}" var="Gym_Session">
        <tr>
            <td>${gym_session.session_id}</td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<%@ include file = "common/footer.jspf" %>
