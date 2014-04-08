<div class="container">
<table class="table table-striped">
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Username</th>
        <th>E-mail</th>
        <th>Created</th>
        <th>Updated</th>
    </tr>
    </thead>
    <tbody id="parent">
    <tr id="row">
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
</div>

<div id="loading" class="container">
    <div class="col-lg-4 col-lg-offset-4">
        <img src="${pageContext.request.contextPath}/resources/picture/loading.gif" style="width: 75px;height: 75px;"/>
    </div>
</div>


<script>

    var parent;
    var element;
    var totalPages;
    var currentPage;

    $(document).ready(function() {
        parent=$("#parent");
        element=$("#row");
        totalPages;
        currentPage=0;
        element.remove();
        poolContent(currentPage);
        deleteUser();
        promoteUser();
        //Going for scroll
        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() > $(document).height()-1 && currentPage<totalPages) {
                poolContent(++currentPage);
            }
        });
    });

    function poolContent(page){
    $.ajax({
        async: false,
        type: "POST",
        url: "../fetch/" + page,
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
            $(data.content).each(function(){
                totalPages=data.totalPages;
                element=element.clone();
                parent.append(element);
                element.attr("data-id",this.id);
                kids=element.children();
                kids.first().html(this.firstName);
                kids.first().next().html(this.lastName);
                kids.first().next().next().html(this.username);
                kids.first().next().next().next().html(this.email);
                kids.first().next().next().next().next().html(this.createdDate);
                kids.first().next().next().next().next().next().html(this.updatedDate);
                if(!isAdmin(this.roles)) {
                kids.first().next().next().next().next().next().next().html("<button class='btn btn-warning' data-id='" + this.id + "'>Promote</button>");
                }else{
                kids.first().next().next().next().next().next().next().html("ADMIN");
                }
                kids.last().html("<button class='btn btn-danger' data-id='"+this.id+"'>Delete</button>");

            });
        },
        error: function(){
            parent.html("<h3 class='col-md-offset-1'>No data!</h3>")
        }
    });
    }

    function isAdmin(roleList){
        rVal=false;
        $(roleList).each(function(){
            if (this.authority=="ROLE_ADMIN")  rVal=true;
        });
        return rVal;
    }

    function deleteUser(){
       $(".btn-danger").click(function(){
            $.post( "delete", { id: $(this).closest("tr").attr("data-id") });
            $(this).closest("tr").fadeOut();
        });
    }

    function promoteUser(){
        $(".btn-warning").click(function(){
            $.post( "promote", { id: $(this).closest("tr").attr("data-id") });
            parent = $(this).parent();
            $(this).remove();
            parent.html("ADMIN");
        });
    }

</script>