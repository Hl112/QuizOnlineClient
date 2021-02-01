
$(function () {
    "use strict";
//sidebar menu js
    $.sidebarMenu($('.sidebar-menu'));

// === toggle-menu js
    $(".toggle-menu").on("click", function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

// === sidebar menu activation js

    $(function () {
        for (var i = window.location, o = $(".sidebar-menu a").filter(function () {
            return this.href === i;
        }).addClass("active").parent().addClass("active"); ; ) {
            if (!o.is("li"))
                break;
            o = o.parent().addClass("in").parent().addClass("active");
        }
    }),
            /* Top Header */

            $(document).ready(function () {
        $(window).on("scroll", function () {
            if ($(this).scrollTop() > 60) {
                $('.topbar-nav .navbar').addClass('bg-dark');
            } else {
                $('.topbar-nav .navbar').removeClass('bg-dark');
            }
        });

    });


    /* Back To Top */

    $(document).ready(function () {
        $(window).on("scroll", function () {
            if ($(this).scrollTop() > 300) {
                $('.back-to-top').fadeIn();
            } else {
                $('.back-to-top').fadeOut();
            }
        });

        $('.back-to-top').on("click", function () {
            $("html, body").animate({scrollTop: 0}, 600);
            return false;
        });
    });


    $(function () {
        $('[data-toggle="popover"]').popover();
    });


    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
});




function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}



function enableUpdate(node) {
    var id = node.id.substring(4);
    var cNameSave = '#btnS' + id;
    var cNameX = '#btnX' + id;
    var ans = '#ans' + id;
    $(ans).removeAttr('readonly');
    $(cNameSave).show();
    $(cNameX).show();
    $('#' + node.id).hide();
}



function loadQuestion(endpoint) {
    $.ajaxSetup({async: false});
    $.get('' + endpoint + '/question', function (data, status) {
        if (status === 'success') {
            var elem = '';

            for (var item of data) {
                console.log(item);
                elem += '<div class="row list-item" id="qes' + item.id + '"><div class="col-12 col-lg-12"><div class="card"><div class="card-header">Question:';
                elem += '<input type="text" id="QES' + item.id + '" class="form-control" style="display: inline;width: 65%;" value="' + item.question + '" readonly="">';
                elem += '<div class="card-action"><div class="dropdown">' +
                        '<button type="submit" class="btn btn-info" id="btnQE' + item.id + '" onclick="eUpdateQ(this);"><i class="icon-drawer"></i>Edit</button>' +
                        '<button type="button" class="btn btn-primary btn-save" id="btnQS' + item.id + '" onclick="saveQ(this);"><i class="icon-check"></i>Save</button>' +
                        '<button type="button" class="btn btn-danger btn-x" id="btnQX' + item.id + '" onclick="xUpdate(' + item.id + ');"><i class="icon-action-undo"></i>  </button></td></tr>';
                if (item.status)
                {
                    elem += '<button type="submit" id="btnDC' + item.id + '" class="btn btn-danger" data-toggle="modal" data-target="#basicModal' + item.id + '"><i class="icon-trash"></i>Delete</button>';
                } else {
                    elem += '<button type="submit" id="btnDC' + item.id + '" class="btn btn-danger" onclick="active(' + item.id + ');" ><i class="icon-trash"></i>Active</button>';

                }


                elem += '<div class="modal fade" id="basicModal' + item.id + '" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">' +
                        '<div class="modal-dialog"><div class="modal-content"><div class="modal-header">' +
                        '<h4 class="modal-title text-danger" id="myModalLabel">Delete Confirm</h4>' +
                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
                        '<span aria-hidden="true">&times;</span></button></div><div class="modal-body"><h3 class="text-danger">Delete selected question?</h3>' +
                        '</div><div class="modal-footer"><button type="button"  value="Delete" onclick="deleteQ(' + item.id + ');" class="btn btn-danger load-modal" id="btnD' + item.id + '" data-dismiss="modal">Delete</button>' +
                        '<button type="button" class="btn btn-default close" data-dismiss="modal">Close</button></div></div></div></div>' +
                        '</div></div></div>';
                elem += '<div class="table-borderless">' +
                        '<table class="table align-items-center table-flush table-borderless">' +
                        '<thead><tr><th>Answer | Create at: ' + new Date(item.createDate).toLocaleDateString() + ' - SUBJECT: ' + item.subjectCode.subjectName + '</th><th>Is Right</th><th>Action</th></tr></thead><tbody>';
                $.ajaxSetup({async: false});
                $.get(endpoint + "/answer/QID/" + item.id, function (data, status) {
                    if (status === 'success') {
                        for (var ans of data) {
                            var correct = '';
                            if (ans.isRight)
                                correct = 'checked';
                            elem += '<tr><td><input type="text" class="form-control"  value="' + ans.answer + '" id="ans' + ans.id + '" readonly=""></td>' +
                                    '<td><div class="icheck-material-white"><input id="user-radiobox' + ans.id + '" type="radio" name="c' + item.id + '" value="1" ' + correct + '>' +
                                    '<label for="user-radiobox' + ans.id + '"></label></div></td><td>' +
                                    '<button type="button" class="btn btn-info" id="btnE' + ans.id + '" onclick="enableUpdate(this);"><i class="icon-drawer"></i>Edit</button>' +
                                    '<button type="button" class="btn btn-primary btn-save" id="btnS' + ans.id + '" onclick="save(this);"><i class="icon-check"></i>Save</button>' +
                                    '<button type="button" class="btn btn-danger btn-x" id="btnX' + ans.id + '" onclick="xUpdate(' + item.id + ');"><i class="icon-action-undo"></i>  </button></td></tr>';
                        }
                    }
                });
                elem += '</tbody></table></div></div></div></div>';

            }
            $('#load-question').html(elem);
            paging(20);

        }
    }
    );
    $('.btn-save').hide();
    $('.btn-x').hide();
}


