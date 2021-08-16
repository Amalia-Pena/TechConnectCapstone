<%@ include file = "common/header.jspf" %>

<c:url var="cssUrl" value="/css/employeeEquipmentMetricCSS.css"/>
<link rel="stylesheet" href="${cssUrl}"/>

<h1>Machine Metrics</h1>
<c:url var = "employeeMetricUrl" value="/employeeEquipmentMetricList"/>
<form method = "GET" action = "${employeeMetricUrl}">
  <label for="check_in"> Check In:</label>
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

  <label for="check_out"> Check Out:</label>
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
 <%-- <label for = "check_in"> Check In Month (ex: 8)</label>
  <input type = "text" name="check_in" id = "check_in"/> --%>

 <%-- <label for = "check_out"> Check Out Month (ex: 8)</label>
  <input type = "text" name="check_out" id = "check_out"/> --%>

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
