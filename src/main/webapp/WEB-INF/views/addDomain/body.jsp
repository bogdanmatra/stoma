<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container">

    <h3>Add domain</h3>

<form:form method="POST" action="saveDomain"  name="addDomain" modelAttribute="domain" role="form" enctype="multipart/form-data">

    <div class="row">
        <div class="col-lg-6">
            <div class="radio">
                <label>
                    <form:radiobutton name="lang" id="ro" value="ro" path="locale"/>
                    Romanian
                </label>
            </div>
            <div class="radio">
                <label>
                    <form:radiobutton  name="lang" id="en" value="en" path="locale"/>
                    English
                </label>
            </div>

        </div>
        <div class="col-lg-6">
            <div class="radio">
                <label>
                    <form:radiobutton  name="st_med" id="st" value="st" path="domMedical"/>
                    Stomatologie
                </label>
            </div>
            <div class="radio">
                <label>
                    <form:radiobutton  name="st_med" id="gen" value="ge" path="domMedical"/>
                    Generala
                </label>
            </div>
        </div>
    </div>

    <div class="input-group ">
        <span class="input-group-addon" >Name</span>
        <form:input  type="text" class="form-control" placeholder="Name" name="name" path="name"/>
        <form:errors cssClass="input-group-addon alert-danger" path="name"/>
    </div>

    <br>
    <div class="input-group ">
        <span class="input-group-addon" >Details</span>
        <form:textarea cols="70" rows="3" type="text" class="form-control" placeholder="Details" name="details" path="details"/>
        <form:errors cssClass="input-group-addon alert-danger" path="details"/>
    </div>

    <br>
    <br>
    <button type="submit" class="btn btn-primary">Post</button>
    <a  href="./"><button type="button" class="btn btn-default">Cancel</button></a>


</form:form>
</div>
