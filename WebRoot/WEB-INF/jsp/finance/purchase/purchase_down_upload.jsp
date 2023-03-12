<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
</head>
<body class="no-skin">
<!-- Horizontal Form -->
<div id="mask" class="mask">
    <div id="darkmask" class="darkmask">
        <div class="mask-top">
            <span class="mask-top-size" style="letter-spacing: 3px;">
                <b>文件处理</b>
            </span>
            <img src="static/img/modal/delete_icon.png"
                 style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                 data-dismiss="modal">
        </div>
        <div class="mask-main">
            <div class="mask-main-list-2">
                <div class="mask-main-list-demo">
                    <form name="form_add" id="form_add">
                        <input name="conid" id="conid" type="hidden" value="${pd.conid}">
                        <div style="display: flex ;justify-content: center;flex-direction: column">
                            <div style="display: flex ;justify-content: center;align-items: center">
                                <div class="mask-size">选择文件:</div>
                                <input type="file" multiple="multiple" name="files" id="files" class="mask-input width-200px  ">
                            </div>
                            <div style="display: flex ;justify-content: center;align-items: center;margin-top: 10px">
                                <div class="mask-size">备&nbsp;&nbsp;&nbsp;&nbsp;注:</div>
                                <input type="text" name="remark" id="remark" value="" class="mask-input width-200px">
                            </div>
                        </div>
                        <div class="mask-button">
                            <div class="mask-save" style="position: relative;">
                                <input class="mask-button-size" type="button" onclick="savef()"
                                       style="opacity:0;width: 136px;height: 28px;position: absolute;">
                                <span class="mask-button-size">上传</span>
                            </div>
                            <div class="mask-close" data-dismiss="modal">
                                <span class="mask-button-size" data-dismiss="modal">取消</span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="seat-middle" style="height: 300px;">
                <div class="seat-middle-r" style="height: 270px;">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>文件名称</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach items="${getfile}" var="file" varStatus="vs">
                            <tbody>
                            <tr>
                                <td>${vs.count}</td>
                                <td>${file.fname}</td>
                                <td>${file.remark}</td>
                                <td align="center">
<%--                                    <a href="<%=basePath%>file/download.do?times=${file.times}">--%>
<%--                                    <img src="static/img/modal/download.png"--%>
<%--                                         style="cursor: pointer;width: 52.8px;height: 21.6px;"></a>--%>
<%--                                    <img src="static/img/home/delete.png"--%>
<%--                                         onclick="delfile('${file.fid}','${file.fname}');"--%>
<%--                                         style="width:59px;height:25px">--%>
    <div class="flex-row-around">
                                    <a href="<%=basePath%>file/download.do?times=${file.times}">
                                        <img src="static/img/modal/download.png"
                                             style="cursor: pointer;width: 52.8px;height: 21.6px;"></a>
                                    <div class="mask-edit mask-img" href="javascript:void (0)"
                                         onclick="delfile('${file.fid}','${file.fname}');">
                                        <font class="mask-img-size">删除</font>
                                    </div></div>
                                </td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    //保存
    $(document).ready(function () {
        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });

    function loadpur(conid) {
        //top.jzts();
        var winId = "loadWin";
        modals.openWin({
            winId: winId,
            title: '导入导出',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>pfile/getFile.do?conid=' + conid
        });
    }

    function savef() {
        var files = $("#files").prop('files');
        var data = new FormData();
        data.append('files', files[0]);  //参数名：file
        var remark = $("#remark").val();
        $.ajax({
            type: 'post',
            data: data,
            url: 'pfile/upload.do?conid=${pd.conid}&remark=' + encodeURI(encodeURI(remark)),
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if ("msg" != data) {
                    // confirm("保存成功")
                    // window.location.href = "company/findBankById.do?subid="+data;
                    loadpur(${pd.conid});
                } else {
                    confirm("保存失败")
                }
            }
        })
    }

    function delfile(fid, fname) {
        if (confirm("确定要删除吗?")) {
            var url = "<%=basePath%>pfile/deleteFile.do?fid=" + fid + "&fname=" + fname;
            $.ajax({
                type: 'post',
                data: {fid: fid, fname: fname},
                url: url,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if ("msg" != data) {
                        loadpur(${pd.conid})
                    } else {
                        confirm("删除失败")
                    }
                }
            })
        }
    }

    function isphone(phone) {
        return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
    }

    //判断编码是否存在
    function hasN(USERNAME) {
        var NUM = $.trim($("#NUM").val());
        $.ajax({
            type: "POST",
            url: '<%=basePath%>user/hasN.do',
            data: {NUM: NUM, USERNAME: USERNAME, tm: new Date().getTime()},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("success" != data.result) {
                    $("#NUM").tips({
                        side: 3,
                        msg: '编号 ' + NUM + ' 已存在',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#NUM").val('');
                }
            }
        });
    }

    $(function () {
        //下拉框
        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({allow_single_deselect: true});
            $(window)
                .off('resize.chosen')
                .on('resize.chosen', function () {
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({'width': $this.parent().width()});
                    });
                }).trigger('resize.chosen');
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({'width': $this.parent().width()});
                });
            });
            $('#chosen-multiple-style .btn').on('click', function (e) {
                var target = $(this).find('input[type=radio]');
                var which = parseInt(target.val());
                if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                else $('#form-field-select-4').removeClass('tag-input-style');
            });
        }
    });
</script>
</body>
</html>
