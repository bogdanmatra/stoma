<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <li id="ddbutton" class="dropdown"><a href="#4" class="dropdown-toggle">Admin</a>

        <ul class="dropdown-menu">
            <li class="dropdown-header">Manage</li>
            <li class="divider"></li>
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


        $('#ddbutton').click(function(){
            $(this).addClass("open");
        });



    });


</script>