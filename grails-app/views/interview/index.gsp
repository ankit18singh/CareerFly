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
        <div class="container">
            <div class="row">
                <g:form name="company" controller="interview" action="jobRequirement" class="form-group">

                    <div class="form-group ${hasErrors(bean: errCompany, field: 'name', 'has-error')}">
                        <label for="name">Name:</label>
                        <g:textField name="name" placeholder="Enter Name of the Company" class="form-control"/>
                        <g:renderErrors bean="${errCompany}" field="name"/>
                    </div>

                    <div class="form-group ${hasErrors(bean: errCity, field: 'name', 'has-error')}">
                        <label for="address">Headquarter:</label>
                        <g:textField name="address" placeholder="Enter the Head-Office City of the Company"
                                     class="form-control"/>
                        <g:renderErrors bean="${errCity}" field="name"/>
                    </div>

                    <g:submitButton name="next" value="Next" class="btn btn-primary btnProp"></g:submitButton>

                </g:form>
            </div>
        </div>

    </content>

</body>
</html>