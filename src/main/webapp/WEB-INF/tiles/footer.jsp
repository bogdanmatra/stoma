<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources/"/>

<div id="footer">
    <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>


        <div class="pull-right">
            <a href="http://ro.linkedin.com/in/bogdanmatra" target="_blank" data-toogle="tooltip" title="Developer" id="tooltip" data-placement="right">
                <img src="https://static.licdn.com/scds/common/u/img/webpromo/btn_profile_greytxt_80x15.png" width="80" height="15" border="0" alt="View Bogdan Petru Matragociu's profile on LinkedIn">
            </a>
        </div>
        <div></div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#tooltip').tooltip();
    });

</script>


