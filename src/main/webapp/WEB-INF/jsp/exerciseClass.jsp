<%@ include file = "common/header.jspf" %>

<h1>Exercise Class</h1>
<table class="table">
  <thead class="table-light">
  <th>Class ID</th>
  <th>Instructor ID</th>
  <th>Class Name</th>
  <th>Class Description</th>
  <th>Class Start Date</th>
  <th>Class End Date</th>
  </thead>
  <tbody>
  <c:forEach items = "${exerciseClass}" var = "exerciseClass">
    <tr>
      <td>${exerciseClass.class_id}</td>
      <td>${exerciseClass.instructor_id}</td>
      <td>${exerciseClass.class_name}</td>
      <td>${exerciseClass.class_description}</td>
      <td>${exerciseClass.class_start_date}</td>
      <td>${exerciseClass.class_end_date}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<%@ include file = "common/footer.jspf" %>