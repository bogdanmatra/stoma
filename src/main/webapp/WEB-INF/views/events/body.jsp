<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">

<div class="col-xs-12 col-sm-12">

    <c:forEach items="${events}" var="item" varStatus="count">

        <c:if test="${count.index % 3 == 0}"> <div class="row"> </c:if>

        <div class="col-6 col-sm-6 col-lg-4">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="submit" class="close" id="${item.id}">×</button>
            </sec:authorize>
            <h2>${item.name}</h2>
            <p class="over">${item.details}</p>
            <p><a class="btn btn-default" href="show/${item.id}" role="button"><spring:message code="viewDetails.label" text="View details"/> »</a></p>
        </div><!--/span-->

        <c:if test="${count.index % 3 == 2 || count.last}"> </div><!--/row--> </c:if>




    </c:forEach>

    <c:if test="${fn:length(events) eq 0}">
        <h3 class='col-md-offset-1'><spring:message code="nodata.label" text="No data!"/></h3>
    </c:if>

    </div>

</div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<script>

    $(document).ready(function(){
        $(".close").click(function(){
            $.post("deleteEvent/"+$(this).attr("id"));
            $(this).parent().fadeOut();
        });
    });

</script>
</sec:authorize>


<style type="text/css">
    p.over {
        /* essential */
        text-overflow: ellipsis;
        width: 300px;
        white-space: nowrap;
        overflow: hidden;
        /* for good looks */
        padding: 10px;
    }
</style>