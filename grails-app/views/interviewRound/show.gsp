<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 21/7/16
  Time: 2:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Interview Round-Saved</title>
    <meta name="layout" content="main">
</head>

<body>

    <content tag="heading">
        <h2>Saved Details</h2>
    </content>

    <content tag="body">

        <g:if test="${!roundInstance}">
            <g:if test="${flash.message}">
                <div class="alert alert-info">
                    <p>
                        ${flash.message}
                        Click <g:link name="roundClick" controller="interviewRound" action="index" id="${interviewInstance.id}"
                    ><u>here</u></g:link> to
                        create.
                    </p>
                </div>
            </g:if>
        </g:if>

        <g:else>
            <g:each in="${roundInstance}" var="show" id="${show.id}">
                <dl class="list-group-item dl-horizontal">
                    <dt>Round Number:</dt>
                    <dd>${roundCount}</dd><br>
                    <dt>Round Name:</dt>
                    <dd>${show.title}</dd><br>
                    <dt>Experience:</dt>
                    <dd>${show.experience}</dd><br>
                    <dt>Time Duration:</dt>

                    <dd>
                        <g:if test="${(show.duration / 60).toInteger() > 0} && ${(show.duration % 60).toInteger() > 0}">
                            ${(show.duration / 60).toInteger()} hour(s) & ${(show.duration % 60).toInteger()} minutes(s)
                        </g:if>
                        <g:elseif test="${(show.duration / 60).toInteger() == 0} && ${(show.duration % 60).toInteger() >= 0}">
                            ${(show.duration / 60).toInteger()} minutes(s)
                        </g:elseif>
                    </dd><br>

                    <dt>Do's:</dt>
                    <g:each in="${show.dos}">
                        <dd>
                            <li class="fa-list-ol list-inline">${it}</li>
                        </dd>
                    </g:each><br>
                    <dt>dont's:</dt>
                    <g:each in="${show.donts}">
                            <dd>
                                <li class="fa-list-ol list-inline">${it}</li>
                            </dd>
                    </g:each>
                </dl>
            </g:each>
            <br>
%{--
            <g:link name="btnEdit" controller="interviewRound" action="edit" class="btn btn-primary "
                    id="${roundInstance.id}">Edit</g:link>--}%
            <g:form name="edit" controller="interviewRound" action="edit" class="form-group">
                <input type="hidden" name="rc" value="${roundCount}">
                <input type="hidden" name="roundID" value="${roundInstance.id}">
                <input type="hidden" name="interviewID" value="${interviewInstance.id}">
                <g:submitButton name="btnEdit" class="btn btn-primary" value="Edit" height="18px"/>
            </g:form>

            <g:link name="btnDelete" controller="interviewRound" action="delete" class="btn btn-primary"
                    id="${roundInstance.id}">Delete</g:link>
        </g:else>

            <g:link name="btnCancel" controller="interviewListing" action="index" class="btn btn-primary">Cancel</g:link>

    </content>

</body>
</html>