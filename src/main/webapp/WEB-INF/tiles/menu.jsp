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
            <li><a href="${ctx}/news/"><spring:message code="news.label" text="News"/></a></li>
            <li><a href="${ctx}/articles/"><spring:message code="articles.label" text="Articles"/></a></li>
            <li><a href="${ctx}/events/"><spring:message code="events.label" text="Events"/></a></li>
            <li><a href="${ctx}/askus"><spring:message code="askus.label" text="Ask us!"/></a></li>
            <li><a href="${ctx}/aboutus"><spring:message code="about.label" text="About us"/></a></li>

            <jsp:include page="admin_menu.jsp"/>

        </ul>


        <br>

        <ul id="sharer" class="nav nav-pills pull-left" style="cursor: pointer;">
            <li>
                <a id="fb">
                    <img src="https://fbstatic-a.akamaihd.net/rsrc.php/yl/r/H3nktOa7ZMg.ico" style="height: 15px; width: 15px;"/>
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
            <li>
                <a id="lin">
                    <img src="https://static.licdn.com/scds/common/u/images/logos/favicons/v1/favicon.ico" style="height: 15px; width: 15px;"/>
                </a>
            </li>
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
        linkedin="http://www.linkedin.com/shareArticle?mini=true&url="+ ins +"&title=Visit us!";
        $("#fb").click(function(){
            openWindow(facebook);
        });
        $("#tw").click(function(){
            openWindow(twitter);
        });
        $("#gp").click(function(){
            openWindow(googlePlus);
        });
        $("#lin").click(function(){
            openWindow(linkedin);
        })


    });

    function openWindow(link){
        console.log("dasdas");
        window.open(link, 'newwindow', 'width=700, height=400');
    }
</script>
