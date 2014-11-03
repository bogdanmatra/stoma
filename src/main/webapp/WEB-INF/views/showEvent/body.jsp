<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:set var="resources" value="${pageContext.request.contextPath}/resources/uploadedPictures/"/>

<div class="container">

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <div class="row">
            <a href="../../delete/${event.id}">
                <button type="button" class="btn btn-default btn-lg pull-right"><span class="glyphicon glyphicon-trash"></span> Delete</button>
            </a>
        </div>
        <br>
    </sec:authorize>
    <c:if
            test="${error == true}">

        <div class="row pull-right">
            <button class="btn btn-danger" disabled>Please type a comment not longer than 400 characters!</button>
        </div>
        <br><br>
    </c:if>

</div>
<c:if test="${fn:length(event.pictures) != 0}">
    <div id="carousel-example-generic" class="carousel slide col-lg-12" data-ride="carousel" style="background-color: #333">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <c:forEach var="i"  begin="0" end="${fn:length(event.pictures)-1}">
                <li data-target="#carousel-example-generic" data-slide-to="${i}"></li>
            </c:forEach>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <c:forEach var="picture" items="${event.pictures}">
                <div class="item">
                    <img src="${resources}${picture.path}" style="height: 300px;" class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
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
        <b class="pull-right">Viewed: ${event.viewed}</b>
    </p>

    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="${resources}default.jpg" style="width: 64px; height: 64px;">
        </a>
        <div class="media-body">
            <h4 class="media-heading">${event.name}</h4>
            ${event.details}
        </div>
    </div>

    <br>
    <br>



    <br>
    <br>

    <h3><spring:message code="comments.label" text="Comments:"/></h3>


    <br>
    <br>
    <c:if test="${fn:length(event.comments) == 0}">
        <h4 class="col-md-offset-1"><spring:message code="noComments.label" text="No comments, please add one!"/></h4>
    </c:if>

    <c:forEach var="com" items="${event.comments}">
        <div class="row col-lg-10">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <form method="POST" action="../deleteComment">
                            <input type="hidden" name="id" value="${com.id}">
                            <input type="hidden" name="theId" value="${event.id}">
                            <button type="submit" class="close pull-right">×</button>
                        </form>
                    </sec:authorize>
                    <h3 class="panel-title">${com.user.username}</h3>
                </div>
                <div class="panel-body">${com.content}
                </div>
            </div>
        </div>
    </c:forEach>


    <div class="row col-lg-8 col-lg-offset-4">
        <form action="../saveEventComment/${event.id}" method="POST">
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