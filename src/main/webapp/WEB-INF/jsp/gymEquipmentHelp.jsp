<%@ include file = "common/header.jspf" %>
<c:url var="gymEquipmentHelpUrl" value="/css/gymEquipmentHelp.css"/>
<link rel="stylesheet" href="${gymEquipmentHelpUrl}"/>

<button onclick="goBack()">Back</button>

<script>
    function goBack() {
        window.history.back();
    }
</script>

<h1>${equipment_name}</h1>

<img src="${equipment_photoPath}" alt="${equipment_photoName}" class = "img-rounded">


<%@ include file = "common/footer.jspf" %>

