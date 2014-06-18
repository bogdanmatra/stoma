<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <input  type="text" class="form-control" placeholder="Host" name="host" id="host" value="localhost"/>
    <br>
    <br>
    <input  type="text" class="form-control" placeholder="Port" name="port" name="port" id="port" value="3306"/>
    <br>
    <br>
    <input  type="text" class="form-control" placeholder="User" name="user"  name="user" id="user" value="root"/>
    <br>
    <br>
    <input  type="text" class="form-control" placeholder="Password" name="pass"  name="pass" id="pass" value="root"/>
    <br>
    <br>
    <button  class="btn btn-primary">Post</button>


</div>
<div class="container">
<div>
    <table class="table table-striped">
        <thead><tr><th>Master</th></tr></thead>
        <tbody>
        <c:forEach var="comment" items="${comments}">
            <tr><td>${comment.content}</td></tr>
        </c:forEach>
        </tbody>

    </table>
</div>
<div>
    <table class="table table-striped" >
        <thead><tr><th>Slave</th></tr></thead>
        <tbody id="table">
            <tr class="toupdate"><td></td></tr>
        </tbody>

    </table>
</div>
</div>

<script>
    $(document)
            .ready(
            function() {
                $(".btn-primary").click(function(){
                    line =  $(".toupdate");
                    table = $("#table");
                    $.post( "retrieveData", { host: $("#host").val(), port : $("#port").val(), user: $("#user").val(), pass: $("#pass").val() }).done(function( data ) {
                        $("#table").empty();
                        $.each(data, function(key, value){
                            line.find("td").html(value);
                            table.append(line);
                            line=line.clone();
                        });
                        $(".btn-primary").addClass("disabled");
                        $(".btn-primary").click(function() { return false; });
                    });
            });
    });
</script>
