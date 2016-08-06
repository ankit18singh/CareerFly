<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 23/7/16
  Time: 11:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>

    <content tag="heading">
        <h2>Saved Details</h2>
    </content>

    <content tag="body">

        <input type="hidden" name="id" value="${interviewInstance}">
        <dl class="list-group-item dl-horizontal">
            <dt>Company Name:</dt>
            <dd>${interviewInstance.company.name}</dd><br>

            <dt>Job Position:</dt>
            <dd>${interviewInstance.jobPosition}</dd><br>

            <dt>Qualification:</dt>
            <dd>${interviewInstance.qualification}</dd><br>

            <dt>Work Experience:</dt>
            <g:each in="${interviewInstance.workExperience}">
                <dd>
                    <li>${it}</li>
                </dd>
            </g:each>
            <br>

            <dt>Technologies:</dt>
            <g:each in="${interviewInstance.technologies}">
                <dd>
                    <li>${it.name}</li>
                </dd>
            </g:each>
            <br>

            <dt>Tools:</dt>
            <g:each in="${interviewInstance.tools}">
                <dd>
                    <li>${it.name}</li>
                </dd>
            </g:each>
            <br>

            <dt>Skills:</dt>
            <g:each in="${interviewInstance.skills}">
                <dd>
                    <li>${it.name}</li>
                </dd>
            </g:each>
            <br>

            <g:each in="${interviewInstance}" var="show" id="${show.id}">
                <dt>Result:</dt>
                <dd>${show.result}</dd>
                <br>
                <dt>Rounds:</dt>
                <dd>${show.rounds.id}</dd>
            </g:each>
        </dl><br>

        <g:link name="btnEdit" controller="interview" action="edit" class="btn btn-primary btnProp"
                id="${interviewInstance.id}">Edit</g:link>

        <g:link name="btnDelete" controller="interview" action="delete" class="btn btn-primary btnProp"
                id="${interviewInstance.id}">Delete</g:link>

        <g:link name="btnRound" controller="interviewRound" action="index" class="btn btn-primary btnRound"
                id="${interviewInstance.id}">Interview Round</g:link>
        <br>
    </content>

</body>
</html>