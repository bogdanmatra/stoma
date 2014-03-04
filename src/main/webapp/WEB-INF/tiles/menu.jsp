<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<br>
<br><br>
<br>

<div class="container">
menu

<c:choose>
    <c:when
            test="${fn:toLowerCase(pageContext.response.locale.language) ==  'en'}">
        <li class="active">
    </c:when>
    <c:otherwise>
        <li>
    </c:otherwise>
</c:choose>
<a href="?locale=en">EN</a>
</li>
<c:choose>
    <c:when
            test="${fn:toLowerCase(pageContext.response.locale.language) ==  'ro'}">
        <li class="active">
    </c:when>
    <c:otherwise>
        <li>
    </c:otherwise>
</c:choose>
<a href="?locale=ro">RO</a>
</li>
</div>


