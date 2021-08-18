<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="gymMetricUrl" value="/gymMemberVisitMetrics"/>
<link href="<c:url value="/css/gymMemberVisitMetrics.css"/>" rel="stylesheet" type="text/css" />
<form:form action="${gymMetricUrl}">

<h1>Visit Metrics</h1>

    <div class="box">
        <i class="fas fa-chart-bar fa-4x" style="margin-bottom: 1rem"></i>
        <h3>Total Gym Time: ${allTimeMetric}</h3>

    </div>

    <div class="box">
        <i class="fas fa-chart-bar fa-4x" style="margin-bottom: 1rem"></i>
        <h3>Gym Time: ${averageTimeMetric}</h3>

    </div>


    <br> <br>

    <div id = "date">
        <c:url var="gymVisitUrl" value="/gymMemberVisitMetrics"></c:url>
        <form action="gymVisitUrl" method="GET">
            <label for="start_date">Custom Start Date: </label>
            <input type="date" name="start_date" id="start_date">
            <label for="end_date">Custom End Date: </label>
            <input type="date" name="end_date" id="end_date">
            <button type="submit" class="btn btn-default">Search</button>
        </form>
        <h1>Week: ${defaultWeekStart} - ${defaultWeekEnd} Visit Metrics</h1>
        <table class="table">
            <thead class="table-light">
            <th>Day</th>
            <th>Visit Duration</th>
            </thead>
            <tbody>
            <c:set var="dayFlag" value="false"></c:set>
            <c:forEach var="dayOfWeek" items="${defaultWeekMetric}">
                <tr>
                    <td>${dayOfWeek.day}</td>
                    <td>${dayOfWeek.totalGymTime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</form:form>

<script>
    window.onload = function () {
        var defualtWeekDataPoints = generateDataPoints();
        var chart = new CanvasJS.Chart("chartContainer", {

            animationEnabled: true,
            theme: "light2", // "light1", "light2", "dark1", "dark2"
            title: {
                text: "Week: " + "${defaultWeekStart}" + "-" + "${defaultWeekEnd}" + " Visit Metrics"
            },
            axisY: {
                title: "Minutes",
                suffix: "min"
            },
            axisX: {},
            data: [{
                type: "column",
                yValueFormatString: "#,##0.000000000000#\"\"",
                dataPoints: defualtWeekDataPoints
            }]
        });
        chart.render();

        function generateDataPoints() {
            var arr = [];
            <c:forEach var="day" items="${defaultWeekMetric}">
            arr.push({label: "${day.day}", y: parseFloat("${day.totalGymTime}")});
            </c:forEach>
            return arr;
        }


    }
</script>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="${pageContext.request.contextPath}/javascript/canvasjs.min.js"></script>
</body>


<%@ include file="common/footer.jspf" %>