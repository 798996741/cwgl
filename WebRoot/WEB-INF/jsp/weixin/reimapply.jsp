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
<%--<%--%>
<%--    String code = request.getParameter("code");--%>
<%--    String state = request.getParameter("state");--%>
<%--    String depa = "";--%>
<%--    String name = "";--%>
<%--    String deptname = "";--%>
<%--    MTAuthorizationService mts = new MTAuthorizationService();--%>
<%--    String accessToken = WeiXinUtil.getAccessToken(WeiXinParamesUtil.corpId, WeiXinParamesUtil.agentSecret).getToken();--%>
<%--    //获取成员信息--%>
<%--    JSONObject userInfo = mts.getUserInfo(accessToken, code);--%>
<%--    System.out.println("userInfo:" + userInfo);--%>
<%--    //3.获取成员--%>
<%--    Contacts_UserService cus = new Contacts_UserService();--%>
<%--    String userId = "";--%>
<%--    if (userInfo.has("UserId")) {--%>
<%--        userId = userInfo.getString("UserId");--%>
<%--        JSONObject userDetail = cus.getUser(accessToken, userId);--%>
<%--        String dept = userDetail.getString("department");--%>
<%--        name = userDetail.getString("name");--%>
<%--        String regEx = "[^0-9]";--%>
<%--        Pattern p = Pattern.compile(regEx);--%>
<%--        Matcher m = p.matcher(dept);--%>
<%--        String trim = m.replaceAll("").trim();--%>
<%--        depa = trim.substring(0, 1);--%>

<%--        Contacts_DepartmentService cds = new Contacts_DepartmentService();--%>
<%--        JSONObject departmentList = cds.getDepartmentList(accessToken, depa);--%>
<%--        JSONArray department = departmentList.getJSONArray("department");--%>
<%--        deptname = department.getJSONObject(0).getString("name");--%>
<%--    }--%>


