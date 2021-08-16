<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="common/header.jspf" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="it=edge">
    <script src="https://kit.fontawesome.com/2745819f47.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Catamaran&display=swap" rel="stylesheet">
    <link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css" />
    <title>Workout Buddy</title>
    <c:url var="loginUrl" value="/login"/>
    <c:url var="registerUrl" value="/register"/>
</head>
<body id="home">

<section class="section-a">
    <div class="containerForNav">
        <div class="sectiona-left">
            <h1>Welcome to the Workout Buddy!</h1>
            <h3>
                Let's get fit together!
            </h3>
        </div>
        <img src="${pageContext.request.contextPath}/siteImages/homeImage1.jpg" alt="Loading-page-pic-one" />
    </div>
</section>

<section class="boxes">
    <a href="${loginUrl}">
        <div class="box">
            <i class="fas fa-user-lock fa-4x" style="margin-bottom: 1rem"></i>
            <h3>Login</h3>
            <p>If you have an account, click here to login!</p>
        </div>
    </a>
    <a href="${registerUrl}">
        <div class="box">
            <i class="fas fa-user-plus fa-4x" style="margin-bottom: 1rem"></i>
            <h3>Register</h3>
            <p>Create an account here!</p>
        </div>
    </a>
</section>

<section id="about" class="section-b">
    <div class="overlay">
        <div class="section-b-inner py-5">
            <h3 class="text-2">Workout Buddy</h3>
            <h2 class="text-5 mt-1">Best workout companion fitness has to offer</h2>
            <p class="mt-1">
                "Good things comes to those who sweat"
                <br>
                - Unknown
            </p>
        </div>
    </div>
</section>

<script>
    window.sr = ScrollReveal();
    sr.reveal('.navbar', {
        duration: 2000,
        origin:'bottom'
    });
    sr.reveal('.sectiona-left', {
        duration: 2000,
        origin:'bottom',
        distance:'300px'
    });
    sr.reveal('.btn', {
        duration: 2000,
        origin:'top',
        delay: 1500
    });
    sr.reveal('.menu-wrap', {
        duration: 2000,
        origin:'left'
    });
    sr.reveal('.overlay', {
        duration: 2000,
        origin:'bottom',
        delay: 1000
    });
    sr.reveal('.box', {
        duration: 2000,
        origin:'bottom',
        distance:'300px',
        delay: 2000
    });
</script>
</body>
</html>

<%@ include file = "common/footer.jspf" %>