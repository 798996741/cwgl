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
<%@ page import="com.fh.utils.refreshToken" %>
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
    <title>加载中...</title>

    <script src="./static/weixin/js/jquery.min.js"></script>
    <script src="http://rescdn.qqmail.com/node/ww/wwopenmng/js/sso/wwLogin-1.0.0.js"></script>
</head>
<body>

<%
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String depa = "";
    String name = "";
    String deptname = "";
    MTAuthorizationService mts = new MTAuthorizationService();

    String accessToken ="";
    refreshToken refreshToken = new refreshToken();
    accessToken = refreshToken.IsExistAccess_Token();
    //获取成员信息
    JSONObject userInfo = mts.getUserInfo(accessToken, code);
    System.out.println("userInfo:" + userInfo);
    //3.获取成员
    Contacts_UserService cus = new Contacts_UserService();
    String userId ="";
    if (userInfo.has("UserId")){
        userId = userInfo.getString("UserId");
        JSONObject userDetail = cus.getUser(accessToken, userId);
        name = userDetail.getString("name");

    }



%>
</body>
<script type="text/javascript">
        window.location.href = "<%=basePath%>app_busi/appbusilog.do?submitter=" + encodeURI(encodeURI("<%=name%>"));
</script>
</html>