function showNoti(msg, status) {
    $('#noti').attr('class', 'btn');
    if (status === 1)
        $('#noti').attr('class', 'btn btn-success');
    if (status === 0)
        $('#noti').attr('class', 'btn btn-danger');
    $('#noti').text(msg);
    setTimeout(function () {
        $('#noti').text('');
        $('#noti').removeAttr('class');
    }, 3000);
}

function save(node) {
    var id = node.id.substring(4);
    var answer = $('#ans' + id).val();
    if (answer.trim() === '') {
        showNoti('Answer is not Empty', 0);
        return;
    }
    var check = $('#user-radiobox' + id).is(':checked');
    var pcheck = check === true ? true : true;
    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/answer/" + id,
        "method": "PUT",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({"answer": answer, "isRight": pcheck})
    };

    $.ajax(settings).done(function (response, status) {

        if (status === 'nocontent') {
            showNoti("Update Answer Successfully", 1);
            $('#btnX' + id).click();
        } else {
            showNoti("Update Answer Fail", 0);
        }
    });
}

function deleteQ(id) {
    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/question/" + id,
        "method": "DELETE",
        "timeout": 0
    };

    $.ajax(settings).done(function (response, status) {
        if (status === 'nocontent') {
            showNoti("Delete Question Successfully", 1);
            $('#btnQX' + id).click();
        } else {
            showNoti("Delete Question Fail", 0);
        }
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    });
}
function eUpdateQ(node) {
    var id = node.id.substring(5);
    var cNameSave = '#btnQS' + id;
    var cNameX = '#btnQX' + id;
    var qes = '#QES' + id;

    $(qes).removeAttr('readonly');
    $(cNameSave).show();
    $(cNameX).show();
    $('#' + node.id).hide();
}


function saveQ(node) {
    var id = node.id.substring(5);
    var question = $('#QES' + id).val();
    if (question.trim() === '') {
        showNoti('Question is not Empty', 0);
        return;
    }
    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/question/" + id,
        "method": "PUT",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({"question": question})
    };

    $.ajax(settings).done(function (response, status) {
        if (status === 'nocontent') {
            showNoti("Update Question Successfully", 1);
            $('#btnQX' + id).click();
        } else {
            showNoti("Update Question Fail", 0);
        }
    });
}

//Paging

// End Paging

