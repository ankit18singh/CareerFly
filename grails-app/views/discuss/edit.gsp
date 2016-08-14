<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 23/7/16
  Time: 9:51 PM
--%>


<g:applyLayout name="main">
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title></title>
    </head>

    <body>
        <content tag="body">

            <div class="container">
                <h1 class="page-header">Edit Discussion</h1>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-10">
                            <g:if test="${flash.error}">
                                <div class="alert alert-danger" style="display: block">${flash.error}</div>
                            </g:if>
                        </div>
                    </div>
                    <g:form controller="discuss" action="update" method="post" class="form-horizontal">
                        <div class="row">

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <g:hiddenField name="id" value="${discussionEdit.id}"/>
                                </div>
                            </div>

                            <div class="form-group ${hasErrors(bean: reloadSaveUpdateInstance, field: "newtitle", "has-error")}">
                                <div class="col-sm-10">
                                    <g:textField name="newtitle" class="form-control" value="${discussionEdit.title}"
                                                 required="required"/>
                                    <g:renderErrors bean="${reloadSaveUpdateInstance}" field="newtitle"/>
                                </div>
                            </div>

                            <div class="form-group ${hasErrors(bean: reloadSaveUpdateInstance, field: "newbody",
                                    "has-error")}">
                                <div class="col-sm-10">
                                    <g:textArea name="newbody" class="form-control" value="${discussionEdit.body}" style="height: 300px"/>
                                    <g:renderErrors bean="${reloadSaveUpdateInstance}" field="newtitle"/>
                                </div>
                            </div>

                            <div class="form-group ${hasErrors(bean: reloadSaveUpdateInstance, field: "newlink",
                                    "has-error")}">
                                <div class="col-sm-10">
                                    <g:textField name="newlink" class="form-control" value="${discussionEdit.link}" required="required"/>
                                    <g:renderErrors bean="${reloadSaveUpdateInstance}" field="newtitle"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-8">
                                    <g:submitButton name="Submit" class="btn btn-lg btn-success" id="sub"/>
                                </div>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>

        </content>
    </body>
</html>
</g:applyLayout>