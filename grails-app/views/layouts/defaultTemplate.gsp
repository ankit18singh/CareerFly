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
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <asset:stylesheet src="font-awesome.min.css"/>
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
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp; Home
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;Profile</a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-book" aria-hidden="true"></i>&nbsp;&nbsp;Interview</a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-comment" aria-hidden="true"></i>&nbsp;&nbsp;Discussion</a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-cog" aria-hidden="true"></i>&nbsp;&nbsp;Settings</a>
            </li>
        </ul>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="container-fluid">
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">+</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>
</html>