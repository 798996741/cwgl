<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page language="java" import="com.fh.pojo.UserTicket" %>
<%@page language="java" import="com.fh.service.app.MTAuthorizationService" %>
<%@page language="java" import="com.fh.utils.WeiXinParamesUtil" %>
<%@page language="java" import="com.fh.utils.WeiXinUtil" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.fh.service.app.Contacts_UserService" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="com.fh.service.app.Contacts_DepartmentService" %>
<%@ page import="net.sf.json.JSONArray" %>
<%
    //	Jurisdiction jurisdiction=new Jurisdiction();
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8"/>
    <title>关联出差申请</title>
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="yes" name="apple-touch-fullscreen" />
    <meta content="telephone=no,email=no" name="format-detection" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="./static/weixin/js/jquery  .min.js"></script>

    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.min.css" />
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.picker.min.css" />
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.poppicker.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/common.css" />
</head>
<body>
<div class="detail-bg">
    <div id="slider" class="mui-slider">
        <div id="sliderSegmentedControl"
             class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
            <a class="mui-control-item" href="#item1mobile">
                本月
            </a>
            <a class="mui-control-item" href="#item2mobile">
                上月
            </a>
            <a class="mui-control-item" href="#item3mobile">
                全部
            </a>
        </div>
        <div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4"></div>
        <div class="mui-slider-group">
            <div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
                <c:forEach items="${tlist}" var="var" varStatus="vs">
                    <div class="record-item clearfix" onclick="edit('${var.id}','${var.submitter}','${var.busi_code}','${var.subuserid}','${pd.dept}')">
                        <div class="record-man">
                                ${var.submitter}
                        </div>
                        <div class="record-word">
                            <div>
                                申请部门：${var.dept}
                                <span class="color-gray fr">${var.subtime}</span>
                            </div>
                            <div>
                                出差编号：${var.busi_code}
                            </div>
                            <div>
                                备用金额：${var.premoney}元
                            </div>
                            <div>
                                收款账户：${var.credit}
                            </div>
                            <div>
                                备注：${var.remark}
                            </div>

                            <c:if test="${var.supsche == 0}">
                                <div class="color-red">
                                        ${var.supauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.supsche == 1}">
                                <div class="color-green">
                                        ${var.supauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.supsche == 2}">
                                <div class="color-orange">
                                        ${var.supauditor}审核不通过
                                </div>
                            </c:if>

                            <c:if test="${var.deptsche == 0}">
                                <div class="color-red">
                                        ${var.deptauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.deptsche == 1}">
                                <div class="color-green">
                                        ${var.deptauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.deptsche == 2}">
                                <div class="color-orange">
                                        ${var.deptauditor}审核不通过
                                </div>
                            </c:if>

                            <c:if test="${var.managersche == 0}">
                                <div class="color-red">
                                        ${var.managerauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.managersche == 1}">
                                <div class="color-green">
                                        ${var.managerauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.managersche == 2}">
                                <div class="color-orange">
                                        ${var.managerauditor}审核不通过
                                </div>
                            </c:if>
<%--                            <div class="color-red">--%>
<%--                                    ${var.auditor}--%>
<%--                                <c:if test="${var.busi_sche == 0}">--%>
<%--                                    审核中--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_sche == 1}">--%>
<%--                                    审核通过--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_sche == 2}">--%>
<%--                                    审核不通过--%>
<%--                                </c:if>--%>
<%--                                    ${var.manageraudit}--%>
<%--                                <c:if test="${var.busi_managersche == 0}">--%>
<%--                                    审核中--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_managersche == 1}">--%>
<%--                                    审核通过--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_managersche == 2}">--%>
<%--                                    审核不通过--%>
<%--                                </c:if>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="item2mobile" class="mui-slider-item mui-control-content">
                <c:forEach items="${llist}" var="var" varStatus="vs">
                    <div class="record-item clearfix" onclick="edit('${var.id}','${var.submitter}','${var.busi_code}','${var.subuserid}','${pd.dept}');">
                        <div class="record-man">
                                ${var.submitter}
                        </div>
                        <div class="record-word">
                            <div>
                                申请部门：${var.dept}
                                <span class="color-gray fr">${var.subtime}</span>
                            </div>
                            <div>
                                出差编号：${var.busi_code}
                            </div>
                            <div>
                                备用金额：${var.premoney}元
                            </div>
                            <div>
                                收款账户：${var.credit}
                            </div>
                            <div>
                                备注：${var.remark}
                            </div>
                            <c:if test="${var.supsche == 0}">
                                <div class="color-red">
                                        ${var.supauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.supsche == 1}">
                                <div class="color-green">
                                        ${var.supauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.supsche == 2}">
                                <div class="color-orange">
                                        ${var.supauditor}审核不通过
                                </div>
                            </c:if>

                            <c:if test="${var.deptsche == 0}">
                                <div class="color-red">
                                        ${var.deptauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.deptsche == 1}">
                                <div class="color-green">
                                        ${var.deptauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.deptsche == 2}">
                                <div class="color-orange">
                                        ${var.deptauditor}审核不通过
                                </div>
                            </c:if>

                            <c:if test="${var.managersche == 0}">
                                <div class="color-red">
                                        ${var.managerauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.managersche == 1}">
                                <div class="color-green">
                                        ${var.managerauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.managersche == 2}">
                                <div class="color-orange">
                                        ${var.managerauditor}审核不通过
                                </div>
                            </c:if>
