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
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/css/datepicker.css"/>
</head>

<body class="no-skin">

<!-- Horizontal Form -->
<div id="mask" class="mask">
    <div id="darkmask" class="darkmask">
        <div class="mask-top">
            <span class="mask-top-size" style="letter-spacing: 3px;"><b>支付明细</b></span>
            <img src="static/img/modal/delete_icon.png"
                 style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                 data-dismiss="modal">
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <div class="mask-main">
            <form name="form_add3" id="form_add3">
                <input type="hidden" name="conid" id="conid" value="${pd.conid}"/>
                <div class="between-center">
                    <div class="between-center padding-8px">
                        <span class="mask-size">支付时间</span>
                        <input class="date-picker" name="busitime" id="busitime" value="" type="text"
                               data-date-format="yyyy-mm-dd" readonly="readonly" style="
                  background: url('static/img/home/date_icon.png') no-repeat scroll 95% center transparent;
                  background-size: 15px;
                  cursor: pointer;
                  width: 250px;
                  height: 24px;
                  line-height: 24px;
                  background-color: #fff;
                  border-radius: 5px;
                  border: rgba(3, 2, 2, 0);
                  padding-left: 5px;" autoComplete="off"/>
                    </div>
                    <div class="between-center padding-8px">
                        <span class="mask-size">支付金额</span>
                        <input type="text" name="paymon" id="paymon" class="mask-input width-250px" autoComplete="off"/>
                    </div>
                </div>
                <div class="between-center">
                    <div class="between-center padding-8px">
                        <span class="mask-size">支付人</span>
                        <input type="text" name="payee" id="payee" maxlength="32" autoComplete="off"
                               class="mask-input width-250px"/>
                    </div>
                    <div class="between-center padding-8px">
                        <span class="mask-size">备&nbsp;&nbsp;注</span>
                        <input type="text" name="remark" id="remark" class="mask-input width-250px" autoComplete="off"/>
                    </div>
                </div>
            </form>
            <div class="seat-middle" style="height: 270px;width: 100%;">
                <div class="seat-middle-r" style="width: 100%;">
                    <form name="form_add2" id="form_add2">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>

                                <th class="center">序号</th>
                                <th class="center">支付时间</th>
                                <th class="center">支付金额</th>
                                <th class="center">支付人</th>
                                <th class="center">备注</th>
                                <th class="center">操作人</th>
                                <th class="center">操作时间</th>
                                <th class="center">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:choose>
                                <c:when test="${not empty blist}">
                                    <%--<c:if test="${QX.cha == 1 }">--%>
                                    <c:forEach items="${blist}" var="blist" varStatus="vs">
                                        <input type="hidden" name="busimid" id="busimid" value="${blist.busimid}"/>
                                        <tr>

                                            <td class="center">${vs.count}</td>
                                            <td class="center">${blist.busitime}</td>
                                            <td class="center">${blist.paymon}</td>
                                            <td class="center">${blist.payee}</td>
                                            <td class="center">${blist.remark}</td>
                                            <td class="center">${blist.cztime}</td>
                                            <td class="center">${blist.username}</td>

                                            <td align="center">
                                                    <%--<c:if test="${QX.edit == 1 }">--%>
                                                    <%--<a class="btn btn-mini btn-primary" onclick="edit();">编辑</a>--%>
                                                    <%--</c:if>--%>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <%--<c:if test="${QX.del == 1 }">--%>
                                                    <img src="static/img/home/delete.png" onclick="del('${blist.busimid}');"
                                                     style="width:59px;height:25px">
                                                <%--<div class="mask-delete mask-img" href="javascript:void (0)"--%>
                                                     <%--onclick="del('${blist.busimid}');">--%>
                                                    <%--<font class="mask-img-size">删除</font>--%>
                                                <%--</div>--%>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="mask-button">
                <div class="mask-save"><span class="mask-button-size savebutten" onclick="saveb()">新增</span></div>
                <div class="mask-close" data-dismiss="modal"><span class="mask-button-size"
                                                                   data-dismiss="modal">取消</span>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="static/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    //保存
    $(document).ready(function () {
        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });

    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    function ismon(paymon) {
        return (new RegExp(/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test(paymon));
    }

    //判断金额是否超过
    function isBusimon() {

        var paymon = $.trim($("#paymon").val());
        var conid = $.trim(${ pd.conid });

        $.ajax({
            type: "POST",
            url: 'purchase/isBusimon.do',
            data: {paymon: paymon, conid: conid},
            dataType: 'json',
            cache: false,
            async: false,
            success: function (data) {
                if ("success" == data.result) {
                    $("#paymon").submit();
                    flag = true;
                    //$("#zhongxin").hide();
                    //$("#zhongxin2").show();
                } else {

                    if (confirm('支付金额已超过总金额，请确认！')) {
                        flag = true;
                    } else {
                        flag = false;
                    }
                }
            }
        });
    }

    var flag = "";

    function saveb() {
        if (!ismon($("#paymon").val())) {
            $("#paymon").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#paymon").focus();
            return false;
        } else if ($("#paymon").val() != "") {
            isBusimon();
            if (!flag) {
                return flag;
            }
        }
        $.ajax({
            type: 'post',
            data: $('#form_add3').serialize(),
            url: 'sell/insertBusimon.do',
            cache: false,
            dataType: 'text',
            success: function (data) {
                if ("msg" != data) {
                    // confirm("保存成功")
                    // window.location.href = "company/findBankById.do?subid="+data;
                    editBusimon(${ pd.conid })
                } else {
                    confirm("保存失败")
                }
            }
        })
        $(".savebutten").attr("onclick", "null");
    }

    function del(busimid) {
        if (confirm("确定要删除吗?")) {

            var url = "purchase/deleteBusimon.do?busimid=" + busimid;
            $.ajax({
                type: 'post',
                data: {busimid: busimid},
                url: url,
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("msg" != data) {
                        // confirm("保存成功")
                        // window.location.href = "company/findBankById.do?subid="+data;
                        editBusimon(${ pd.conid })
                    } else {
                        confirm("删除失败")
                    }
                }
            })
        }
    }


    //修改
    function edit() {

        $.ajax({
            type: 'post',
            data: $('#form_add2').serialize(),
            url: 'purchase/insertBankinfo.do',
            cache: false,
            dataType: 'text',
            success: function (data) {
                if ("msg" != data) {
                    // confirm("保存成功")
                    // window.location.href = "company/findBankById.do?subid="+data;
                    editBusimon(${ pd.conid })
                } else {
                    confirm("保存失败")
                }
            }
        })

    }

    function editBusimon(conid) {
        // top.jzts();
        var winId = "BusimonWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            url: '<%=basePath%>purchase/findBusimon.do?conid=' + conid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    //保存
    // function save() {
    //     //alert($("#role_id1").val());
    //
    //     if ($("#bname").val() == "") {
    //         $("#bname").tips({
    //             side: 3,
    //             msg: '开户行不能为空',
    //             bg: '#AE81FF',
    //             time: 3
    //         });
    //         $("#bname").focus();
    //         return false;
    //     }
    //     if ($("#bno").val() == "") {
    //         $("#bno").tips({
    //             side: 3,
    //             msg: '银行账号不能为空',
    //             bg: '#AE81FF',
    //             time: 3
    //         });
    //         $("#bno").focus();
    //         return false;
    //     }
    //
    //
    //         $("#form_add").submit();
    //
    //
    //
    //     }


    // return false;

    // if ($("#cno").val() == "") {
    //     hasCno();
    // } else {
    //     $("#userForm_add").submit();
    //     // $("#zhongxin").hide();
    //     // $("#zhongxin2").show();
    // }


    function isphone(phone) {
        return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
    }

    //判断公司编号是否存在
    function hasCno() {
        var cno = $.trim($("#cno").val());
        $.ajax({
            type: "POST",
            url: '<%=basePath%>conpany/hasCno.do',
            data: {cno: cno, tm: new Date().getTime()},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("success" == data.result) {
                    $("#cno").submit();
                    //$("#zhongxin").hide();
                    //$("#zhongxin2").show();
                } else {
                    $("#cno").css("background-color", "#D16E6C");
                    setTimeout("$('#cno').val('此公司编号已存在!')", 500);
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