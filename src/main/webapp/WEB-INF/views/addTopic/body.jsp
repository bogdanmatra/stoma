<%--
  Created by IntelliJ IDEA.
  User: bmatragociu
  Date: 3/13/14
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div class="container">

    <form:form method="POST" action="save"  name="addTopicForm" modelAttribute="question">

        <div class="input-group">
            <span class="input-group-addon">New topic</span>
            <textarea class="form-control" name="content" placeholder="Text" rows="5" name="content"></textarea>
        </div>
        <br>
            <form:errors cssClass="btn btn-danger disabled" path="content"/>
        <br>
        <br>

            <div class="row-fluid">
        <button type="submit" class="btn btn-primary">Post</button>
        <a  href="../askus"><button type="button" class="btn btn-default">Cancel</button></a>
        </div>

    </form:form>

</div>