<%--                            <div class="color-red">--%>
<%--                                    ${var.auditor}--%>
<%--                                <c:if test="${var.busi_sche == 0}">--%>
<%--                                    审核中--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_sche == 1}">--%>
<%--                                    审核通过--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_sche == 2}">--%>
<%--                                    审核不通过--%>
<%--                                </c:if>--%>
<%--                                    ${var.manageraudit}--%>
<%--                                <c:if test="${var.busi_managersche == 0}">--%>
<%--                                    审核中--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_managersche == 1}">--%>
<%--                                    审核通过--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_managersche == 2}">--%>
<%--                                    审核不通过--%>
<%--                                </c:if>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="item3mobile" class="mui-slider-item mui-control-content">
                <c:forEach items="${alist}" var="var" varStatus="vs">
                    <div class="record-item clearfix" onclick="edit('${var.id}','${var.submitter}','${var.busi_code}','${var.subuserid}','${pd.dept}');">
                        <div class="record-man">
                                ${var.submitter}
                        </div>
                        <div class="record-word">
                            <div>
                                申请部门：${var.dept}
                                <span class="color-gray fr">${var.subtime}</span>
                            </div>
                            <div>
                                出差编号：${var.busi_code}
                            </div>
                            <div>
                                备用金额：${var.premoney}元
                            </div>
                            <div>
                                收款账户：${var.credit}
                            </div>
                            <div>
                                备注：${var.remark}
                            </div>
                            <c:if test="${var.supsche == 0}">
                                <div class="color-red">
                                        ${var.supauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.supsche == 1}">
                                <div class="color-green">
                                        ${var.supauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.supsche == 2}">
                                <div class="color-orange">
                                        ${var.supauditor}审核不通过
                                </div>
                            </c:if>

                            <c:if test="${var.deptsche == 0}">
                                <div class="color-red">
                                        ${var.deptauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.deptsche == 1}">
                                <div class="color-green">
                                        ${var.deptauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.deptsche == 2}">
                                <div class="color-orange">
                                        ${var.deptauditor}审核不通过
                                </div>
                            </c:if>

                            <c:if test="${var.managersche == 0}">
                                <div class="color-red">
                                        ${var.managerauditor}暂未审核
                                </div>
                            </c:if>
                            <c:if test="${var.managersche == 1}">
                                <div class="color-green">
                                        ${var.managerauditor}审核通过
                                </div>
                            </c:if>
                            <c:if test="${var.managersche == 2}">
                                <div class="color-orange">
                                        ${var.managerauditor}审核不通过
                                </div>
                            </c:if>
<%--                            <div class="color-red">--%>
<%--                                    ${var.auditor}--%>
<%--                                <c:if test="${var.busi_sche == 0}">--%>
<%--                                    审核中--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_sche == 1}">--%>
<%--                                    审核通过--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_sche == 2}">--%>
<%--                                    审核不通过--%>
<%--                                </c:if>--%>
<%--                                    ${var.manageraudit}--%>
<%--                                <c:if test="${var.busi_managersche == 0}">--%>
<%--                                    审核中--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_managersche == 1}">--%>
<%--                                    审核通过--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${var.busi_managersche == 2}">--%>
<%--                                    审核不通过--%>
<%--                                </c:if>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<script src="./static/weixin/js/mui.min.js"></script>
<script src="./static/weixin/js/mui.picker.min.js"></script>
<script src="./static/weixin/js/mui.poppicker.js"></script>
<script src="./static/weixin/js/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="./static/weixin/js/city.data-3.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    function edit(id,submitter,busi_code,userid,dept) {
        if ('${msg}'=='submitter'){
            location.href ="<%=basePath%>app_reim/putrelevanbusi.do?id="+id+"&submitter="+encodeURI(encodeURI(submitter))+"&busi_code="+encodeURI(encodeURI(busi_code))+"&userid="+userid+"&dept="+dept;
        }
    }
   

</script>

</body>
</html>
