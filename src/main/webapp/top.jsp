<%-- 
    Document   : top
    Created on : Jan 26, 2021, 8:15:04 PM
    Author     : HL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Start topbar header-->
<header class="topbar-nav">
    <nav class="navbar navbar-expand fixed-top">
        <ul class="navbar-nav mr-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link toggle-menu" href="javascript:void();">
                    <i class="icon-menu menu-icon"></i>
                </a>
            </li>
            <div id='noti'></div>
            <!--            <li class="nav-item">
                            <form class="search-bar">
                                <input type="text" class="form-control" placeholder="Enter keywords">
                                <a href="javascript:void();"><i class="icon-magnifier"></i></a>
                            </form>
                        </li>-->
        </ul>

        <ul class="navbar-nav align-items-center righ t-nav-link top-nav">
            <i class="zmdi zmdi-account-o mr-2"></i><li class="dropdown-item" id="u-fullname"> Admin</li>
            <li class="dropdown-item logout" onclick="sessionStorage.clear();location.replace('login.jsp');"><i class="icon-power mr-2"></i> Logout</li>
        </ul>
    </nav>
</header>
<!--End topbar header-->
<script>

    var user = sessionStorage.getItem('USER');
    if (user === null) {
        location.replace('login.jsp');
    }
    var data = JSON.parse(user);
    document.getElementById('u-fullname').innerHTML = data.fullname;
</script>
<div class="clearfix"></div>
