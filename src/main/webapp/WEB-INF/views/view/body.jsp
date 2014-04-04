<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/resources/uploadedPictures/"/>


<c:if
        test="${error == true}">
    <div class="container">
        <div class="row pull-right">
        <button class="btn btn-danger" disabled>Please type a comment not longer than 400 characters!</button>
    </div>
    </div>
    <br><br>
</c:if>

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

    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="/stoma/resources/uploadedPictures/default.jpg" style="width: 64px; height: 64px;">
        </a>
        <div class="media-body">
            <h4 class="media-heading">${news.title}</h4>
            ${news.content}
        </div>
    </div>

    <br>
    <br>



<br>
<br>

    <h3>Comments:</h3>


    <br>
    <br>


    <c:forEach var="com" items="${news.comments}">
    <div class="row col-lg-10">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">${com.user.username}</h3>
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
            <button type="submit" class="btn btn-default" type="button">Comment!</button>
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
    });

</script>