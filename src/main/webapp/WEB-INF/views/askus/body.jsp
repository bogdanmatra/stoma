<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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



</sec:authorize>



<sec:authorize access="isAnonymous()">
Please log in to ask us a question!
</sec:authorize>


</div>