<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="container">


    <c:choose>
        <c:when test="${Empty == true}">
        <a href="addTopic"><button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-star"> </span> <spring:message code="newTopic.label" text="New topic!"/>  </button></a>
        <br>
        <br>
            <h3 class="col-md-offset-1"><spring:message code="noQuestions.label" text="No questions!"/></h3>
        </c:when>
        <c:otherwise>

    <br><br>
        <a href="addTopic"><button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-star"> </span> <spring:message code="newTopic.label" text="New topic!"/>  </button></a>
    <c:if
            test="${error == true}">
        <button class="btn btn-danger pull-right" disabled>Please type an answer not longer than 400 characters!</button>
    </c:if>
    <br><br>

    <c:forEach var="question" items="${allQuestions}">

        <div class="row col-lg-8">
        <div class="panel panel-primary">
            <div class="panel-heading">

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <form method="POST" action="deleteQuestion">
                        <button type="submit" class="close">×</button>
                        <input type="hidden" name="id" value="${question.id}">
                        <input type="hidden" name="currentPage" value="${currentPage}">
                    </form>
                </sec:authorize>
                <h3 class="panel-title"><span class="glyphicon glyphicon-star"></span>${question.user.firstName}&nbsp;${question.user.lastName}&nbsp;(${question.user.username})&nbsp;<spring:message code="said.label" text="said:"/></h3>

            </div>
            <div class="panel-body">
                <b>Q:</b>    ${question.content}
            </div>
        </div>
        </div>


        <c:forEach var="answer" items="${question.answers}">

        <div class="row col-lg-8 col-lg-offset-4">
            <div class="panel panel-success">
                <div class="panel-heading">

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <form method="POST" action="deleteAnswer">
                            <input type="hidden" name="id" value="${answer.id}">
                            <input type="hidden" name="currentPage" value="${currentPage}">
                            <button type="submit" class="close pull-right">×</button>
                        </form>
                    </sec:authorize>


                    <h3 class="panel-title">${answer.user.firstName}&nbsp;${answer.user.lastName}&nbsp;(${answer.user.username})&nbsp;<spring:message code="said.label" text="said:"/></h3>
                </div>
                <div class="panel-body">
                    <b>A:</b>    ${answer.content}
                </div>
            </div>
            </div>

        </c:forEach>
        <div class="row col-lg-8 col-lg-offset-4">
        <form action="saveAnswer" method="POST">
        <div class="input-group">
            <input type="text" name="content" class="form-control">
            <input type="hidden" name="questionId" value="${question.id}">
            <input type="hidden" name="currentPage" value="${currentPage}">
            <span class="input-group-btn">
            <button type="submit" class="btn btn-default" type="button"><spring:message code="answer.label" text="Answer!"/></button>
          </span>
        </div>
        </form>
        <br>
        </div>

    </c:forEach>

<div class="row col-lg-12">
<!-- Pagination: -->

    <ul class="pagination">
    <%--First li--%>
        <c:choose>
            <c:when test="${currentPage == 0}">
                <li class="disabled"><a>«</a></li>
                <c:set var="begin" value="0"/>
            </c:when>
            <c:otherwise>
                <li><a href="${currentPage-1}">«</a></li>
                <c:set var="begin" value="${currentPage-1}"/>
            </c:otherwise>
        </c:choose>

    <%--Until when--%>
        <c:choose>
            <c:when test="${currentPage == noOfPages-1}">
                <c:set var="end" value="${currentPage}"/>
            </c:when>
            <c:otherwise>
                <c:set var="end" value="${currentPage+1}"/>
            </c:otherwise>
        </c:choose>


    <%--Iterating pages--%>
    <c:forEach var="i" begin="${begin}" end="${end}">

        <c:choose>
            <c:when test="${currentPage == i}">
                <li class="disabled"><a>${i+1}</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${i}">${i+1}</a></li>
            </c:otherwise>
        </c:choose>

    </c:forEach>

   <%--Last li--%>
        <c:choose>
            <c:when test="${currentPage == noOfPages-1}">
                <li class="disabled"><a>»</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${currentPage+1}">»</a></li>
            </c:otherwise>
        </c:choose>

    </ul>

        </c:otherwise>
    </c:choose>
</div>
</div>