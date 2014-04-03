<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <li class="dropdown ddbutton"><a href="#4" class="dropdown-toggle" data-toggle="dropdown">Admin <span class="caret"></span></a>
        <ul class="dropdown-menu" style="margin-top: 0px;">
            <li class="dropdown-header">Manager</li>
            <li class="divider"></li>
            <li><a href="#">Edit user</a></li>
            <li><a href="#">Add news or article</a></li>
            <li><a href="#">Edit contact details</a></li>
        </ul>
    </li>
</sec:authorize>