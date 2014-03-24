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

<style type="text/css">
    body {
        padding-top: 50px;
        padding-bottom: 20px;
    }


    /* Customize the nav-justified links to be fill the entire space of the .navbar */

    .nav-justified {
        background-color: #eee;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .nav-justified > li > a {
        padding-top: 15px;
        padding-bottom: 15px;
        margin-bottom: 0;
        font-weight: bold;
        color: #777;
        text-align: center;
        background-color: #e5e5e5; /* Old browsers */
        background-image:    -moz-linear-gradient(top, #f5f5f5 0%, #e5e5e5 100%); /* FF3.6+ */
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f5f5f5), color-stop(100%,#e5e5e5)); /* Chrome,Safari4+ */
        background-image: -webkit-linear-gradient(top, #f5f5f5 0%,#e5e5e5 100%); /* Chrome 10+,Safari 5.1+ */
        background-image:      -o-linear-gradient(top, #f5f5f5 0%,#e5e5e5 100%); /* Opera 11.10+ */
        background-image:         linear-gradient(top, #f5f5f5 0%,#e5e5e5 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f5f5f5', endColorstr='#e5e5e5',GradientType=0 ); /* IE6-9 */
        background-repeat: repeat-x; /* Repeat the gradient */
        border-bottom: 1px solid #d5d5d5;
    }
    .nav-justified > .active > a,
    .nav-justified > .active > a:hover,
    .nav-justified > .active > a:focus {
        background-color: #ddd;
        background-image: none;
        box-shadow: inset 0 3px 7px rgba(0,0,0,.15);
    }
    .nav-justified > li:first-child > a {
        border-radius: 5px 5px 0 0;
    }
    .nav-justified > li:last-child > a {
        border-bottom: 0;
        border-radius: 0 0 5px 5px;
    }

    #footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        /* Set the fixed height of the footer here */
        height: 60px;
        background-color: #f5f5f5;
    }

</style>
