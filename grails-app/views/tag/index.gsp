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
    <style>
        .alert{
           width: 80%;
           padding: 10px;
        }
    </style>
</head>

<body>
<p><br/><br/></p>
<div class="container">
    <g:if test="${flash.error}" >
        <div class="alert alert-danger" style = "display: block">
           ${flash.error}
        </div>
    </g:if>
    <g:form method="post" controller="tag" action="save">
        <div class="form-group ${hasErrors(bean: modelIns, field: 'name' , 'has-error')}">
              <div class="col-sm-1">
                  <label for="tokenfield" class="control-label">Tags</label>
              </div>
              <div class="col-sm-8">
                  <input type="text" name="token"class="form-control" placeholder="Enter discussion tags.......!" id="tokenfield" />
              </div>
            <div class="col-sm-2">
                <input type="submit" value="create"  class="button button-success"/>
                <asset:javascript src="bootstrap-tokenfield.min.js"/>
                <script>
                    $('#tokenfield').tokenfield({
                        autocomplete: {
                            source: ['red','blue','green','yellow','violet','brown','purple','black','white'],
                            delay: 100
                        },
                        showAutocompleteOnFocus: true
                    })
                </script>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>