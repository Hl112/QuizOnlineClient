<%-- 
    Document   : history
    Created on : Jan 27, 2021, 4:06:41 AM
    Author     : HL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History - Quiz Online</title>
        <c:import url="header.jsp"/>
        <c:import url="menu.jsp"/>
        <c:import url="top.jsp"/>
        <script>
            var list = [];
            var settings = {
                "url": "http://localhost:8088/QuizOnline/rest/result",
                "method": "GET",
                "timeout": 0
            };
            $.ajaxSetup({async: false});
            $.ajax(settings).done(function (response) {
                for (var item of response) {
                    list.push(item);
                }
            });



        </script>
    </head>
    <body>
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="card mt-2">
                    <div class="card-content">
                        <div class="row row-group m-0 pb-0">
                            <div class="col-12 col-lg-6 col-xl-3 border-light ">
                                <div class="card-body">
                                    <select name="subject" class="form-control" id="input-1">
                                        <option value="">Search by Subject</option>
                                        <option value="PRJ311">Java Desktop</option>
                                        <option value="PRJ321">Java Web</option>
                                    </select>        </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-3 border-light">
                                <div class="card-body">
                                    <input type="text" class="form-control" id="input-2" name="question" placeholder="Cái này đề không rõ" disabled="">
                                </div>
                            </div>

                            <div class="col-12 col-lg-6 col-xl-1 border-light">
                                <div class="card-body">
                                    <div class="form-group">
                                        <button type="button" class="btn btn-light px-5" onclick="searchHistory(list);"><i class="icon-magnifier"></i>Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  

                <div class="row">
                    <div class="col-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">History
                            </div>
                            <div class="table-responsive">
                                <table class="table align-items-center table-flush table-borderless">
                                    <thead>
                                        <tr>
                                            <th>Subject Code</th>
                                            <th>Subject Name</th>
                                            <th>Score</th>
                                            <th>Take Date</th>
                                        </tr>
                                    </thead>
                                    <tbody id="content" class="list-wrapper">
                                        <tr>
                                            <td>PRJ321</td>
                                            <td>JAVA Web</td>
                                            <td>9.5</td>
                                            <td>20-02-2010</td>
                                        </tr>
                                        <tr>
                                            <td>PRJ321</td>
                                            <td>JAVA Web</td>
                                            <td>9.5</td>
                                            <td>20-02-2010</td>
                                        </tr>
                                        <tr>
                                            <td>PRJ321</td>
                                            <td>JAVA Web</td>
                                            <td>9.5</td>
                                            <td>20-02-2010</td>
                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div><!--End Row-->
                <div class="col-md-12" id="paging">
                    <div id="pagination-container"></div>
                </div>
                <!--End Dashboard Content-->

                <!--start overlay-->
                <div class="overlay toggle-menu"></div>
                <!--end overlay-->

            </div>
            <!-- End container-fluid-->

        </div>
    </body>

    <c:import url="footer.jsp"/>
    <script>
        loadHistoryList(list);
    </script>
</html>
