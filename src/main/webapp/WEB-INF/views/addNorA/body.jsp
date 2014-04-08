<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <c:if test="${action == 'saveArticle'}">
        <h3>Add article</h3>
    </c:if>
    <c:if test="${action == 'saveNews'}">
        <h3>Add news</h3>
    </c:if>

    <div class="row-fluid">


        <form:form method="POST" action="../${action}"  name="addUserForm" modelAttribute="nOrA" role="form">
            <div class="col-lg-8">

                <div class="radio">
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                        English
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                        Romanian
                    </label>
                </div>


                <div class="input-group ">
                    <span class="input-group-addon" >Title</span>
                    <form:input type="text" class="form-control" placeholder="Title" name="title" path="title"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="title"/>
                </div>

                <br>
                <div class="input-group ">
                    <span class="input-group-addon" >Content</span>
                    <form:textarea cols="100" rows="15" type="text" class="form-control" placeholder="Content" name="content" path="content"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="content"/>
                </div>
                <br>


                <select multiple class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                <br>
                <input type="file" name="pic" accept="image/*">
                <p class="help-block">Example block-level help text here.</p>


                <br>
                <br>
                <button type="submit" class="btn btn-primary">Post</button>
                <a  href=".."><button type="button" class="btn btn-default">Cancel</button></a>
            </div>
        </form:form>


    </div>
</div>
