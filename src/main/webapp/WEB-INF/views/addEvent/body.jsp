<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resourcesPic" value="${pageContext.request.contextPath}/resources/uploadedPictures/"/>

<div class="container">

    <c:if test="${action == 'saveArticle'}">
        <h3>Add article</h3>
    </c:if>
    <c:if test="${action == 'saveNews'}">
        <h3>Add news</h3>
    </c:if>

    <div class="row-fluid">


        <form:form method="POST" action="${pageContext.request.contextPath}/saveEvent"  name="addEvent" modelAttribute="event" role="form" enctype="multipart/form-data">
            <form:hidden path="id"/>
            <form:hidden path="viewed"/>
            <div class="col-lg-10">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="radio">
                            <label>
                                <form:radiobutton  name="locale" id="ro" value="ro" path="locale"/>
                                Romanian
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="radio">
                            <label>
                                <form:radiobutton  name="locale" id="en" value="en" path="locale"/>
                                English
                            </label>
                        </div>

                    </div>
                </div>
                <br>


                <div class="input-group ">
                    <span class="input-group-addon" >Name</span>
                    <form:textarea rows="2"  type="text" class="form-control" placeholder="Name" name="name" path="name"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="name"/>
                </div>

                <br>
                <div class="input-group ">
                    <span class="input-group-addon" >Details</span>
                    <form:textarea cols="100" rows="15" type="text" class="form-control" placeholder="Details" name="details" path="details"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="details"/>
                </div>

                <br>
                <table id="fileTable" style="border-collapse:separate;border-spacing:15px 10px;">

                    <c:forEach items="${event.pictures}" var="picture" varStatus="loopStatus">

                        <tr><td>
                            <img src="${resourcesPic}${picture.path}" style="height: 100px;">
                        </td>
                            <td>
                                <a id="${picture.id}"  class="btn btn-danger deleteMe" >Delete</a>
                            </td>
                        </tr>

                    </c:forEach>

                    <tr>
                        <td><input name="files[0]" type="file" /></td>
                    </tr>
                    <tr>
                        <td><input name="files[1]" type="file" /></td>
                    </tr>
                </table>
                <br>
                <button id="addFile" type="button" value="Add File" class="btn btn-default" > Add file </button>

                <br>
                <br>
                <button type="submit" class="btn btn-primary">Post</button>
                <a  href=".."><button type="button" class="btn btn-default">Cancel</button></a>
            </div>
        </form:form>

    </div>
</div>



<script>
    $(document)
            .ready(
            function() {


                $(".deleteMe").click( function(){
                    $(this).closest("tr").fadeOut();
                    $.post( "${pageContext.request.contextPath}/deletePicture/" + $(this).attr("id") , function(){
                    });
                });


                //remove sharer
                $("#sharer").fadeOut();

                //add more file components if Add is clicked
                $('#addFile')
                        .click(
                        function() {
                            var fileIndex = $('#fileTable tr')
                                    .children().length - 1;
                            $('#fileTable')
                                    .append(
                                            '<tr><td>'
                                            + '   <input type="file" name="files['+ ++fileIndex +']" />'
                                            + '</td></tr>');
                        });

            });

</script>