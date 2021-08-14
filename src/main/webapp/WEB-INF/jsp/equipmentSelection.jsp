<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<c:url var="cssUrl" value="/css/equipmentSelection.css"/>
<link rel="stylesheet" href="${cssUrl}"/>


<h1>Welcome to the Equipment Selection Page</h1>

<c:url var="logEquipmentUrl" value="/logEquipmentUse"/>

<form action="${logEquipmentUrl}" method="GET" modelAttribute="equipmentUsage">
    <label for="equipmentSelect">Please choose a </label>
    <select name="equipmentSelect" id="equipmentSelect">
        <optgroup label="Strength Equipment">
            <c:forEach var="equipment" items="${strengthEquipmentList}">
                <option value="${equipment.equipment_id}">
                        ${equipment.name}
                </option>
            </c:forEach>
        </optgroup>
        <optgroup label="Cardio Equipment">
            <c:forEach var="equipment" items="${cardioEquipmentList}">
                <option value="${equipment.equipment_id}">
                        ${equipment.name}
                </option>
            </c:forEach>
        </optgroup>
    </select>
    <br><br>
    <input type="submit" value="Check In">
</form>


<%@ include file="common/footer.jspf" %>
