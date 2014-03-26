<div class="container">

    <form class="form-signin" role="form" action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="user" class="form-control" placeholder="Username" required="" autofocus="" name="j_username">
        <input type="password" class="form-control" placeholder="Password" required="" name="j_password">

        <a href="./signup/">Sign up!</a>

        <br>
        <br>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div>