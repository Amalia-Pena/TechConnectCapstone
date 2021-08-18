<%@ include file="common/header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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

<%--
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

--%>


<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">

    <c:if test="${not empty gymSessionEquipmentUsageMapCardio}">
    <script>

        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                title: {
                    text: "Cardio Equipment Metrics"
                },
                axisY: {
                    title: "Distance (Miles)",
                    titleFontColor: "#4F81BC",
                    lineColor: "#4F81BC",
                    labelFontColor: "#4F81BC",
                    tickColor: "#4F81BC"
                },

                toolTip: {
                    shared: true
                },
                legend: {
                    cursor: "pointer",
                    itemclick: toggleDataSeries
                },
                data: [{
                    type: "column",
                    name: "Treadmill",
                    legendText: "Treadmill",
                    showInLegend: true,
                    dataPoints: [
                        <c:forEach var="entry" items="${gymSessionEquipmentUsageMapCardio}">
                        <c:if test="${entry.value.equipment_id == 1}">
                        { y: parseFloat("${entry.value.distance}"), label:"${entry.value.formattedDate}" },
                        </c:if>
                        </c:forEach>
                    ]
                },
                    {
                        type: "column",
                        name: "Stationary Bike",
                        legendText: "Stationary Bike",
                        showInLegend: true,
                        dataPoints: [
                            <c:forEach var="entry" items="${gymSessionEquipmentUsageMapCardio}">
                            <c:if test="${entry.value.equipment_id == 2}">
                            { y: parseFloat("${entry.value.distance}"), label:"${entry.value.formattedDate}"},
                            </c:if>
                            </c:forEach>
                        ]
                    }]
            });


            chart.render();

            function toggleDataSeries(e) {
                if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                } else {
                    e.dataSeries.visible = true;
                }
                chart.render();
            }

        }

    </script>
    </c:if>
</head>
<body>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="${pageContext.request.contextPath}/javascript/canvasjs.min.js"></script>
</body>
</html>

<%@ include file="common/footer.jspf" %>

