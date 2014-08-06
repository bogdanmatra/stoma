<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources/"/>


<link href="${resources}jqueryte/jquery-te-1.4.0.css" rel="stylesheet" media="screen"/>
<script src="${resources}jqueryte/jquery-te-1.4.0.min.js"></script>

<div class="container">

    <c:if test="${action == 'saveArticle'}">
        <h3>Add article</h3>
    </c:if>
    <c:if test="${action == 'saveNews'}">
        <h3>Add news</h3>
    </c:if>

    <div class="row-fluid">


        <form:form method="POST" action="${action}"  name="addNewsOrArticle" modelAttribute="nOrA" role="form" enctype="multipart/form-data">
            <div class="col-lg-10">
                <div class="row">
                <div class="col-lg-6">
                    <div class="radio">
                        <label>
                            <input type="radio" name="lang" id="ro" value="ro" checked>
                            Romanian
                        </label>
                    </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="lang" id="en" value="en">
                        English
                    </label>
                </div>

                </div>
                <div class="col-lg-6">
                <div class="radio">
                    <label>
                        <input type="radio" name="st_med" id="st" value="st" checked>
                        Stomatologie
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="st_med" id="gen" value="ge">
                        Generala
                    </label>
                </div>
                </div>
                </div>
                <br>


                <form:select multiple="true" class="form-control" id="mselect" path="domains">
                </form:select>
                <form:errors cssClass="input-group-addon alert-danger" path="domains"/>
                <br>


                <div class="input-group ">
                    <span class="input-group-addon" >Title</span>
                    <form:textarea rows="2"  type="text" class="form-control" placeholder="Title" name="title" path="title"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="title"/>
                </div>

                <br>
                <div >
                    <span >Content:</span>
                    <form:textarea cols="100" rows="700" type="text"  placeholder="Content" name="content" path="content" id="richedit"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="content"/>
                </div>

                <br>
                <table id="fileTable" style="border-collapse:separate;border-spacing:15px 10px;">
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

    $(document).ready(function(){
        $("#richedit").jqte();
        $(".jqte_tool_9").hide();
        $(".jqte_tool_10").hide();
        populateMSelect();
        $('input:radio').change(function(){
            populateMSelect();
        });

        $(document)
                .ready(
                function() {

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


    });


    function populateMSelect(){
        language =$('input[name=lang]:checked').val();
        domMed = $('input[name=st_med]:checked').val();
        multipleSelect=$("#mselect");
        multipleSelect.empty();
        $.post( "../fetchDomainList", { locale: language, domMed: domMed  }, function(data){
            $(data).each(function(){
                multipleSelect.append("<option value=" + this.id + ">" + this.name +"</option>");
            });
        });
    }


</script>