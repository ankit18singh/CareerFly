<%--
  Created by IntelliJ IDEA.
  User: praveen
  Date: 13/8/16
  Time: 4:33 PM
--%>

%@ page contentType="text/html;charset=UTF-8" %>
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

    <a href="check">Social Profile
        <i class="fa fa-facebook" aria-hidden="true"></i>
    </a>
    <hr>
    <div class="well">
        <form name="update" class="form-horizontal" method="post" action="updatesocial">
            <div class="form-group ${hasErrors(bean: usersocial, field: 'fb', 'has-error')}">
                <label for="fb" class="col-lg-4 control-label">FaceBook Username </label>
                <div class="col-lg-5">
                    <input type="text" class="form-control" name="fb" value="${usersocial.fb}" id="fb" autofocus="fb">
                    <g:renderErrors bean="${usersocial.fb}" field="fb" />
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: usersocial, field: 'skype', 'has-error')}">
                <label for="skype" class="col-lg-4 control-label"> Skype Username </label>
                <div class="col-lg-5">
                    <input type="text" class="form-control" name="skype" value="${usersocial.skype}" id="skype" >
                    <g:renderErrors bean="${usersocial.skype}" field="skype" />
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: usersocial, field: 'gplus', 'has-error')}">
                <label for="gplus" class="col-lg-4 control-label"> Google+</label>
                <div class="col-lg-5">
                    <input type="text" class="form-control" name="gplus" value="${usersocial.gplus}" id="gplus">
                    <g:renderErrors bean="${usersocial.gplus}" field="gplus" />
                </div>
            </div>

            <div align="center">
                <button class="btn btn-info">Update</button>
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