<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<c:url var="cssUrl" value="/css/equipmentSelection.css"/>
<link rel="stylesheet" href="${cssUrl}"/>


<h1>Welcome to the Equipment Selection Page</h1>

<c:url var="equipmentUrl" value="/GymEquipmentHelp?equipment_id=${equipment.equipment_id}"/>
<c:url var="logStrengthUrl" value="/logStrengthEquipmentUse"/>

<form action="${logStrengthUrl}">
    <label for="equipmentSelect">Please choose a </label>
    <select name="equipmentSelect" id="equipmentSelect">

        <c:forEach var="equipment" items="${strengthEquipmentList}">
            <option value="${equipment.equipment_id}">
                    ${equipment.name}
            </option>
        </c:forEach>
    </select>
    <br><br>
    <input type="submit" value="Check In">
</form>




<%@ include file="common/footer.jspf" %>