<%--%>--%>
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
                               readonly="readonly" value="${pd.busi_code}"/>
                    </div>
                    <div class="mui-icon mui-icon-plus add-icon">
                    </div>
                </div>
            </div>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>报销人</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" name="submitter" id="submitter" class="form-input__inner" value="${pd.submitter}"/>
                    </div>
                </div>
            </div>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>报销公司</label>
                <div class="form-content form-date">
                    <div id="showeduPicker" class="selectPicker">
                        请选择报销公司
                        <div class="down-icon"></div>
                    </div>
                </div>
            </div>
            <input value="" name="company" id="company" type="hidden">
            <div id="exacompany"></div>
        </form>
    </section>
    <section>
        <div id="hidden">
            <c:forEach items="${list}" var="var" varStatus="vs">
                <form acrtion="" method="post" id="form${vs.count}">
                    <div class="blue-block">
                        <i></i>
                        <p>行程${vs.count}</p>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>所属项目</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="busi_project${vs.count}" name="busi_project${vs.count}"
                                       value="${var.busi_project}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>出差事由</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       value="${var.reason}" id="reason${vs.count}" name="reason${vs.count}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>交通工具</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="trip_mode${vs.count}" name="trip_mode${vs.count}"
                                       value="${var.trip_mode}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>开始城市</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="busi_startcity${vs.count}" name="busi_startcity${vs.count}"
                                       value="${var.busi_startcity}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>目的城市</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="busi_endcity${vs.count}" name="busi_endcity${vs.count}"
                                       value="${var.busi_endcity}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>开始时间</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="busi_starttime${vs.count}" name="busi_starttime${vs.count}"
                                       value="${var.busi_starttime}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>结束时间</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="busi_endtime${vs.count}" name="busi_endtime${vs.count}"
                                       value="${var.busi_endtime}"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>时长（天）</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner"
                                       id="busi_time${vs.count}" name="busi_time${vs.count}"
                                       value="${var.busi_time}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>票据数量</label>
                        <div class="form-content mui-clearfix">
                            <div class="mui-numbox fr">
                                <button class="mui-btn mui-btn-numbox-minus" type="button">
                                    -
                                </button>
                                <input class="mui-input-numbox" type="number" style="height: 100%!important;"
                                       id="billnum${vs.count}" name="billnum${vs.count}"/>
                                <button class="mui-btn mui-btn-numbox-plus" type="button">
                                    +
                                </button>
                            </div>
                        </div>
                    </div>
                    <div id="exabillnum${vs.count}"></div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>交通金额</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" class="form-input__inner" id="tripmon${vs.count}"
                                       name="tripmon${vs.count}" onchange="addmon();"/>
                            </div>
                        </div>
                    </div>
                    <div id="exatripmon${vs.count}"></div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>住宿金额</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" class="form-input__inner"
                                       id="hostelmon${vs.count}" name="hostelmon${vs.count}"
                                       onchange="addmon();"/>
                            </div>
                        </div>
                    </div>
                    <div id="exahostelmon${vs.count}"></div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>出差补贴</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" class="form-input__inner" id="mission${vs.count}"
                                       name="mission${vs.count}" onchange="addmon();"/>
                            </div>
                        </div>
                    </div>
                    <div id="examission${vs.count}"></div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>实报金额</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" class="form-input__inner" id="realmon${vs.count}"
                                       name="realmon${vs.count}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div id="exarealmon${vs.count}"></div>
                </form>
            </c:forEach>
        </div>

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
        var busiid = document.getElementById("busiid");
        if (busiid.value == '') {
            document.getElementById("hidden").style.display = 'none';
        }
    }

    function ismon(paymon) {
        return (new RegExp(/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test(paymon));
    }

    function subform() {
        var count = '${pd.count}';
        for (var i = 1; i <= count; i++) {

            if( document.getElementById("company").value!="" ){
                document.getElementById("exacompany").innerHTML=""

            }else {
                document.getElementById("exacompany").innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">公司名称不可为空</span>"
                return false;
            }
            if(document.getElementById("billnum" + i).value!=""){
                document.getElementById("exabillnum"+i).innerHTML=""
            }else {
                document.getElementById("exabillnum"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">票据数量不可为空</span>"
                return false;
            }
            if(ismon(document.getElementById("tripmon" + i).value)){
                document.getElementById("exatripmon"+i).innerHTML=""
            }else {

                document.getElementById("exatripmon"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">交通金额格式错误</span>"
                return false;
            }
            if(document.getElementById("tripmon" + i).value!=""){
                document.getElementById("exatripmon"+i).innerHTML=""
            }else {

                document.getElementById("exatripmon"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">交通金额不可为空</span>"
                return false;
            }
            if(ismon(document.getElementById("hostelmon" + i).value)){
                document.getElementById("exahostelmon"+i).innerHTML=""
            }else {

                document.getElementById("exahostelmon"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">住宿金额格式错误</span>"
                return false;
            }
            if(document.getElementById("hostelmon" + i).value!="" ){
                document.getElementById("exahostelmon"+i).innerHTML=""
            }else {

                document.getElementById("exahostelmon"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">住宿金额不可为空</span>"
                return false;
            }
            if(ismon(document.getElementById("mission" + i).value)){
                document.getElementById("examission"+i).innerHTML=""
            }else {

                document.getElementById("examission"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">出差补贴格式错误</span>"
                return false;
            }
            if(document.getElementById("mission" + i).value!="" ){
                document.getElementById("examission"+i).innerHTML=""
            }else {

                document.getElementById("examission"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">出差补贴不可为空</span>"
                return false;
            }
            if(ismon(document.getElementById("realmon" + i).value)){
                document.getElementById("exarealmon"+i).innerHTML=""
            }else {

                document.getElementById("exarealmon"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">实报金额格式错误</span>"
                return false;
            }
            if(document.getElementById("realmon" + i).value!=""){
                document.getElementById("exarealmon"+i).innerHTML=""
            }else {
                document.getElementById("exarealmon"+i).innerHTML="<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">实报金额不可为空</span>"
                return false;
            }

        }



        var obj = {};
        var form_main = $('#form_main').serializeArray();
        for (var i in form_main) {
            obj[form_main[i].name] = form_main[i].value;
        }

        for (var i = 1; i <= count; i++) {
            var formlist = $('#form' + i).serializeArray();
            obj["busi_project" + i] = $("#busi_project" + i).val();
            obj["reason" + i] = $("#reason" + i).val();
            obj["trip_mode" + i] = $("#trip_mode" + i).val();
            obj["busi_startcity" + i] = $("#busi_startcity" + i).val();
            obj["busi_endcity" + i] = $("#busi_endcity" + i).val();
            obj["busi_starttime" + i] = $("#busi_starttime" + i).val();
            obj["busi_endtime" + i] = $("#busi_endtime" + i).val();
            obj["busi_time" + i] = $("#busi_time" + i).val();
            obj["billnum" + i] = $("#billnum" + i).val();
            obj["tripmon" + i] = $("#tripmon" + i).val();
            obj["hostelmon" + i] = $("#hostelmon" + i).val();
            obj["mission" + i] = $("#mission" + i).val();
            obj["realmon" + i] = $("#realmon" + i).val();
        }
        obj["count"] = count;
        obj["dept"] = "${pd.dept}";
        $.ajax({
            type: 'post',
            data: obj,
            url: '<%=basePath%>app_reim/submit.do',
            cache: false,
            dataType: 'json',
            async: false,
            success: function (data) {

            }
        })
        location.href = "<%=basePath%>app_reim/reimlog.do?submitter=" + encodeURI(encodeURI("${pd.submitter}"));
    }

    function getbusi() {
        location.href = '<%=basePath%>app_reim/relevanbusi.do?submitter=' + encodeURI(encodeURI('${pd.submitter}')) + '&userid=' + '${pd.userid}' + '&dept=' + '${pd.dept}';
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
                cache: false,
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
            var company = document.getElementById("company");
            showeduPickerButton.addEventListener(
                'tap',
                function (event) {
                    eduPicker.show(function (items) {
                        console.log(items[0]);
                        showeduPickerButton.innerText = _getParam(items[0], 'text');
                        company.value = _getParam(items[0], 'text');
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                },
                false
            );

        });
    })(mui);
    var countadd = '${pd.count}';

    function addmon() {
        for (var i = 1; i <= countadd; i++) {
            if (document.getElementById("tripmon" + i).value != "" && document.getElementById("tripmon" + i).value != undefined
                && document.getElementById("hostelmon" + i).value != "" && document.getElementById("hostelmon" + i).value != undefined
                && document.getElementById("mission" + i).value != "" && document.getElementById("mission" + i).value != undefined) {
                document.getElementById("realmon" + i).value = Number(document.getElementById("tripmon" + i).value) + Number(document.getElementById("hostelmon" + i).value) + Number(document.getElementById("mission" + i).value);
            }
        }


    }
</script>

</body>
</html>
