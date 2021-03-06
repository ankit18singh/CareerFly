<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Interview Experience</title>
    <meta name="layout" content="main">
</head>
<body>


    <content tag="heading">
        <h2>Company Details</h2>
    </content>

    <content tag="body">

        <g:form name="company" controller="interview" action="jobRequirement" class="form-group">
            <div class="form-group">
                <label for="name">Name:</label>
                <g:textField name="name" placeholder="Enter Name of the Company" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="address">Headquarter:</label>
                <g:textField name="address" placeholder="Enter the Head-Office City of the Company"
                             class="form-control"/>
            </div>

            <g:submitButton name="next" value="Next" class="btn btn-primary btnProp"></g:submitButton>
        </g:form>

    </content>

</body>
</html>