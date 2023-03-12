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
    <!-- 下拉框 -->
    <style>
        ul li {
            line-height: 30px;
            list-style-type: none
        }
    </style>
</head>

<body class="no-skin">

<!-- Horizontal Form -->
<div id="mask" class="mask">
    <div id="darkmask" class="darkmask">
        <div class="mask-top">
            <span class="mask-top-size" style="letter-spacing: 3px;"><b>导入</b></span>
            <img src="static/img/modal/delete_icon.png" style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                 data-dismiss="modal">
        </div>
        <div class="mask-main">
            <div class="mask-main-list-2">
                <div class="mask-main-list-demo">
                    <form action="purchase/readExcel.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
                        <input name="conid" id="conid" type="hidden" value="${pd.conid}">

                        <div style="display: flex ;justify-content: center">
                            <input type="file" id="excel" name="excel" onchange="fileType(this)" class="mask-main-list-input-1" />
                        </div>
                        <div class="mask-button">
                            <div class="mask-save" style="position: relative;"><input type="button" onclick="outExcelpur();"
                                                                                      style="opacity:0;width: 136px;height: 28px;position: absolute;"><span
                                    class="mask-button-size">导入</span></div>
                            <div class="mask-close" data-dismiss="modal"><span class="mask-button-size"
                                                                               data-dismiss="modal">取消</span></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">


    //$(top.hangge());
    //保存
    $(document).ready(function () {

        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });
    function save() {
        $("#form_add").submit();
    }

    function fileType(obj) {
        var fileType = obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
        if (fileType != '.xls') {
            $("#excel").tips({
                side: 3,
                msg: '请上传xls格式的文件',
                bg: '#AE81FF',
                time: 3
            });
            $("#excel").val('');
            document.getElementById("excel").files[0] = '请选择xls格式的文件';
        }
    }
    function outExcelpur() {
        if ($("#excel").val() == "" || document.getElementById("excel").files[0] == '请选择xls格式的文件') {

            $("#excel").tips({
                side: 3,
                msg: '请选择文件',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        $("#Form").submit();

    }

    $(function () {
        //下拉框
        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({ allow_single_deselect: true });
            $(window)
                .off('resize.chosen')
                .on('resize.chosen', function () {
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({ 'width': $this.parent().width() });
                    });
                }).trigger('resize.chosen');
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({ 'width': $this.parent().width() });
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