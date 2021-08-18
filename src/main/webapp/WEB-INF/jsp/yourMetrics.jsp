<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>Your Metrics</h1>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="it=edge">
    <script src="https://kit.fontawesome.com/2745819f47.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Catamaran&display=swap" rel="stylesheet">
    <link href="<c:url value="/css/yourMetrics.css"/>" rel="stylesheet" type="text/css" />


</head>

<section class = "boxes">

    <c:if test="${appCurrentUser.role == 'admin' || appCurrentUser.role == 'employee' || appCurrentUser.role == 'user'}">
        <c:url var="gymMemberWorkoutMetricsUrl" value="/gymMemberWorkoutMetrics"/>
        <form:form action = "${gymMemberWorkoutMetricsUrl}" method = "GET">
            <a href="${gymMemberWorkoutMetricsUrl}">
                <div class="box">
                    <i class="fas fa-chart-bar fa-4x" style="margin-bottom: 1rem"></i>
                    <h3>Workout Metrics</h3>
                    <p>Click here to view your workout metrics</p>
                </div>
            </a>
        </form:form>


    </c:if>

    <c:if test="${appCurrentUser.role == 'admin' || appCurrentUser.role == 'user' || appCurrentUser.role == 'employee'}">
        <c:url var="gymMemberVisitMetricsUrl" value="/gymMemberVisitMetrics"/>
        <form:form action = "${gymMemberVisitMetricsUrl}" method = "GET">
            <a href="${gymMemberVisitMetricsUrl}">
                <div class="box">
                    <i class="fas fa-dumbbell fa-4x" style="margin-bottom: 1rem"></i>
                    <h3>Visit Metrics</h3>
                    <p>Click here to view your visit metrics</p>
                </div>
            </a>
        </form:form>


    </c:if>

</section>


<%@ include file="common/footer.jspf" %>
