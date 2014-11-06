<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources/"/>
<c:set var="resourcesPic" value="${pageContext.request.contextPath}/resources/uploadedPictures/"/>

<%--<link href="${resources}jqueryte/jquery-te-1.4.0.css" rel="stylesheet" media="screen"/>--%>
<%--<script src="${resources}jqueryte/jquery-te-1.4.0.min.js"></script>--%>
<script src="${resources}wysiwyg/bootstrap-wysiwyg.js"></script>
<script src="${resources}wysiwyg/external/google-code-prettify/prettify.js"></script>
<script src="${resources}wysiwyg/external/jquery.hotkeys.js"></script>
<link href="${resources}wysiwyg/external/google-code-prettify/prettify.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">



<div class="container">





    <c:if test="${action == 'saveArticle'}">
        <h3>Add article</h3>
    </c:if>
    <c:if test="${action == 'saveNews'}">
        <h3>Add news</h3>
    </c:if>

    <div class="row-fluid">

        <form:form method="POST" action="${pageContext.request.contextPath}/addNorA/${action}"  name="addNewsOrArticle" modelAttribute="nOrA" role="form" enctype="multipart/form-data">
            <form:hidden path="id"/>
            <form:hidden path="viewed"/>
            <div class="col-lg-10">
                <div class="row">
                <div class="col-lg-6">
                    <div class="radio">
                        <label>
                            <form:radiobutton name="lang" id="ro" value="ro" path="domains[0].locale"/>
                            Romanian
                        </label>
                    </div>
                <div class="radio">
                    <label>
                        <form:radiobutton name="lang" id="en" value="en" path="domains[0].locale"/>
                        English
                    </label>
                </div>

                </div>
                <div class="col-lg-6">
                <div class="radio">
                    <label>
                        <form:radiobutton name="st_med" id="st" value="st" path="domains[0].domMedical"/>
                        Stomatologie
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <form:radiobutton name="st_med" id="gen" value="ge" path="domains[0].domMedical"/>
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


                <div class="input-group">
                    <span class="input-group-addon" >Title</span>
                    <form:textarea rows="2"  type="text" class="form-control" colls="100" cssStyle="max-width: 868px;" placeholder="Title" name="title" path="title"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="title"/>
                </div>

                <br>




                </div>
                <div class="input-group">
                    <p>Content:</p>

                    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
                        <div class="btn-group">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                            </ul>
                        </div>
                        <div class="btn-group">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                                <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                                <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
                            <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
                            <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
                            <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
                        </div>
                        <div class="btn-group">
                            <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
                            <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
                            <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
                            <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
                        </div>
                        <div class="btn-group">
                            <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
                            <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
                            <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
                            <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
                        </div>
                        <div class="btn-group">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
                            <div class="dropdown-menu input-append">
                                <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                                <button class="btn" type="button">Add</button>
                            </div>
                            <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

                        </div>

                        <div class="btn-group">
                            <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
                            <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                        </div>
                        <div class="btn-group">
                            <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                            <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
                        </div>
                        <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
                    </div>
                    <div id="editor" style="height: 1000px; width: 1000px; overflow-y: auto; overflow-x: hidden;outline: black auto 1px;">
                        Go ahead&hellip;
                    </div>

                    <form:textarea  type="text"  placeholder="Content" name="content" path="content" id="richedit" cssStyle="visibility: hidden;"/>
                    <form:errors cssClass="input-group-addon alert-danger" path="content"/>
                </div>

                <br>
                <table id="fileTable" style="border-collapse:separate;border-spacing:15px 10px;">

                    <c:forEach items="${nOrA.pictures}" var="picture" varStatus="loopStatus">

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
            <br><br><br><br><br>
            </div>
        </form:form>

    </div>
</div>
<div class="hidden list-domain">
    <c:forEach var="domain" items="${nOrA.domains}">
       <div class="child">${domain.name}</div>
    </c:forEach>
</div>


<script>

    $(document).ready(function(){

        $(".deleteMe").click( function(){
            $(this).closest("tr").fadeOut();
            $.post( "${pageContext.request.contextPath}/deletePicture/" + $(this).attr("id"), function(){
            });
        });


        $('[data-edit="createLink"]').css("width","170px");
        $("#editor").html(($("#richedit").val()));
        $("#editor").bind("DOMSubtreeModified",function(){
            $("#richedit").html($("#editor").html());  // copy div to textarea
        });

        populateMSelect();
        $('input:radio').change(function(){
            populateMSelect();
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


    function populateMSelect(){
        language =$("input[name='domains[0].locale']:checked").val();
        domMed = $("input[name='domains[0].domMedical']:checked").val();
        multipleSelect=$("#mselect");
        multipleSelect.empty();
        $.post( "${pageContext.request.contextPath}/fetchDomainList", { locale: language, domMed: domMed  }, function(data){
            $(data).each(function(){
                var option = "<option value=" + this.id + ">" + this.name +"</option>";
                var theValue = this.name;
                var isIn = false;
                $(".list-domain .child").each(function(){
                    if(theValue == $(this).html()){
                        isIn=true;
                    }
                });

                if (isIn){
                    var option = "<option value=" + this.id + " checked='checked' selected='selected'>" + this.name +"</option>";
                }
                multipleSelect.append(option);
            });
        });
    }
</script>


<script>
    $(function(){
        function initToolbarBootstrapBindings() {
            var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                        'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                        'Times New Roman', 'Verdana'],
                    fontTarget = $('[title=Font]').siblings('.dropdown-menu');
            $.each(fonts, function (idx, fontName) {
                fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
            });
            $('a[title]').tooltip({container:'body'});
            $('.dropdown-menu input').click(function() {return false;})
                    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
                    .keydown('esc', function () {this.value='';$(this).change();});

            $('[data-role=magic-overlay]').each(function () {
                var overlay = $(this), target = $(overlay.data('target'));
                overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
            });
            if ("onwebkitspeechchange"  in document.createElement("input")) {
                var editorOffset = $('#editor').offset();
                $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
            } else {
                $('#voiceBtn').hide();
            }
        };
        function showErrorAlert (reason, detail) {
            alert("Unsupported file!");
        };
        initToolbarBootstrapBindings();
        $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
        window.prettyPrint && prettyPrint();
    });
</script>
