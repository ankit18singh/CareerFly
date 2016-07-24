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
           width: 83%;
           padding: 10px;
           border-radius: 10px;
        }
        .form-horizontal .control-label {
            text-align: left;
        }

        .col-sm-1{
            padding-left: 2%;
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
    <g:form method="post" controller="tag" action="save"  class="form-horizontal">
           <div class="form-group">
                    <label for="tokenfield" class="col-sm-1 control-label">Tag</label>
                    <div class="col-sm-9">
                        <input type="text" name="token"class="form-control" placeholder="Enter discussion tags.......!" id="tokenfield" />
                    </div>
           </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Create</button>
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
          </div>
    </g:form>
</div>
</body>
</html>