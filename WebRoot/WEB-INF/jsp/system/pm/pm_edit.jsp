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
                <span class="mask-top-size" style="letter-spacing: 3px;"><b>项目信息</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;" data-dismiss="modal">
            </div>
            <div class="mask-main">
                <!-- /.box-header -->
                <!-- form start -->
                <form action="pm/${msg}.do" name="form_add" id="form_add"
                      method="post">
                    <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
                    <div id="zhongxin">
                        <table id="table_report" class="table table-striped table-bordered table-hover">
                            <c:if test="${fx == 'head'}">
                                <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
                                       type="hidden"/>
                            </c:if>
                            <input type="hidden" name="pmid" id="pmid" value="${tbpm.pmid }"/>

                            <div class="between-center">
                                <div class="between-center padding-8px">
                                    <span class="mask-size flex-row-between"><font style="color: red;">*</font>常规项目<br>类别</span>
                                    <input type="text" name="pcate" id="pcate" value="${tbpm.pcate }" autoComplete="off"
                                           maxlength="64" placeholder="这里输入常规项目类别" title="常规项目类别"
                                           class="mask-input width-250px"/>
                                </div>
                                <div class="between-center padding-8px">
                                    <span class="mask-size flex-row-between"><font style="color: red;">*</font>项目类型<br>说明</span>
                                    <input type="text" name="pdesc" id="pdesc" value="${tbpm.pdesc }" autoComplete="off"
                                           maxlength="64" placeholder="输入项目类型说明" title="项目类型说明"
                                           class="mask-input width-250px"/>
                                </div>
                            </div>
                            <div class="between-center">
                                <div class="between-center padding-8px">
                                    <span class="mask-size flex-row-between"><font style="color: red;">*</font>编&nbsp;&nbsp;码</span>
                                    <input type="text" name="pno" id="pno" autoComplete="off"
                                           value="${tbpm.pno }" maxlength="32" placeholder="这里输入编码"
                                           title="编码" class="mask-input width-250px"/>
                                </div>
                                <div class="between-center padding-8px">
                                    <span class="mask-size">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
                                    <input type="text" name="remark" id="remark" value="${tbpm.remark }"
                                           autoComplete="off"
                                           placeholder="这里输入备注" maxlength="100" title="备注"
                                           class="mask-input width-250px"/>
                                </div>
                            </div>


                        </table>
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


    //$(top.hangge());
    //保存
    $(document).ready(function () {

        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });

    function save() {
        if ($("#pcate").val() == "") {
            $("#pcate").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#pcate").focus();
            return false;
        }
        if ($("#pdesc").val() == "") {
            $("#pdesc").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#pdesc").focus();
            return false;
        }
        if ($("#pno").val() == "") {
            $("#pno").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#pno").focus();
            return false;
        } else if ($("#pno").val() != "") {
            findPno();
        }
        $("#form_add").submit();
    }


    function isphone(phone) {
        return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
    }

    //判断公司编号是否存在
    function findPno() {
        var pno = $.trim($("#pno").val());
        $.ajax({
            type: "POST",
            url: 'pm/findPno.do',
            data: {pno: pno},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("success" == data.result) {
                    $("#pno").submit();

                    //$("#zhongxin").hide();
                    //$("#zhongxin2").show();
                } else {
                    // $("#cno").css("background-color", "#D16E6C");
                    // setTimeout("$('#cno').val('此公司编号已存在!')", 500);
                    confirm('此编码已存在，请确认！')
                    return false;

                }
            }
        });
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
