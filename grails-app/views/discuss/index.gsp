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
                        <div class="col-sm-3">
                            %{-- <select name="newsFeeds" class="form-control">
                                 <option value="interest" id=1>Interest</option>
                                 <option value="latest" id=2>Latest</option>
                                 <option value="toprated" id=3>Top Rated</option>
                             </select>--}%
                            <g:select name = "newsFeeds" class="form-control" from ="${[[abc:"Interest",xyz:1], [abc:"Latest",xyz:2],[abc :"TopRated", xyz:3]]}"
                                      value="this.value" onchange="${remoteFunction(params : 'this.value')}"
                                      optionValue="abc" optionKey="xyz"  />
                            <g:submitButton name="submit"/>
                        </div>
                    </div>

                </g:form>
            </div>

            <hr id="hrCol">

            <div class="viewFeeds">
                <g:each in="${viewAll}" var="feeds" status="i">
                    <div class="row">
                        <div class="col-sm-1"><i class="fa fa-bookmark fa-4x" aria-hidden="true"><span
                                class="badge">${i+1}</span></i>
                        </div>
                        <div class="col-sm-7">
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
                                </div>
                            </div>
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