function paging(num) {
    var items = $(".list-wrapper .list-item");
    var numItems = items.length;
    var perPage = num;
    $(".list-wrapper .list-item").show();
    items.slice(perPage).hide();
    $('#pagination-container').pagination({
        items: numItems,
        itemsOnPage: perPage,
        prevText: "&laquo;",
        nextText: "&raquo;",
        onPageClick: function (pageNumber) {
            var showFrom = perPage * (pageNumber - 1);
            var showTo = showFrom + perPage;
            items.hide().slice(showFrom, showTo).show();
        }
    });

}

function  search() {
    var subject = $('#subject').val();
    var searchValue = $('#searchValue').val();
    var status = $('#status').val();
    if (searchValue === '') {
        searchValue = 'none';
    }

    $.ajaxSetup({async: false});
    $.get('http://localhost:8088/QuizOnline/rest/question/search/' + subject + "/" + searchValue + '/' + status, function (data, status) {
        if (status === 'success') {
            var elem = '';

            for (var item of data) {
                elem += '<div class="row list-item" id="qes' + item.id + '"><div class="col-12 col-lg-12"><div class="card"><div class="card-header">Question:';
                elem += '<input type="text" id="QES' + item.id + '" class="form-control" style="display: inline;width: 65%;" value="' + item.question + '" readonly="">';
                elem += '<div class="card-action"><div class="dropdown">' +
                        '<button type="submit" class="btn btn-info" id="btnQE' + item.id + '" onclick="eUpdateQ(this);"><i class="icon-drawer"></i>Edit</button>' +
                        '<button type="button" class="btn btn-primary btn-save" id="btnQS' + item.id + '" onclick="saveQ(this);"><i class="icon-check"></i>Save</button>' +
                        '<button type="button" class="btn btn-danger btn-x" id="btnQX' + item.id + '" onclick="xUpdate(' + item.id + ');"><i class="icon-action-undo"></i>  </button></td></tr>';
                if (item.status)
                {
                    elem += '<button type="submit" id="btnDC' + item.id + '" class="btn btn-danger" data-toggle="modal" data-target="#basicModal' + item.id + '"><i class="icon-trash"></i>Delete</button>';
                } else {
                    elem += '<button type="submit" id="btnDC' + item.id + '" class="btn btn-danger" onclick="active(' + item.id + ');" ><i class="icon-trash"></i>Active</button>';

                }


                elem += '<div class="modal fade" id="basicModal' + item.id + '" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">' +
                        '<div class="modal-dialog"><div class="modal-content"><div class="modal-header">' +
                        '<h4 class="modal-title text-danger" id="myModalLabel">Delete Confirm</h4>' +
                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
                        '<span aria-hidden="true">&times;</span></button></div><div class="modal-body"><h3 class="text-danger">Delete selected question?</h3>' +
                        '</div><div class="modal-footer"><button type="button"  value="Delete" onclick="deleteQ(' + item.id + ');" class="btn btn-danger load-modal" id="btnD' + item.id + '" data-dismiss="modal">Delete</button>' +
                        '<button type="button" class="btn btn-default close" data-dismiss="modal">Close</button></div></div></div></div>' +
                        '</div></div></div>';
                elem += '<div class="table-borderless">' +
                        '<table class="table align-items-center table-flush table-borderless">' +
                        '<thead><tr><th>Answer | Create at: ' + new Date(item.createDate).toLocaleDateString() + ' - SUBJECT: ' + item.subjectCode.subjectName + '</th><th>Is Right</th><th>Action</th></tr></thead><tbody>';
               $.ajaxSetup({async: false});
                $.get("http://localhost:8088/QuizOnline/rest/answer/QID/" + item.id, function (data, status) {
                    if (status === 'success') {
                        for (var ans of data) {
                            var correct = '';
                            if (ans.isRight)
                                correct = 'checked';
                            elem += '<tr><td><input type="text" class="form-control"  value="' + ans.answer + '" id="ans' + ans.id + '" readonly=""></td>' +
                                    '<td><div class="icheck-material-white"><input id="user-radiobox' + ans.id + '" type="radio" name="c' + item.id + '" value="1" ' + correct + '>' +
                                    '<label for="user-radiobox' + ans.id + '"></label></div></td><td>' +
                                    '<button type="button" class="btn btn-info" id="btnE' + ans.id + '" onclick="enableUpdate(this);"><i class="icon-drawer"></i>Edit</button>' +
                                    '<button type="button" class="btn btn-primary btn-save" id="btnS' + ans.id + '" onclick="save(this);"><i class="icon-check"></i>Save</button>' +
                                    '<button type="button" class="btn btn-danger btn-x" id="btnX' + ans.id + '" onclick="xUpdate(' + item.id + ');"><i class="icon-action-undo"></i>  </button></td></tr>';
                        }
                    }
                });
                elem += '</tbody></table></div></div></div></div>';

            }
            $('#load-question').html(elem);

            paging(20);
        }
    }
    );
    $('.btn-save').hide();
    $('.btn-x').hide();
}

