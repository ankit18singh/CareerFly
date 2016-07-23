<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <meta name="layouts" content="main">
    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:stylesheet href="font-awesome.min.css"/>
    <asset:stylesheet src="jquery.min.css"/>
    <asset:stylesheet src="bootstrap.min.js"/>
    <asset:stylesheet src="login.css"/>
</head>
<body>
    <div class="container-fluid well1">
        <h1 align="center">CareerFly</h1>
    </div>
    <div class="box-model">
        <div class="col-md-offset-3 col-md-3 col-xs-offset-2 col-xs-11 well">
            <div>
                <h3>Login</h3>
                <h5>Access Your Account</h5>
                <g:if test="${flash.message}">
                    <div class="alert alert-error danger" style="display: block">${flash.message}</div>
                </g:if>
                <g:form controller="login" action="save">
                    <div class="form-group ${hasErrors(bean: myUser, field: 'email', 'has-error')}">
                        <g:textField name="email" placeholder="Email" class="form-control" value="${myUser.email}">
                        </g:textField>
                        <g:renderErrors bean="${myUser}" field="email" />
                    </div>
                    <div class="form-group ${hasErrors(bean: myUser, field: 'password', 'has-error')}">
                        <g:passwordField name="password" placeholder="Password" class="form-control" value="${myUser.password}">
                        </g:passwordField>
                        <g:renderErrors bean="${myUser}" field="password" />
                    </div>
                    <div class="d1">
                        <g:submitButton name="Login" class="btn btn-md">

                        </g:submitButton>
                    </div>
                    <a class="anchor" href="#">Forget  ?</a>
                </g:form>
                </div>
            </div>
        </div>
    </body>
</html>