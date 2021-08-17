<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="common/header.jspf" %>
<c:url var="logEquipmentUrl" value="/logEquipmentUse"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="<c:url value="/css/equipmentSelection.css"/>" rel="stylesheet" type="text/css" />
    <title>Equipment Selection</title>
</head>
<body style="background: url(/siteImages/equipmentSelection.jpg) no-repeat;
    background-size: cover;">
    <h1>Equipment Selection</h1>

    <div id = "nest">

    <form action="${logEquipmentUrl}" method="GET" modelAttribute="equipmentUsage">
        <label for="equipmentSelect">Please select your equipment: </label>
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
    </div>
</body>
</html>

<%@ include file="common/footer.jspf" %>
