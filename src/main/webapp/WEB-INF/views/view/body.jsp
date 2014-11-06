<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="my.app.stoma.domain.Article" %>
<%@ page import="com.sun.org.apache.xml.internal.serialize.Printer" %>
<%@ page import="my.app.stoma.domain.News" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:set var="resources" value="${pageContext.request.contextPath}/resources/uploadedPictures/"/>

<div class="container">

<sec:authorize access="hasRole('ROLE_ADMIN')">
<div class="row">
    <a href="../../editNorA/${news.id}">
        <button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-edit"></span> Edit</button>
    </a>
    <a href="../../delete/${news.id}">
<button type="button" class="btn btn-default btn-lg pull-right"><span class="glyphicon glyphicon-trash"></span> Delete</button>
    </a>
</div>
<br>
</sec:authorize>
<c:if
        test="${error == true}">

        <div class="row pull-right">
        <button class="btn btn-danger" disabled><spring:message code="pleaseMsg.label" text="400 char"/></button>
    </div>
    <br><br>
</c:if>

</div>
<c:if test="${fn:length(news.pictures) != 0}">
    <div id="carousel-example-generic" class="carousel slide col-lg-12" data-ride="carousel" style="background-color: #333">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <c:forEach var="i"  begin="0" end="${fn:length(news.pictures)-1}">
            <li data-target="#carousel-example-generic" data-slide-to="${i}"></li>
            </c:forEach>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <c:forEach var="picture" items="${news.pictures}">
            <div class="item">
                <img src="${resources}${picture.path}" style="height: 300px; width:auto;" class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
            </div>
            </c:forEach>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</c:if>


<div class="container">

    <br><br>
    <p>
        <c:forEach var="domain" items="${news.domains}">
        <button class="btn btn-default disabled"> ${domain.name} </button>
        </c:forEach>
        <b class="pull-right"><spring:message code="viewed.label" text="Viewed:"/> ${news.viewed}</b>

    </p>
    <br>
    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="${resources}default.jpg" style="width: 64px; height: 64px;">
        </a>
        <div class="media-body">
            <h4 class="media-heading">${news.title}</h4>
        </div>
        <br>
        <br>
        <div  style="overflow-x: auto;">
        <sec:authorize access="isAuthenticated()">
            <div id="contentStrip"> ${news.content} </div>
        </sec:authorize>

        <sec:authorize access="isAnonymous()">

            <%
                String result = "";
                if(request.getAttribute("news") instanceof Article) {
                    Article article = (Article) request.getAttribute("news");
                    Document doc = Jsoup.parseBodyFragment(article.getContent());
                    Element body = doc.body();
                    if (!body.children().isEmpty()) {
                        result = body.children().first().outerHtml();
                    }else{
                        result=body.outerHtml();
                    }
                    if (result == null) result = body.outerHtml();
                    out.println(result);
                } else{
                    out.println(((News)request.getAttribute("news")).getContent());
                }
            %>
            <%
                if(request.getAttribute("news") instanceof Article) {
            %>
            <p><b><spring:message code="login.text" text="Log in"/></b></p>
            <a href="../../../login"><button class="btn btn-success"> Log in </button></a>
            <%
                }
            %>

        </sec:authorize>
        </div>
    </div>

    <br>
    <br>



<br>
<br>

    <h3><spring:message code="comments.label" text="Comments:"/></h3>


    <br>
    <br>
    <c:if test="${fn:length(news.comments) == 0}">
        <h4 class="col-md-offset-1"><spring:message code="noComments.label" text="No comments, please add one!"/></h4>
    </c:if>

    <c:forEach var="com" items="${news.comments}">
    <div class="row col-lg-10">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <form method="POST" action="../../deleteComment">
                    <input type="hidden" name="id" value="${com.id}">
                    <input type="hidden" name="theId" value="${news.id}">
                    <button type="submit" class="close pull-right">×</button>
                </form>
            </sec:authorize>
            <h3 class="panel-title">${com.user.firstName}&nbsp;${com.user.lastName}&nbsp;(${com.user.username})</h3>
        </div>
        <div class="panel-body">${com.content}
        </div>
    </div>
    </div>
    </c:forEach>


    <div class="row col-lg-8 col-lg-offset-4">
    <form action="../../saveComment/${news.id}" method="POST">
        <div class="input-group">
            <input type="text" name="content" class="form-control">
            <span class="input-group-btn">
            <button type="submit" class="btn btn-default" type="button"><spring:message code="comment.label" text="Comment!"/></button>
          </span>
        </div>
    </form>
    </div>

</div>






<script>

    $(document).ready(function() {
        $('.carousel-indicators :first-child').addClass("active");
        $('.carousel-inner :first-child').addClass("active");
        $('#carousel-example-generic').carousel();
        $(".nav.nav-pills.pull-right").fadeOut();
    });

</script>