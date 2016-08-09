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
                    <g:form controller="discuss" action="update" method="post" class="form-horizontal">
                        <div class="row">

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <g:hiddenField name="id" value="${discussionEdit.id}"/>
                                    <g:textField name="author" value="${discussionEdit.author}"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <g:textField name="newtitle" class="form-control" value="${discussionEdit.title}"
                                                 required="required"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <g:textArea name="newbody" class="form-control"
                                                value="${discussionEdit.body}" style="height: 300px"
                                                required="required"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <g:textField name="newlink" class="form-control" value="${discussionEdit.link}" required="required"/>
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