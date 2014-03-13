<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">


<sec:authorize access="isAuthenticated()">


    <a href="addTopic"><button type="button" class="btn btn-success">New topic!</button></a>
    <br><br>

    <c:forEach var="question" items="${allQuestions}">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">${question.user.username}</h3>
            </div>
            <div class="panel-body">
                <b>Q:</b>    ${question.content}
            </div>
        </div>


        <c:forEach var="answer" items="${question.answers}">

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">${answer.user.username}</h3>
                </div>
                <div class="panel-body">
                    <b>A:</b>    ${answer.content}
                </div>
            </div>

        </c:forEach>

        <div class="input-group">

            <input type="text" class="form-control">
            <span class="input-group-btn">
            <button class="btn btn-default" type="button">Answer!</button>
          </span>
        </div>
        <br>

    </c:forEach>


<!-- Pagination: -->
    <ul class="pagination">

        <c:choose>
            <c:when test="${currentPage == 0}">
                <li class="disabled"><a>«</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${currentPage-1}">«</a></li>
            </c:otherwise>
        </c:choose>

    <c:forEach var="i" begin="0" end="${noOfPages-1}">

        <c:choose>
            <c:when test="${currentPage == i}">
                <li class="disabled"><a>${i+1}</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${i}">${i+1}</a></li>
            </c:otherwise>
        </c:choose>

    </c:forEach>

        <c:choose>
            <c:when test="${currentPage == noOfPages-1}">
                <li class="disabled"><a>»</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${currentPage+1}">»</a></li>
            </c:otherwise>
        </c:choose>

    </ul>


</sec:authorize>



<sec:authorize access="isAnonymous()">
Please log in to ask us a question!
</sec:authorize>


</div>