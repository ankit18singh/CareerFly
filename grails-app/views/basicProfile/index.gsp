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
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script type="text/javascript">
            function editFirstName() {
                //console.log(document.getElementById("firstName"))
                document.getElementById("firstName").removeAttribute("readonly");
                //document.forms[0].firstName.readonly=false;
            }
            function editLastName() {
                document.getElementById("lastName").removeAttribute("readonly");
            }
            function editEmail() {
                document.getElementById("email").removeAttribute("readonly");
            }
            function editPassword() {
                document.getElementById("password").removeAttribute("readonly");
            }
        </script>
        <title>USER'S PROFILE</title>
    </head>
    <body>

        <div class="container">
            <h3>Edit your profile
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            </h3>
            <hr>
            <div class="container well">
                <form name="update" class="form-horizontal" method="post" action="/basicProfile/update">
                    <input type="hidden" name="id" value="${userData.id}" >
                    <div class="form-group ${hasErrors(bean: userData, field: 'firstName', 'has-error')}">
                        <label for="firstName" class="col-lg-4 control-label"> FirstName: </label>
                        <div class="col-lg-6 top-pad">
                            <input type="text" class="form-control try" name="firstName" id="firstName" value="${userData.firstName}" readonly required>
                            <button type="button" class="btn btn-group-sm try" onclick="editFirstName()">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </button>
                            <g:renderErrors bean="${userData}" field="firstName" />
                        </div>
                    </div>
                    <div class="form-group ${hasErrors(bean: userData, field: 'lastName', 'has-error')}">
                        <label for="lastName" class="col-lg-4 control-label"> LastName: </label>
                        <div class="col-lg-6 top-pad">
                            <input type="text" class="form-control try" name="lastName" id="lastName" value="${userData.lastName}" readonly required>
                            <button type="button" class="btn btn-group-sm try" onclick="editLastName()">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </button>
                            <g:renderErrors bean="${userData}" field="lastName" />
                        </div>
                    </div>
                    <div class="form-group ${hasErrors(bean: userData, field: 'email', 'has-error')}">
                        <label for="email" class="col-lg-4 control-label"> Email: </label>
                        <div class="col-lg-6 top-pad">
                            <input type="text" class="form-control try" name="email" id="email"
                                   value="${userData.email}" readonly required>
                            <button type="button" class="btn btn-group-sm try" onclick="editEmail()">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </button>
                            <g:renderErrors bean="${userData}" field="email" />
                        </div>
                    </div>
                    <div class="form-group ${hasErrors(bean: userData, field: 'password', 'has-error')}">
                        <label for="password" class="col-lg-4 control-label"> Password </label>
                        <div class="col-lg-6 top-pad">
                            <input type="password" class="form-control try" name="password" id="password" value="${userData.password}" readonly required>
                            <button type="button" class="btn btn-group-sm try" onclick="editPassword()">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </button>
                            <g:renderErrors bean="${userData}" field="password" />
                        </div>
                    </div>
                    <div align="center">
                        <button class="btn btn-info">submit here
                            </button>
                    </div>
                </form>
                <g:if test="${flash.message}" style="display: block">
                    <div class="alert alert-danger">
                        ${flash.message}
                    </div>
                </g:if>
            </div>
        </div>
    <g:link controller="logout">LOGOUT</g:link>
    </body>
</html>
