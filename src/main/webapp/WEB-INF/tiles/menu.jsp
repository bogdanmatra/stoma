<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>


<div class="container">
    <div class="masthead">
        <br><br><br>
        <ul id="menu" class="nav nav-justified">
            <li><a href="${ctx}"><spring:message code="home.label" text="Home"/></a></li>
            <li><a href="${ctx}/news/">News</a></li>
            <li><a href="${ctx}/articles/">Articles</a></li>
            <li><a href="${ctx}/events">Events</a></li>
            <li><a href="${ctx}/askus">Ask us!</a></li>
            <li><a href="${ctx}/aboutus">About us</a></li>

            <jsp:include page="admin_menu.jsp"/>

        </ul>


        <br>
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
</br>

<script>
    // Active class in menu
    $(document).ready(function(){
        $('.nav li').click(function(event){
            //remove all pre-existing active classes
            $('#menu').children().removeClass('active');
            $(this).addClass('active');
        });
    });
</script>
