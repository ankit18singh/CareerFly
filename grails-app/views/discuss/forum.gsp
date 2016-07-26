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
        <asset:stylesheet src="discussion.css"/>
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({ selector:'textarea' });</script>
    </head>

    <body>
        <content tag="body">

            <div class="row">
                <div class="form-group col-sm-11">
                    <div class="input-group col-md-12">
                        <input type="text" class="  search-query form-control" placeholder="Search" />
                        <span class="input-group-btn">
                            <button class="btn btn-danger search" type="button">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-sm-1 text-center">
                    <i class="fa fa-plus-square-o fa-3x" aria-hidden="true" title="Create New Discussion"
                       data-toggle="modal" data-target="#newDiscModal"></i>
                </div>
            </div>

            <hr>

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
                                    <div class="well">${forumInstanceModel.body}</div>
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
                                    <button class="btn btn-default"><span class="badge">${forumInstanceModel.upVotes}</span>
                                        <i class="fa fa-thumbs-up" aria-hidden="true"></i></button>
                                </div>
                                <div class="col-sm-1 col-md-1">
                                    <button class="btn btn-default"><span class="badge">${forumInstanceModel.downVotes}</span>
                                        <i class="fa fa-thumbs-down" aria-hidden="true"></i></button>
                                </div>

                                <div class="col-sm-8 col-md-8">
                                    %{--<button type="button" class="btn delete">popup</button>--}%
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

            <div class="row">
                <div class="col-sm-2 col-md-2">

                </div>
                <div class="col-sm-10 col-md-10">
                    <div class="comments bg-success">
                        <div class="row">
                            <div class="col-sm-12">

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <hr id="hrCol">

            <div class="row">
                <div class="col-sm-2 col-md-2">

                </div>
                <div class="col-sm-10 col-md-10 editor">
                    <g:textArea name="editorArea"/>
                </div>
            </div>


            <!--Modal code-->
            <div id="newDiscModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create Discussion</h4>
                        </div>
                        <div class="modal-body">
                            <g:form controller="discuss" action="save" method="post" class="form-horizontal">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-sm-8 col-md-12">
                                            <g:textField name="newtitle" class="form-control" placeholder="Title of your Discussion"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-8 col-md-12">
                                            <g:textArea name="newbody" class="form-control"
                                                        placeholder="Add Description of your Discussion here.." style="height: 300px"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-8 col-md-12">
                                            <g:textField name="newlink" class="form-control" placeholder="Paste URL here.."/>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="col-sm-8 col-md-12">
                                            <g:textField name="newtag" class="form-control" placeholder="Enter tags.."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-8 col-md-12">
                                            <input type="file" name="newfile" class="form-control" id="newfile"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-8 col-md-12">
                                            <g:submitButton name="Submit" class="btn btn-lg btn-success pull-right"
                                                            id="sub"/>
                                        </div>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>


            <script type="text/javascript">
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
            </script>

        </content>
    </body>
</html>

</g:applyLayout>