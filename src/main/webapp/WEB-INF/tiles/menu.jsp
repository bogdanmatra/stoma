<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="container">
    <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <ul id="menu" class="nav nav-justified">
            <li class="active"><a href="#0"><spring:message code="home.label" text="Home"/></a></li>
            <li><a href="#1">Projects</a></li>
            <li><a href="#2">Services</a></li>
            <li><a href="#3">Downloads</a></li>
            <li><a href="#4">About</a></li>
            <li><a href="#5">Contact</a></li>
        </ul>


        <ul class="nav nav-pills pull-right">
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
        </ul>


    </div>



</div>


<script>
    // Active class in menu
    $(document).ready(function(){
        $('.nav li').click(function(event){
            //remove all pre-existing active classes
            $('.active').removeClass('active');

            $(this).addClass('active');

        });
    });


</script>
