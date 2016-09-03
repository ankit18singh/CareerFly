Created by IntelliJ IDEA.
User: smita
Date: 21/7/16
Time: 1:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Interview Round-Edit</title>
    <meta name="layout" content="main">
</head>
<body>

    <content tag="heading">
        <h2>Edit Details</h2>
    </content>

    <content tag="body">

        <div class="container">
            <div class="row">
                <g:form name="edit" controller="interviewRound" action="update" method="post" class="form-group">

                    <h3>Round: ${roundCount}</h3>

                    <g:each in="${roundInstance}" var="edit" id="edit.id">
                        <div class="form-group ${hasErrors(bean: errRound, field: 'title', 'has-error')}">
                            <input type="hidden" name="id" value="${roundInstance.id}">
                            <input type="hidden" name="interviewID" value="${interviewInstance}">
                            <label for="title">Round Name:</label>
                            <g:textField name="title" placeholder="Enter the Name of Round" class="form-control"
                                         value="${edit.title}"></g:textField>
                            <g:renderErrors bean="${errRound}" field="title"/>
                        </div>

                        <div class="form-group  ${hasErrors(bean: errRound, field: 'experience', 'has-error')}">
                            <label for="experience">Share your Experience:</label>
                            <g:textField name="experience" placeholder="Enter your Experience" class="form-control"
                                         value="${edit.experience}"></g:textField>
                            <g:renderErrors bean="${errRound}" field="experience"/>
                        </div>

                        <div class="form-group ${hasErrors(bean: errRound, field: 'duration', 'has-error')}">
                            <label for="duration">Time Duration</label>
                            <g:textField name="duration" placeholder="Enter the duration of the Round (in minutes)"
                                         class="form-control" value="${edit.duration}"></g:textField>
                            <g:renderErrors bean="${errRound}" field="duration"/>
                        </div>

                        <div class="form-group">
                            <label for="dos">Suggest Do's</label>
                            <g:textField name="dos" placeholder="Enter all the Do's here" class="form-control"
                                         value="${edit.dos}"></g:textField>
                        </div>

                        <div class="form-group">
                            <label for="donts">Suggest Dont's</label>
                            <g:textField name="donts" placeholder="Enter all the Dont's here" class="form-control"
                                         value="${edit.donts}"></g:textField>
                        </div>

                        <g:submitButton name="submit" value="Done" class="btn btn-primary btnProp"></g:submitButton>

                        <g:link name="cancel" controller="interviewRound" action="show"
                                class="btn btn-primary btnProp">Cancel</g:link>
                    </g:each>

                </g:form>
            </div>
        </div>

    </content>

</body>
</html>

