<%-- 
    Document   : student
    Created on : Jan 26, 2021, 11:36:45 PM
    Author     : HL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student - Quiz Online</title>
        <c:import url="header.jsp"/>
        <c:import url="menu.jsp"/>
        <c:import url="top.jsp"/>
       
    </head>
    <body>
     
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-6 col-xl-6">
                        <div class="card">
                            <div class="card-header">Subject #1</div>
                            <div class="card-body">
                                <ul class="list-inline">
                                   <i class="fa fa-circle mr-2 text-white"></i> <li class="list-inline-item subject-code">Subject Code:</li>
                                </ul>
                                <ul class="list-inline">
                                   <i class="fa fa-circle mr-2 text-white"></i> <li class="list-inline-item subject-name">Subject Name:</li>
                                </ul>
                            </div>
                            <div class="row m-0 row-group text-center border-top border-light-3">
                                <div class="col-12 col-lg-12">
                                    <div class="p-3 border-top">
                                        <h5 class="mb-0 n-question">60</h5>
                                        <small class="mb-0">Number of Question</small>
                                    </div>
                                    <div class="p-3 border-top">
                                        <h5 class="mb-0 t-question">60 Minutes</h5>
                                        <small class="mb-0">For one Quiz</small>
                                    </div>
                                    <div class="p-3 border-top">
                                        <h5 class="mb-0">Description</h5>
                                        <small class="mb-0 d-question">Quiz about course Java Desktop</small>
                                    </div>
                                    <div class="p-3 border-top">
                                        
                                        <a href="#" class="btn btn-light px-5 quiz-link"><i class="zmdi zmdi-assignment-check"></i> Take a Quiz</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6 col-xl-6">
                        <div class="card">
                            <div class="card-header">Subject #2</div>
                            <div class="card-body">
                                <ul class="list-inline">
                                    <i class="fa fa-circle mr-2 text-white"></i><li class="list-inline-item subject-code">Subject Name: Java Desktop</li>
                                </ul>
                                <ul class="list-inline">
                                    <i class="fa fa-circle mr-2 text-white"></i><li class="list-inline-item subject-name">Subject Name: Java Desktop</li>
                                </ul>
                            </div>
                            <div class="row m-0 row-group text-center border-top border-light-3">
                                <div class="col-12 col-lg-12">
                                    <div class="p-3 border-top">
                                        <h5 class="mb-0 n-question">60</h5>
                                        <small class="mb-0">Number of Question</small>
                                    </div>
                                    <div class="p-3 border-top">
                                        <h5 class="mb-0 t-question">60 Minutes</h5>
                                        <small class="mb-0">For one Quiz</small>
                                    </div>
                                    <div class="p-3 border-top">
                                        <h5 class="mb-0">Description</h5>
                                        <small class="mb-0 d-question">Quiz about course Java Desktop</small>
                                    </div>
                                    <div class="p-3 border-top">
                                       <a href="#" class="btn btn-light px-5 quiz-link"><i class="zmdi zmdi-assignment-check"></i> Take a Quiz</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                </div>

            </div>
        </div>
    </body>
    <c:import url="footer.jsp"/>
       <script>
  $.get("${applicationScope.ENDPOINT}/subject", function(data, status){
   for(var i = 0; i<data.length ; i++){ 
       document.getElementsByClassName('subject-code')[i].innerHTML = 'Subject Code: ' + data[i].subjectCode;
       document.getElementsByClassName('subject-name')[i].innerHTML = 'Subject Name: ' + data[i].subjectName;
       document.getElementsByClassName('n-question')[i].innerHTML = data[i].question;
       document.getElementsByClassName('t-question')[i].innerHTML =   data[i].time + ' Minutes';
       document.getElementsByClassName('d-question')[i].innerHTML =   'Quiz about ' + data[i].subjectName;
       document.getElementsByClassName('quiz-link')[i].href =   'quizNow.jsp?subject=' + data[i].subjectCode;
  }});      
        </script>
</html>
