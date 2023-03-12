<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"     %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>出差申请纪录</title>
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="yes" name="apple-touch-fullscreen"/>
    <meta content="telephone=no,email=no" name="format-detection"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
<%--    <script src="/static/weixin/js/jquery.min.js"></script>--%>
    <script src="./static/weixin/js/jquery.min.js"></script>


    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.poppicker.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/common.css"/>
</head>
<body>
<div>
    <div class="record-status">待审批</div>
    <%--    <div class="record-month">本月(1)</div>--%>
    <c:forEach items="${nlist}" var="var" varStatus="vs">
        <div class="record-item clearfix" onclick="edit('${var.id}');">
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
                <div class="color-red">
                        ${var.auditor}
                    <c:if test="${var.busi_sche == 0}">
                        暂未审核
                    </c:if>
                    <c:if test="${var.busi_sche == 1}">
                        审核通过
                    </c:if>
                    <c:if test="${var.busi_sche == 2}">
                        审核不通过
                    </c:if>
                        ${var.manageraudit}
                    <c:if test="${var.busi_managersche == 0}">
                        暂未审核
                    </c:if>
                    <c:if test="${var.busi_managersche == 1}">
                        审核通过
                    </c:if>
                    <c:if test="${var.busi_managersche == 2}">
                        审核不通过
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="record-status">已审批</div>
    <%--    <div class="record-month">本月(1)</div>--%>
    <c:forEach items="${ylist}" var="var" varStatus="vs">
        <div class="record-item clearfix" onclick="edit('${var.id}');">
            <div class="record-man">
                    ${var.submitter}
            </div>
            <div class="record-word">
                <div>
                    出差编号：${var.busi_code}
                    <span class="color-gray fr">${var.subtime}</span>
                </div>
                <div>
                    申请部门：${var.dept}
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
                <div class="color-green">
                    <c:if test="${var.busi_sche == 0}">
                        审核中
                    </c:if>
                    <c:if test="${var.busi_sche == 1}">
                        审核通过
                    </c:if>
                    <c:if test="${var.busi_sche == 2}">
                        审核不通过
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<script type="text/javascript">
    if ('${msg}'=='submitter'){
        location.href = "<%=basePath%>app_busi/findById.do?id="+id;
    }else if ('${msg}'=='auditor'){
        location.href = "<%=basePath%>app_busi/findauditById.do?id="+id+"&auditor="+"${pd.auditor}"+"&manageraudit="+'${pd.manageraudit}';
    }

</script>
</body>
</html>