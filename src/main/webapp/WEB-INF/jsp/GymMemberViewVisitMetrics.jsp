<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="form-group">
    <p>Total Gym Time: ${allTimeMetric}</p>
</div>
<div class="form-group">
    <p>Average Gym Time: ${averageTimeMetric}</p>
</div>

<script>
    window.onload = function () {
        var defualtWeekDataPoints = generateWeekDataPoints();
        var chart1 = new CanvasJS.Chart("chartContainer1", {

            animationEnabled: true,
            theme: "dark2", // "light1", "light2", "dark1", "dark2"
            title: {
                text: "Week: " + "${defaultWeekStart}" + "-" + "${defaultWeekEnd}" + " Visit Metrics"
            },
            axisY: {
                title: "Gym Session Time (Minutes)"

            },
            axisX: {},
            data: [{
                type: "column",
                yValueFormatString: "#,##0.00#\"\"",
                dataPoints: defualtWeekDataPoints
            }]
        });


        function generateWeekDataPoints() {
            var arr = [];
            <c:forEach var="day" items="${defaultWeekMetric}">
            arr.push({label: "${day.day}", y: parseFloat("${day.totalGymTime}")});
            </c:forEach>
            return arr;
        }


        var defualtMonthDataPoints = generateMonthDataPoints();
        var chart2 = new CanvasJS.Chart("chartContainer2", {

            animationEnabled: true,
            theme: "dark2", // "light1", "light2", "dark1", "dark2"
            title: {
                text: "Month: " + "${defaultMonthStart}" + " to " + "${defaultMonthEnd}" + " Visit Metrics"
            },
            axisY: {
                title: "Gym Session Time (Minutes)"

            },
            axisX: {title: "Day of the Month"},
            data: [{
                type: "column",
                click: onClick,
                yValueFormatString: "#,##0.00#\"\"",
                dataPoints: defualtMonthDataPoints
            }]
        });
        chart1.render();
        chart2.render();

        function onClick(e) {
            window.open(e.dataPoint.link, '_blank');
        }

        function generateMonthDataPoints() {
            var arr = [];
            <c:forEach var="day" items="${defaultMonthMetric}">
            arr.push({label: "${day.dayOfMonth}", y: parseFloat("${day.totalGymTime}"), link: "http://www.google.com"});
            </c:forEach>
            return arr;
        }

    }
</script>

<body>
<div id="chartContainer1" style="height: 300px; width: 100%;"></div>
<p></p>
<div id="chartContainer2" style="height: 300px; width: 100%;"></div>
<script src="${pageContext.request.contextPath}/javascript/canvasjs.min.js"></script>
</body>


<%@ include file="common/footer.jspf" %>