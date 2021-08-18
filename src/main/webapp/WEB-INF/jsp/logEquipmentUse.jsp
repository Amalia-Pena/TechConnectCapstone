<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "common/header.jspf" %>
<c:url var="equipmentUrl" value="/logEquipmentUse"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log Strength Equipment Use</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/2745819f47.js" crossorigin="anonymous"></script>
    <link href="<c:url value="/css/logEquipmentUse.css"/>" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="wrapper">


    <div class="inner">
        <form:form action="${equipmentUrl}" method="POST" modelAttribute="equipmentUsage"
                   enctype="multipart/form-data">
            <div class="user-details">
                <div class="form-group">
                    <div class="form-wrapper">
                        <label for="reps" class="details">Reps</label>
                        <form:input class="form-control" path="reps" placeholder="reps"/>
                        <form:errors path="reps" cssClass="bg-danger"/>
                    </div>
                    <div class="form-wrapper" style="margin-right: 20px">
                        <label for="weight_per_rep" class="details">Weight Per Rep</label>
                        <form:input class="form-control" path="weight_per_rep" placeholder="weight_per_rep"/>
                        <form:errors path="weight_per_rep" cssClass="bg-danger"/>
                    </div>
                    <div class="form-wrapper">
                        <label for="distance" class="details">Distance</label>
                        <form:input class="form-control" path="distance" placeholder="distance" value="0"/>
                        <form:errors path="distance" cssClass="bg-danger"/>
                    </div>
                </div>

                <button type="submit" class="btn btn-default">Check out</button>
            </div>
        </form:form>
    </div>
    <section class="boxes">
        <c:url var="equipmentUrl" value="/GymEquipmentHelp?equipment_id=${equipmentSelection}"/>
        <a href="${equipmentUrl}">
            <div class="box">
                <i class="fas fa-info-circle fa-4x" style="margin-bottom: 1rem"></i>
                <br>
                <h4>Get Help With ${equipment.name} Equipment</h4>
            </div>
        </a>
    </section>
</div>

</body>
</html>


<%@ include file="common/footer.jspf" %>