<%-- 
    Document   : menu
    Created on : Jan 26, 2021, 8:16:06 PM
    Author     : HL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Start sidebar-wrapper-->
<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
    <div class="brand-logo">
        <a href="index.jsp">
            <!--<img src="assets/images/logo-icon.png" class="logo-icon" alt="logo icon">-->
            <h5 class="logo-text">Quiz Online</h5>
        </a>
    </div>
    <ul class="sidebar-menu do-nicescrol" id="sb-menu">

        <!--        <li class="sidebar-header">Admin</li>
                <li><a href="searchQuestion.jsp"><i class="icon-arrow-right"></i> <span>Question</span></a></li>
                <li><a href="createQuestion.jsp"><i class="icon-arrow-right"></i> <span>Create Question</span></a></li>-->

        <!--        <li class="sidebar-header">Student</li>
                <li><a href="<li class="sidebar-header">Student</li>student.jsp"><i class="icon-arrow-right"></i><span>Subject</span></a></li>
                <li><a href="#"><i class="icon-arrow-right"></i><span>Take A Quiz</span></a></li>
                <li><a href="history.jsp"><i class="icon-arrow-right"></i> <span>History</span></a></li>-->
      
    </ul>
    <script>
        var user = sessionStorage.getItem('USER');
        var data = JSON.parse(user);


        if (data.role === 'admin') {
            document.getElementById('sb-menu').innerHTML = '<li class="sidebar-header">Admin</li><li><a href="searchQuestion.jsp"><i class="icon-arrow-right"></i> <span>Question</span></a></li><li><a href="createQuestion.jsp"><i class="icon-arrow-right"></i> <span>Create Question</span></a></li>';
        } else {
            document.getElementById('sb-menu').innerHTML = '<li class="sidebar-header">Student</li><li><a href="student.jsp"><i class="icon-arrow-right"></i> <span>Take A Quiz</span></a></li><li><a href="history.jsp"><i class="icon-arrow-right"></i> <span>History</span></a></li>';
        }
    </script>
</div>
<!--End sidebar-wrapper-->