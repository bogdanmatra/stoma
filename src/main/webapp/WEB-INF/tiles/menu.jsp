<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <sec:authorize access="!hasRole('ROLE_ADMIN')">
        <ul class="nav nav-pills pull-left">
            <li>
                <a id="fb">
                    <img src="http://www.facebook.com/favicon.ico" style="height: 15px; width: 15px;"/>
                </a>
            </li>
            <li>
                <a id="tw">
                    <img src="http://twitter.com/favicons/favicon.ico" style="height: 15px; width: 15px;"/>
                </a>
            </li>
            <li>
                <a id="gp">
                    <img src="https://ssl.gstatic.com/s2/oz/images/faviconr2.ico" style="height: 15px; width: 15px;"/>
                </a>
            </li>
        </ul>
        </sec:authorize>




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
        $('.nav-justified').children().hover(function(event){
            $(this).addClass('active');
        },
        function(event){
            $(this).removeClass('active');}
         );

        // Should be tested after hosting
        ins=window.location;
        facebook="http://www.facebook.com/sharer.php?u="+ins+"&t=Visit us!";
        twitter="http://twitter.com/share?text=Visit us!&url="+ins;
        googlePlus="http://plus.google.com/share?url="+ins;
        $("#fb").click(function(){
            openWindow(facebook);
        });
        $("#tw").click(function(){
            openWindow(twitter);
        });
        $("#gp").click(function(){
            openWindow(googlePlus);
        });


    });

    function openWindow(link){
        console.log("dasdas");
        window.open(link, 'newwindow', 'width=700, height=400');
    }
</script>
