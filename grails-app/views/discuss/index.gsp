<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 19/7/16
  Time: 11:57 PM
--%>
<g:applyLayout name="main">
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="discussion.css"/>
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
                <div class="viewFeeds">

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3" style="float: right">
                                <select name="newsFeeds" class="form-control">
                                    <option value="intrest">Intrest</option>
                                    <option value="latest">Latest</option>
                                    <option value="toprated">Top Rated</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <hr id="hrCol">
                    <g:each in="${viewAll}" var="feeds" status="i">
                        <div class="row">
                            <div class="col-sm-1"><i class="fa fa-bookmark fa-4x" aria-hidden="true"><span
                                    class="badge">${i+1}</span></i>
                            </div>
                            <div class="col-sm-7">
                                <g:link controller="discuss" action="forum" id="${feeds.id}">
                                    <h4>${feeds.title}<br>
                                    <small>${feeds.body}</small>
                                    </h4>
                                </g:link>
                            </div>

                        </div>
                        <hr id="hrCol">
                    </g:each>
                </div>

        <nav>
            <ul class="pager">
                <li><a href="#">Previous</a></li>
                <li><a href="#">Next</a></li>
            </ul>
        </nav>


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

    </content>
</body>
</html>
</g:applyLayout>