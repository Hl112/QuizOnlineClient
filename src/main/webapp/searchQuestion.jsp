<%-- 
    Document   : newsearchQuestion
    Created on : Jan 27, 2021, 2:52:41 AM
    Author     : HL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question - Quiz Online</title>
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

                <!--Start Dashboard Content-->

                <div class="card mt-2">
                    <div class="card-content">
                        <div class="row row-group m-0 pb-0">
                            <div class="col-12 col-lg-6 col-xl-3 border-light ">
                                <div class="card-body">
                                    <select name="subject" class="form-control" id="subject">
                                        <option value="none">Search by Subject</option>
                                        <option value="PRJ311">Java Desktop</option>
                                        <option value="PRJ321">Java Web</option>
                                    </select>        </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-3 border-light">
                                <div class="card-body">
                                    <input type="text" class="form-control" id="searchValue" name="question" placeholder="Search by Name">
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-3 border-light">
                                <div class="card-body">
                                    <select name="status" class="form-control" id="status">
                                        <option value="none">Search by Status</option>
                                        <option value="true">Active</option>
                                        <option value="false">Deactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-1 border-light">
                                <div class="card-body">
                                    <div class="form-group">
                                        <button type="button" onclick="search();" class="btn btn-light px-5"><i class="icon-magnifier"></i>Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
                <div id="load-question" class="list-wrapper" ></div>
                <div class="col-md-12" id="paging">
                    <div id="pagination-container"></div>
                </div>
                <div class="overlay toggle-menu"></div>


            </div>
            <!-- End container-fluid-->

        </div>
    </body>
    <c:import url="footer.jsp"/>
    <script>
        loadQuestion('${applicationScope.ENDPOINT}');
        function xUpdate(id) {
//            $.ajaxSetup({async: false});
//            $.get('${applicationScope.ENDPOINT}/question', function (data, status) {
//                if (status === 'success') {
//                    var elem = '';
//
//                    for (var item of data) {
//                        elem += '<div class="row" id="qes' + item.id + '"><div class="col-12 col-lg-12"><div class="card"><div class="card-header">Question:';
//                        elem += '<input type="text" id="QES' + item.id + '" class="form-control" style="display: inline;width: 65%;" value="' + item.question + '" readonly="">';
//                        elem += '<div class="card-action"><div class="dropdown">' +
//                                '<button type="submit" class="btn btn-info" id="btnQE' + item.id + '" onclick="eUpdateQ(this);"><i class="icon-drawer"></i>Edit</button>' +
//                                '<button type="button" class="btn btn-primary btn-save" id="btnQS' + item.id + '" onclick="saveQ(this);"><i class="icon-check"></i>Save</button>' +
//                                '<button type="button" class="btn btn-danger btn-x" id="btnQX' + item.id + '" onclick="xUpdate(' + item.id + ');"><i class="icon-action-undo"></i>  </button></td></tr>' +
//                                '<button type="submit" id="btnDC' + item.id + '" class="btn btn-danger" data-toggle="modal" data-target="#basicModal' + item.id + '"><i class="icon-trash"></i>Delete</button>' +
//                                '<div class="modal fade" id="basicModal' + item.id + '" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">' +
//                                '<div class="modal-dialog"><div class="modal-content"><div class="modal-header">' +
//                                '<h4 class="modal-title text-danger" id="myModalLabel">Delete Confirm</h4>' +
//                                '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
//                                '<span aria-hidden="true">&times;</span></button></div><div class="modal-body"><h3 class="text-danger">Delete selected question?</h3>' +
//                                '</div><div class="modal-footer"><button type="button"  value="Delete" onclick="deleteQ(' + item.id + ');" class="btn btn-danger load-modal" id="btnD' + item.id + '" data-dismiss="modal">Delete</button>' +
//                                '<button type="button" class="btn btn-default close" data-dismiss="modal">Close</button></div></div></div></div>' +
//                                '</div></div></div>';
//                        elem += '<div class="table-borderless">' +
//                                '<table class="table align-items-center table-flush table-borderless">' +
//                                '<thead><tr><th>Answer | Create at: ' + new Date(item.createDate).toLocaleDateString() + '</th><th>Is Right</th><th>Action</th></tr></thead><tbody>';
//
//                        $.ajaxSetup({async: false});
//                        $.get("${applicationScope.ENDPOINT}/answer/QID/" + item.id, function (data, status) {
//                            if (status === 'success') {
//                                for (var ans of data) {
//                                    console.log(ans);
//                                    var correct = '';
//                                    if (ans.isRight)
//                                        correct = 'checked';
//                                    elem += '<tr><td><input type="text" class="form-control"  value="' + ans.answer + '" id="ans' + ans.id + '" readonly=""></td>' +
//                                            '<td><div class="icheck-material-white"><input id="user-radiobox' + ans.id + '" type="radio" name="c' + item.id + '" value="1" ' + correct + '>' +
//                                            '<label for="user-radiobox' + ans.id + '"></label></div></td><td>' +
//                                            '<button type="button" class="btn btn-info" id="btnE' + ans.id + '" onclick="enableUpdate(this);"><i class="icon-drawer"></i>Edit</button>' +
//                                            '<button type="button" class="btn btn-primary btn-save" id="btnS' + ans.id + '" onclick="save(this);"><i class="icon-check"></i>Save</button>' +
//                                            '<button type="button" class="btn btn-danger btn-x" id="btnX' + ans.id + '" onclick="xUpdate(' + item.id + ');"><i class="icon-action-undo"></i>  </button></td></tr>';
//                                }
//                            }
//                        });
//                        elem += '</tbody></table></div></div></div></div>';
//                    }
//                    $('#load-question').html(elem);
//                   
//
//                    //
//                }
//            }
//            );
//            $('.btn-save').hide();
//            $('.btn-x').hide();
//             paging(2);
            loadQuestion('${applicationScope.ENDPOINT}');
        }

    </script>
</html>
