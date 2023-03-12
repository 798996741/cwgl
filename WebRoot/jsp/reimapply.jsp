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
<%@ page import="com.fh.utils.refreshToken" %>
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
    <title>报销申请</title>
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="yes" name="apple-touch-fullscreen"/>
    <meta content="telephone=no,email=no" name="format-detection"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="./static/weixin/js/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.poppicker.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/common.css"/>
</head>
<body>
<%
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String depa = "";
    String name = "";
    String deptname = "";
    String accessToken = "";
    MTAuthorizationService mts = new MTAuthorizationService();
    refreshToken refreshToken = new refreshToken();
    accessToken = refreshToken.IsExistAccess_Token();

    //获取成员信息
    JSONObject userInfo = mts.getUserInfo(accessToken, code);
    System.out.println("userInfo:" + userInfo);
    //3.获取成员
    Contacts_UserService cus = new Contacts_UserService();
    String userId = "";
    if (userInfo.has("UserId")) {
        userId = userInfo.getString("UserId");
        JSONObject userDetail = cus.getUser(accessToken, userId);
        String dept = userDetail.getString("department");
        name = userDetail.getString("name");
        String regEx = "[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(dept);
        String trim = m.replaceAll("").trim();
        depa = trim.substring(0, 1);

//        Contacts_DepartmentService cds = new Contacts_DepartmentService();
//        JSONObject departmentList = cds.getDepartmentList(accessToken, depa);
//        JSONArray department = departmentList.getJSONArray("department");
//        deptname = department.getJSONObject(0).getString("name");
    }


%>
<div class="detail-bg">
    <section>
        <div class="blue-block">
            <i></i>
            <p>报销申请</p>
        </div>
        <form acrtion="" method="post" id="form_main">
            <input type="hidden" name="subuserid" id="subuserid" value="${pd.userid}"/>
            <input type="hidden" name="dept" id="dept" value="${pd.dept}"/>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>关联出差申请单</label>
                <div class="form-content">
                    <div class="form-input" style="width: 86%;">
                        <input type="text" autocomplete="off" class="form-input__inner" id="busi_code" name="busi_code"
                               readonly="readonly" onclick="getbusi();" value=""/>
                    </div>
                    <div class="mui-icon mui-icon-plus add-icon">
                    </div>
                </div>
            </div>
<%--            <div class="form-item">--%>
<%--                <label class="form-label">--%>
<%--                    <span class="color-red">| </span>报销公司</label>--%>
<%--                <div class="form-content form-date">--%>
<%--                    <div id="showeduPicker" class="selectPicker">--%>
<%--                        请选择报销公司--%>
<%--                        <div class="down-icon"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <input value="" name="company" id="company" type="hidden">
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>报销人</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" class="form-input__inner" value="<%=name%>"/>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <section>


        <div class="bottom-submit-big" onclick="subform();">
            提交
        </div>
    </section>
</div>

<script src="./static/weixin/js/mui.min.js"></script>
<script src="./static/weixin/js/mui.picker.min.js"></script>
<script src="./static/weixin/js/mui.poppicker.js"></script>
<script src="./static/weixin/js/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="./static/weixin/js/city.data-3.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">

    window.onload = function () {
        var busiid = document.getElementById("busiid").value;
        if (busiid == null) {
            document.getElementById("hidden").style.display = 'none';
        }
    }
    var bool1=true;
    function subform() {
        if (bool1){
        var obj = {};
        var form_main = $('#form_main').serializeArray();
        for (var i in form_main) {
            obj[form_main[i].name] = form_main[i].value;
        }
        var count='${pd.count}';
        for (var i = 1; i <= count; i++) {
            var formlist = $('#form' + i).serializeArray();
            obj["busi_project" + i] = $("#busi_project" + i).val();
            obj["reason" + i] = $("#reason" + i).val();
            obj["trip_mode" + i] = $("#trip_mode" + i).val();
            obj["busi_startcity" + i] = $("#busi_startcity" + i).val();
            obj["busi_endcity" + i] = $("#busi_endcity" + i).val();
            obj["busi_starttime" + i] = $("#busi_starttime" + i).val();
            obj["busi_endtime" + i] = $("#busi_endtime" + i).val();
            obj["busi_endtime" + i] = $("#busi_time" + i).val();
            obj["billnum" + i] = $("#billnum" + i).val();
            obj["tripmon" + i] = $("#tripmon" + i).val();
            obj["hostelmon" + i] = $("#hostelmon" + i).val();
            obj["mission" + i] = $("#mission" + i).val();
            obj["realmon" + i] = $("#realmon" + i).val();
        }
        obj["count"] = count;
        $.ajax({
            type: 'post',
            data: obj,
            url: '<%=basePath%>app_busi/submit.do',
            cache: false,
            dataType: 'json',
            async: false,
            success: function (data) {

            }
        })
            bool1=false;
        }
    }
    function getbusi() {

        location.href = '<%=basePath%>app_reim/relevanbusi.do?submitter=' + encodeURI(encodeURI('<%=name%>'))+'&userid='+ '<%=userId%>'+'&dept='+ '<%=depa%>';
        <%--var submitter="<%=name%>";--%>
        <%--$.ajax({--%>
        <%--    type: 'post',--%>
        <%--    url: '<%=basePath%>app_reim/relevanbusi.do',--%>
        <%--    data:{submitter:submitter},--%>
        <%--    cache: false,--%>
        <%--    dataType: 'json',--%>
        <%--    success: function (data) {--%>
        <%--        console.log(data + "data");--%>
        <%--        console.log(data.list[0].name + "data.list");--%>
        <%--        for (var i = 0; i < data.list.length; i++) {--%>

        <%--        }--%>
        <%--        // console.log(getbusipj)--%>
        <%--    }--%>
        <%--})--%>
    }

    (function ($) {
        $.init();
        $.ready(function () {

            var _getParam = function (obj, param) {
                return obj[param] || '';
            };
            // 报销公司
            var eduPicker = new $.PopPicker();
            var getbusipj = [];
            $.ajax({
                type: 'post',
                url: '<%=basePath%>app_reim/getcompany',
                // cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data + "data");
                    console.log(data.list[0].csname + "data.list");
                    for (var i = 0; i < data.list.length; i++) {
                        getbusipj.push({value: data.list[i].csname, text: data.list[i].csname})
                        eduPicker.setData(getbusipj);
                    }
                    // console.log(getbusipj)
                }
            })

            console.log(getbusipj);

            // eduPicker.setData([{
            //     value: '1',
            //     text: '宇伦'
            // },
            //     {
            //         value: '2',
            //         text: '宇伦2'
            //     }
            // ]);
            var showeduPickerButton = document.getElementById(
                'showeduPicker'
            );
            var company=document.getElementById("company");
            showeduPickerButton.addEventListener(
                'tap',
                function (event) {
                    eduPicker.show(function (items) {
                        console.log(items[0]);
                        showeduPickerButton.innerText = _getParam(items[0],'text');
                        company.value= _getParam(items[0],'text');
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                },
                false
            );

        });
    })(mui);

    function addmon() {
        var tripmon=document.getElementById("tripmon");
        var hostelmon=document.getElementById("hostelmon");
        var mission=document.getElementById("mission");
        var realmon=document.getElementById("realmon");
        if (tripmon.value!="" && tripmon.value!=undefined && hostelmon.value!="" && hostelmon.value!=undefined && mission.value!="" && mission.value!=undefined){
            realmon.value(Number(tripmon.value+hostelmon.value+mission.value));
        }
    }
</script>

</body>
</html>
