<%--
  Created by IntelliJ IDEA.
  User: praveen
  Date: 21/7/16
  Time: 6:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Login</title>
    <meta name="layouts" content="main">
    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:stylesheet href="font-awesome.min.css"/>
    <asset:stylesheet src="jquery.min.css"/>
    <asset:stylesheet src="bootstrap.min.js"/>
    <style>


    h1{
        padding-top: 30px;
        margin-bottom:26px;
        text-align: center;
    }
    .col-md-3{
        background-color: #f5f5f5;
        height:289px;
        border-radius: 4px;
        border: 1px solid #000000;

    }
    .col-md-offset-5{
        margin-left: 37.667%;
    }
    h3{
        text-align: center;
    }
    h6{
        text-align: center;
        font-size: small;

    }
    .form-horizontal .form-group{
        padding-top:5px;
        margin-left: 17px;
        text-align: center;
        margin-right: -277px;
    }
    .form-control{
        width: 50%;

    }
    .form-group{
    }
    .button{
        margin-left: 105px;
    }
    </style>
</head>

<body>
<div class="container-fluid">
    <h1>CareerFly</h1>
        <div class="col-md-offset-5 col-md-3 col-xs-4">

            <div>
                <h3>Login</h3>
                <h6>Access Your Account</h6>
                <g:if test="${flash.message}">
                    <div class="alert alert-info">
                        <p>${flash.message}</p></div>
                </g:if>
                <g:form class="form-horizontal" action="register" controller="signup">
                    <div class="form-group">
                        <g:textField name="emailid" placeholder="Email" class="form-control"></g:textField>
                    </div>
                    <div class="form-group">
                        <g:passwordField name="password" placeholder="Password" class="form-control"></g:passwordField>
                    </div>
                    <div class="button">
                        <g:submitButton name="Login" class="btn btn-danger btn-sm"></g:submitButton>
                        <a href="">Forget ?</a>
                    </div>
                </g:form>
            </div>
        </div>
</div>
</body>
</html>