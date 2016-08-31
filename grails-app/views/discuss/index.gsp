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
    </head>

    <body>
        <content tag="body">

            <div class="row">
                <g:form controller="discuss" action="index" method="post">
                    <div class="form-group">
                        <div class="col-sm-8">

                        </div>
                        <div class="col-sm-3">
                            %{-- <select name="newsFeeds" class="form-control">
                                 <option value="interest" id=1>Interest</option>
                                 <option value="latest" id=2>Latest</option>
                                 <option value="toprated" id=3>Top Rated</option>
                             </select>--}%
                            <g:select name = "newsFeeds" class="form-control" from ="${[[abc:"Interest",xyz:1], [abc:"Latest",xyz:2],[abc :"TopRated", xyz:3]]}"
                                       onchange="${remoteFunction(params : 'this.value')}"
                                      optionValue="abc" optionKey="xyz"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-1">
                            <g:submitButton name="submit" class="btn btn-default"/>
                        </div>
                    </div>
                </g:form>
            </div>

            <hr id="hrCol">

            <div class="viewFeeds">
                <g:each in="${viewAll}" var="feeds" status="i">
                    <div class="row">
                        <div class="col-sm-10">
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <asset:image class="media-class img-circle" src="dp.png"
                                                     width="64px"/>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <g:link controller="discuss" action="forum" id="${feeds.id}">
                                        <h4 class="media-heading"> ${feeds.title}<br/>
                                            <small>${raw(feeds.body)}</small>
                                        </h4>
                                    </g:link>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <small>Upvoted By: ${feeds.upVotes} people</small>
                                            <br>
                                            <small>DownVoted By: ${feeds.downVotes} people</small>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <small>Posted by: <a href="#">${feeds.author.firstName+ " " +feeds.author
                                                    .lastName}</a> on : ${feeds.dateCreated}</small>
                                        </div>
                                        <div class="col-sm-6">
                                            <g:link controller="discuss" action="forum" id="${feeds.id}"
                                            ><button type="submit" class="btn btn-success">Comment</button></g:link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-2"><i class="fa fa-bookmark fa-5x" aria-hidden="true"><span
                                class="badge">${i+1}</span></i>
                        </div>

                    </div>

                    <hr id="hrCol">
                </g:each>
                %{--<g:paginate  next="Forward" prev="Back" maxsteps="10" controller="discuss" action= "index"
                             total="${discussionCount}"/>--}%

            </div>

        </content>
    </body>
</html>

</g:applyLayout>