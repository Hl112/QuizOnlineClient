function login() {
//var username = document.getElementById('username');
    console.log('test');
    var username = $('#username').val();
    var password = $('#password').val();
    var noti = $('#noti');
    console.log(username);
    console.log(password);
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
    $.get('${applicationScope.ENDPOINT}' + '/users/checkLogin/' + username + '/' + password, function (ketqua, status) {
        if (status === 'success') {
            noti.html('<div class="form-group btn btn-primary">Login Success</div>');
            sessionStorage.setItem("USER", ketqua);
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