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
            <td>${gymSession.check_in}</td>
            <td>${gymSession.check_out}</td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<c:if test="${appCurrentUser.role == 'admin' || appCurrentUser.role == 'employee'}">
    <c:url var="equipmentUsageUrl" value="/gymMemberWorkoutMetrics"/>
    <form action="${equipmentUsageUrl}" method="GET">
        <label for="user_id">Search by Gym Member User ID:</label>
        <input type="text" name="user_id" id="user_id">
        <input type="submit" value="Search">
    </form>
    <h2></h2>
    <table class="table">
        <thead class="table-light">
        <th>User ID</th>
        <th>User Name</th>
        <th>First Name</th>
        <th>Last Name</th>
        </thead>

        <tbody>
        <c:forEach items="${allUsersList}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</c:if>

<%@ include file="common/footer.jspf" %>
