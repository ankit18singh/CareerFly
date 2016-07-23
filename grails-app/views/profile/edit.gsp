<%--
  Created by IntelliJ IDEA.
  User: akshita
  Date: 22/7/16
  Time: 11:25 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="defaultTemplate">
</head>
<body>
<content tag="body">
    <div class="container">
        <h3>Edit your profile
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
        </h3>
        <hr>
        <div class="container well">
            <form name="update" class="form-horizontal" method="post" action="/basicProfile/update">
                <input type="hidden" name="id" value="${editing.id}">
                <div class="form-group">
                    <label for="firstName"> FirstName: </label>
                    <input type="text" class="form-control" name="firstName" id="firstName" value="${editing.firstName}">
                </div>
                <div class="form-group">
                    <label for="lastName"> LastName: </label>
                    <input type="text" class="form-control" name="lastName" id="lastName" value="${editing.lastName}">
                </div>
                <div class="form-group">
                    <label for="email"> Email: </label>
                    <input type="text" class="form-control" name="email" id="email" value="${editing.email}">
                </div>
                <div class="form-group">
                    <label for="password"> New Password </label>
                    <input type="text" class="form-control" name="password" id="password" value="${editing.password}">
                </div>
                <input type="submit" class="btn btn-info" value="submit here" >
            </form>
            <g:if test="${flash.message}" >
                <div class="alert alert-error danger">
                    ${flash.message}
                </div>
            </g:if>
        </div>
    </div>
</content>
</body>
</html>