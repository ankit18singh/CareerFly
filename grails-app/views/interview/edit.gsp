<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 24/7/16
  Time: 1:55 AM
--%>

<%@ page import="com.careerfly.organization.interview.Result" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
    <content tag="heading">
        <h2>Edit Details</h2>
    </content>

    <content tag="body">

        <g:if test="${!interviewInstance}">
            <g:if test="${flash.message}">
                <div class="alert alert-info">
                    <p>
                        ${flash.message}
                    </p>
                </div>
                <g:link name="cancel" controller="interviewListing" action="index" class="btn btn-primary btnProp">Cancel</g:link>
            </g:if>
        </g:if>

        <g:else>
            <g:form name="editInterview" controller="interview" action="update" class="form-group">

                    <input type="hidden" name="companyID" value="${interviewInstance.company.id}">

                    <div class="form-group ${hasErrors(bean: errCompany, field: 'name', 'has-error')}">
                        <label for="companyName">Company Name:</label>
                        <g:textField name="companyName" placeholder="Enter the Name of the Company" class="form-control"
                                     value="${interviewInstance.company.name}"/>
                        <g:renderErrors bean="${errCompany}" field="name"/>
                    </div>

                    <input type="hidden" name="cityID" value="${interviewInstance.company.address.city.id}">

                    <div class="form-group ${hasErrors(bean: errCity, field: 'name', 'has-error')}">
                        <label for="companyAddress">Headquarter:</label>
                        <g:textField name="companyAddress" placeholder="Enter City of the Company" class="form-control"
                                     value="${interviewInstance.company.address.city.name}"/>
                        <g:renderErrors bean="${errCity}" field="name"/>
                    </div>

                    <input type="hidden" name="id" value="${interviewInstance.id}">

                    <div class="form-group ${hasErrors(bean: errInterview, field: 'jobPosition', 'has-error')}">
                        <label for="jobPosition">Job Position:</label>
                        <g:textField name="jobPosition" placeholder="Enter Job Position for which you were Interviewed"
                                     class="form-control" value="${interviewInstance.jobPosition}"/>
                        <g:renderErrors bean="${errInterview}" field="jobPosition"/>
                    </div>

                    <div class="form-group ${hasErrors(bean: errInterview, field: 'qualification', 'has-error')}">
                        <label for="qualification">Qualification:</label>
                        <g:textField name="qualification" placeholder="Enter required Qualification" class="form-control"
                                     value="${interviewInstance.qualification}"/>
                        <g:renderErrors bean="${errInterview}" field="qualification"/>
                    </div>

                <g:each in="${interviewInstance}" var="show">

                    <div class="form-group ${hasErrors(bean: errInterview, field: 'workExperience', 'has-error')}">
                        <label for="workExperience">Work Experience:</label>
                        <g:textArea name="workExperience" rows="3" placeholder="Enter required Work Experience"
                                    class="form-control" value="${show.workExperience}"/>
                        <g:renderErrors bean="${errInterview}" field="workExperience"/>
                    </div>

                    <div class="form-group ${hasErrors(bean: errTech, field: 'technologies', 'has-error')}">
                        <label for="technologies">Technologies:</label>
                        <g:textField name="technologies" placeholder="Enter requirement of Technologies"
                                     class="form-control" value="${show.technologies.name}"/>
                        <g:renderErrors bean="${errTech}" field="technologies"/>
                    </div>

                    <div class="form-group ${hasErrors(bean: errTool, field: 'tools', 'has-error')}">
                        <label for="tools">Tools & IDEs:</label>
                        <g:textField name="tools" placeholder="Enter the name of Tools & IDEs whose experience is required"
                                     class="form-control" value="${show.tools.name}"/>
                        <g:renderErrors bean="${errTool}" field="tools"/>
                    </div>

                    <div class="form-group ${hasErrors(bean: errSkill, field: 'skills', 'has-error')}">
                        <label for="skills">Skills:</label>
                        <g:textField name="skills" placeholder="Enter required Skills" class="form-control"
                                     value="${show.skills.name}"/>
                        <g:renderErrors bean="${errSkill}" field="skills"/>
                    </div>

                </g:each>

                <div class="form-group ${hasErrors(bean: errInterview, field: 'result', 'has-error')}">
                    <label for="result">Your Placement:</label>
                    <g:select name="result" id="result" from="${com.careerfly.organization.interview.Result.values()}"
                              value="${interviewInstance.result}" class="form-control"/>
                    <g:renderErrors bean="${errInterview}" field="result"/>
                </div>

                <g:submitButton name="submit" value="Submit" class="btn btn-primary btnProp"></g:submitButton>

                <g:link name="cancel" controller="interview" action="show" class="btn btn-primary btnProp">Cancel</g:link>

            </g:form>
        </g:else>
    </content>
</body>
</html>
