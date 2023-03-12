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
                    <font style="color: red;">*</font>公司名称
                  </span>
                            <select class="mask-select" name="company" id="company">
                                <option value="" selected></option>
                                <c:forEach items="${getcsname}" var="csname" varStatus="vs">
                                    <option value="${csname.csname}"
                                            <c:if test="${csname.csname==obj.company}">selected</c:if>
                                    > ${csname.csname}</option>

                                </c:forEach>
                                </option>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>微信名称
                  </span>
                            <input type="text" class="mask-input" name="subuserid" id="subuserid"
                                   value="${obj.subuserid }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>审核编号
                  </span>
                            <input type="text" class="mask-input" name="reim_code" id="reim_code"
                                   value="${obj.reim_code }"/>
                        </div>

                    </div>
                    <div class="between-center">
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>提交人
                  </span>
                            <input type="text" class="mask-input" name="submitter" id="submitter"
                                   value="${obj.submitter }"/>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>提交时间
                  </span>
                            <input class="date-picker" name="submittime" id="submittime" autoComplete="off"
                                   value="${obj.submittime }" type="text" data-date-format="yyyy-mm-dd"
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
                    <font style="color: red;">*</font>上级
                  </span>
                            <input class="mask-input" name="supauditor" id="supauditor" value="${obj.supauditor}"
                            />
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>上级<br/>审核时间
                  </span>
                            <input class="date-picker" name="supauditime" id="supauditime" autoComplete="off"
                                   value="${obj.supauditime }" type="text" data-date-format="yyyy-mm-dd"
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
                        <div class="between-center padding-8px"
                             style="display: flex;flex-direction:row;justify-content: space-between;">
                            <span class="mask-size"><font style="color: red;">*</font>上级<br/>审核状态</span>
                            <select class="mask-select"  name="supsche" id="supsche">
                                <option value="0"
                                        <c:if test="${obj.supsche=='0'}">selected</c:if>
                                > 暂未审核
                                </option>
                                <option value="1"
                                        <c:if test="${obj.supsche=='1'}">selected</c:if>
                                > 审核通过
                                </option>
                                <option value="2"
                                        <c:if test="${obj.supsche=='2'}">selected</c:if>
                                > 审核不通过
                                </option>
                            </select>
                        </div>

                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>财务
                  </span>
                            <input type="text" class="mask-input" name="deptauditor" id="deptauditor"
                                   value="${obj.deptauditor }"/>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>财务<br/>审核时间
                  </span>
                            <input class="date-picker" name="depttime" id="depttime" autoComplete="off"
                                   value="${obj.depttime }" type="text" data-date-format="yyyy-mm-dd"
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
                        <div class="between-center padding-8px"
                             style="display: flex;flex-direction:row;justify-content: space-between;">
                            <span class="mask-size"><font style="color: red;">*</font>财务<br/>审核状态</span>
                            <select class="mask-select"  name="deptsche" id="deptsche">
                                <option value="0"
                                        <c:if test="${obj.deptsche=='0'}">selected</c:if>
                                > 暂未审核
                                </option>
                                <option value="1"
                                        <c:if test="${obj.deptsche=='1'}">selected</c:if>
                                > 审核通过
                                </option>
                                <option value="2"
                                        <c:if test="${obj.deptsche=='2'}">selected</c:if>
                                > 审核不通过
                                </option>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>总经理
                  </span>
                            <input type="text" class="mask-input" name="managerauditor" id="managerauditor"
                                   value="${obj.managerauditor }"/>
                        </div>
                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                  <span class="mask-size flex-row-between">
                    <font style="color: red;">*</font>总经理<br/>审核时间
                  </span>
                            <input class="date-picker" name="managertime" id="managertime" autoComplete="off"
                                   value="${obj.managertime }" type="text" data-date-format="yyyy-mm-dd"
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
                        <div class="between-center padding-8px"
                             style="display: flex;flex-direction:row;justify-content: space-between;">
                            <span class="mask-size"><font style="color: red;">*</font>总经理<br/>审核状态</span>
                            <select class="mask-select"  name="managersche" id="managersche">
                                <option value="0"
                                        <c:if test="${obj.managersche=='0'}">selected</c:if>
                                > 暂未审核
                                </option>
                                <option value="1"
                                        <c:if test="${obj.managersche=='1'}">selected</c:if>
                                > 审核通过
                                </option>
                                <option value="2"
                                        <c:if test="${obj.managersche=='2'}">selected</c:if>
                                > 审核不通过
                                </option>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size">
                    <font style="color: red;">*</font>关联出差<br/>申请单
                  </span>
                            <input type="text" class="mask-input" name="busi_code" id="busi_code"
                                   value="${obj.busi_code }"/>
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
    function ismon(paymon) {
        return (new RegExp(/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test(paymon));
    }

    function save() {

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




    function editContmon(conid) {
// top.jzts();
        var winId = "ContmonWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>sell/findContmon.do?conid=' + conid
            /*, hideFunc:function(){
            modals.info("hide me");
            },
            showFunc:function(){
            modals.info("show me");
            } */
        });
        return false;
    }




</script>
</body>
</html>
