<%-- 
    Document   : createQuestion
    Created on : Jan 27, 2021, 1:58:17 AM
    Author     : HL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Question - Quiz Online</title>
        <c:import url="header.jsp"/>
        <c:import url="menu.jsp"/>
        <c:import url="top.jsp"/>
        <script>
            if (data.role !== 'admin') {
                window.location.replace('student.jsp');
            }
        </script>
    </head>
    <body>
        <div class="content-wrapper">
            <div class="container-fluid">

                <div class="row mt-3">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">Fill Information Question</div>
                                <hr>
                                <form>
                                    <div class="form-group">
                                        <label for="input-1">Subject</label>
                                        <select name="subject" class="form-control" id="input-1">
                                            <option value="PRJ311">Java Desktop</option>
                                            <option value="PRJ321">Java Web</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="input-2">Question</label>
                                        <input type="text" class="form-control" id="input-2" name="question" placeholder="Enter Your Question" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="input-3">Create Date</label>
                                        <input type="text" class="form-control" id="input-3" value="22-11-2021" readonly="">
                                        <script>$('#input-3').val(new Date().toLocaleDateString());</script>
                                    </div>
                                    <!--                                    <div class="form-group form-control-file">
                                                                            <label for="input-4">Image</label>
                                                                            <input type="file" class="form-control" id="input-4" >
                                                                        </div>-->
                                    <div class="form-group">
                                        <label for="input-5">Description</label>
                                        <input type="text" class="form-control" id="input-5" placeholder="Enter Your Description">
                                    </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">Fill Answer Of Question</div>
                                <hr>
                                <div class="form-group">
                                    <label for="input-6">Answer 1</label>
                                    <input type="text" class="form-control form-control-rounded" id="input-6" placeholder="Enter Your Answer 1" required="">
                                </div>
                                <div class="icheck-material-white">
                                    <input id="user-radiobox1" type="radio" name="correct" value="1" checked="">
                                    <label for="user-radiobox1">Is Correct</label>
                                </div>
                                <div class="form-group">
                                    <label for="input-7">Answer 2</label>
                                    <input type="text" class="form-control form-control-rounded" id="input-7" placeholder="Enter Your Answer 2" required="">
                                </div>
                                <div class="icheck-material-white">
                                    <input id="user-radiobox2" type="radio" name="correct" value="2">
                                    <label for="user-radiobox2">Is Correct</label>
                                </div>
                                <div class="form-group">
                                    <label for="input-8">Answer 3</label>
                                    <input type="text" class="form-control form-control-rounded" id="input-8" placeholder="Enter Your Answer 3" required="">
                                </div>
                                <div class="icheck-material-white">
                                    <input id="user-radiobox3" type="radio" name="correct" value="3">
                                    <label for="user-radiobox3">Is Correct</label>
                                </div>
                                <div class="form-group">
                                    <label for="input-9">Answer 4</label>
                                    <input type="text" class="form-control form-control-rounded" id="input-9" placeholder="Enter Your Answer 4" required="">
                                </div>
                                <div class="icheck-material-white">
                                    <input id="user-radiobox4" type="radio" name="correct" value="4">
                                    <label for="user-radiobox4">Is Correct</label>
                                </div>
                                <div class="form-group">
                                    <button type="button" onclick="addQuestion();" class="btn btn-light btn-round px-5"><i class="icon-check"></i> Add Question</button>
                                    <button type="reset"  class="btn btn-light btn-round px-5" id="reset"><i class="icon-check"></i> Reset</button>
                                </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div><!--End Row-->

                <!--start overlay-->
                <div class="overlay toggle-menu"></div>
                <!--end overlay-->

            </div>
            <!-- End container-fluid-->

        </div>
    </body>
    <c:import url="footer.jsp"/>
</html>
