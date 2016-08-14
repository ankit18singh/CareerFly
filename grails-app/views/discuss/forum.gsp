<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 19/7/16
  Time: 8:34 PM
--%>
<g:applyLayout name="main">
    <%@ page contentType="text/html;charset=UTF-8" %>

    <html>
    <head>
        <title></title>
    </head>

    <body>
        <content tag="body">
            <g:if test="${flash.message}">
                <div class="alert alert-success" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col-sm-2 col-md-2 dp text-center">
                    <asset:image src="dp.png" id="dp" class="img-circle"/>
                </div>

                <div class="col-sm-10 col-md-10">
                    <div class="forum_area">
                        <g:if test="${forumInstanceModel}">
                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <h2>${forumInstanceModel.title}</h2>

                                    <div class="well">${raw(forumInstanceModel.body)}</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <small>${forumInstanceModel.tags}</small>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-12 col-md-12">
                                    <p>Source: <a href="${forumInstanceModel.link}"
                                                  target="_blank">${forumInstanceModel.link}</a></p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-1 col-md-1">
                                    <a href="/discuss/upVote/${forumInstanceModel.id}" class="btn btn-default"><span
                                            class="badge">${forumInstanceModel.upVotes}</span>
                                        <i class="fa fa-thumbs-up" aria-hidden="true"></i></a>
                                </div>

                                <div class="col-sm-1 col-md-1">
                                    <a href="/discuss/downVote/${forumInstanceModel.id}" class="btn btn-default"><span
                                            class="badge">${forumInstanceModel.downVotes}</span>
                                        <i class="fa fa-thumbs-down" aria-hidden="true"></i></a>
                                </div>

                                <div class="col-sm-8 col-md-8">
                                    %{--<button type="button" class="btn delete">popup</button>--}%
                                    <p>Posted by: ${forumInstanceModel.author.firstName + " " +
                                            forumInstanceModel.author.lastName}</p>
                                </div>

                                %{--<div class="col-sm-1 col-md-1">
                                    <g:link controller="discuss" action="edit" id="${forumInstanceModel.id}"><i
                                            class="fa fa-pencil fa-2x" aria-hidden="true"></i></g:link>
                                </div>

                                <div class="col-sm-1 col-md-1">
                                    <g:link controller="discuss" action="delete" id="${forumInstanceModel.id}"><i
                                            class="fa fa-trash-o fa-2x" aria-hidden="true"></i></g:link>
                                </div>--}%
                                <g:if test="${forumInstanceModel.author.id == session.loggedInUser}">
                                    <div class="col-sm-1 col-md-1">
                                        <g:link controller="discuss" action="edit" id="${forumInstanceModel.id}"><i
                                                class="fa fa-pencil fa-2x" aria-hidden="true"></i></g:link>
                                    </div>

                                    <div class="col-sm-1 col-md-1">
                                        <g:link controller="discuss" action="delete" id="${forumInstanceModel.id}"><i
                                                class="fa fa-trash-o fa-2x" aria-hidden="true"></i></g:link>
                                    </div>
                                </g:if>
                                <g:else>
                                </g:else>

                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
            <hr id="hrCol">
            <div class="row">
                <div class="col-sm-10">
                    <g:if test="${flash.error}">
                        <div class="alert alert-danger" style="display: block">${flash.error}</div>
                    </g:if>
                </div>
            </div>
            <g:form controller="discuss" action="comment" method="post" id="${forumInstanceModel.id}"
                    class="form-horizontal">
                <div class="row">
                    <div class="form-group ${hasErrors(bean: reloadCommentInstanceModel,field: "discussionComment",
                            "has-error")}">
                        <div class="col-sm-2 col-md-2">
                        </div>
                        <div class="col-sm-10 col-md-10">
                            <g:textArea name="discussionComment" class="form-control"
                                        placeholder="Enter Your Comment her.."/>
                            <g:renderErrors bean="reloadCommentInstanceModel" field="discussionComment"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 col-md-2">

                        </div>

                        <div class="col-sm-10 col-md-10">
                            <g:submitButton name="save" class="btn btn-success pull-right"></g:submitButton>
                        </div>
                    </div>
                </div>
            </g:form>

            <hr id="hrCol">

            <div class="row">
                <div class="col-sm-2 col-md-2">

                </div>

                <div class="col-sm-10 col-md-10">
                    <g:each in="${forumInstanceModel.getImmediateChildComments()}" var="comment">
                        <g:render template="comment" model="[commentInstance: comment]"></g:render>
                    </g:each>
                </div>
            </div>


        %{--<script type="text/javascript">
            $(".fa-trash-o").click(function(){
                swal({   title: "Are you sure?",
                            text: "You will not be able to recover this Discussion!",
                            type: "warning",   showCancelButton: true,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes, delete it!",
                            cancelButtonText: "No, cancel please!",
                            closeOnConfirm: false,   closeOnCancel: false },
                        function(isConfirm){
                            if (isConfirm) {
                                swal("Deleted!", "Your Discussion has been deleted.", "success");
                            } else {
                                swal("Cancelled", "Your Discussion is safe :)", "error");
                            }
                        });
            });
        </script>--}%

        </content>
    </body>
    </html>

</g:applyLayout>