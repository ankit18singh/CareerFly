<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 19/7/16
  Time: 10:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Interview Round</title>
    <meta name="layout" content="main"/>
</head>

<body>

    <content tag="heading">
        <h2>Interview Round Experience</h2>
    </content>

    <content tag="body">

        <g:form controller="interviewRound" action="save" name="interviewExp" method="post" class="form-group">
            <h3>Round: ${roundCount}</h3>

            <div class="form-group ${hasErrors(bean: errUser, field: 'title', 'has-error')}">
                <label for="title">Round Name:</label>
                <g:textField name="title" placeholder="Enter the Name of Round" class="form-control"
                             value="${errUser.title}"></g:textField>
                <g:renderErrors bean="${errUser}" field="title"/>
            </div>

            <div class="form-group">
                <label for="experience">Share your Experience:</label>
                <g:textArea name="experience" placeholder="Enter your Experience" rows="3"
                            class="form-control"></g:textArea>
            </div>

            <div class="form-group ${hasErrors(bean: errUser, field: 'duration', 'has-error')}">
                <label for="duration">Time Duration:</label>
                <g:textField name="duration" placeholder="Enter the duration of the Round (in minutes)"
                             class="form-control" value="${errUser.duration}"></g:textField>
                <g:renderErrors bean="${errUser}" field="duration"/>
            </div>

            <div class="form-group">
                <label for="dos">Suggest Do's:</label>
                <g:textArea name="dos" placeholder="Enter all the Do's here" rows="3" class="form-control"></g:textArea>
            </div>

            <div class="form-group">
                <label for="donts">Suggest dont's:</label>
                <g:textArea name="donts" placeholder="Enter all the dont's here" rows="3"
                             class="form-control"></g:textArea>
            </div>

            <g:submitButton name="submit" value="Submit" class="btn btn-primary"></g:submitButton>
        </g:form>

    </content>

</body>
</html>