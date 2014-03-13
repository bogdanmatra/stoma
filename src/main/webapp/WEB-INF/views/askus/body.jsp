<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">


<sec:authorize access="isAuthenticated()">

    <c:forEach var="question" items="${allQuestions}">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">${question.user.username}</h3>
            </div>
            <div class="panel-body">
                    ${question.content}
            </div>
        </div>


        <c:forEach var="answer" items="${question.answers}">

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">${answer.user.username}</h3>
                </div>
                <div class="panel-body">
                        ${answer.content}
                </div>
            </div>

        </c:forEach>
    </c:forEach>




</sec:authorize>



<sec:authorize access="isAnonymous()">
Please log in to ask us a question!
</sec:authorize>


</div>