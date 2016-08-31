<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 8/8/16
  Time: 6:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Interview</title>
    <meta name="layout" content="main">
</head>

<body>
    <content tag="heading">
        <g:link name="experience" controller="interview" action="index" class="col-md-4">InterviewExperience</g:link>
        <g:link name="round" controller="interviewListing" action="index" class="col-md-4">Interview Round</g:link>
        <g:link name="list" controller="interviewListing" action="index" class="col-md-4">Interview List</g:link>
        <br>
        <br>
    </content>

    <content tag="body">
        <div class="container">

            <h3>Uploaded by You:</h3>
            <br>
            <g:each in="${interview}" var="show">
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <g:img dir="/assets/images" file="dp.png" class="img-circle" height="px" width="50px"/>
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">${show.company.name} <small><i>Posted by: ${userInstance.firstName}
                        ${userInstance.lastName}, on: ${show.dateCreated}</i></small></h4>
                        <p>
                            <input type="hidden" name="id" value="${show}">
                            <dl class="list-group-item dl-horizontal">
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

                                <dt>Technologies:</dt>
                                <g:each in="${show.technologies}">
                                    <dd>
                                        <li>${it.name}</li>
                                    </dd>
                                </g:each>
                                <br>

                                <dt>Tools:</dt>
                                <g:each in="${show.tools}">
                                    <dd>
                                        <li>${it.name}</li>
                                    </dd>
                                </g:each>
                                <br>

                                <dt>Skills:</dt>
                                <g:each in="${show.skills}">
                                    <dd>
                                        <li>${it.name}</li>
                                    </dd>
                                </g:each>
                                <br>

                                <g:each in="${show}" var="disp" id="${disp.id}">
                                    <dt>Result:</dt>
                                    <dd>${disp.result}</dd>
                                </g:each>
                            </dl>
                            ${show.id}
                            ${show.company.id}
                            <g:link name="interviewRound" controller="interviewRound" action="show"
                                    id="${show.id}">See Interview Round</g:link>
                        </p>
                    </div>
                </div>
                <hr>
            </g:each>
        </div>

    </content>

</body>
</html>