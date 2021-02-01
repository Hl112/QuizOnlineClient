<%-- 
    Document   : signUp
    Created on : Jan 27, 2021, 4:28:27 AM
    Author     : HL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up - Quiz Online</title>
    <c:import url="header.jsp"/>
    </head>

<body class="bg-theme bg-theme1">

<!-- start loader -->
   <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
   <!-- end loader -->

<!-- Start wrapper-->
 <div id="wrapper">

	<div class="card card-authentication1 mx-auto my-4">
		<div class="card-body">
		 <div class="card-content p-2">
		 	
		  <div class="card-title text-uppercase text-center py-3">Sign Up</div>
                  <div id="noti"></div>
		    <form>
			  <div class="form-group">
			  <label for="fullname" class="sr-only">Name</label>
			   <div class="position-relative has-icon-right">
				  <input type="text" id="fullname" class="form-control input-shadow" placeholder="Enter Your Name">
				  <div class="form-control-position">
					  <i class="icon-user"></i>
				  </div>
			   </div>
			  </div>
			  <div class="form-group">
			  <label for="email" class="sr-only">Email ID</label>
			   <div class="position-relative has-icon-right">
				  <input type="text" id="email" class="form-control input-shadow" placeholder="Enter Your Email ID">
				  <div class="form-control-position">
					  <i class="icon-envelope-open"></i>
				  </div>
			   </div>
			  </div>
			  <div class="form-group">
			   <label for="password" class="sr-only">Password</label>
			   <div class="position-relative has-icon-right">
				  <input type="password" id="password" class="form-control input-shadow" placeholder="Choose Password">
				  <div class="form-control-position">
					  <i class="icon-lock"></i>
				  </div>
			   </div>
			  </div>
			  
			
			  
                        <button type="button" onclick="signUp();" class="btn btn-light btn-block waves-effect waves-light">Sign Up</button>
			  
			
			 </form>
		   </div>
		  </div>
		  <div class="card-footer text-center py-3">
		    <p class="text-warning mb-0">Already have an account? <a href="login.jsp"> Sign In here</a></p>
		  </div>
	     </div>
    
     <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
	
	</div><!--wrapper-->


    </body>
    <c:import url="footer.jsp"/>
</html>
