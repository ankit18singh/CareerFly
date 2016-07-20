<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 19/7/16
  Time: 11:57 PM
--%>
<g:applyLayout name="defaultTemplate">
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <content tag="body">
        <h1 class="page-header">Welcome to Discussion-Forum
        <g:link controller="discuss" action="create">
            <button class="btn btn-success">Create Discussion</button>
        </g:link></h1>
        <div class="container">
        <div class="row">
            <div class="col-sm-10">
                    <table class="table table-bordered table-responsive">
                        <tbody>
                            <g:each in="${viewAll}" var="tab">
                                <tr>
                                    <td>${tab.id}</td>
                                    <td><g:link controller="discuss"
                                                action="forum" id="${tab.id}">${tab.title}</g:link></td>
                                    <td></td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            <div class="col-sm-2"></div>
        </div>
        </div>
    </content>
</body>
</html>
</g:applyLayout>