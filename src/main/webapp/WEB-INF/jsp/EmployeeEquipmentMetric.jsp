<%@ include file = "common/header.jspf" %>

<c:url var="cssUrl" value="/css/employeeEquipmentMetricCSS.css"/>
<link rel="stylesheet" href="${cssUrl}"/>
<div id="box">
<h1>Machine Metrics</h1>
<c:url var = "employeeMetricUrl" value="/employeeEquipmentMetricList"/>
<form method = "GET" action = "${employeeMetricUrl}">
  <label for="check_in"> Check In Month:</label>
  <select name = "check_in" id="check_in">
    <option value = 1> January</option>
    <option value = 2> February</option>
    <option value = 3> March</option>
    <option value = 4> April</option>
    <option value = 5> May</option>
    <option value = 6> June</option>
    <option value = 7> July</option>
    <option value = 8> August</option>
    <option value = 9> September</option>
    <option value = 10> October</option>
    <option value = 11> November</option>
    <option value = 12> December</option>
  </select>

  <label for="check_out"> Check Out Month:</label>
  <select name = "check_out" id="check_out">
    <option value = 1> January</option>
    <option value = 2> February</option>
    <option value = 3> March</option>
    <option value = 4> April</option>
    <option value = 5> May</option>
    <option value = 6> June</option>
    <option value = 7> July</option>
    <option value = 8> August</option>
    <option value = 9> September</option>
    <option value = 10> October</option>
    <option value = 11> November</option>
    <option value = 12> December</option>
  </select>

    <input type="submit"/>
</form>
</div>
<br> <br>


<!DOCTYPE HTML>
<html>
<head>
    <c:if test="${employeeEquipmentMetricStartMonth != null}">


        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    title: {
                        text: "${employeeEquipmentMetricStartMonth} to ${employeeEquipmentMetricEndMonth} Equipment Metrics"
                    },
                    data: [{
                        type: "pie",
                        startAngle: 240,
                        yValueFormatString: "##0.00\"\"",
                        indexLabel: "{label} {y}",
                        dataPoints: [
                            <c:forEach items="${getAllEquipmentMetricForEmployee}" var="equipment_metric">

                            {
                                label: "${equipment_metric.name}",
                                y: parseFloat("${equipment_metric.equipmentUsage }")
                            },

                            </c:forEach>
                        ]
                    }]
                });
                chart.render();

            }
        </script>
    </c:if>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="${pageContext.request.contextPath}/javascript/canvasjs.min.js"></script>
</body>
</html>

<table class="table">
    <tr>
        <th>Equipment Name</th>
        <th>Number of minutes used</th>
    </tr>
    <c:forEach items="${getAllEquipmentMetricForEmployee}" var="equipment_metric">
    <tr>
      <td>${equipment_metric.name} </td>
      <td>${equipment_metric.equipmentUsage }</td>
    </tr>
  </c:forEach>
</table>




<%@ include file = "common/footer.jspf" %>
