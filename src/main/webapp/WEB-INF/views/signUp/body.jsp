<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">

<div class="row-fluid">


        <form:form method="POST" action="saveUser"  name="addUserForm" modelAttribute="user" role="form">
    <div class="col-lg-8">
    <div class="input-group ">
        <span class="input-group-addon" >First name</span>
        <form:input type="text" class="form-control" placeholder="First name" name="firstName" path="firstName"/>
        <form:errors cssClass="input-group-addon alert-danger" path="firstName"/>
    </div>

    <br>
        <div class="input-group ">
            <span class="input-group-addon" >Last Name</span>
            <form:input type="text" class="form-control" placeholder="Last name" name="lastName" path="lastName"/>
            <form:errors cssClass="input-group-addon alert-danger" path="lastName"/>
        </div>

        <br>
        <div class="input-group ">
            <span class="input-group-addon" >Username</span>
            <form:input type="text" class="form-control" placeholder="Username" name="username" autocomplete="off" path="username"/>
            <form:errors cssClass="input-group-addon alert-danger" path="username"/>
        </div>
        <br>
            <div class="input-group ">
                <span class="input-group-addon" >Password</span>
                <form:input type="password" class="form-control" placeholder="Password" name="password" autocomplete="off" path="password"/>
                <form:errors cssClass="input-group-addon alert-danger" path="password"/>
            </div>
            <br>
            <div class="input-group ">
                <span class="input-group-addon" >E-mail</span>
                <input type="text" class="form-control" placeholder="E-mail" name="email">
                <form:errors cssClass="input-group-addon alert-danger" path="email"/>
            </div>
            <br>
            <br>
            <button type="submit" class="btn btn-primary">Post</button>
            <a  href=".."><button type="button" class="btn btn-default">Cancel</button></a>
    </div>
        </form:form>




</div>
</div>
