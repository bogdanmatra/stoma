<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">

    <a href="addTopic"><button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-star"></span> New topic!</button></a>
    <c:if
            test="${error == true}">
        <button class="btn btn-danger pull-right" disabled>Please type an answer not longer than 400 characters!</button>
    </c:if>
    <br><br>

    <c:forEach var="question" items="${allQuestions}">

        <div class="panel panel-primary">
            <div class="panel-heading">

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <form method="POST" action="deleteQuestion">
                        <button type="submit" class="close">×</button>
                        <input type="hidden" name="id" value="${question.id}">
                        <input type="hidden" name="currentPage" value="${currentPage}">
                    </form>
                </sec:authorize>
                <h3 class="panel-title"><span class="glyphicon glyphicon-star"></span> ${question.user.username} said:</h3>

            </div>
            <div class="panel-body">
                <b>Q:</b>    ${question.content}
            </div>
        </div>


        <c:forEach var="answer" items="${question.answers}">

            <div class="panel panel-success">
                <div class="panel-heading">

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <form method="POST" action="deleteAnswer">
                            <input type="hidden" name="id" value="${answer.id}">
                            <input type="hidden" name="currentPage" value="${currentPage}">
                            <button type="submit" class="close pull-right">×</button>
                        </form>
                    </sec:authorize>


                    <h3 class="panel-title">${answer.user.username} said:</h3>
                </div>
                <div class="panel-body">
                    <b>A:</b>    ${answer.content}
                </div>
            </div>

        </c:forEach>

        <form action="saveAnswer" method="POST">
        <div class="input-group">
            <input type="text" name="content" class="form-control">
            <input type="hidden" name="questionId" value="${question.id}">
            <input type="hidden" name="currentPage" value="${currentPage}">
            <span class="input-group-btn">
            <button type="submit" class="btn btn-default" type="button">Answer!</button>
          </span>
        </div>
        </form>
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

</div>