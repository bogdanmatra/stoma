<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">

<h3>Engleza stomatologie</h3>
    <table class="table table-striped">
<thead><tr><th>Title</th><th>Details</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${eng.st}">
<tr><td>${domain.name}</td><td>${domain.details}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
        </tbody>
        </table>

        <br><br><br>


    <h3>Engleza generala</h3>
        <table class="table table-striped">
        <thead><tr><th>Title</th><th>Details</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${eng.gen}">
    <tr><td>${domain.name}</td><td>${domain.details}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
        </tbody>

        </table>

    <br><br><br>


    <h3>Romana stomatologie</h3>
    <table class="table table-striped">
        <thead><tr><th>Title</th><th>Details</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${rom.st}">
    <tr><td>${domain.name}</td><td>${domain.details}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
        </tbody>
    </table>

    <br><br><br>


    <h3>Romana generala</h3>
    <table class="table table-striped">
        <thead><tr><th>Title</th><th>Details</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${rom.gen}">
    <tr><td>${domain.name}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
    </tbody>
    </table>


</div>



<script>

    $(document).ready(function() {

        //remove sharer
        $("#sharer").fadeOut();

        $(".btn-danger").click(function(){
            $.post( "deleteAjax", { id: $(this).attr("data-id") });
            $(this).closest("tr").fadeOut();
        });

    });

</script>


