<%--
  Created by IntelliJ IDEA.
  User: praveen
  Date: 21/7/16
  Time: 1:01 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>SignUp</title>
    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:stylesheet href="font-awesome.min.css"/>
    <asset:stylesheet src="jquery.min.css"/>
    <asset:stylesheet src="bootstrap.min.js"/>
    <style>
        h1{
            padding-top: 30px;
            padding-left: 56px;
            margin-bottom:26px;
            text-align: center;
        }
        .box {
            background-color: #f5f5f5;
            height:510px;
            border-radius: 4px;
            overflow: scroll;
            border: 1px solid #000000;
            padding-bottom: 50px;
        }

        h3 {
            text-align: center;
        }
        h6 {
            text-align: center;
            font-size: small;
        }
        .form-horizontal {
            margin-left: 17px;

        }
        .form-control {
            width: 97%;
        }
        .buttonregister {
            width:95.33%;
            padding-top: 5%;
        }

        .box.col-sm-4{
            text-align: center;
            margin-left: 326px;
        }

    </style>
</head>

<body>
<div class="container-fluid">
    <h1>CareerFly</h1>

        <div class=" box col-md-6 col-md-offset-3 col-sm-4">
                <h3>SignUp</h3>
                <h6>Create Account</h6>
                <div>
                    <g:if test="${flash.message}">

                        <div class="alert alert-info">
                            <p>${flash.message}</p>
                        </div>

                    </g:if>
                </div>
                <div>
                    <g:form method="post" class="form-horizontal" action="signup" controller="User">

                        <div class="form-group ${hasErrors(bean: user, field: 'firstName', 'has-error')}">
                            <g:textField name="firstName" placeholder="FirstName" class="form-control "
                                         value="${user.firstName}" autofocus="firstName"
                                         required="firstName"></g:textField>
                            <g:renderErrors bean="${user}" field="firstName" />
                        </div>

                        <div class="form-group ${hasErrors(bean: user, field: 'lastName', 'has-error')}">
                                <g:textField name="lastName" placeholder="LastName" class="form-control "
                                             value="${user.lastName}" required="lastName"></g:textField>
                                <g:renderErrors bean="${user}" field="lastName" />
                        </div>

                        <div class="form-group ${hasErrors(bean: user, field: 'email', 'has-error')}">
                                <g:textField name="email" placeholder="Email" class="form-control "
                                             value="${user.email}" required="Email"></g:textField>
                                <g:renderErrors bean="${user}" field="email" />
                        </div>

                        <div class="form-group">
                                <g:passwordField name="password" placeholder="Password" class="form-control "
                                                 required="Password"
                                ></g:passwordField>
                        </div>

                        <div class="form-group">
                                <g:passwordField name="confirmpassword" placeholder="Confirm Password"
                                                 class="form-control" required="confirmpassword"></g:passwordField>
                        </div>

                        <div class="radio col-md-offset-3 col-md-6 col-sm-10">
                                <label class="radio-inline">
                                    <g:radio name="Gender" value="MALE" checked="checked"></g:radio>MALE
                                </label>
                                <label class="radio-inline">
                                    <g:radio name="Gender" value="FEMALE"></g:radio>FEMALE
                                </label>
                        </div>

                        <div class="buttonregister col-sm-10 col-md-2">
                            <g:submitButton name="Register" class="btn btn-danger btn-lg"></g:submitButton>
                        </div>
                    </g:form>

                </div>
        </div>
    </div>
<footer>

</footer>
</body>
</html>