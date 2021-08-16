<%@ include file="common/header.jspf" %>

<c:url var="workoutMetricUrl" value="/gymMemberWorkoutMetrics"/>
<c:if test="${not empty gymSessionEquipmentUsageMapStrength}">

    <table class="table">
        <thead class="table-light">
        <th>Equipment Name</th>
        <th>Reps</th>
        <th>Weight Per Rep</th>
        </thead>

        <tbody>
        <h1>Strength Equipment Metrics</h1>
        <c:forEach var="entry" items="${gymSessionEquipmentUsageMapStrength}">
          <tr>
          <td>
                    ${entry.key}
            </td>
            <td>
                    ${entry.value.reps}
            </td>
            <td>
                    ${entry.value.weight_per_rep}
            </td>
          </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<c:if test="${not empty gymSessionEquipmentUsageMapCardio}">

<table class="table">
    <thead class="table-light">
    <th>Equipment Name</th>
    <th>Distance</th>
    </thead>
    <tbody>
    <h1>Cardio Equipment Metrics</h1>
    <c:forEach var="entry" items="${gymSessionEquipmentUsageMapCardio}">
      <tr>
        <td>
                ${entry.key}
        </td>
        <td>
                ${entry.value.distance}
        </td>
      </tr>
    </c:forEach>
    </tbody>
</table>
</c:if>

<%@ include file="common/footer.jspf" %>

