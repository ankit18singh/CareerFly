<%--
  Created by IntelliJ IDEA.
  User: akshita
  Date: 21/7/16
  Time: 5:44 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <asset:stylesheet src="bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <asset:stylesheet src="font-awesome.min.css"/>
        <asset:stylesheet src="def.css"/>
        <asset:javascript src="jquery.min.js"/>
        <asset:javascript src="bootstrap.min.js"/>
        <meta charset="utf-8">
        <meta name="layout" content="main.gsp">
        <title>USER'S PROFILE</title>
    </head>
    <body>
        <content tag="body">
            <a href="index.gsp" style="padding-right: 25px">Edit your profile
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            </a>

            <a href="Socialprofile.gsp">Social Profile
                <i class="fa fa-facebook" aria-hidden="true"></i>
            </a>

            <hr>
            <div class="well">
                <form name="update" class="form-horizontal" method="post" action="/Profile/update">
                    <input type="hidden" name="id" value="${userData.id}" >
                    <div class="form-group ${hasErrors(bean: userData, field: 'firstName', 'has-error')}">
                        <label for="firstName" class="col-lg-4 control-label"> FirstName: </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="firstName" id="firstName"
                                   value="${userData.firstName}" required autofocus>
                            <g:renderErrors bean="${userData}" field="firstName" />
                        </div>
                    </div>
                    <div class="form-group ${hasErrors(bean: userData, field: 'lastName', 'has-error')}">
                        <label for="lastName" class="col-lg-4 control-label"> LastName: </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="lastName" id="lastName"
                                   value="${userData.lastName}" required>
                            <g:renderErrors bean="${userData}" field="lastName" />
                        </div>
                    </div>
                    <div class="form-group ${hasErrors(bean: userData, field: 'password', 'has-error')}">
                        <label for="password" class="col-lg-4 control-label"> Password </label>
                        <div class="col-lg-2">
                            <input type="password" class="form-control" name="password" id="password"
                                   value="${userData.password}" required>
                            <g:renderErrors bean="${userData}" field="password" />
                        </div>
                    </div>
                    <div align="center">
                        <button class="btn btn-info">SAVE</button>
                        <button type="reset" class="btn btn-default">CANCEL</button>
                    </div>
                </form>
                <g:if test="${flash.message}" style="display: block">
                    <div class="text-center bg-primary">
                        ${flash.message}
                    </div>
                </g:if>
            </div>
        </content>
    </body>
</html>
