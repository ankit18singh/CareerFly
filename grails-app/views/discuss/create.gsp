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
                <div class="row">
                    <div class="col-sm-10">
                        <g:if test="${flash.error}">
                            <div class="alert alert-danger" style="display: block">${flash.error}</div>
                        </g:if>
                    </div>
                </div>
                <g:form controller="discuss" action="save" method="post" class="form-horizontal">
                    <div class="row">
                        <div class="form-group ${hasErrors(bean: reloadSaveCreateInstance, field: "newtitle", "has-error")}">
                            <div class="col-sm-10">
                                <g:textField name="newtitle" class="form-control"
                                             placeholder="Title of your Discussion" required="required"/>
                                <g:renderErrors bean="${reloadSaveCreateInstance}" field="newtitle"/>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: reloadSaveCreateInstance, field: "newbody", "has-error")}">
                            <div class="col-sm-10">
                                <g:textArea name="newbody" class="form-control"
                                            placeholder="Add Description of your Discussion here.."
                                            style="height: 300px"/>
                                <g:renderErrors bean="${reloadSaveCreateInstance}" field="newtitle"/>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: reloadSaveCreateInstance, field: "newlink", "has-error")}">
                            <div class="col-sm-10">
                                <g:textField name="newlink" class="form-control" placeholder="Paste URL here.." required="required"/>
                                <g:renderErrors bean="${reloadSaveCreateInstance}" field="newtitle"/>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: reloadSaveCreateInstance, field: "newtag", "has-error")}">
                            <div class="col-sm-10 col-md-10">
                                <g:textField name="token" class="form-control"
                                             placeholder="Enter discussion tags.......!" required="required" id="tokenfield"/>
                                <g:renderErrors bean="${reloadSaveCreateInstance}" field="newtitle"/>
                                <asset:javascript src="bootstrap-tokenfield.min.js"/>
                                <script>
                                    $('#tokenfield').tokenfield({
                                        autocomplete: {
                                            source: ['red','blue','green','yellow','violet','brown','purple','black','white'],
                                            delay: 100
                                        },
                                        showAutocompleteOnFocus: true
                                    })
                                </script>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: reloadSaveCreateInstance, field: "newfile", "has-error")}">
                            <div class="col-sm-10 col-md-10">
                                <input type="file" name="newfile" class="form-control" id="newfile" required="required"/>
                                <g:renderErrors bean="${reloadSaveCreateInstance}" field="newtitle"/>
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