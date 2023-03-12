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
<div>
    <div id="mask" class="mask">
        <div id="darkmask" class="darkmask">
            <div class="mask-top">
                <span class="mask-top-size" style="letter-spacing: 3px;"><b>出差项目</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;" data-dismiss="modal">
            </div>
            <div class="mask-main">
                <!-- /.box-header -->
                <!-- form start -->
                <form action="busiPJ/${msg}.do" name="form_add" id="form_add"
                      method="post">
                    <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
                    <div id="zhongxin">

                        <c:if test="${fx == 'head'}">
                            <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
                                   type="hidden"/>
                        </c:if>
                        <input type="hidden" name="id" id="id" value="${list.id }"/>

                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>项目分类</span>
                                <input type="text" name="classify" id="classify" value="${list.classify }"
                                       maxlength="32" placeholder="这里输入项目分类" title="项目分类"
                                       class="mask-input width-250px" autoComplete="off"/>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>项目名称</span>
                                <input type="text" name="name" id="name" value="${list.name }"
                                       maxlength="32" placeholder="这里输入项目名称" title="项目名称"
                                       class="mask-input width-250px" autoComplete="off"/>
                            </div>
                        </div>
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;"></font>项目阶段</span>
                                <select name="stage" id="stage" data-placeholder="项目阶段"
                                        class="mask-select width-250px">
                                    <option value="" <c:if test="${''==list.stage}">selected</c:if>></option>
                                    <option value="维护中" <c:if test="${'维护中'==list.stage}">selected</c:if>>维护中</option>
                                    <option value="推进中" <c:if test="${'推进中'==list.stage}">selected</c:if>>推进中</option>
                                </select>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>项目编号</span>
                                <input type="text" name="number" id="number"
                                       value="${list.number }" maxlength="32" placeholder="这里输入项目编号"
                                       title="项目编号" class="mask-input width-250px" autoComplete="off"/>
                            </div>
                        </div>
                        <div class="between-center">
                            <div class="between-start padding-8px" style="position: relative">
                                <span class="mask-size">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
                                <textarea class="mask-textarea mask-textarea4 " name="remark" id="mask-main-list-textarea-7"
                                          value="${list.remark}"  placeholder="这里输入备注" autoComplete="off">${list.remark}</textarea>
                                <div class="mask-dropdown mask-textarea2-shrink"></div>
                            </div>
                        </div>
                    </div>

                </form>
                <div class="mask-button">
                    <div class="mask-save" onclick="save();"><span class="mask-button-size">保存</span></div>
                    <div class="mask-close"><span class="mask-button-size" data-dismiss="modal">取消</span></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function getback() {
        var clifname = $.trim($("#clifname").val());
        $.ajax({
            type: "POST",
            url: 'client/getByClifname.do',
            data: {clifname: clifname},
            dataType: 'json',
            cache: false,
            success: function (data) {
                console.log(data.byId);
                $("#clisname").val(data.byId.clisname);
                $("#clino").val(data.byId.clino);
                $("#tname").val(data.byId.tname);
                $("#taxno").val(data.byId.taxno);
                $("#address").val(data.byId.address);
                $("#tel").val(data.byId.tel);
                $("#bankname").val(data.byId.bankname);
                $("#bankno").val(data.byId.bankno);
            }
        });
    }

    //$(top.hangge());
    //保存
    $(document).ready(function () {

        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });
    var flag1 = "";
    var flag2 = "";

    function save() {
        if ($("#classify").val() == "") {
            $("#classify").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#classify").focus();
            return false;
        }
        if ($("#name").val() == "") {
            $("#name").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#name").focus();
            return false;
        }
        if ($("#number").val() == "") {
            $("#number").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#number").focus();
            return false;
        }


        $("#form_add").submit();
    }


    function isphone(phone) {
        return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
    }

    function hasClifname() {
        var clifname = $.trim($("#clifname").val());
        $.ajax({
            type: "POST",
            url: 'client/hasClifname.do',
            data: {clifname: clifname},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (data) {
                if ("success" == data.result) {
                    $("#clifname").submit();

                    //$("#zhongxin").hide();
                    //$("#zhongxin2").show();
                } else {
                    // $("#cno").css("background-color", "#D16E6C");
                    // setTimeout("$('#cno').val('此公司编号已存在!')", 500);

                    confirm('此名称与供应商名称相同，请确认！')
                    return false;
                }
            }
        });
    }

    function hasClino() {
        var clino = $.trim($("#clino").val());
        $.ajax({
            type: "POST",
            url: 'client/hasClino.do',
            data: {clino: clino},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (data) {
                if ("success" == data.result) {
                    $("#clino").submit();
                    flag1 = true;
                    //$("#zhongxin").hide();
                    //$("#zhongxin2").show();
                } else {
                    // $("#cno").css("background-color", "#D16E6C");
                    // setTimeout("$('#cno').val('此公司编号已存在!')", 500);

                    if (confirm('此编码已存在，请确认！')) {
                        flag1 = true;
                    } else {
                        flag1 = false;
                    }


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
