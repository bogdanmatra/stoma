<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">


<sec:authorize access="isAuthenticated()">


    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Panel title</h3>
        </div>
        <div class="panel-body">
            Panel content
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Panel title</h3>
        </div>
        <div class="panel-body">
            Panel content
        </div>
    </div>





    <c:forEach var="question" items="${allQuestions}">
        ${question.content}
        <c:forEach var="answer" items="${question.answers}">
           //// ${answer.content}
        </c:forEach>
    </c:forEach>




</sec:authorize>



<sec:authorize access="isAnonymous()">
Please log in to ask us a question!
</sec:authorize>


</div>