function addQuestion() {
    var subjectCode = $('#input-1').val();
    var question = $('#input-2').val();
    var description = $('#input-5').val();
    var ans1 = $('#input-6').val();
    var ans2 = $('#input-7').val();
    var ans3 = $('#input-8').val();
    var ans4 = $('#input-9').val();
    var check1 = $('#user-radiobox1').is(':checked');
    var check2 = $('#user-radiobox2').is(':checked');
    var check3 = $('#user-radiobox3').is(':checked');
    var check4 = $('#user-radiobox4').is(':checked');
    var correct;
    if (check1)
        correct = 1;
    if (check2)
        correct = 2;
    if (check3)
        correct = 3;
    if (check4)
        correct = 4;
    if (question.trim() === '') {
        showNoti("Question is not empty", 0);
        return;
    }
    if (ans1.trim() === '') {
        showNoti("Answer 1 is not empty", 0);
        return;
    }
    if (ans2.trim() === '') {
        showNoti("Answer 2 is not empty", 0);
        return;
    }
    if (ans3.trim() === '') {
        showNoti("Answer 3 is not empty", 0);
        return;
    }
    if (ans4.trim() === '') {
        showNoti("Answer 4 is not empty", 0);
        return;
    }

    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/question",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({"subjectCode": subjectCode,
            "question": question,
            "description": description,
            "answer": [
                {"answer": ans1, "isRight": check1},
                {"answer": ans2, "isRight": check2},
                {"answer": ans3, "isRight": check3},
                {"answer": ans4, "isRight": check4}
            ]})
    };

    $.ajax(settings).done(function (response, status) {
        if (status === 'nocontent') {
            showNoti("Create Question Successfully", 1);
            $('#reset').click();
        } else {
            showNoti("Create Question Fail", 0);
        }
    });

}


function login() {
//var username = document.getElementById('username');

    var username = $('#username').val();
    var password = $('#password').val();
    var noti = $('#noti');

    noti.html('');
    if (username === '')
    {
        noti.html('<div class="form-group btn btn-danger">Username is not empty</div>');
        return false;
    } else {
        if (password === '') {
            noti.html('<div class="form-group btn btn-danger">Password is not empty</div>');
            return false;
        }
    }
    noti.html('');
    $.get('http://localhost:8088/QuizOnline/rest/users/checkLogin/' + username + '/' + password, function (ketqua, status) {
        if (status === 'success') {
            noti.html('<div class="form-group btn btn-primary">Login Success</div>');
            var check = document.getElementById('user-checkbox');
            var data = JSON.stringify(ketqua);
            if (check) {
                setCookie("USER", username + '-' + password, 2);
            }
            sessionStorage.setItem("USER", data);
            if (ketqua.role === 'student') {
                location.replace('student.jsp');
            } else {
                location.replace('searchQuestion.jsp');
            }
        } else {
            noti.html('<div class="form-group btn btn-danger">Invalid Username or Password</div>');
        }
    });
}

function signUp() {
    var username = $('#email').val();
    var password = $('#password').val();
    var fullname = $('#fullname').val();
    var noti = $('#noti');
    noti.html('');
    if (fullname.trim() === '') {
        noti.html('<div class="form-group btn btn-danger">Fullname is not empty</div>');
        return false;
    }
    if (username.trim() === '')
    {
        noti.html('<div class="form-group btn btn-danger">Email is not empty</div>');
        return false;
    }
    if (!username.trim().match("[@]+"))
    {
        noti.html('<div class="form-group btn btn-danger">Email is wrong</div>');
        return false;
    }
    if (password.trim() === '') {
        noti.html('<div class="form-group btn btn-danger">Password is not empty</div>');
        return false;
    }
    noti.html('');
    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/users",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({"username": username, "password": password, "fullname": fullname})
    };

    $.ajax(settings).done(function (response, status) {
        if (status === 'nocontent') {
            noti.html('<div class="form-group btn btn-success">Create Account Successfully</div>');
            setTimeout(window.location.replace('login.jsp'), 3000);
        } else {
            noti.html('<div class="form-group btn btn-danger">Create Account Fail</div>');
        }
    });
}


