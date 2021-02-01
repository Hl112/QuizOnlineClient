<%-- 
    Document   : quizNow
    Created on : Jan 30, 2021, 4:14:52 AM
    Author     : HL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
        <c:import url="header.jsp"/>
        <c:import url="menu.jsp"/>
        <c:import url="top.jsp"/>
        <script>
            $("#wrapper").toggleClass("toggled");
            var url = new URL(window.location.href);
            var subject = url.searchParams.get("subject");

            if (subject === null) {
                location.replace('student.jsp');
            }
            var time = 0;
            var timeS = 0;
            var numOfQuestion = 0;
            var submited = false;
            var clearQues = [];
            $.ajaxSetup({async: false});
            $.get("${applicationScope.ENDPOINT}/subject/" + subject, function (data, status) {
                time = data.time * 60;
                timeS = data.time * 60;
                numOfQuestion = data.question;
            });

            var question = JSON.parse(sessionStorage.getItem("Question" + subject));
            var totalQues = 0;
            if (question === null) {
                question = [];
                if (time !== 0 && numOfQuestion !== 0) {
                    var settings = {
                        "url": "http://localhost:8088/QuizOnline/rest/question/quiz/" + subject + "/" + numOfQuestion,
                        "method": "GET",
                        "timeout": 0,
                        "async": false
                    };

                    $.ajax(settings).done(function (response) {
                        totalQues = response.length;
                        for (var q of response) {
                            var ques = {};
                            ques.id = q.id;
                            ques.question = q.question;
                            $.ajaxSetup({async: false});
                            $.get("http://localhost:8088/QuizOnline/rest/answer/QID/" + q.id, function (data, status) {
                                if (status === 'success') {
                                    ques.ans = data;
                                }
                            });
                            question.push(ques);
                        }
                    });
                }

                sessionStorage.setItem("Question" + subject, JSON.stringify(question));
                sessionStorage.setItem("time" + subject, time);
                sessionStorage.setItem("totalQ" + subject, totalQues);
            } else {
                timeS = sessionStorage.getItem('time' + subject);
                totalQues = sessionStorage.getItem('totalQ' + subject);

            }
            clearQues = JSON.parse(sessionStorage.getItem("user" + subject));
            console.log(clearQues);
            if (clearQues === null) {
                clearQues = [];
                for (var q of question) {
                    clearQues.push(q);
                }
                for (var q of clearQues) {
                    for (var a of q.ans) {
                        a.isRight = false;
                    }
                }
                sessionStorage.setItem("user" + subject, JSON.stringify(clearQues));
            }
            function generate_quiz(arr, timeS, time) {
                var html = '';
                for (var i = 0; i < arr.length; i++) {
                    html += ' <div class="card list-item">' +
                            '<div class="card-header">Question ' + (i) + '</div>' +
                            '<div class="card-body">' +
                            '<div class="chart-container-7">' + arr[i].question +
                            '</div></div>' +
                            '<div class="table-responsive">' +
                            ' <table class="table align-items-center">' +
                            ' <tbody>';
                    html += '<tr><td><div class="icheck-material-white">' +
                            '<input id="ans' + arr[i].ans[0].id + '-question' + arr[i].id + '" type="radio" onclick="saveAns(this,clearQues, subject);" name="question' + i + '" value="1">' +
                            '<label for="ans' + arr[i].ans[0].id + '-question' + arr[i].id + '">A. ' + arr[i].ans[0].answer + '</label></div></td></tr>';
                    html += '<tr><td><div class="icheck-material-white">' +
                            '<input id="ans' + arr[i].ans[1].id + '-question' + arr[i].id + '" type="radio" onclick="saveAns(this,clearQues, subject);" name="question' + i + '" value="1">' +
                            '<label for="ans' + arr[i].ans[1].id + '-question' + arr[i].id + '">B. ' + arr[i].ans[1].answer + '</label></div></td></tr>';
                    html += '<tr><td><div class="icheck-material-white">' +
                            '<input id="ans' + arr[i].ans[2].id + '-question' + arr[i].id + '" type="radio" onclick="saveAns(this,clearQues, subject);" name="question' + i + '" value="1">' +
                            '<label for="ans' + arr[i].ans[2].id + '-question' + arr[i].id + '">C. ' + arr[i].ans[2].answer + '</label></div></td></tr>';
                    html += '<tr><td><div class="icheck-material-white">' +
                            '<input id="ans' + arr[i].ans[3].id + '-question' + arr[i].id + '" type="radio" onclick="saveAns(this,clearQues, subject);" name="question' + i + '" value="1">' +
                            '<label for="ans' + arr[i].ans[3].id + '-question' + arr[i].id + '">D. ' + arr[i].ans[3].answer + '</label></div></td></tr>';
                    html += '</tbody></table></div></div>';
                }
                $('#quiz').html(html);
                checkedAns(arr);
                progress(timeS, time, $('#progressBar'));
            }

        </script>
    </head>
    <body>

        <div class="content-wrapper">
            <div class="container-fluid">
                <div id="progressBar">
                    <div class="bar"></div>
                </div>
                <div class="col-12 col-lg-12 col-xl-12 list-wrapper" id="quiz">

                </div>
                <div class="col-md-12" id="paging">
                    <div id="pagination-container"></div>
                </div>
                <div class="form-group">
                    <a href="#" data-toggle="modal" id="submit1" data-target="#basicModal" class="btn btn-danger">Submit</a>
                    <!-- Modal Confirm -->
                    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title text-info" id="myModalLabel">Submit Confirm</h4>

                                </div>
                                <div class="modal-body">
                                    <h3 class="text-danger result-quiz">Sumbit quiz ?</h3>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger load-modal" id="btnSubmit" onclick="submitQuiz(question, totalQues, subject, data.username);">SUBMIT</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal" id="btnClose">Close</button>
                                    <a href="student.jsp" type="button" class="btn btn-primary" id="takenew" >Take A New Quiz</a>
                                    <a href="history.jsp" type="button" class="btn btn-info" id="history">View History</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp"/>
        <script>


            generate_quiz(clearQues, timeS, time);

            $('#takenew').hide();
            $('#history').hide();
            paging(1);
            function progress(timeleft, timetotal, $element) {
                var progressBarWidth = timeleft * $element.width() / timetotal;
                $element.find('div').animate({width: progressBarWidth}, 500).html(Math.floor(timeleft / 60) + ":" + timeleft % 60);
                $('#noti').attr('class', 'btn btn-success').text(Math.floor(timeleft / 60) + " Minutes : " + timeleft % 60 + " Seconds");
                if (timeleft > 0) {
                    setTimeout(function () {
                        sessionStorage.setItem("time" + subject, timeleft - 1);
                        progress(timeleft - 1, timetotal, $element);
                    }, 1000);
                } else {
                    if (!submited) {
                        $('#noti').attr('class', 'btn btn-danger').text("Time Out");
                        $('#submit1').click();
                        $('#btnSubmit').click();
                    }
                }
            }
            ;

            //  progress(600, 600, $('#progressBar'));

        </script>
    </body>
</html>
