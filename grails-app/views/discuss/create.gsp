<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 19/7/16
  Time: 4:30 PM
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
            <h1 class="page-header">Create Discussion</h1>
            <div class="container">
                <g:form controller="discuss" action="save" method="post" class="form-horizontal">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <g:textField name="newtitle" class="form-control" placeholder="Title of your Discussion"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-10">
                                <g:textArea name="newbody" class="form-control"
                                            placeholder="Add Description of your Discussion here.." style="height: 300px"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-10">
                                <g:textField name="newlink" class="form-control" placeholder="Paste URL here.."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-10">
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