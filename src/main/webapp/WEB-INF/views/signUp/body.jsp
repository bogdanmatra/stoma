<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="container">

<div class="row-fluid">


        <form:form method="POST" action="${pageContext.request.contextPath}/signup/saveUser"  name="addUserForm" modelAttribute="user" role="form">
            <form:hidden path="id"/>
    <div class="col-lg-8">
    <div class="input-group ">
        <span class="input-group-addon" ><spring:message code="signUp.fname" text="fname"/></span>
        <form:input type="text" class="form-control"  name="firstName" path="firstName"/>
        <form:errors cssClass="input-group-addon alert-danger" path="firstName"/>
    </div>

    <br>
        <div class="input-group ">
            <span class="input-group-addon" ><spring:message code="signUp.lname" text="lname"/></span>
            <form:input type="text" class="form-control"  name="lastName" path="lastName"/>
            <form:errors cssClass="input-group-addon alert-danger" path="lastName"/>
        </div>

        <br>
        <div class="input-group ">
            <span class="input-group-addon" ><spring:message code="signUp.uname" text="user"/></span>
            <form:input type="text" class="form-control"  name="username" autocomplete="off" path="username"/>
            <form:errors cssClass="input-group-addon alert-danger" path="username"/>
        </div>
        <br>
            <div class="input-group ">
                <span class="input-group-addon" ><spring:message code="signUp.pass" text="pass"/></span>
                <form:input type="password" class="form-control"  name="password" autocomplete="off" path="password"/>
                <form:errors cssClass="input-group-addon alert-danger" path="password"/>
            </div>
            <br>
            <div class="input-group ">
                <span class="input-group-addon" ><spring:message code="signUp.mail" text="mail"/></span>
                <form:input type="text" class="form-control" name="email"  path="email"/>
                <form:errors cssClass="input-group-addon alert-danger" path="email"/>
            </div>
            <br>
            <br>
            <button type="submit" class="btn btn-primary"><spring:message code="signUp.submit" text="submit"/></button>
            <a  href=".."><button type="button" class="btn btn-default"><spring:message code="signUp.cancel" text="cancel"/></button></a>
    </div>
        </form:form>




</div>
</div>

<script>
    $("#password").val("");
    //remove sharer
    $("#sharer").fadeOut();
</script>
