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

        <g:form name="editInterview" controller="interview" action="update" class="form-group">

            <g:each in="${getCompany}" var="company" id="${company.id}">
                <input type="hidden" name="companyID" value="${company.id}">
                <div class="form-group">
                    <label for="companyName">Company Name:</label>
                    <g:textField name="companyName" placeholder="Enter the Name of the Company" class="form-control"
                                 value="${company.name}"></g:textField>
                </div>
            </g:each>

            <g:each in="${getCity}" var="city" id="${city.id}">
                <input type="hidden" name="cityID" value="${city.id}">
                <div class="form-group">
                    <label for="companyAddress">Headquarter:</label>
                    <g:textField name="companyAddress" placeholder="Enter City of the Company" class="form-control"
                                 value="${city.name}"
                    ></g:textField>
                </div>
            </g:each>

            <g:each in="${getInterview}" var="edit" id="${edit.id}">
                <input type="hidden" name="interviewID" value="${edit.id}">
                <div class="form-group">
                    <label for="jobPosition">Job Position:</label>
                    <g:textField name="jobPosition" placeholder="Enter Job Position for which you were Interviewed"
                                 class="form-control" value="${edit.jobPosition}"/>
                </div>

                <div class="form-group">
                    <label for="qualification">Qualification:</label>
                    <g:textField name="qualification" placeholder="Enter required Qualification" class="form-control"
                                 value="${edit.qualification}"/>
                </div>

                <div class="form-group">
                    <label for="workExperience">Work Experience:</label>
                    <g:textArea name="workExperience" rows="3" placeholder="Enter required Work Experience"
                                class="form-control" value="${edit.workExperience}"/>
                </div>
            </g:each>

            <g:each in="${getTech}" var="tech" id="${tech.id}">
                <input type="hidden" name="techID" value="${tech.id}">
                <div class="form-group">
                    <label for="technologies">Technologies:</label>
                    <g:textField name="technologies" placeholder="Enter requirement of Technologies"
                                 class="form-control" value="${tech.name}"/>
                </div>
            </g:each>

            <g:each in="${getTool}" var="tool" id="${tool.id}">
                <input type="hidden" name="toolID" value="${tool.id}">
                <div class="form-group">
                    <label for="tools">Tools & IDEs:</label>
                    <g:textField name="tools" placeholder="Enter the name of Tools & IDEs whose experience is required"
                                 class="form-control" value="${tool.name}"/>
                </div>
            </g:each>

            <g:each in="${getSkill}" var="skill" id="${skill.id}">
                <input type="hidden" name="skillID" value="${skill.id}">
                <div class="form-group">
                    <label for="skills">Skills:</label>
                    <g:textField name="skills" placeholder="Enter required Skills" class="form-control"
                                 value="${skill.name}"/>
                </div>
            </g:each>

            <g:each in="${getInterview}" var="inter" id="${inter.id}">
                <div class="form-group">
                    <label for="rounds">Rounds:</label>
                    <g:textField name="rounds" placeholder="Enter the Number of Round" class="form-control"
                                 value="${inter.rounds}"/>
                </div>

                <div class="form-group">
                    <label for="result">Your Placement:</label>
                    <g:select name="result" id="result" from="${com.careerfly.organization.interview.Result.values()}" value="${inter.result}" class="form-control"/>
                </div>
            </g:each>

            <g:submitButton name="submit" value="Submit" class="btn btn-primary btnProp"></g:submitButton>

        </g:form>

    </content>
</body>
</html>