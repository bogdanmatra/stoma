<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>



<div class="container">

<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;box-shadow: 10px 10px 65px black;">
    <div class="container">

        <h4><span class="glyphicon glyphicon-star"> </span> <spring:message code="news.label" text="News"/></h4>
        <span><spring:message code="stiri.text"/></span>
        <br>
        <a class="btn btn-primary btn-lg" style="float:right" role="button" href="news/"/><spring:message code="go.enter"/> »</a>
    </div>
</div>
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;box-shadow: 10px 10px 65px black;">
        <div class="container">
            <h4><span class="glyphicon glyphicon-star"> </span> <spring:message code="articles.label"/></h4>
            <span><spring:message code="articole.text"/></span>
            <br>
            <a class="btn btn-primary btn-lg" style="float:right" role="button" href="articles/"><spring:message code="go.enter"/> »</a>
        </div>
    </div>
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;box-shadow: 10px 10px 65px black;">
        <div class="container">
            <h4><span class="glyphicon glyphicon-star"> </span>  <spring:message code="askus.label"/></h4>
            <span><spring:message code="askus.text"/></span>
            <br>
            <a class="btn btn-primary btn-lg" style="float:right" role="button" href="askus"><spring:message code="go.enter"/> »</a>
        </div>
    </div>
    <div class="jumbotron"  style="padding-top: 15px;padding-bottom: 15px;box-shadow: 10px 10px 65px black;">
        <div class="container">
            <h4><span class="glyphicon glyphicon-star"> </span> <spring:message code="events.label"/></h4>
            <span><spring:message code="evenimente.text"/></span>
            <br>
            <a class="btn btn-primary btn-lg" style="float:right" role="button" href="events/"><spring:message code="go.enter"/> »</a>
        </div>
    </div>
</div>