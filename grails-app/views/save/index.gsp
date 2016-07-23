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
    .col-md-6{
        background-color: #f5f5f5;
        height:450px;
        border-radius: 4px;
        border: 1px solid #000000;

    }

    h3{
    text-align: center;
    }
    h6{
        text-align: center;
        font-size: small;
    }
    .form-horizontal {
        margin-left: 17px;
        text-align: center;
    }
    .form-control{
        width: 95%;
    }
    /*.buttonregister{*/
        /*margin-left: 263px;*/
    /*}*/

</style>

</head>

<body>
<div class="container-fluid">
    <h1>CareerFly</h1>

        <div class="col-md-6 col-md-offset-3 col-xs-4">
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
                    <g:form method="post" class="form-horizontal" action="register" controller="save">
                            <div class="form-group ${hasErrors(bean: Register, field: 'firstname', 'has-error')}">
                                <g:textField name="firstname" placeholder="FirstName" class="form-control"
                                             value="${Register.firstName}"></g:textField>
                                <g:renderErrors bean="${Register}" field="firstname" />
                            </div>
                            <div class="form-group ${hasErrors(bean: Register, field: 'lastname', 'has-error')}">
                                <g:textField name="lastname" placeholder="LastName" class="form-control"
                                             value="${Register.lastName}"></g:textField>
                                <g:renderErrors bean="${Register}" field="lastname" />
                            </div>
                            <div class="form-group ${hasErrors(bean: Register, field: 'email', 'has-error')}">
                            <g:textField name="email" placeholder="Email" class="form-control"
                                         value="${Register.email}"></g:textField>
                            <g:renderErrors bean="${Register}" field="email" />
                            </div>
                            <div class="form-group">
                            <g:passwordField name="password" placeholder="Password" class="form-control"></g:passwordField>
                            </div>
                            <div class="form-group">
                            <g:passwordField name="confirmpassword" placeholder="Confirm Password" class="form-control"></g:passwordField>
                            </div>
                            <div class="buttonregister">
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