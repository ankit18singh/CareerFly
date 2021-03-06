<%--
  Created by IntelliJ IDEA.
  User: ankit
  Date: 18/7/16
  Time: 8:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="def.css"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="sweetalert.css"/>
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="sweetalert.min.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="tinymce/tinymce.min.js"/>
    <script>
        tinymce.init({
            selector: 'textarea',
            menubar: false,
            statusbar: false
        });
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <g:layoutHead/>
</head>

<body>
    <header>
        <nav class="navbar navbar-inverse navbar-static-top navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#search"
                            aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#" id="collapse-sidebar" class="navbar-brand"><i class="fa fa-fw fa-angle-double-left"></i>
                    </a>
                    <a href="#" class="navbar-brand">Careerfly</a>
                </div>

                <div class="collapse navbar-collapse" id="search">
                    <ul class="nav navbar-nav pull-right">
                        <li>
                            <g:form class="navbar-form navbar-right" method="get" controller="discuss" action="search">
                                <div class="row">
                                    <div class="form-group col-sm-10 col-md-10">
                                        <div class="input-group col-md-12">
                                            <input type="search" class="search-query form-control" placeholder="Search"
                                                   name="searchBox"/>
                                            <span class="input-group-btn">
                                                <button class="btn btn-danger search" type="button">
                                                    <i class="fa fa-search" aria-hidden="true"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="col-sm-1 text-center pull-right">
                                        <g:link controller="discuss" action="create">
                                            <i class="fa fa-plus-square-o fa-3x" aria-hidden="true"
                                               title="Create New Discussion"></i>
                                        </g:link>

                                    </div>
                                </div>
                            </g:form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div id="wrapper">

        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="dummy">

                </li>
                <li>
                    <asset:image src="dp.png" class="img-circle" height="80px"/>
                </li>
                <li>
                    <g:link controller="home" action="index">
                        <i class="fa fa-fw fa-home" aria-hidden="true" title="Home"></i> <span class="text">Home</span>
                    </g:link>
                </li>
                <li>
                    <g:link controller="profile" action="index">
                        <i class="fa fa-fw fa-user" aria-hidden="true" title="Profile"></i> <span class="text">Profile
                    </span>
                    </g:link>
                </li>
                <li>
                    <g:link controller="question" action="index">
                        <i class="fa fa-fw fa-book" aria-hidden="true" title="Interview"></i> <span class="text">
                        Interview</span>
                    </g:link>
                </li>
                <li>
                    <g:link controller="discuss" action="index">
                        <i class="fa fa-fw fa-comment" aria-hidden="true" title="Discussion"></i> <span class="text">
                        Discussion</span>
                    </g:link>
                </li>
                <li>
                    <g:link controller="settings" action="index">
                        <i class="fa fa-fw fa-cog" aria-hidden="true" title="Settings"></i> <span class="text">Settings
                    </span>
                    </g:link>
                </li>
                <li>
                    <g:link controller="Signout" action="index">
                        <i class="fa fa-sign-out" aria-hidden="true"></i> <span class="text">Sign Out</span>
                    </g:link>
                </li>
            </ul>
        </div>

        <div id="page-content-wrapper">
            <div class="page-header">
                <g:pageProperty name="page.heading"/>
            </div>

            <div id="body">
                <g:pageProperty name="page.body"/>
            </div>
        </div>
    </div>

    <script>
        $("#collapse-sidebar").on("click", function () {
            $('body').toggleClass("sidebar-collapsed");
            $(this).find(".fa").toggleClass("fa-angle-double-left fa-angle-double-right");
        });
    </script>

</body>
</html>