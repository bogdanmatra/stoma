<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
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
                <div class="form-group">

                    <c:if
                            test="${error ==  'true'}">

                        <div class="alert alert-warning">
                            <a class="close" data-dismiss="alert">×</a>
                            <strong>Log in failed!</strong> Please try again.
                        </div>
                    </c:if>
                </div>
            </form>

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
