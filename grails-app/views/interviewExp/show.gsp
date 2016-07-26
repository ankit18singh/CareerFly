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
    %{--<style>
        .btnRound {
            width: 126px;
        }
    </style>--}%
</head>

<body>

    <content tag="heading">
        <h2>Saved Details</h2>
    </content>

    <content tag="body">
        <dl class="list-group-item dl-horizontal">
            <g:each in="${getCompany}" var="disp" id="${disp.id}">
                <dt>Company Name:</dt>
                <dd>${disp.name}</dd><br>
            </g:each>

            <g:each in="${getCity}" var="view" id="${view.id}">
                <dt>Company Headquarter:</dt>
                <dd>${view.name}</dd><br>
            </g:each>

            <g:each in="${getInterview}" var="show" id="${show.id}">
                    <dt>Job Position:</dt>
                    <dd>${show.jobPosition}</dd><br>

                    <dt>Qualification:</dt>
                    <dd>${show.qualification}</dd><br>

                    <dt>Work Experience:</dt>
                    <g:each in="${show.workExperience}">
                        <dd>
                            <li>${it}</li>
                        </dd>
                    </g:each>
                    <br>
            </g:each>

            <g:each in="${getTech}" var="tech" id="${tech.id}">
                <dt>Technologies:</dt>
                <g:each in="${tech.name.split(",")}">
                    <dd>
                        <li>${it}</li>
                    </dd>
                </g:each>
            </g:each>
            <br>
            <g:each in="${getTool}" var="tool" id="${tool.id}">
                <dt>Tools:</dt>
                <g:each in="${tool.name.split(",")}">
                    <dd>
                        <li>${it}</li>
                    </dd>
                </g:each>
            </g:each>
            <br>
            <g:each in="${getSkill}" var="skill" id="${skill.id}">
                <dt>Skills:</dt>
                <g:each in="${skill.name.split(",")}">
                    <dd>
                        <li>${it}</li>
                    </dd>
                </g:each>
            </g:each>
            <br>
            <g:each in="${getInterview}" var="show" id="${show.id}">
                <dt>Result:</dt>
                <dd>${show.result}</dd>
                <br>
                <dt>Rounds:</dt>
                <dd>${show.rounds}</dd>
            </g:each>
        </dl><br>

        <g:link name="btnEdit" controller="interviewExp" action="edit" class="btn btn-primary btnProp">Edit</g:link>

        <g:link name="btnDelete" controller="interviewExp" action="delete" class="btn btn-primary btnProp"
                id="${getInterview.id}">Delete</g:link>

        <g:link name="btnRound" controller="interviewRound" action="index"
                class="btn btn-primary btnRound">Interview Round</g:link>
        <br>
    </content>

</body>
</html>