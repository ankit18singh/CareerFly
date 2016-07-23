<%--
  Created by IntelliJ IDEA.
  User: gajesh
  Date: 20/7/16
  Time: 10:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:stylesheet href="bootstrap-tokenfield.min.css"/>
    <asset:stylesheet href="tokenfield-typeahead.min.css"/>
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="bootstrap.min.js"/>
</head>

<body>
<p><br/><br/></p>
<div class="container">
    <g:form method="post" controller="tag" action="save">
    <input type="text" name="token"class="form-control" id="tokenfield" />
        <p><br/></p>
    <input type="submit" value="create" placeholder="Enter discussion tags.......!" class="button button-success"/>
    <asset:javascript src="bootstrap-tokenfield.min.js"/>
    <script>
        $('#tokenfield').tokenfield({
            autocomplete: {
                source: ['red','blue','green','yellow','violet','brown','purple','black','white'],
                delay: 100
            },
            showAutocompleteOnFocus: true
        });
    </script>
    </g:form>
</div>
</body>
</html>