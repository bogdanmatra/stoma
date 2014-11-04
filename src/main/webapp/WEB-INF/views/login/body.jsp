<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="container">

    <form class="form-signin" role="form" action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
        <h2 class="form-signin-heading"><spring:message code="please.label"/></h2>
        <input type="user" class="form-control" placeholder="<spring:message code="username.label"/>" required="" autofocus="" name="j_username">
        <input type="password" class="form-control" placeholder="<spring:message code="password.label"/>" required="" name="j_password">

        <a href="./signup/"><spring:message code="inregistrare.label"/>!</a>
        <br>
        <a href="./aboutus/"><spring:message code="forgotten.label"/></a>

        <br>
        <br>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div>