<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "common/header.jspf" %>

<c:url var="cssUrl" value="/css/equipmentSelection.css"/>
<link rel="stylesheet" href="${cssUrl}"/>


<h1>Welcome to the Equipment Selection Page</h1>



<div class = "dropdown">
    <button class = "dropbtn"> Select your equipment </button>
    <div class = "dropdown-content">
        <c:forEach var = "equipment" items="${equipmentList}">
            <c:url var="equipmentUrl" value="/GymEquipmentHelp?equipment_id=${equipment.equipment_id}"/>
            <a href = "${equipmentUrl}">${equipment.name}</a>
        </c:forEach>
    </div>
</div>

<%@ include file = "common/footer.jspf" %>
