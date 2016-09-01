
<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 21/7/16
  Time: 12:46 PM
--%>
<%@ page import="com.careerfly.organization.interview.Result" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>
<body>

    <content tag="heading">
        <h2>Company's Requirements</h2>
    </content>

    <content tag="body">

        <g:form name="requirement" controller="interview" action="save" class="form-group">

            <div class="form-group ${hasErrors(bean: errInterview, field: 'jobPosition', 'has-error')}">
                <label for="jobPosition">Job Position:</label>
                <g:textField name="jobPosition" placeholder="Enter Job Position for which you were Interviewed"
                             class="form-control"/>
                <g:renderErrors bean="${errInterview}" field="jobPosition"/>
            </div>

            <div class="form-group ${hasErrors(bean: errInterview, field: 'qualification', 'has-error')}">
                <label for="qualification">Qualification:</label>
                <g:textField name="qualification" placeholder="Enter required Qualification" class="form-control"/>
                <g:renderErrors bean="${errInterview}" field="qualification"/>
            </div>

            <div class="form-group ${hasErrors(bean: errInterview, field: 'workExperience', 'has-error')}">
                <label for="workExperience">Work Experience:</label>
                <g:textArea name="workExperience" rows="3" placeholder="Enter required Work Experience"
                            class="form-control"/>
                <g:renderErrors bean="${errInterview}" field="workExperience"/>
            </div>

            <div class="form-group ${hasErrors(bean: errTech, field: 'technologies', 'has-error')}">
                <label for="technologies">Technologies:</label>
                <g:textField name="technologies" placeholder="Enter requirement of Technologies" class="form-control"/>
                <g:renderErrors bean="${errTech}" field="technologies"/>
            </div>

            <div class="form-group ${hasErrors(bean: errTool, field: 'tools', 'has-error')}">
                <label for="tools">Tools & IDEs:</label>
                <g:textField name="tools" placeholder="Enter the name of Tools & IDEs whose experience is required"
                             class="form-control"/>
                <g:renderErrors bean="${errTool}" field="tools"/>
            </div>

            <div class="form-group ${hasErrors(bean: errSkill, field: 'skills', 'has-error')}">
                <label for="skills">Skills:</label>
                <g:textField name="skills" placeholder="Enter required Skills" class="form-control"/>
                <g:renderErrors bean="${errSkill}" field="skills"/>
            </div>

            <div class="form-group ${hasErrors(bean: errInterview, field: 'result', 'has-error')}">
                <label for="result">Your Placement:</label>
                <g:select name="result" id="result" from="${Result.values()}" value="${fieldValue(field: 'result')}"
                          noSelection="['':'Select the Status of Placement']" class="form-control"/>
                <g:renderErrors bean="${errInterview}" field="result"/>
            </div>

            <g:link name="prevBtn" controller="interview" action="index" class="btn btn-primary btnProp">Previous</g:link>

            <g:submitButton name="submit" value="Submit" class="btn btn-primary btnProp"></g:submitButton>

        </g:form>

    </content>

</body>
</html>
