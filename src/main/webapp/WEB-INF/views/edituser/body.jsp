
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
    </tr>
    </tbody>
</table>
</div>

 ${users}


<script>
    4
    var parent=$("#parent");
    var element=$("#row");
    element.hide();

    $.ajax({
        async: false,
        type: "POST",
        url: "../fetch/" + "0",
        beforeSend:function(){
            // show gif here, eg:
          //  $("#loading").show();
        },
        complete:function(){
            // hide gif here, eg:
           // setTimeout(function() {
           //     $("#loading").hide()
           // }, 300);
        },

        success: function (data) {

            $(data.content).each(function(){
                element=element.clone();
                element.show();
                element.attr("data-id",this.id)
                parent.append(element);
                element.children().first().html(this.firstName);
                element.children().first().next().html(this.lastName);
                element.children().first().next().next().html(this.username);
                element.children().first().next().next().next().html(this.email);
                element.children().first().next().next().next().next().html(this.createdDate);
                element.children().last().html(this.updatedDate);

            });
        },
        error: function(){
            parent.html("<h3 class='col-md-offset-1'>No data!</h3>")
        }
    });


</script>