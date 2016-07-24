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
    <ckeditor:resources/>
</head>

<body>
    <content tag="body">
        <div class="container forum_area">
            <g:if test="${Current}">
                <h1>Q:- ${Current.title}?</h1>
                <div class="well">${Current.body}</div>
                <h4>Exteral link: <a href="#" target="_blank">${Current.link}</a></h4>
                <button class="btn"><i class="fa fa-thumbs-up" aria-hidden="true"></i></button>
                <button class="btn"><i class="fa fa-thumbs-down" aria-hidden="true"></i></button>
                <br>
                <br>
                <div class="container">
                    <ckeditor:editor name="myeditor" height="400px" width="80%">
                        ${initialValue}
                    </ckeditor:editor>
                </div>
            </g:if>
        </div>
    </content>
</body>
</html>
</g:applyLayout>