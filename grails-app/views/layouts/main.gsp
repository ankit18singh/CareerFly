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
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <g:layoutHead/>
</head>

<body>


<div id="wrapper">

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a href="#" id="collapse-sidebar"><i class="fa fa-fw fa-angle-double-left"></i></a>
            </li>
            <li class="text">
                <asset:image src="dp.png" class="img-circle" height="80px"/>
            </li>
            <li>
                <g:link controller="home" action="index">
                    <i class="fa fa-fw fa-home" aria-hidden="true"></i><span class="text">Home</span>
                </g:link>
            </li>
            <li>
                <g:link controller="profile" action="index">
                    <i class="fa fa-fw fa-user" aria-hidden="true"></i><span class="text">Profile</span></g:link>
            </li>
            <li>
                <g:link controller="question" action="index">
                    <i class="fa fa-fw fa-book" aria-hidden="true"></i><span class="text">Interview</span></g:link>
            </li>
            <li>
                <g:link controller="discuss" action="index">
                    <i class="fa fa-fw fa-comment" aria-hidden="true"></i><span class="text">Discussion</span></g:link>
            </li>
            <li>
                <g:link controller="settings" action="index">
                    <i class="fa fa-fw fa-cog" aria-hidden="true"></i><span class="text">Settings</span></g:link>
            </li>
        </ul>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
                    <div class="container-fluid">
                        <div id="body">
                            <g:pageProperty name="page.body"/>
                        </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<script>


    $("#collapse-sidebar").on("click", function() {
        $('body').toggleClass("sidebar-collapsed");
        $(this).find(".fa").toggleClass("fa-angle-double-left fa-angle-double-right");
       // $(this).toggleClass("text-right text-center")
    });

</script>

</body>
</html>