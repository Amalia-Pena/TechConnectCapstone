<%@ include file = "common/header.jspf" %>

<c:url var="cssUrl" value="/css/employeeEquipmentMetricCSS.css"/>
<link rel="stylesheet" href="${cssUrl}"/>

<h1>Machine Metrics</h1>
<c:url var = "employeeMetricUrl" value="/employeeEquipmentMetricList"/>
<form method = "GET" action = "${employeeMetricUrl}">
  <label for = "check_in"> Check In Month (ex: 8)</label>
  <input type = "text" name="check_in" id = "check_in"/>

  <label for = "check_out"> Check Out Month (ex: 8)</label>
  <input type = "text" name="check_out" id = "check_out"/>

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

<%@ include file = "common/footer.jspf" %>
