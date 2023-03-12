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
    <%@ include file="../../system/include/incJs_mx.jsp" %>
</head>

<body class="no-skin">
<div>
    <div class="mask">
        <div id="darkmask" class="darkmask">
            <div class="mask-top">
                <span class="mask-top-size"><b>编&nbsp;&nbsp;辑</b></span>
                <img src="static/img/modal/delete_icon.png" style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                     data-dismiss="modal">
            </div>
            <div class="mask-main">

                <form name="form_add" id="form_add">
                    <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }" />
                    <input type="hidden" name="isaudit" id="isaudit1" value="${sign.isaudit}"/>

                    <c:if test="${fx == 'head'}">
                        <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden" />
                    </c:if>
                    <input type="hidden" name="conid" id="conid" value="${sign.conid}" />
                    <input type="hidden" name="maxid" id="maxid" value="${maxConid}" />
                    <div class="between-center">
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>签订时间
                </span>
                            <input class="date-picker date-style" name="signtime" id="signtime" autoComplete="off"
                                   value="${sign.signtime }" type="text" data-date-format="yyyy-mm-dd" onchange="combo()" />
                        </div>

                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>合同类型
                </span>
                            <select class="mask-select" name="type" id="type" onchange="combo()">
                                <option value="" selected></option>
                                <option value="B" <c:if test="${sign.type == 'B'}">selected</c:if>
                                > B
                                </option>
                                <option value="Q" <c:if test="${sign.type == 'Q'}">selected</c:if>
                                > Q
                                </option>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>项目/<br />产品类型
                </span>
                            <select class="mask-select js-example-basic-single" name="pno" id="pno" onchange="combo()">
                                <option value="" selected></option>
                                <c:forEach items="${pno}" var="pname" varStatus="vs">
                                    <option value="${pname.pno}" <c:if test="${pname.pno==sign.pno}">selected</c:if>
                                    > ${pname.pdesc}</option>

                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="between-center">
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>乙&nbsp;&nbsp;&nbsp;&nbsp;方
                </span>
                            <select class="mask-select js-example-basic-single"
                                    style="background: #ffffff!important;border-radius: 5px!important;"
                                    name="clino" id="clino" onchange="combo()">
                                <option value="" selected></option>
                                <c:forEach items="${clino}" var="cliname" varStatus="vs">
                                    <option value="${cliname.supno}" <c:if test="${cliname.supno==sign.clino}">selected</c:if>
                                    > ${cliname.supsname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>甲&nbsp;&nbsp;&nbsp;&nbsp;方
                </span>
                            <select class="mask-select js-example-basic-single"
                                    style="background: #ffffff!important;border-radius: 5px!important;"
                                    name="cno" id="cno2" onchange="combo()">
                                <option value="" selected></option>
                                <c:forEach items="${cno}" var="csname" varStatus="vs">
                                    <option value="${csname.cno}" <c:if test="${csname.cno==sign.cno}">selected</c:if>
                                    > ${csname.csname}</option>

                                </c:forEach>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>合同编号
                </span>
                            <input class="mask-input bgcolor-ddd" value="${sign.conno}" name="conno" id="conno"
                                   autoComplete="off" style="background-color: #dddddd;"></input>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>甲方签署
                </span>
                            <select class="mask-select" name="asign" id="asign">
                                <option value="" selected></option>
                                <option value="0" <c:if test="${sign.asign == 0}">selected</c:if>
                                > 是
                                </option>
                                <option value="1" <c:if test="${sign.asign == 1}">selected</c:if>
                                > 否
                                </option>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>乙方签署
                </span>
                            <select class="mask-select" name="bsign" id="bsign">
                                <option value="" selected></option>
                                <option value="0" <c:if test="${sign.bsign == 0}">selected</c:if>
                                > 是
                                </option>
                                <option value="1" <c:if test="${sign.bsign == 1}">selected</c:if>
                                > 否
                                </option>
                            </select>
                        </div>
                        <div class="between-start padding-8px" style="position: relative">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>对应销售<br />合同编号
                </span>
                            <textarea class="mask-textarea mask-textarea1 " name="purno" id="mask-main-list-textarea-5"
                                      value="${sign.purno }" autoComplete="off">${sign.purno}</textarea>
                            <div class="mask-dropdown mask-textarea1-shrink"></div>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>归档情况
                </span>
                            <select class="mask-select" name="isarc" id="isarc">
                                <option value="" selected></option>
                                <option value="0" <c:if test="${sign.isarc == 0}">selected</c:if>
                                > 是
                                </option>
                                <option value="1" <c:if test="${sign.isarc == 1}">selected</c:if>
                                > 否
                                </option>
                            </select>
                        </div>
                        <div class="between-start padding-8px" style="position: relative">
                            <span class="mask-size">纸质合同<br>存档方式</span>
                            <textarea class="mask-textarea mask-textarea2 " name="place" id="mask-main-list-textarea-7"
                                      value="${sign.place}" autoComplete="off">${sign.place}</textarea>
                            <div class="mask-dropdown mask-textarea2-shrink"></div>
                        </div>
                        <div class="between-center padding-8px">
                            <span class="mask-size">合同扫描件</span>
                            <div class="mask-input around-center padding-0px bgcolor-rgba" style="background-color: #eef2f5;">
                                <div class="mask-upload-download mask-img-updo flex-row-between"
                                     onclick="loadpur('${sign.conid}');">
                                    <font class="mask-img-size1">上传</font>
                                    <font class="mask-img-size2">下载</font>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>合同总金额
                </span>
                            <input type="text" class="mask-input" name="consmon" id="consmon" value="${sign.consmon }"
                                   autoComplete="off"  />
                        </div>
                        <div class="between-start padding-8px" style="position:relative;">
                            <span class="mask-size mask-size-top">付款方式</span>
                            <textarea class="mask-textarea mask-textarea3 " name="paymet" id="mask-main-list-textarea-1"
                                      value="${sign.paymet }"  autoComplete="off">${sign.paymet}</textarea>
                            <div class="mask-dropdown mask-textarea3-shrink"></div>
                        </div>
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>合同状态
                </span>
                            <select class="mask-select" name="state" id="state">
                                <option value="2"
                                        <c:if test="${sign.state == 0}">selected</c:if>
                                > 执行中
                                </option>
                                <option value="0" <c:if test="${sign.state == 0}">selected</c:if>
                                > 完成
                                </option>
                                <option value="1" <c:if test="${sign.state == 1}">selected</c:if>
                                > 作废
                                </option>
                            </select>
                        </div>
                    </div>
                    <c:if test="${msg == 'updateContractById' }">
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size">付款明细</span>
                                <div class="mask-input center-center bgcolor-rgba">
<%--                                    <img src="static/img/modal/edit.png"--%>
<%--                                         style="margin-left: -80px;cursor: pointer;width: 52.8px;height: 21.6px;" data-toggle="modal"--%>
<%--                                         data-target="#receiptsDetails" href="javascript:void (0)" onclick="editContmon('${sign.conid}');">--%>
                                    <div class="mask-edit mask-img" style="margin-left: -60px;" href="javascript:void (0)" onclick="editContmon('${sign.conid}');">
                                        <font class="mask-img-size">编辑</font>
                                    </div>
                                </div>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">已付款金额</span>
                                <div class="mask-input bgcolor-ddd" style="background-color: #dddddd;">
                                    <c:if test="${lastContmon.conamon==null}">0</c:if>
                                    <c:if test="${lastContmon.conamon!=null}">${lastContmon.conamon}</c:if>
                                </div>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">未付款金额</span>
                                <div class="mask-input bgcolor-ddd" style="background-color: #dddddd;">
                                    <c:if test="${lastContmon.connmon==null}">${sign.consmon }</c:if>
                                    <c:if test="${lastContmon.connmon!=null}">${lastContmon.connmon}</c:if>
                                </div>
                            </div>
                        </div>
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size">收票明细</span>
                                <div class="mask-input center-center bgcolor-rgba" style="background-color: #eef2f5;">
<%--                                    <img src="static/img/modal/edit.png" href="javascript:void (0)"--%>
<%--                                         onclick="editInvmon('${sign.conid}');"--%>
<%--                                         style="margin-left: -80px;cursor: pointer;width: 52.8px;height: 21.6px;" data-toggle="modal"--%>
<%--                                         data-target="#ticketsDetails">--%>
                                    <div class="mask-edit mask-img" style="margin-left: -60px;" href="javascript:void (0)"
                                         onclick="editInvmon('${sign.conid}');">
                                        <font class="mask-img-size">编辑</font>
                                    </div>
                                </div>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">已收票金额</span>
                                <div class="mask-input bgcolor-ddd" style="background-color: #dddddd;">
                                    <c:if test="${lastInvmon.invamon==null}">0</c:if>
                                    <c:if test="${lastInvmon.invamon!=null}">${lastInvmon.invamon}</c:if>
                                </div>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">未收票金额</span>
                                <div class="mask-input bgcolor-ddd" style="background-color: #dddddd;">
                                    <c:if test="${lastInvmon.invnmon==null}">${sign.consmon }</c:if>
                                    <c:if test="${lastInvmon.invnmon!=null}">${lastInvmon.invnmon}</c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>其他费用
                </span>
                            <input type="text" name="busismon" id="busismon" autoComplete="off" value="${sign.busismon}"
                                    class="mask-input" />
                        </div>
                        <div class="between-start padding-8px" style="position:relative;">
                            <span class="mask-size mask-size-top">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
                            <textarea class="mask-textarea mask-textarea4 " name="busiexp" id="mask-main-list-textarea-2" value=""
                                      autoComplete="off">${sign.busiexp }</textarea>
                            <div class="mask-dropdown mask-textarea4-shrink"></div>
                        </div>
                    </div>
                    <c:if test="${msg == 'updateContractById' }">
                        <div class="between-center">
                            <div class="between-center padding-8px">
                                <span class="mask-size">支付明细</span>
                                <div class="mask-input center-center bgcolor-rgba">
<%--                                    <img src="static/img/modal/edit.png"--%>
<%--                                         style="margin-left: -80px;cursor: pointer;width: 52.8px;height: 21.6px;" data-toggle="modal"--%>
<%--                                         href="javascript:void (0)" onclick="editBusimon('${sign.conid}');" data-target="#payDetails">--%>
                                    <div class="mask-edit mask-img" style="margin-left: -60px;" href="javascript:void (0)" onclick="editBusimon('${sign.conid}');">
                                        <font class="mask-img-size">编辑</font>
                                    </div>
                                </div>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">已支付<br />其他费用</span>
                                <div class="mask-input bgcolor-ddd" style="background-color: #dddddd;">
                                    <c:if test="${lastBusimon.busiamon==null}">0</c:if>
                                    <c:if test="${lastBusimon.busiamon!=null}">${lastBusimon.busiamon}</c:if>
                                </div>
                            </div>
                            <div class="between-center padding-8px">
                                <span class="mask-size">未支付<br />其他费用</span>
                                <div class="mask-input bgcolor-ddd" style="background-color: #dddddd;">
                                    <c:if test="${lastBusimon.businmon==null}">${sign.busismon}</c:if>
                                    <c:if test="${lastBusimon.businmon!=null}">${lastBusimon.businmon}</c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="mask-button">
                        <c:if test="${user.QX_SH != 1 }">
                        <div class="mask-save"><span class="mask-button-size" onclick="save('2');">保存</span></div>
                        <div class="mask-close" data-dismiss="modal"><span class="mask-button-size" data-dismiss="modal">取消</span>
                        </div>
                        </c:if>
                        <c:if test="${user.QX_SH == 1 }">
                            <div class="mask-save">
                                <span class="mask-button-size" onclick="save('0');">审核通过</span>
                            </div>
                            <div class="mask-close">
                                <span class="mask-button-size" onclick="save('1');">审核不通过</span>
                            </div>
                        </c:if>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script src="static/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $('.js-example-basic-single').select2();
    });

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

    function save(isaudit) {

        document.getElementById("isaudit1").value = isaudit;
        if ($("#signtime").val() == "") {
            $("#signtime").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#signtime").focus();
            return false;
        }
        if ($("#type").val() == "") {
            $("#type").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#type").focus();
            return false;
        }
        if ($("#pno").val() == "") {
            $("#pno").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#pno").focus();
            return false;
        }
        if ($("#con2").val() == "") {
            $("#con2").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#con2").focus();
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
        }


        if ($("#asign").val() == "") {
            $("#asign").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#asign").focus();
            return false;
        }
        if ($("#bsign").val() == "") {
            $("#bsign").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#bsign").focus();
            return false;
        }
        if ($("#isarc1").val() == "") {
            $("#isarc1").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#isarc1").focus();
            return false;
        }
        if ($("#consmon").val() == "") {
            $("#consmon").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#consmon").focus();
            return false;
        } else if ($("#consmon").val() == "" && reg.test($("#consmon").val())) {
            $("#consmon").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#consmon").focus();
            return false;
        }
        if ($("#state1").val() == "") {
            $("#state1").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#state1").focus();
            return false;
        }
        if ($("#busismon").val() == "") {
            $("#busismon").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#busismon").focus();
            return false;
        } else if ($("#busismon").val() == "" && reg.test($("#busismon").val())) {
            $("#busismon").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#busismon").focus();
            return false;
        }
        $.ajax({
            type: 'post',
            data: $('#form_add').serialize(),
            url: '<%=basePath%>purchase/${msg}.do',
            cache: false,
            dataType: 'text',
            success: function (data) {
                if ("msg" != data) {
                    location.href = "<%=basePath%>purchase/findContract.do"

                } else {
                    confirm("保存失败")
                }
            }
        })
        $(".mask-button-size").attr("onclick", "null");
    }


    function combo() {
        var clino = document.getElementById("clino").value;
        var cno1 = document.getElementById("cno2").value;
        var pno1 = document.getElementById("pno").value;
        var type1 = document.getElementById("type").value;
        var signtime = document.getElementById("signtime").value.substring(0, 7);
        var year = document.getElementById("signtime").value.substring(0, 4);
        // 2019-01-01
        // var maxid = document.getElementById("maxid").value;

        if (cno1 != '' && pno1 != '' && type1 != '' && year != '') {

            var jsondata = '';
            var result = '';
            $.ajax({
                type: "POST",
                url: '<%=basePath%>purchase/comboConno.do',
                data: { cno: cno1, pno: pno1, type: type1, signtime: year },
                dataType: 'json',
                cache: false,
                success: function (data) {

                    $("#clino").submit();
                    $("#cno2").submit();
                    $("#pno").submit();
                    $("#type").submit();
                    $("#signtime").submit();
                    jsondata = JSON.stringify(data);
                    console.log(jsondata)
                    //$("#zhongxin").hide();
                    //$("#zhongxin2").show();
                    var conno = '' + type1 + '-' + cno1 + '-' + clino + '-' + pno1 + '-' + signtime + '-' + jsondata + '';
                    document.getElementById("conno").value = conno;

                }
            });


        }


    }

    function editContmon(conid) {
        // top.jzts();
        var winId = "ContmonWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>purchase/findContmon.do?conid=' + conid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    function editInvmon(conid) {
        // top.jzts();
        var winId = "InvmonWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>purchase/findInvmon.do?conid=' + conid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    function editBusimon(conid) {
        // top.jzts();
        var winId = "BusimonWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>purchase/findBusimon.do?conid=' + conid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

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
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    function isphone(phone) {
        return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
    }

    //判断公司编号是否存在
    function hasCno() {
        var cno = $.trim($("#cno").val());
        $.ajax({
            type: "POST",
            url: '<%=basePath%>conpany/hasCno.do',
            data: { cno: cno, tm: new Date().getTime() },
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
            data: { NUM: NUM, USERNAME: USERNAME, tm: new Date().getTime() },
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

    $('.mask-textarea1').click(function () {
        $(".mask-textarea1-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea1').animate({
            height: '135px',
        })

    });
    $(".mask-textarea1-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea1')[0].style.height === "24px") {
            $(".mask-textarea1-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea1').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea1-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea1').animate({
                height: '24px',
            })
        }
    })

    $('.mask-textarea2').click(function () {
        $(".mask-textarea2-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea2').animate({
            height: '135px',
        })
    });

    $(".mask-textarea2-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea2')[0].style.height === "24px") {
            $(".mask-textarea2-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea2').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea2-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea2').animate({
                height: '24px',
            })
        }
    })

    $('.mask-textarea3').click(function () {
        $(".mask-textarea3-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea3').animate({
            height: '135px',
        })
    });

    $(".mask-textarea3-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea3')[0].style.height === "24px") {
            $(".mask-textarea3-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea3').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea3-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea3').animate({
                height: '24px',
            })
        }
    })

    $('.mask-textarea4').click(function () {
        $(".mask-textarea4-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea4').animate({
            height: '135px',
        })
    });

    $(".mask-textarea4-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea4')[0].style.height === "24px") {
            $(".mask-textarea4-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea4').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea4-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea4').animate({
                height: '24px',
            })
        }
    })
    $(".dropdown-exit-image").click(function () {
        window.location.href = "index.html"
    })
</script>
</body>

</html>