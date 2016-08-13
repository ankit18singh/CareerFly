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
                                    <p>Source: <a href="${forumInstanceModel.link}" target="_blank">${forumInstanceModel.link}</a> </p>
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
                                    <p>Posted by: ${forumInstanceModel.author.firstName +" "+
                                        forumInstanceModel.author.lastName}</p>
                                </div>

                                    <div class="col-sm-1 col-md-1">
                                        <g:link controller="discuss" action="edit" id="${forumInstanceModel.id}"
                                        ><i class="fa fa-pencil fa-2x" aria-hidden="true"></i></g:link>
                                    </div>

                                    <div class="col-sm-1 col-md-1">
                                        <g:link controller="discuss" action="delete" id="${forumInstanceModel.id}"
                                        ><i class="fa fa-trash-o fa-2x" aria-hidden="true"></i></g:link>
                                    </div>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
            <hr id="hrCol">

            <g:form controller="discuss" action="comment" method="post" id="${forumInstanceModel.id}" class="form-horizontal">
                <div class="row">
                    <div class="col-sm-2 col-md-2">

                    </div>
                    <div class="col-sm-10 col-md-10 editor">
                        <g:textArea name="discussionComment"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-2 col-md-2">

                    </div>
                    <div class="col-sm-10 col-md-10">
                        <g:submitButton name="save" class="btn btn-success pull-right"></g:submitButton>
                    </div>
                </div>
            </g:form>

            <hr id="hrCol">

            <g:if test="${CommentInstanceModel}">
                <g:each in="${CommentInstanceModel}" var="comment">

                    <div class="row">
                        <div class="col-sm-2 col-md-2">

                        </div>
                        <div class="col-sm-10 col-md-10">
                            <div class="comments bg-success">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <asset:image class="media-class img-circle" src="dp.png"
                                                                 width="64px"/>
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading"> ${comment.author.firstName + " "+comment.author.lastName
                                                }</h4><p>${raw(comment.body)}</p>
                                                <div class="row">
                                                    <div class="col-sm-1 col-md-1">
                                                        <a href="/discuss/commentUpVote/${comment.id}" class="btn btn-default"><span
                                                                class="badge">${comment.upVotes}</span><i class="fa fa-thumbs-up" aria-hidden="true"></i></a>
                                                    </div>
                                                    <div class="col-sm-1 col-md-1">
                                                        <a href="/discuss/commentDownVote/${comment.id}" class="btn btn-default"><span
                                                                class="badge">${comment.downVotes}</span><i class="fa fa-thumbs-down" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>

                                                <hr/>
                                                <div>
                                                    <g:form controller="discuss" action="subComment" method="post" id="${comment.id}">
                                                        <div class="row">
                                                            <div class="col-sm-12 col-md-12">
                                                                <g:textArea name="replyBox"/>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12 col-md-12">
                                                                <g:submitButton name="reply" class="btn btn-success pull-right"/>
                                                            </div>
                                                        </div>
                                                    </g:form>
                                                </div>
                                                <hr/>
                                            </div>
                                            <g:if test="${subCommentModel}">
                                                <g:each in="${subCommentModel}" var="reply">
                                                    <div class="media">
                                                        <a class="pull-left" href="#">
                                                            <asset:image class="media-class img-circle" src="dp.png"
                                                                         width="44px"/>
                                                        </a>
                                                    </div>
                                                    <div class="media-body">
                                                        <h3 class="media-heading"> ${reply.author.firstName + " "+reply.author.lastName
                                                }</h3><p>${raw(reply.body)}</p>
                                                    </div
                                                </g:each>

                                            </g:if>
                                            <g:else>
                                                <p>none.</p>
                                            </g:else>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                        </div>
                    </div>
                </g:each>
            </g:if>
            <g:else>

                <div class="row">
                    <div class="col-sm-2 col-md-2">

                    </div>
                    <div class="col-sm-10 col-md-10">
                        <div class="comment">
                            <div class="row">
                                <div class="col-sm-12">
                                    <p>Post a comment.</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </g:else>


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