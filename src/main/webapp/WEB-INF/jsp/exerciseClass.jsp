<%@ include file="common/header.jspf" %>


<c:url var="cssUrl" value="/css/exerciseClass.css"/>
<link rel="stylesheet" href="${cssUrl}"/>

<h1>Exercise Class Schedule</h1>

<link rel="stylesheet" href="${pageContext.request.contextPath}/Calendar.js-main/src/calendarjs.css"/>
<script src="${pageContext.request.contextPath}/Calendar.js-main/src/calendarjs.js"></script>

<div id="myCalendar">
</div>
<script>
    // calendarJs(id, options, startDateTime)

    var calendarInstance = new calendarJs("myCalendar", {
        exportEventsEnabled: true,
        manualEditingEnabled: true,
        showTimesInMainCalendarEvents: false,
        minimumDayHeight: 0,
        manualEditingEnabled: true,
        visibleDays: [0, 1, 2, 3, 4, 5, 6]
    },);

    var previousDay = new Date();

    var randomColor = Math.floor(Math.random() * 16777215).toString(16);

    var events = [
        {
            from: previousDay,
            to: previousDay,
            title: "HIIT class",
            description: "This is a another description of the event that has been added, so it can be shown in the pop-up dialog.",
            location: "Teams Meeting",
            isAllDayEvent: true,
            color: "#FF0000",
            colorText: "#FFFF00",
            colorBorder: "#00FF00"
        },
        <c:forEach var="exerciseClass" items="${exerciseClassList}">
        {
            from: Date.parse("${exerciseClass.class_start_date}"),
            to: Date.parse("${exerciseClass.class_end_date}"),
            title: "${exerciseClass.class_name}",
            description: "${exerciseClass.class_description}",
            location: "TBA",
            color: "#FF0000",
            colorText: "#FFFF00",
            colorBorder: "cyan",
        },
        </c:forEach>
        // more events here
    ];

    var defaultClassList = generateClassList();

    function generateClassList() {
        var arr = [];
        <c:forEach var="exerciseClass" items="${exerciseClassList}">
        arr.push({
            from: "${exerciseClass.class_start_date}",
            to: "${exerciseClass.class_end_date}",
            title: "${exerciseClass.class_name}",
            description: "${exerciseClass.class_description}",
            location: "TBA",
            color: "${exerciseClass.class_color}",
            colorText: "white",
            colorBorder: "#cyan"
        });
        </c:forEach>
        return arr;
    }

    calendarInstance.addEvents(defaultClassList, true, false);

</script>

<%@ include file="common/footer.jspf" %>