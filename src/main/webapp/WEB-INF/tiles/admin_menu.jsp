<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <li class="dropdown ddbutton"><a href="#4" class="dropdown-toggle">Admin <span class="caret"></span></a>

        <ul class="dropdown-menu">
            <li><a href="#">Users</a></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Articles</a></li>
            <li><a href="#">Events</a></li>

        </ul>

    </li>
</sec:authorize>






<script>
    // Active class in menu
    $(document).ready(function(){
        $('.ddbutton').click(function(){
            $(this).addClass("open");
        });
    });


</script>