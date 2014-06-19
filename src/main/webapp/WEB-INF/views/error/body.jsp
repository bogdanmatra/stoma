<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources/"/>

<div class="container">
<h1 class="col-lg-offset-1">   Ooops!</h1>
<br>

<div class="span4 pull-left">
	<img
		src="${resources}picture/warning.jpg" height="200px" />
</div>


		<h5 class="span4 pull-left">
			Sorry there was an error with code:
			${errorCode}! <a href="/afipark/contact"></a>
		</h5>

</div>