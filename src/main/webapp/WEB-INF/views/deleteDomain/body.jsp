<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">


    <table class="table">
<thead><tr><th>Engleza stomatologie</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${eng.st}">
<tr><td>${domain.name}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
        </tbody>
        </table>



    <table class="table">
        <thead><tr><th>Engleza generala</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${eng.gen}">
    <tr><td>${domain.name}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
        </tbody>
        </table>

    <table class="table">
        <thead><tr><th>Romana stomatologie</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${rom.st}">
    <tr><td>${domain.name}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
        </tbody>
    </table>


    <table class="table">
        <thead><tr><th>Romana generala</th></tr></thead>
        <tbody>
<c:forEach var="domain" items="${rom.gen}">
    <tr><td>${domain.name}</td><td><button class="btn btn-danger pull-right" data-id="${domain.id}">Delete</button></td></tr>
</c:forEach>
    </tbody>
    </table>


</div>



<script>

    $(document).ready(function() {

        $(".btn-danger").click(function(){
            $.post( "deleteAjax", { id: $(this).attr("data-id") });
            $(this).closest("tr").fadeOut();
        });

    });

</script>


