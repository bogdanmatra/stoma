<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
            <h4>Stoma</h4>
            <div class="list-group" id="firstGroup">
                <c:forEach var="domain" items="${st}">
                <a href="#" class="list-group-item" data-id="${domain.id}" onclick="poolContent(${domain.id})">${domain.name}</a>
                </c:forEach>
            </div>
            <h4>Generala</h4>
            <div class="list-group">
                <c:forEach var="domain" items="${gen}">
                    <a href="#" class="list-group-item" data-id="${domain.id}" onclick="poolContent(${domain.id})">${domain.name}</a>
                </c:forEach>
            </div>
        </div>


        <div class="col-xs-12 col-sm-9">
            <div class="row" id="contents">
                <div class="col-6 col-sm-6 col-lg-4 hide multi" >
                    <h2>Heading</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn btn-default" href="#" role="button">View details »</a></p>
                </div><!--/span-->
            </div><!--/row-->
        </div><!--/span-->


    </div>


</div>


<script>

    var global= $(".multi");
    var parent=$("#contents");

    $(document).ready(function() {
//Going for scroll
        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() > $(document).height()-1) {
                //alert("near bottom!");
                for(i=1;i<10;i++) {
                    global = global.clone();
                    parent.append(global);
                }
            }
        });

        poolContent($("#firstGroup").find("a:first").attr("data-id"));
        var elements=$('.list-group-item');
        elements.first().addClass("active");
        elements.click(function (event) {
            //remove all pre-existing active classes
            $(".list-group-item").removeClass('active');
            $(this).addClass('active');
        });
    });

    function poolContent( id ) {
        var element = global;
        $.ajax({
            async: false,
            type: "POST",
            url: "news/getNews/" + id,
            success: function (data) {
                parent.empty();
                element.removeClass("hide");
                $(data.content).each(function(){
                    element=element.clone()
                    parent.append(element);
                    element.find("h2").html(this.title);
                    element.find("p:first").html(this.content);
                });
            },
            error: function(){
                parent.html("No data!")
            }
        });
    }



</script>