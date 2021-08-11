<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="common/header.jspf" %>

<c:url var="profileUrl" value="/profile"/>
<c:url var="profileImg" value="/profile/image?userName=${user.username}"/>
<td><img height="50" width="50" src="${profileImg}" alt="None"/></td>
<li>UserName: ${user.username}</li>
<li>First Name: ${user.firstName}</li>
<li>Last Name: ${user.lastName}</li>
<li>Email: ${user.email}</li>


<%@ include file="common/footer.jspf" %>