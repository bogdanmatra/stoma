<%--
  Created by IntelliJ IDEA.
  User: bmatragociu
  Date: 3/13/14
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>


<div class="container">

    <form method="POST" action="/askus/addTopic" >

        <div class="input-group">
            <span class="input-group-addon">New topic</span>
            <textarea class="form-control" placeholder="Text" rows="5"></textarea>
        </div>
        <br>

            <div class="row-fluid">
        <button type="submit" class="btn btn-primary">Post</button>
        <a  href="0"><button type="button" class="btn btn-default">Cancel</button></a>
        </div>

    </form>

</div>
