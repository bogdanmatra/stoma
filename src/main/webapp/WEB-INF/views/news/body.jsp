<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
            <div class="list-group" id="firstGroup">
            <a href="#" class="list-group-item"  onclick="emptyParent();poolContent(-1,0)">All</a>
            </div>
            <h4>Stoma</h4>
            <div class="list-group">
                <c:forEach var="domain" items="${hashMap.st}">
                <a href="#" class="list-group-item" data-id="${domain.id}" onclick="emptyParent();poolContent(${domain.id},0)">${domain.name}</a>
                </c:forEach>
            </div>
            <h4>Generala</h4>
            <div class="list-group">
                <c:forEach var="domain" items="${hashMap.gen}">
                    <a href="#" class="list-group-item" data-id="${domain.id}" onclick="emptyParent();poolContent(${domain.id},0)">${domain.name}</a>
                </c:forEach>
            </div>
        </div>


        <div class="col-xs-9 col-sm-9">
            <div class="row" id="contents">
                <div class="media-body col-md-offset-1 hide multi" >
                    <h2>Heading</h2>
                    <p class="over">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn btn-success" href="#" role="button">View details »</a></p>
                </div><!--/span-->
            </div><!--/row-->
        </div><!--/span-->


    </div>


</div>

<div id="loading" class="container">
<div class="col-lg-4 col-lg-offset-6">
<img src="${pageContext.request.contextPath}/resources/picture/loading.gif" style="width: 75px;height: 75px;"/>
</div>
</div>

<script>

    var global= $(".multi");
    var parent=$("#contents");
    var initialParent=parent;
    var totalPages;
    var currentId;
    var currentPage=0;

    $(document).ready(function() {
        parent.empty();
        poolContent(-1,currentPage);
        //Going for scroll
        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() > $(document).height()-1 && currentPage<totalPages-1) {
                console.log(currentPage+1);
                poolContent(currentId,++currentPage);
            }
        });

        // Selected
        var elements=$('.list-group-item');
        elements.first().addClass("active");
        elements.click(function (event) {
            //remove all pre-existing active classes
            $(".list-group-item").removeClass('active');
            $(this).addClass('active');
        });
        // End selected

    });

    function poolContent( id, pageNumber ) {
        currentId=id;
        var element = global;
        $.ajax({
            async: false,
            type: "POST",
            url: "${newsOrArticles}" + "/" + id +"/" + pageNumber,
            beforeSend:function(){
                // show gif here, eg:
                $("#loading").show();
            },
            complete:function(){
                // hide gif here, eg:
                setTimeout(function() {
                    $("#loading").hide()
                }, 300);
            },

            success: function (data) {
                element.removeClass("hide");
                totalPages=data.totalPages;
                if(totalPages==0){
                    parent.html("<h3 class='col-md-offset-1'>No data!</h3>")
                    return;
                }
                $(data.content).each(function(){
                    element=element.clone()
                    parent.append(element);
                    element.find("h2").html(this.title);
                    element.find("p:first").html(this.content);
                    element.find("p:last").find("a").attr("href","./" + "${newsOrArticles}" + "/view/" + this.id);
                });
            },
            error: function(){
                parent.html("<h3 class='col-md-offset-1'>No data!</h3>")
            }
        });
    }

    function emptyParent() {
       parent.empty();
       currentPage=0;
    }

</script>


<style type="text/css">
    p.over {
        /* essential */
        text-overflow: ellipsis;
        width: 800px;
        white-space: nowrap;
        overflow: hidden;
        /* for good looks */
        padding: 10px;
    }
</style>