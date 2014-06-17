<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>

<sec:authorize access="hasRole('ROLE_ADMIN')">

    <li class="dropdown ddbutton"><a href="#4" class="dropdown-toggle" data-toggle="dropdown">Administrator <span class="caret"></span></a>
        <ul class="dropdown-menu" style="margin-top: 0px; border-radius: 0 0 4px 4px;">
            <li class="dropdown-header" style="cursor: default;">Manager</li>
            <li class="divider"></li>
            <li><a href="${ctx}/edituser/">Edit user</a></li>
            <li><a href="${ctx}/addDomain">Add domain</a></li>
            <li><a href="${ctx}/deleteDomain">Delete domains</a></li>
            <li><a href="${ctx}/addNorA/n">Add news</a></li>
            <li><a href="${ctx}/addNorA/a">Add article</a></li>
            <li><a href="${ctx}/addEvent">Add event</a></li>
            <li><a href="${ctx}/contactEdit">Edit contact details</a></li>
        </ul>
    </li>

</sec:authorize>


