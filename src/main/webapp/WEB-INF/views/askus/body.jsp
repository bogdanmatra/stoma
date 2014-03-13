<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">


<sec:authorize access="isAuthenticated()">

    <button type="button" class="btn btn-success">New topic!</button>
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



    <ul class="pagination">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
    </ul>

</sec:authorize>



<sec:authorize access="isAnonymous()">
Please log in to ask us a question!
</sec:authorize>


</div>