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

            <div class="viewFeeds">
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

        </content>
    </body>
</html>

</g:applyLayout>