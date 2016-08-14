<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 14/8/16
  Time: 7:31 PM
--%>
<g:applyLayout name="main">
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <content tag="body">
        <h2 class="page-header">Search Result</h2>
        <g:if test="${searchInstanceModel}">
            <g:each in="${searchInstanceModel}" var="result">
                %{--<p>${result.title}</p>--}%
                <div class="viewFeeds">
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
                                    <g:link controller="discuss" action="forum" id="${result.id}">
                                        <h4>${result.title}<br/>
                                            <small>${raw(result.body)}</small>
                                        </h4>
                                    </g:link>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <small>Upvoted By: ${result.upVotes} people</small>
                                            <br>
                                            <small>DownVoted By: ${result.downVotes} people</small>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <small>Posted by: <a href="#">${result.author.firstName+ " " +result.author
                                                    .lastName}</a> on : ${result.dateCreated}</small>
                                        </div>
                                        <div class="col-sm-6">
                                            <g:link controller="discuss" action="forum" id="${result.id}"
                                            ><button type="submit" class="btn btn-success">Comment</button></g:link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <hr/>
            </g:each>
        </g:if>
    </content>
</body>
</html>
</g:applyLayout>