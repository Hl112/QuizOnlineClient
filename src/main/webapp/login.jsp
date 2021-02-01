<%-- 
    Document   : login
    Created on : Jan 27, 2021, 4:37:07 AM
    Author     : HL
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Quiz Online</title>
        <c:import url="header.jsp"/>
    </head>
    <body class="bg-theme bg-theme1">

        <!-- start loader -->
        <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
        <!-- end loader -->

        <!-- Start wrapper-->
        <div id="wrapper">

            <div class="loader-wrapper"><div class="lds-ring"><div></div><div></div><div></div><div></div></div></div>
            <div class="card card-authentication1 mx-auto my-5">
                <div class="card-body">
                    <div class="card-content p-2">
                        <!--                        <div class="text-center">
                                                    <img src="assets/images/logo-icon.png" alt="logo icon">
                                                </div>-->
                        <div class="card-title text-uppercase text-center py-3">Sign In</div>
                        <div id="noti"></div>
                        ${sessionScope.USER}
                        <form action="">
                            <div class="form-group">
                                <label for="exampleInputUsername" class="sr-only">Username</label>
                                <div class="position-relative has-icon-right">
                                    <input type="text" id="username" class="form-control input-shadow" placeholder="Enter Username" name="username" required="">
                                    <div class="form-control-position">
                                        <i class="icon-user"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword" class="sr-only">Password</label>
                                <div class="position-relative has-icon-right">
                                    <input type="password" id="password" class="form-control input-shadow" placeholder="Enter Password" name="password" required="">
                                    <div class="form-control-position">
                                        <i class="icon-lock"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-6">
                                    <div class="icheck-material-white">
                                        <input type="checkbox" id="user-checkbox" checked="" name="remember" />
                                        <label for="user-checkbox">Remember me</label>
                                    </div>
                                </div>

                            </div>
                            <button type="button" class="btn btn-light btn-block" onclick="login();" onsubmit="false">Sign In</button>

                           
                        </form>

                    </div>
                </div>
                <div class="card-footer text-center py-3">
                    <p class="text-warning mb-0">Do not have an account? <a href="signUp.jsp"> Sign Up here</a></p>
                </div>
            </div>


        </div><!--wrapper-->



    </body>
    <c:import url="footer.jsp"/>
    <script>
 
    </script>
</html>
