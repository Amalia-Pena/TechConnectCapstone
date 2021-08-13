<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<c:url var="profileUrl" value="/profile"/>
<c:url var="profileImg" value="/profile/image?userName=${user.username}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User Profile</title>
    <link href="<c:url value="/css/profile.css"/>" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="page-content page-container" id="page-content">
        <div class="padding">
            <div class="row container d-flex justify-content-center">
                <div class="col-xl-6 col-md-12">
                    <div class="card user-card-full">
                        <div class="row m-l-0 m-r-0">
                            <div class="col-sm-4 bg-c-lite-green user-profile">
                                <div class="card-block text-center text-white">
                                    <div class="m-b-25"> <img height="50" width="50" src="${profileImg}" alt="None" style="border-radius: 40px; background:none"/> </div>
                                    <h6 class="f-w-600">Username: ${user.username}</h6>
                                    <p>Member</p>
                                    <c:url var="editProfileUrl" value="/editProfile"/>
                                    <form:form action="${editProfileUrl}" method="GET" modelAttribute="user">
                                        <button type="submit" style="background: none; border: none"><i class="fas fa-edit"></i></button>
                                    </form:form>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="card-block">
                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">First Name</p>
                                            <h6 class="text-muted f-w-400">${user.firstName}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Last Name</p>
                                            <h6 class="text-muted f-w-400">${user.lastName}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Email</p>
                                            <h6 class="text-muted f-w-400">${user.email}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


<%@ include file="common/footer.jspf" %>