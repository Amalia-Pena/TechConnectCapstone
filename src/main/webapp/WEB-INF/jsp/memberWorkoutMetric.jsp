<%@ include file = "common/header.jspf" %>

<h1>Workout Metrics</h1>
<c:url var = "memberMetricUrl" value="/memberWorkoutMetricList"/>
<form method = "GET" action = "${memberMetricUrl}">

    <label for = "totalGymTime"> Total Gym Time </label>
    <input type = "text" name="totalGymTime" id = "totalGymTime"/>


    <input type = "submit" value= "searchAll" name = "searchType"/>
    <input type = "submit" value="searchNone" name = "searchType"/>
</form>


<table class="table">
    <tr>
        <th>Name</th>
    </tr>
    <c:forEach items="${getAllTimeSpentForMember}" var="workout_metric">
        <tr>
            <td>${workout_metric.totalGymTime } </td>
        </tr>
    </c:forEach>
</table>

<%@ include file = "common/footer.jspf" %>