function submitQuiz(arr, totalQues, subject, username) {

    var totalCorrect = 0;
    var score;

    for (var q of arr) {
        for (var a of q.ans) {
            if (a.isRight) {
                if ($('#ans' + a.id + '-question' + q.id).is(':checked')) {
                    totalCorrect++;
                }
            }
        }
    }
    score = (totalCorrect * 10) / totalQues;
    $.ajaxSetup({async: false});
    var noti = $('#noti');
    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/result",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({"username": username, "subjectCode": subject, "score": score.toFixed(1)})
    };

    $.ajax(settings).done(function (response, status) {
        if (status === 'nocontent') {
            noti.html('<div class="form-group btn btn-success">Submit Successfully</div>');
            sessionStorage.removeItem("Question" + subject);
            sessionStorage.removeItem("time" + subject);
            sessionStorage.removeItem("totalQ" + subject);
            sessionStorage.removeItem("user" + subject);
        } else {
            noti.html('<div class="form-group btn btn-danger">Submit Fail</div>');
        }
    });

    $('#myModalLabel').text("Result Of Quiz");
    $('.result-quiz').html(' - Subject: ' + subject + '<br> - Total Question: ' + totalQues + '<br> - Correct Answer: ' + totalCorrect + '<br> - Score: ' + score.toFixed(1) + 'đ');
    $('#btnSubmit').hide();
    submited = true;
    $('#btnClose').hide();
    $('#takenew').show();
    $('#history').show();
    $('#basicModal').unbind();
}

function checkedAns(arr) {

    for (var q of arr) {
        for (var a of q.ans) {
            if (a.isRight) {
                $('#ans' + a.id + '-question' + q.id).prop("checked", true); ;
            }
        }
    }
}

function saveAns(node, arr, subject) {
    var newQ = [];
    for (var item of arr) {
        newQ.push(item);
    }
    var id = node.id;
    var ansID = id.substring(3, id.indexOf('-'));
    var quesID = id.substring(id.indexOf('-') + 9);
    console.log(ansID);
    console.log(quesID);
    for (var q of newQ) {

        if (q.id == quesID) {
            for (var a of q.ans) {
                if (a.id == ansID) {
                    a.isRight = true;
                    console.log(newQ);
                    sessionStorage.setItem("user" + subject, JSON.stringify(newQ));
                    break;
                }
            }
        }
    }

}


function loadHistoryList(arr) {
    $('#content').html('');

    var html = '';
    for (var history of arr) {
        html += '<tr class="list-item"><td>' + history.subjectCode.subjectCode + '</td><td>' + history.subjectCode.subjectName + '</td><td>' + history.score + 'đ</td><td>' + new Date(history.takeDate).toLocaleDateString() + ' - ' + new Date(history.takeDate).toLocaleTimeString() + '</td></tr>';
    }
    $('#content').html(html);
    paging(20);
}

function searchHistory(arr) {
    var subject = $('#input-1').val();

    if (subject !== '') {
        var settings = {
            "url": "http://localhost:8088/QuizOnline/rest/result/search/" + subject,
            "method": "GET",
            "timeout": 0
        };

        $.ajax(settings).done(function (response) {
            loadHistoryList(response);
        });
    } else {
        loadHistoryList(arr);
    }


}

function active(id) {
    var settings = {
        "url": "http://localhost:8088/QuizOnline/rest/question/active/" + id,
        "method": "PUT",
        "timeout": 0
    };

    $.ajax(settings).done(function (response, status) {
        if (status === 'nocontent') {
            showNoti("Active Question Successfully", 1);
            $('#btnQX' + id).click();
        } else {
            showNoti("Active Question Fail", 0);
        }

    });
}

