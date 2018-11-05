<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources/"/>

<div id="footer">
    <div class="container" style="padding-top: 20px;">

        <div class="pull-left">
            <a href="${pageContext.request.contextPath}/aboutus"> Termeni si conditii </a>
        </div>
        <div class="pull-right">
            <a href="http://ro.linkedin.com/in/bogdanmatra" target="_blank" data-toogle="tooltip" title="Developer" id="tooltip" data-placement="left">
                <img src="https://static.licdn.com/scds/common/u/img/webpromo/btn_profile_greytxt_80x15.png" width="80" height="15" border="0" alt="View Bogdan Petru Matra's profile on LinkedIn">
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


