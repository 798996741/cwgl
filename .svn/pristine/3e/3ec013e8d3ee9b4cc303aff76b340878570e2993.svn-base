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
                <span class="mask-top-size" style="letter-spacing: 3px;"><b>客户信息</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;" data-dismiss="modal">
            </div>
            <div class="mask-main">
                <!-- /.box-header -->
                <!-- form start -->
                <form action="client/${msg}.do" name="form_add" id="form_add"
                      method="post">
                    <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
                    <div id="zhongxin">

                        <c:if test="${fx == 'head'}">
                            <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
                                   type="hidden"/>
                        </c:if>
                        <input type="hidden" name="cliid" id="cliid" value="${cList.cliid }"/>

                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>公司简称</span>
                                <select name="csname" id="csname" data-placeholder="公司简称"
                                        class="mask-select width-250px">
                                    <option value=""></option>
                                    <c:forEach items="${csname1}" var="csname" varStatus="vs">
                                        <option value="${csname.csname}"
                                                <c:if test="${csname.csname==cList.csname}">selected</c:if>
                                        >${csname.csname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>客户全称</span>
                                <input type="text" name="clifname" id="clifname" value="${cList.clifname }"
                                       maxlength="32" placeholder="这里输入客户全称" title="客户全称" onchange="getback()"
                                       onblur="hasClifname()" class="mask-input width-250px" autoComplete="off"/>
                            </div>
                        </div>
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>客户简称</span>
                                <input type="text" name="clisname" id="clisname" value="${cList.clisname }"
                                       autoComplete="off"
                                       maxlength="32" placeholder="这里输入客户简称" title="客户简称"
                                       class="mask-input width-250px"/>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size flex-row-between"><font style="color: red;">*</font>客户编码</span>
                                <input type="text" name="clino" id="clino"
                                       value="${cList.clino }" maxlength="32" placeholder="这里输入客户编码"
                                       title="客户编码" class="mask-input width-250px" autoComplete="off"/>
                            </div>
                        </div>

                        <div>
                            <div class="mask-subtitle-size"><b style="font-size: 15px;">开票信息</b></div>
                        </div>
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size">公司名称</span>
                                <input type="text" name="tname" id="tname" autoComplete="off"
                                       value="${cList.tname }" maxlength="100" placeholder="这里输入公司名称"
                                       title="公司名称" class="mask-input width-250px"/>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size" style="letter-spacing: 2px">纳税人<br/>识别号</span>
                                <input type="text" name="taxno" id="taxno" autoComplete="off"
                                       value="${cList.taxno }" maxlength="100" placeholder="这里输入纳税人识别号"
                                       title="纳税人识别号" class="mask-input width-250px"/>
                            </div>
                        </div>

                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size">地址</span>
                                <input type="text" type="text" name="address" id="address"
                                       value="${cList.address }" maxlength="100" placeholder="这里输入地址"
                                       title="地址" class="mask-input width-250px" autoComplete="off"/>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">电话</span>
                                <input type="text" name="tel" id="tel" value="${cList.tel }" maxlength="100"
                                       placeholder="这里输入电话" maxlength="64" autoComplete="off"
                                       title="电话" class="mask-input width-250px"/>
                            </div>
                        </div>
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size">开户行</span>
                                <input type="text" type="text" name="bankname" id="bankname"
                                       value="${cList.bankname }" maxlength="100" placeholder="这里输入开户行"
                                       title="开户行" class="mask-input width-250px" autoComplete="off"/>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">账号</span>
                                <input type="text" name="bankno" id="bankno" value="${cList.bankno }" autoComplete="off"
                                       placeholder="这里输入账号" maxlength="64" title="账号" class="mask-input width-250px"/>
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
        if ($("#csname").val() == "") {
            $("#csname").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#csname").focus();
            return false;
        }
        if ($("#clifname").val() == "") {
            $("#clifname").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#clifname").focus();
            return false;
        }
        if ($("#clisname").val() == "") {
            $("#clisname").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#clisname").focus();
            return false;
        }
        if ($("#clino").val() == "") {
            $("#clino").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#clino").focus();
            return false;
        } else if ($("#clino").val() != "") {
            hasClino()
            if (!flag1) {
                return flag1;
            }
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
