<%@ include file="common/header.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Calendar.js-main/src/calendarjs.css"/>
<script src="${pageContext.request.contextPath}/Calendar.js-main/src/calendarjs.js"></script>

<div id="myCalendar">
</div>
<script>
    // calendarJs(id, options, startDateTime)

    var calendarInstance = new calendarJs("myCalendar", {
        exportEventsEnabled: true,
        manualEditingEnabled: true,
        showTimesInMainCalendarEvents: true,
        minimumDayHeight: 0,
        manualEditingEnabled: true,
        organizerName: "Your Name",
        organizerEmailAddress: "your@email.address",
        visibleDays: [0, 1, 2, 3, 4, 5, 6]
    },);

    var previousDay = new Date();

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
        // more events here
    ];

    calendarInstance.addEvents(events, true, false);

</script>
<%@ include file="common/footer.jspf" %>