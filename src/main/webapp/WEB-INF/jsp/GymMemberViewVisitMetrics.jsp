<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:url var="gymMetricUrl" value="/gymMemberVisitMetrics"/>
<link href="<c:url value="/css/gymMemberVisitMetrics.css"/>" rel="stylesheet" type="text/css" />
<form:form action="${gymMetricUrl}">

    <h1>Visit Metrics</h1>
    <section class = "boxes">
    <div class="box">
        <i class="fas fa-chart-bar fa-4x" style="margin-bottom: 1rem"></i>
        <h3 style="font-size: 20px"><strong>Total Gym Time: </strong>${allTimeMetric}</h3>

    </div>

    <div class="box">
        <i class="fas fa-chart-bar fa-4x" style="margin-bottom: 1rem"></i>
        <h3 style="font-size: 20px"><strong>Average Gym Session Time: </strong>${averageTimeMetric} minutes</h3>

    </div>
    </section>


    <br> <br>

    <div id="date">
        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {

                    animationEnabled: true,
                    theme: "dark2", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Today's Metrics"
                    },
                    axisY: {
                        title: "Gym Session Time (Minutes)"

                    },
                    axisX: {},
                    data: [{
                        type: "column",
                        yValueFormatString: "#,##0.00#\"\"",
                        dataPoints: [{
                            label: "${defaultDayMetric.day}",
                            y: parseFloat("${defaultDayMetric.totalGymTime}")
                        }]
                    }]
                });

                var defualtWeekDataPoints = generateWeekDataPoints();
                var chart1 = new CanvasJS.Chart("chartContainer1", {

                    animationEnabled: true,
                    theme: "dark2", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Week: " + "${defaultWeekStart}" + "-" + "${defaultWeekEnd}" + " Metrics"
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
                        text: "Month: " + "${defaultMonthStart}" + " to " + "${defaultMonthEnd}" + " Metrics"
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

        function onClick(e) {
            window.open(e.dataPoint.link, '_blank');
        }

                function generateMonthDataPoints() {
                    var arr = [];
                    <c:forEach var="day" items="${defaultMonthMetric}">
                    arr.push({
                        label: "${day.dayOfMonth}",
                        y: parseFloat("${day.totalGymTime}"),
                        link: "http://www.google.com"
                    });
                    </c:forEach>
                    return arr;
                }

                var defaultYearDataPoints = generateYearDataPoints();
                var chart3 = new CanvasJS.Chart("chartContainer3", {

                    animationEnabled: true,
                    theme: "dark2", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Year: " + "${defaultYearStart}" + " to " + "${defaultYearEnd}" + " Metrics"
                    },
                    axisY: {
                        title: "Gym Session Time (Minutes)"

                    },
                    axisX: {},
                    data: [{
                        type: "column",
                        yValueFormatString: "###,##0.00#\"\"",
                        dataPoints: defaultYearDataPoints
                    }]
                });


                function generateYearDataPoints() {
                    var arr = [];
                    <c:forEach var="month" items="${defaultYearMetric}">
                    arr.push({label: "${month.month}", y: parseFloat("${month.totalGymTime}")});
                    </c:forEach>
                    return arr;
                }

                chart.render();
                chart1.render();
                chart2.render();
                chart3.render();
            }
        </script>
    </div>
</form:form>

<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<p></p>
<div id="chartContainer1" style="height: 300px; width: 100%;"></div>
<p></p>
<div id="chartContainer2" style="height: 300px; width: 100%;"></div>
<p></p>
<div id="chartContainer3" style="height: 300px; width: 100%;"></div>
<script src="${pageContext.request.contextPath}/javascript/canvasjs.min.js"></script>
</body>

<%@ include file="common/footer.jspf" %>