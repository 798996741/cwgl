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
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>审核结果</title>
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="yes" name="apple-touch-fullscreen"/>
    <meta content="telephone=no,email=no" name="format-detection"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="/static/weixin/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/weixin/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/weixin/css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/weixin/css/mui.poppicker.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/static/weixin/css/common.css"/>
</head>
<body>
<div>
    <div class="ada-table ada-table-bluebg">
        您的审核结果为：
        <c:if test="${pd.busi_sche == 1}">
            审核通过
        </c:if>
        <c:if test="${pd.busi_sche == 2}">
            审核不通过
        </c:if>
        审核结束请关闭页面，如需继续审核则点击按钮
        <table cellspacing="0" cellpadding="0" border="0" class="ada-table__header">
                    <td>
                        <div class="cell">
                                <span class="btn-opt bg-green" onclick="editor();">
                                    返回审核
                                </span>
                        </div>
                    </td>

                </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    function editor() {
        location.href = "<%=basePath%>app_busi/findByauditor.do?auditor="+"${pd.auditor}";
    }

</script>
</body>
</html>