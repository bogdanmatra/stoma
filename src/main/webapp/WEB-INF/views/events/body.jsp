<%--
  Created by IntelliJ IDEA.
  User: bmatragociu
  Date: 3/14/14
  Time: 6:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>






<div class="container">

<div class="col-xs-12 col-sm-12">

    <c:forEach items="${events}" var="item" varStatus="count">

        <c:if test="${count.index % 3 == 0}"> <div class="row"> </c:if>

        <div class="col-6 col-sm-6 col-lg-4">
            <h2>${item.name}</h2>
            <p>${item.details}</p>
            <p><a class="btn btn-default" href="show/${item.id}" role="button">View details »</a></p>
        </div><!--/span-->

        <c:if test="${count.index % 3 == 2}"> </div><!--/row--> </c:if>




    </c:forEach>


    </div>

</div>