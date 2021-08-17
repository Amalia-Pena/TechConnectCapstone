<%@ include file = "common/header.jspf" %>

<c:url var="cssUrl" value="/css/employeeEquipmentMetricCSS.css"/>
<link rel="stylesheet" href="${cssUrl}"/>

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

  <input type = "submit"/>
</form>


<table class="table">
  <tr>
    <th>Name</th>
    <th>Number of days used</th>
  </tr>
  <c:forEach items="${getAllEquipmentMetricForEmployee}" var="equipment_metric">
    <tr>
      <td>${equipment_metric.name} </td>
      <td>${equipment_metric.equipmentUsage }</td>
    </tr>
  </c:forEach>
</table>


  <script>
    window.onload = function () {

      var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2", // "light1", "light2", "dark1", "dark2"
        title:{
          text: "Monthly Equipment Use"
        },
        axisY: {
          title: "Days"
        },
        data: [{
          type: "column",
          showInLegend: true,
          legendMarkerColor: "grey",
          legendText: "Equipment Use (days)",
          dataPoints: [
            { y: 300878, label: "Venezuela" },
            { y: 266455,  label: "Saudi" },
            { y: 169709,  label: "Canada" },
            { y: 158400,  label: "Iran" },
            { y: 142503,  label: "Iraq" },
            { y: 101500, label: "Kuwait" },
            { y: 97800,  label: "UAE" },
            { y: 80000,  label: "Russia" }
          ]
        }]
      });
      chart.render();

    }
  </script>


<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>



<%@ include file = "common/footer.jspf" %>
