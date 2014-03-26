<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="opacity: .85;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}">
                <table>
                    <tr><td>Stomatology</td></tr>
                    <tr><td></td> <td><img src="${pageContext.request.contextPath}/resources/picture/tooth.png" style="height: 70px;"></td></tr>

                </table></a>
        </div>
        <div class="navbar-collapse collapse">
            <sec:authorize access="isAnonymous()">
            <form class="navbar-form navbar-right" role="form" action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control" name="j_username">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control" name="j_password">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>

                    <c:if
                            test="${error ==  true}">
                        <button class="btn btn-danger" disabled>Log in failed!</button>
                    </c:if>
                <a href="${ctx}/signup/"><button type=button class="btn btn-default">Sign up</button></a>

            </form>

            </sec:authorize>

<sec:authorize access="isAuthenticated()">


    <div class="navbar-form navbar-right">
        <sec:authentication property="principal.username" var="user"/>
        <div class="form-group">
            <div style="color: #fff" >Welcome, ${user}!</div>
        </div>
        <a href="<c:url value="/j_spring_security_logout" />">
        <button type="submit" class="btn btn-success">Sign Out</button>
        </a>
    </div>

</sec:authorize>

        </div><!--/.navbar-collapse -->
    </div>
</div>

<jsp:include page="menu.jsp"/>

