    <div id="carousel-example-generic" class="carousel slide col-lg-12" data-ride="carousel" style="background-color: #333">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="/stoma/resources/picture/med.png" style="height: 300px;" class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
            </div>
            <div class="item">
                <img src="/stoma/resources/picture/tooth.png" style="height: 300px;" class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>



<div class="container">

    <br><br>

    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="/stoma/resources/picture/med.png" style="width: 64px; height: 64px;">
        </a>
        <div class="media-body">
            <h4 class="media-heading">Nested media heading</h4>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

        </div>
    </div>

    <br>
    <br>



<br>
<br>

    <h3>Comments:</h3>


    <br>
    <br>

    <div class="row col-lg-10">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Panel title</h3>
        </div>
        <div class="panel-body">
            Panel content
        </div>
    </div>
    </div>




    <div class="row col-lg-10">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
        </div>
    </div>

    <div class="row col-lg-8 col-lg-offset-4">
    <form action="saveAnswer" method="POST">
        <div class="input-group">
            <input type="text" name="content" class="form-control">
            <input type="hidden" name="questionId" value="${question.id}">
            <input type="hidden" name="currentPage" value="${currentPage}">
            <span class="input-group-btn">
            <button type="submit" class="btn btn-default" type="button">Answer!</button>
          </span>
        </div>
    </form>
    </div>
</div>






<script>

    $(document).ready(function() {
        $('#carousel-example-generic').carousel();
    });

</script>