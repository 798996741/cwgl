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
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/css/datepicker.css"/>

</head>
<body class="no-skin">

<!-- Horizontal Form -->
<div>
    <div class="mask">
        <div id="darkmask" class="darkmask">
            <div class="mask-top">
                <span class="mask-top-size"><b>编&nbsp;&nbsp;辑</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                     data-dismiss="modal">
            </div>
            <div class="mask-main">
                <form name="form_add" id="form_add">
                    <input type="hidden" name="id" id="id" value="${obj.id }"/>
                    <input type="hidden" name="uid" id="uid" value="${obj.uid}"/>
                    <c:if test="${fx == 'head'}">
                        <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
                               type="hidden"/>
                    </c:if>


                    <div class="between-center">
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>所属项目
                  </span>
                            <select class="mask-select" name="busi_project" id="busi_project">
                                <option value="" selected></option>
                                <c:forEach items="${pjname}" var="name" varStatus="vs">
                                    <option value="${name.name}"
                                            <c:if test="${name.name==obj.busi_project}">selected</c:if>
                                    > ${name.name}</option>

                                </c:forEach>
                                </option>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>交通工具
                  </span>
                            <input type="text" class="mask-input" name="trip_mode" id="trip_mode"
                                   value="${obj.trip_mode }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>开始城市
                  </span>
                            <input type="text" class="mask-input" name="busi_startcity" id="busi_startcity"
                                   value="${obj.busi_startcity }"/>
                        </div>

                    </div>
                    <div class="between-center">
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>目的城市
                  </span>
                            <input type="text" class="mask-input" name="busi_endcity" id="busi_endcity"
                                   value="${obj.busi_endcity }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>开始时间
                  </span>
                            <input class="date-picker" name="busi_starttime" id="busi_starttime" autoComplete="off"
                                   value="${obj.busi_starttime }" type="text" data-date-format="yyyy-mm-dd"
                                   style="width: 136px;
                  height: 28px;
                  line-height: 28px;
                  border-radius: 5px;
                  border: rgba(0, 0, 0, 0);
                  background: url('static/img/home/date_icon.png') no-repeat scroll 90% center transparent;
                  background-size: 15px;
                  background-color: #fff;
                  cursor: pointer;
                  padding-left: 5px;"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>结束时间
                  </span>
                            <input class="date-picker" name="busi_endtime" id="busi_endtime" autoComplete="off"
                                   value="${obj.busi_endtime }" type="text" data-date-format="yyyy-mm-dd"
                                   style="width: 136px;
                  height: 28px;
                  line-height: 28px;
                  border-radius: 5px;
                  border: rgba(0, 0, 0, 0);
                  background: url('static/img/home/date_icon.png') no-repeat scroll 90% center transparent;
                  background-size: 15px;
                  background-color: #fff;
                  cursor: pointer;
                  padding-left: 5px;"/>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>时长（天）
                  </span>
                            <input type="text" class="mask-input" name="busi_time" id="busi_time"
                                   value="${obj.busi_time }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>票据数量
                  </span>
                            <input type="text" class="mask-input" name="billnum" id="billnum"
                                   value="${obj.billnum }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>交通金额
                  </span>
                            <input type="text" class="mask-input" name="tripmon" id="tripmon"
                                   value="${obj.tripmon }"/>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>住宿金额
                  </span>
                            <input type="text" class="mask-input" name="hostelmon" id="hostelmon"
                                   value="${obj.hostelmon }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>出差补贴
                  </span>
                            <input type="text" class="mask-input" name="mission" id="mission"
                                   value="${obj.mission }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>实报金额
                  </span>
                            <input type="text" class="mask-input" name="realmon" id="realmon"
                                   value="${obj.realmon }"/>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-start padding-8px" style="position:relative;">
                            <span class="mask-size mask-size-top">出差事由</span>
                            <textarea class="mask-textarea mask-textarea4 " name="reason"
                                      id="mask-main-list-textarea-2"
                            >${obj.reason }</textarea>
                            <div class="mask-dropdown mask-textarea4-shrink"></div>
                        </div>
                    </div>
                    <div class="mask-button">
                            <div class="mask-save"><span class="mask-button-size" onclick="save();">保存</span></div>
                            <div class="mask-close" data-dismiss="modal"><span class="mask-button-size"
                                                                               data-dismiss="modal">取消</span>
                            </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="static/js/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $(".select2-container--below").css({"background-color":"#ffffff", "border-radius":"5px"});
    }
    $(document).ready(function () {

        $('.js-example-basic-single').select2();
    });
    //$(top.hangge());
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

    function save() {
        if ($("#busi_starttime").val()>=$("#busi_endtime").val()){
            $("#busi_starttime").tips({
                side: 3,
                msg: '请选择正确的时间',
                bg: '#AE81FF',
                time: 2
            });
            $("#busi_endtime").tips({
                side: 3,
                msg: '请选择正确的时间',
                bg: '#AE81FF',
                time: 2
            });
            return false;
        }

        if (!ismon($("#billnum").val())) {
            $("#billnum").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 2
            });
            $("#billnum").focus();
            return false;
        }


        if (!ismon($("#tripmon").val())) {
            $("#tripmon").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#tripmon").focus();
            return false;
        }

        if (!ismon($("#hostelmon").val())) {
            $("#hostelmon").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#hostelmon").focus();
            return false;
        }

        if (!ismon($("#mission").val())) {
            $("#mission").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#mission").focus();
            return false;
        }

        if (!ismon($("#realmon").val())) {
            $("#realmon").tips({
                side: 3,
                msg: '格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#realmon").focus();
            return false;
        }
        $.ajax({
            type: 'post',
            data: $('#form_add').serialize(),
            url: '<%=basePath%>adminreim/${msg}.do',
            cache: false,
            dataType: 'text',
            success: function (data) {
                if ("msg" != data) {
                    location.href = "<%=basePath%>adminreim/findadminreim.do"

                } else {
                    confirm("保存失败")
                }
            }
        })
        $(".mask-button-size").attr("onclick", "null");
    }
    function ismon(paymon) {
        return (new RegExp(/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test(paymon));
    }



</script>
</body>
</html>
