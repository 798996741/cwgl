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
    <title>出差申请</title>
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
    MTAuthorizationService mts = new MTAuthorizationService();

    refreshToken refreshToken = new refreshToken();
    String accesstoken = refreshToken.IsExistAccess_Token();

//    accessToken = WeiXinUtil.getAccessToken(WeiXinParamesUtil.corpId, WeiXinParamesUtil.agentSecret).getToken();

    //获取成员信息
    JSONObject userInfo = mts.getUserInfo(accesstoken, code);

    System.out.println("userInfo:" + userInfo);
    //3.获取成员
    Contacts_UserService cus = new Contacts_UserService();
    String userId = "";
    if (userInfo.has("UserId")) {
        userId = userInfo.getString("UserId");
        JSONObject userDetail = cus.getUser(accesstoken, userId);
        String dept = userDetail.getString("department");
        name = userDetail.getString("name");
        String regEx = "[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(dept);
        String trim = m.replaceAll("").trim();
        depa = trim.substring(0, 1);

//        accessToken = WeiXinUtil.getAccessToken(WeiXinParamesUtil.corpId, WeiXinParamesUtil.agentSecret).getToken();
        Contacts_DepartmentService cds = new Contacts_DepartmentService();
        JSONObject departmentList = cds.getDepartmentList(accesstoken, depa);
        JSONArray department = departmentList.getJSONArray("department");
        deptname = department.getJSONObject(0).getString("name");
    }


%>
<div class="detail-bg">
    <section>
        <div class="blue-block">
            <i></i>
            <p>出差申请</p>
        </div>
        <form acrtion="" method="post" id="formuser">
            <input type="hidden" name="subuserid" id="subuserid" value="<%=userId%>"/>
            <input type="hidden" name="department" id="department" value="<%=depa%>"/>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>
                    申请人</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" class="form-input__inner" value="<%=name%>"
                               name="submitter" id="submitter" readonly="readonly">
                    </div>
                </div>

            </div>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>
                    所属部门</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" class="form-input__inner" value="<%=deptname%>"
                               name="dept" id="dept" readonly="readonly">
                    </div>
                </div>
            </div>

        </form>
        <div id="form">
            <form acrtion="" method="post" id="form1">

                <div class="blue-block">
                    <i></i>
                    <p>行程1</p>
                </div>
                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>所属项目</label>
                    <div class="form-content form-date">
                        <div id='showeduPicker1' class="selectPicker">请选择所属项目
                            <div class="down-icon"></div>
                        </div>
                    </div>
                </div>
                <div id="exabusi_project1"></div>
                <input type="hidden" name="busi_project1" id="busi_project1" value=""/>
                <div class="form-item" id="orther1">
                     <textarea autocomplete="off" placeholder="请输入其他项目" class="form-input__inner"
                               style="min-height: 54px; height: 54px;" data-value="" value="" name="ortherpj1"
                               id="ortherpj1"
                     ></textarea>
                </div>
                <div id="exaortherpj1"></div>
                <div>
                    <textarea autocomplete="off" placeholder="请输入出差事由" class="form-input__inner"
                              style="min-height: 54px; height: 54px;" data-value="" value="" name="reason1" id="reason1"
                    ></textarea>
                </div>
                <div id="exareason1"></div>
                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>交通工具</label>
                    <div class="form-content form-date">
                        <div id='showeduPicker2' class="selectPicker">请选择交通工具
                            <div class="down-icon"></div>
                        </div>
                    </div>
                </div>
                <div id="exatrip_mode1"></div>
                <input type="hidden" name="trip_mode1" id="trip_mode1" value=""/>

                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>出发城市</label>
                    <div class="form-content form-date">
                        <div id="showCityPicker1">
                            请选择您所在的出发城市
                            <div class="down-icon"></div>
                        </div>
                    </div>
                </div>
                <div id="exabusi_startcity1"></div>
                <input type="hidden" name="busi_startcity1" id="busi_startcity1" value=""/>
                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>目的城市</label>
                    <div class="form-content form-date">
                        <div id="showCityPicker2">
                            请选择您所在的目的城市
                            <div class="down-icon"></div>
                        </div>
                    </div>
                </div>
                <div id="exabusi_endcity1"></div>
                <input type="hidden" name="busi_endcity1" id="busi_endcity1" value=""/>
                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>
                        开始时间</label>
                    <div class="form-content">
                        <div class="btn1 date selectPicker" id="dateResult1" data-options1='{"type":"datetime"}'>请选择开始时间
                            <div class="down-icon"></div>
                        </div>
                    </div>
                </div>
                <div id="exabusi_starttime1"></div>
                <input type="hidden" name="busi_starttime1" id="busi_starttime1" value=""/>
                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>
                        结束时间</label>
                    <div class="form-content">
                        <div class="btn2 date selectPicker" id="dateResult2" data-options2='{"type":"datetime"}'>请选择结束时间
                            <div class="down-icon"></div>
                        </div>
                    </div>
                </div>
                <div id="exabusi_endtime1"></div>
                <input type="hidden" name="busi_endtime1" id="busi_endtime1" value=""/>
                <div class="form-item">
                    <label class="form-label">
                        <span class="color-red">| </span>
                        时长（天）</label>
                    <div class="form-content">
                        <div class="form-input">
                            <input type="text" autocomplete="off" class="form-input__inner" id="busi_time1"
                                   name="busi_time1" readonly="readonly">
                        </div>
                    </div>
                </div>

            </form>
        </div>
        <div class="form-add" onclick="appendform();">
            + 增加行程
        </div>
        <%--        <div class="form-add" onclick="appendform();">--%>
        <%--            - 删除行程--%>
        <%--        </div>--%>
        <div class="form-item">
            <label class="form-label">
                <span class="color-red">| </span>
                出差天数</label>
            <div class="form-content">
                <div class="form-input">
                    <input type="text" autocomplete="off" class="form-input__inner" value="0" id="busi_day"
                           name="busi_day" readonly="readonly" form="formuser">
                </div>
            </div>
        </div>

        <div class="blue-block">
            <i></i>
            <p>申请备用金</p>
        </div>
        <div class="form-item">
            <label class="form-label">
                <span class="color-red">| </span>
                是否申请备用金</label>
            <div class="form-content selectPicker">
                <input type="radio" name="partyMember" value="yes" /> 是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="partyMember" value="no" checked/> 否
            </div>
        </div>
        <div id="backmoney">


            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>
                    申请金额</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" class="form-input__inner" id="premoney"
                               name="premoney" value="" form="formuser">
                    </div>
                </div>
            </div>
            <div id="exapremoney"></div>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>
                    收款账户</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" class="form-input__inner" id="credit" name="credit"
                               value="" form="formuser">
                    </div>
                </div>
            </div>
            <div id="exacredit"></div>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>
                    归还时间</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" class="form-input__inner" id="backtime" name="backtime"
                               value="0" form="formuser" readonly="readonly">
                    </div>
                </div>
            </div>
            <div>
        <textarea autocomplete="off" placeholder="请输入其他说明" class="form-input__inner"
                  style="min-height: 54px; height: 54px;" id="remark" name="remark" data-value="" form="formuser"
                  value=""></textarea>
            </div>
        </div>
        <div style="height: 50px"></div>

        <div class="bottom-submit-big" onclick="submitadd();">
            提交
        </div>

        <div style="height: 50px"></div>

    </section>

</div>

<script src="./static/weixin/js/mui.min.js"></script>
<script src="./static/weixin/js/mui.picker.min.js"></script>
<script src="./static/weixin/js/mui.poppicker.js"></script>
<script src="./static/weixin/js/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="./static/weixin/js/city.data-3.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">



    var count = 1;

    function appendform() {
        count++;
        console.log(count)
        var form = document.createElement("div");
        form.id = count;
        form.innerHTML = "<form acrtion=\"\" method=\"post\" id=\"form" + count + "\">\n" +
            "\n" +
            "                <div class=\"blue-block\">\n" +
            "                    <i></i>\n" +
            "                    <p>行程" + count + "</p>\n" +
            "                </div>\n" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>所属项目</label>\n" +
            "                    <div class=\"form-content form-date\">\n" +
            "                        <div id='showeduPicker1" + count + "' class=\"selectPicker\">请选择所属项目\n" +
            "                            <div class=\"down-icon\"></div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" + "<div id=\"exabusi_project" + count + "\"></div>" +
            "                <input type=\"hidden\" name=\"busi_project" + count + "\" id=\"busi_project" + count + "\" value=\"\"/>\n" +
            "               <div class=\"form-item\" id=\"orther" + count + "\">\n" +
            "                     <textarea autocomplete=\"off\" placeholder=\"请输入其他项目\" class=\"form-input__inner\"\n" +
            "                               style=\"min-height: 54px; height: 54px;\" data-value=\"\" value=\"\" name=\"ortherpj" + count + "\" id=\"ortherpj" + count + "\" \n" +
            "                     ></textarea>\n" +
            "                </div>" +"<div id=\"exaortherpj" + count + "\"></div>"+
            "                <div>\n" +
            "                    <textarea autocomplete=\"off\" placeholder=\"请输入出差事由\" class=\"form-input__inner\"\n" +
            "                              style=\"min-height: 54px; height: 54px;\" data-value=\"\" value=\"\" name=\"reason" + count + "\" id=\"reason" + count + "\"\n" +
            "                    ></textarea>\n" +
            "<div id=\"exareason" + count + " \" style=\"display: none\"></div>" +
            "                </div>\n" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>交通工具</label>\n" +
            "                    <div class=\"form-content form-date\">\n" +
            "                        <div id='showeduPicker2" + count + "' class=\"selectPicker\">请选择交通工具\n" +
            "                            <div class=\"down-icon\"></div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "                <input type=\"hidden\" name=\"trip_mode" + count + "\" id=\"trip_mode" + count + "\" value=\"\"/>\n" +
            "<div id=\"exatrip_mode" + count + "\"></div>" +
            "\n" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>出发城市</label>\n" +
            "                    <div class=\"form-content form-date\">\n" +
            "                        <div id=\"showCityPicker1" + count + "\">\n" +
            "                            请选择您所在的出发城市\n" +
            "                            <div class=\"down-icon\"></div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "                <input type=\"hidden\" name=\"busi_startcity" + count + "\" id=\"busi_startcity" + count + "\" value=\"\"/>\n" +
            "<div id=\"exabusi_startcity" + count + "\"></div>" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>目的城市</label>\n" +
            "                    <div class=\"form-content form-date\">\n" +
            "                        <div id=\"showCityPicker2" + count + "\">\n" +
            "                            请选择您所在的目的城市\n" +
            "                            <div class=\"down-icon\"></div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "                <input type=\"hidden\" name=\"busi_endcity" + count + "\" id=\"busi_endcity" + count + "\" value=\"\"/>\n" +
            "<div id=\"exabusi_endcity" + count + "\"></div>" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>\n" +
            "                        开始时间</label>\n" +
            "                    <div class=\"form-content\">\n" +
            "                        <div class=\"btn1" + count + " date selectPicker\" id=\"dateResult1" + count + "\" data-options1" + count + "='{\"type\":\"datetime\"}'>请选择开始时间\n" +
            "                            <div class=\"down-icon\"></div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "                <input type=\"hidden\" name=\"busi_starttime" + count + "\" id=\"busi_starttime" + count + "\" value=\"\"/>\n" +
            "<div id=\"exabusi_starttime" + count + "\"></div>" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>\n" +
            "                        结束时间</label>\n" +
            "                    <div class=\"form-content\">\n" +
            "                        <div class=\"btn2" + count + " date selectPicker\" id=\"dateResult2" + count + "\" data-options2" + count + "='{\"type\":\"datetime\"}'>请选择结束时间\n" +
            "                            <div class=\"down-icon\"></div>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "                <input type=\"hidden\" name=\"busi_endtime" + count + "\" id=\"busi_endtime" + count + "\" value=\"\"/>\n" +
            "<div id=\"exabusi_endtime" + count + "\"></div>" +
            "                <div class=\"form-item\">\n" +
            "                    <label class=\"form-label\">\n" +
            "                        <span class=\"color-red\">| </span>\n" +
            "                        时长（天）</label>\n" +
            "                    <div class=\"form-content\">\n" +
            "                        <div class=\"form-input\">\n" +
            "                            <input type=\"text\" autocomplete=\"off\" class=\"form-input__inner\" id=\"busi_time" + count + "\"\n" +
            "                                   name=\"busi_time" + count + "\" readonly=\"readonly\">\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "            </form>";
        document.getElementById("form1").appendChild(form);


        (function ($) {

            document.getElementById("orther" + count).style.display = 'none'
            $.init();
            var btns1 = $('.btn1' + count);
            var dateResult1 = document.getElementById('dateResult1' + count);
            var busi_starttime = document.getElementById('busi_starttime' + count);
            $('.btn1' + count).each(function (i, btn) {
                btn.addEventListener('tap', function () {
                    var _self = this;
                    if (_self.picker) {
                        _self.picker.show(function (rs) {
                            console.log(rs.text);
                            document.getElementById('dateResult1' + count).innerText = rs.text;
                            _self.picker.dispose();
                            _self.picker = null;
                        });
                    } else {
                        var optionsJson = this.getAttribute('data-options1' + count) || '{}';
                        var options = JSON.parse(optionsJson);
                        _self.picker = new $.DtPicker(options);
                        _self.picker.show(function (rs) {
                            document.getElementById('dateResult1' + count).innerText = rs.text;
                            document.getElementById('busi_starttime' + count).value = rs.text;
                            console.log(document.getElementById('dateResult1' + count).innerText);
                            console.log(document.getElementById('busi_starttime' + count).value);
                            var starttime = document.getElementById('busi_starttime' + count).value;
                            var endtime = document.getElementById('busi_endtime' + count).value;
                            if (starttime != null && endtime != null) {
                                if (getday(starttime, endtime) != undefined) {
                                    document.getElementById('busi_time' + count).value = getday(starttime, endtime);
                                    document.getElementById('busi_day').value = 0;
                                    var sum = 0;
                                    for (var j = 1; j <= count; j++) {
                                        sum = sum + Number(document.getElementById('busi_time' + j).value);
                                    }
                                    document.getElementById('busi_day').value = sum;
                                    // document.getElementById('busi_day').value=Number(document.getElementById('busi_time'+ count).value)+Number(document.getElementById('busi_day').value);
                                }
                            }
                            _self.picker.dispose();
                            _self.picker = null;
                        });
                    }

                }, false);
            });
            var btns2 = $('.btn2' + count);
            var dateResult2 = document.getElementById('dateResult2' + count);
            var busi_endtime = document.getElementById('busi_endtime' + count);
            $('.btn2' + count).each(function (i, btn) {
                btn.addEventListener('tap', function () {
                    var _self = this;
                    if (_self.picker) {
                        _self.picker.show(function (rs) {
                            console.log(rs.text);
                            document.getElementById('dateResult2' + count).innerText = rs.text;
                            _self.picker.dispose();
                            _self.picker = null;
                        });
                    } else {
                        var optionsJson = this.getAttribute('data-options2' + count) || '{}';
                        var options = JSON.parse(optionsJson);
                        _self.picker = new $.DtPicker(options);
                        _self.picker.show(function (rs) {
                            document.getElementById('dateResult2' + count).innerText = rs.text;
                            document.getElementById('busi_endtime' + count).value = rs.text;
                            console.log(document.getElementById('dateResult2' + count).innerText);
                            console.log(document.getElementById('busi_endtime' + count).value);
                            var starttime = document.getElementById('busi_starttime' + count).value;
                            var endtime = document.getElementById('busi_endtime' + count).value;
                            if (starttime != null && endtime != null) {
                                if (getday(starttime, endtime) != undefined) {
                                    document.getElementById('busi_time' + count).value = getday(starttime, endtime);
                                    document.getElementById('busi_day').value = 0;
                                    var sum = 0;
                                    for (var j = 1; j <= count; j++) {
                                        sum = sum + Number(document.getElementById('busi_time' + j).value);
                                    }
                                    document.getElementById('busi_day').value = sum;
                                    // document.getElementById('busi_day').value=Number(document.getElementById('busi_time'+ count).value)+Number(document.getElementById('busi_day').value);
                                }

                            }
                            _self.picker.dispose();
                            _self.picker = null;
                        });
                    }

                }, false);
            });
            var _getParam1 = function (obj, param) {
                return obj[param] || '';
            };
            var eduPicker1 = new $.PopPicker();
            var getbusipj = [];
            getbusipj.push({value: '其他', text: '其他'})
            $.ajax({
                type: 'post',
                url: '<%=basePath%>app_busi/getbusipj',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data + "data");
                    console.log(data.list[0].name + "data.list");
                    for (var i = 0; i < data.list.length; i++) {
                        getbusipj.push({value: data.list[i].name, text: data.list[i].name})
                        eduPicker1.setData(getbusipj);
                    }
                    // console.log(getbusipj)
                }
            })
            var showeduPickerButton1 = document.getElementById('showeduPicker1' + count);
            var busi_project = document.getElementById('busi_project' + count)
            document.getElementById('showeduPicker1' + count).addEventListener('tap', function (event) {
                eduPicker1.show(function (items) {
                    console.log(items[0])
                    document.getElementById('showeduPicker1' + count).innerText = _getParam1(items[0], 'text');
                    document.getElementById('busi_project' + count).value = _getParam1(items[0], 'text');
                    if (document.getElementById('showeduPicker1' + count).innerText == "其他") {
                        document.getElementById("orther" + count).style.display = 'block';
                    } else {
                        document.getElementById("orther" + count).style.display = 'none';
                    }
                    //返回 false 可以阻止选择框的关闭
                    //return false;
                });
            }, false);
            // 学历
            var _getParam2 = function (obj, param) {
                return obj[param] || '';
            };
            var eduPicker2 = new $.PopPicker();
            eduPicker2.setData([{
                value: '飞机',
                text: '飞机'
            }, {
                value: '火车',
                text: '火车'
            }, {
                value: '汽车',
                text: '汽车'
            }, {
                value: '其他',
                text: '其他'
            }]);
            var showeduPickerButton2 = document.getElementById('showeduPicker2' + count);
            var trip_mode = document.getElementById('trip_mode' + count)
            document.getElementById('showeduPicker2' + count).addEventListener('tap', function (event) {
                eduPicker2.show(function (items) {
                    console.log(items[0])
                    document.getElementById('showeduPicker2' + count).innerText = _getParam2(items[0], 'text');
                    document.getElementById('trip_mode' + count).value = _getParam2(items[0], 'text');
                    console.log(document.getElementById('showeduPicker2' + count).innerText);
                    console.log(document.getElementById('trip_mode' + count).value);
                    //返回 false 可以阻止选择框的关闭
                    //return false;
                });
            }, false);

            // 获取地区
            var _getParam1 = function (obj, param) {
                return obj[param] || '';
            };
            var cityPicker1 = new $.PopPicker({
                layer: 3
            });
            cityPicker1.setData(cityData3);
            var showCityPickerButton1 = document.getElementById(
                'showCityPicker1' + count
            );
            var busi_startcity1 = document.getElementById(
                'busi_startcity' + count
            );
            document.getElementById(
                'showCityPicker1' + count
            ).addEventListener(
                'tap',
                function (event) {
                    cityPicker1.show(function (items) {
                        console.log(items);
                        document.getElementById(
                            'showCityPicker1' + count
                        ).innerText =
                            _getParam1(items[0], 'text') +
                            ' ' +
                            _getParam1(items[1], 'text') +
                            ' ' +
                            _getParam1(items[2], 'text');
                        document.getElementById(
                            'busi_startcity' + count
                        ).value = _getParam1(items[0], 'text') +
                            ' ' +
                            _getParam1(items[1], 'text') +
                            ' ' +
                            _getParam1(items[2], 'text');

                    });
                },
                false
            );


            var _getParam2 = function (obj, param) {
                return obj[param] || '';
            };
            var cityPicker2 = new $.PopPicker({
                layer: 3
            });
            cityPicker2.setData(cityData3);
            var showCityPickerButton2 = document.getElementById(
                'showCityPicker2' + count
            );
            var busi_endcity1 = document.getElementById(
                'busi_endcity' + count
            );
            document.getElementById(
                'showCityPicker2' + count
            ).addEventListener(
                'tap',
                function (event) {
                    cityPicker2.show(function (items) {
                        console.log(items);
                        document.getElementById(
                            'showCityPicker2' + count
                        ).innerText =
                            _getParam2(items[0], 'text') +
                            ' ' +
                            _getParam2(items[1], 'text') +
                            ' ' +
                            _getParam2(items[2], 'text');
                        document.getElementById(
                            'busi_endcity' + count
                        ).value = _getParam2(items[0], 'text') +
                            ' ' +
                            _getParam2(items[1], 'text') +
                            ' ' +
                            _getParam2(items[2], 'text');

                    });
                },
                false
            );

        })(mui);


    }

    (function ($) {
        document.getElementById("orther1").style.display = 'none'
        document.getElementById("backmoney").style.display = 'none';
        $.init();
        var btns1 = $('.btn1');
        var dateResult1 = document.getElementById('dateResult1');
        var busi_starttime = document.getElementById('busi_starttime1');

        btns1.each(function (i, btn) {
            btn.addEventListener('tap', function () {
                var _self = this;
                if (_self.picker) {
                    _self.picker.show(function (rs) {
                        console.log(rs.text);
                        dateResult1.innerText = rs.text;
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                } else {
                    var optionsJson = this.getAttribute('data-options1') || '{}';
                    var options = JSON.parse(optionsJson);
                    _self.picker = new $.DtPicker(options);
                    _self.picker.show(function (rs) {
                        dateResult1.innerText = rs.text;
                        busi_starttime.value = rs.text;
                        var starttime = document.getElementById('busi_starttime1').value;
                        var endtime = document.getElementById('busi_endtime1').value;
                        if (starttime != null && endtime != null) {
                            if (getday(starttime, endtime) != undefined) {
                                document.getElementById('busi_time1').value = getday(starttime, endtime);
                                document.getElementById('busi_day').value = 0;
                                var sum = 0;
                                for (var j = 1; j <= count; j++) {
                                    sum = sum + Number(document.getElementById('busi_time' + j).value);
                                }
                                // document.getElementById('busi_day').value=Number(document.getElementById('busi_time1').value)+Number(document.getElementById('busi_day').value);
                                document.getElementById('busi_day').value = sum;
                            }
                        }
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                }

            }, false);
        });
        var btns2 = $('.btn2');
        var dateResult2 = document.getElementById('dateResult2');
        var busi_endtime = document.getElementById('busi_endtime1');
        btns2.each(function (i, btn) {
            btn.addEventListener('tap', function () {
                var _self = this;
                if (_self.picker) {
                    _self.picker.show(function (rs) {
                        console.log(rs.text);
                        dateResult2.innerText = rs.text;
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                } else {
                    var optionsJson = this.getAttribute('data-options2') || '{}';
                    var options = JSON.parse(optionsJson);
                    _self.picker = new $.DtPicker(options);
                    _self.picker.show(function (rs) {
                        dateResult2.innerText = rs.text;
                        busi_endtime.value = rs.text;
                        var starttime = document.getElementById('busi_starttime1').value;
                        var endtime = document.getElementById('busi_endtime1').value;
                        if (starttime != null && endtime != null) {
                            if (getday(starttime, endtime) != undefined) {
                                document.getElementById('busi_time1').value = getday(starttime, endtime);
                                document.getElementById('busi_day').value = 0;
                                var sum = 0;
                                for (var j = 1; j <= count; j++) {
                                    sum = sum + Number(document.getElementById('busi_time' + j).value);
                                }
                                // document.getElementById('busi_day').value=Number(document.getElementById('busi_time1').value)+Number(document.getElementById('busi_day').value);
                                document.getElementById('busi_day').value = sum;
                            }

                        }
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                }

            }, false);
        });

        var myDate = new Date();
        var getmonth = myDate.getMonth();
        if (getmonth == 11) {
            document.getElementById('backtime').value = (myDate.getFullYear() + 1) + "-" + "1" + "-" + "05";
        } else if (getmonth < 11) {
            document.getElementById('backtime').value = (myDate.getFullYear()) + "-" + (myDate.getMonth() + 2) + "-" + "05";
        }


        var _getParam1 = function (obj, param) {
            return obj[param] || '';
        };
        var eduPicker1 = new $.PopPicker();
        var getbusipj = [];
        getbusipj.push({value: '其他', text: '其他'})
        $.ajax({
            type: 'post',
            url: '<%=basePath%>app_busi/getbusipj',
            // cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data + "data");
                console.log(data.list[0].name + "data.list");
                for (var i = 0; i < data.list.length; i++) {
                    getbusipj.push({value: data.list[i].name, text: data.list[i].name})
                    eduPicker1.setData(getbusipj);
                }
                // console.log(getbusipj)
            }
        })
        var showeduPickerButton1 = document.getElementById('showeduPicker1');
        var busi_project = document.getElementById('busi_project1')
        showeduPickerButton1.addEventListener('tap', function (event) {
            eduPicker1.show(function (items) {
                console.log(items[0])
                showeduPickerButton1.innerText = _getParam1(items[0], 'text');
                busi_project.value = _getParam1(items[0], 'text');

                if (showeduPickerButton1.innerText == "其他") {
                    document.getElementById("orther1").style.display = 'block';
                } else {
                    document.getElementById("orther1").style.display = 'none';
                }


                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);


        // 学历
        var _getParam2 = function (obj, param) {
            return obj[param] || '';
        };
        var eduPicker2 = new $.PopPicker();
        eduPicker2.setData([{
            value: '飞机',
            text: '飞机'
        }, {
            value: '火车',
            text: '火车'
        }, {
            value: '汽车',
            text: '汽车'
        }, {
            value: '其他',
            text: '其他'
        }]);
        var showeduPickerButton2 = document.getElementById('showeduPicker2');
        var trip_mode = document.getElementById('trip_mode1')
        showeduPickerButton2.addEventListener('tap', function (event) {
            eduPicker2.show(function (items) {
                console.log(items[0])
                showeduPickerButton2.innerText = _getParam2(items[0], 'text');
                trip_mode.value = _getParam2(items[0], 'text');
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        // 获取地区
        var _getParam1 = function (obj, param) {
            return obj[param] || '';
        };
        var cityPicker1 = new $.PopPicker({
            layer: 3
        });
        cityPicker1.setData(cityData3);
        var showCityPickerButton1 = document.getElementById(
            'showCityPicker1'
        );
        var busi_startcity1 = document.getElementById(
            'busi_startcity1'
        );
        showCityPickerButton1.addEventListener(
            'tap',
            function (event) {
                cityPicker1.show(function (items) {
                    console.log(items);
                    showCityPickerButton1.innerText =
                        _getParam1(items[0], 'text') +
                        ' ' +
                        _getParam1(items[1], 'text') +
                        ' ' +
                        _getParam1(items[2], 'text');
                    busi_startcity1.value =
                        _getParam1(items[0], 'text') +
                        ' ' +
                        _getParam1(items[1], 'text') +
                        ' ' +
                        _getParam1(items[2], 'text');
                });
            },
            false
        );


        var _getParam2 = function (obj, param) {
            return obj[param] || '';
        };
        var cityPicker2 = new $.PopPicker({
            layer: 3
        });
        cityPicker2.setData(cityData3);
        var showCityPickerButton2 = document.getElementById(
            'showCityPicker2'
        );
        var busi_endcity1 = document.getElementById(
            'busi_endcity1'
        );
        showCityPickerButton2.addEventListener(
            'tap',
            function (event) {
                cityPicker2.show(function (items) {
                    console.log(items);
                    showCityPickerButton2.innerText =
                        _getParam2(items[0], 'text') +
                        ' ' +
                        _getParam2(items[1], 'text') +
                        ' ' +
                        _getParam2(items[2], 'text');
                    busi_endcity1.value =
                        _getParam2(items[0], 'text') +
                        ' ' +
                        _getParam2(items[1], 'text') +
                        ' ' +
                        _getParam2(items[2], 'text');
                });
            },
            false
        );


    })(mui);

    $('input[name=partyMember]').change(function () {
        var partyradio = $('input:radio[name="partyMember"]:checked').val();
        if (partyradio == 'yes') {
            document.getElementById("backmoney").style.display = 'block'
        } else if (partyradio == 'no') {
            document.getElementById("backmoney").style.display = 'none'
        }
    })

    var bool1 = true;

    function submitadd() {
        if (bool1) {
            for (var i = 1; i <= count; i++) {

                if (document.getElementById("orther" + i).style.display==='block'){
                    if (document.getElementById("ortherpj" + i).value != ""){
                        document.getElementById("exaortherpj" + i).innerHTML = ""
                        document.getElementById("busi_project" + i).value = document.getElementById("ortherpj" + i).value;
                    }else {
                        document.getElementById("exaortherpj" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">其他项目不可为空</span>"
                        return false;
                    }
                }
                if (document.getElementById("busi_project" + i).value != "") {
                    document.getElementById("exabusi_project" + i).innerHTML = ""
                } else {

                    document.getElementById("exabusi_project" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">所属项目不可为空</span>"
                    return false;
                }
                if (document.getElementById("trip_mode" + i).value != "") {
                    document.getElementById("exatrip_mode" + i).innerHTML = ""
                } else {
                    document.getElementById("exatrip_mode" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">交通工具不可为空</span>"
                    return false;

                }
                if (document.getElementById("busi_startcity" + i).value != "") {
                    document.getElementById("exabusi_startcity" + i).innerHTML = ""
                } else {

                    document.getElementById("exabusi_startcity" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">开始城市不可为空</span>"
                    return false;
                }
                if (document.getElementById("busi_endcity" + i).value != "") {
                    document.getElementById("exabusi_endcity" + i).innerHTML = ""
                } else {

                    document.getElementById("exabusi_endcity" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">目的城市不可为空</span>"
                    return false;
                }

                if (document.getElementById("busi_starttime" + i).value != "") {
                    document.getElementById("exabusi_starttime" + i).innerHTML = ""
                } else {

                    document.getElementById("exabusi_starttime" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">开始时间不可为空</span>"
                    return false;
                }
                if (document.getElementById("busi_endtime" + i).value != "") {
                    document.getElementById("exabusi_endtime" + i).innerHTML = ""
                } else {
                    document.getElementById("exabusi_endtime" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">结束时间不可为空</span>"
                    return false;
                }
                if (document.getElementById("busi_endtime" + i).value > document.getElementById("busi_starttime" + i).value) {
                    document.getElementById("exabusi_starttime" + i).innerHTML = ""
                    document.getElementById("exabusi_endtime" + i).innerHTML = ""
                } else {
                    document.getElementById("exabusi_starttime" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">请选择正确的开始时间</span>"
                    document.getElementById("exabusi_endtime" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">请选择正确的结束时间</span>"
                    return false;
                }
                if (Date.parse(document.getElementById("busi_starttime" + i).value ) > Date.parse(new Date())){
                    document.getElementById("exabusi_starttime" + i).innerHTML = ""
                }else {
                    document.getElementById("exabusi_starttime" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">开始时间需要大于当前时间</span>"
                    return false;
                }
                if (Date.parse(document.getElementById("busi_endtime" + i).value ) > Date.parse(new Date())){
                    document.getElementById("exabusi_endtime" + i).innerHTML = ""
                }else {
                    document.getElementById("exabusi_endtime" + i).innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">结束时间需要大于当前时间</span>"
                    return false;
                }

            }
            var partyradio = $('input:radio[name="partyMember"]:checked').val();
            if (partyradio == 'yes') {

                if (document.getElementById("premoney").value != "" && reg.test(document.getElementById("premoney").value)) {
                    document.getElementById("exapremoney").innerHTML = ""
                } else {
                    document.getElementById("exapremoney").innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">申请金额格式错误或不能为空</span>"
                    return false;
                }
                if (document.getElementById("credit").value != "" && reg.test(document.getElementById("credit").value)) {
                    document.getElementById("exacredit").innerHTML = ""
                } else {
                    document.getElementById("exacredit").innerHTML = "<span style=\"margin-top: -5px;color: #f56c6c;text-align: center;font-size: 0.3rem\">收款账户格式错误或不能为空</span>"
                    return false;
                }
            }

            var obj = {};
            var formuser = $('#formuser').serializeArray();
            for (var i in formuser) {
                obj[formuser[i].name] = formuser[i].value;
            }

            for (var i = 1; i <= count; i++) {

                var formlist = $('#form' + i).serializeArray();
                obj["busi_project" + i] = $("#busi_project" + i).val()
                obj["reason" + i] = $("#reason" + i).val();
                obj["busi_startcity" + i] = $("#busi_startcity" + i).val()
                obj["busi_endcity" + i] = $("#busi_endcity" + i).val()
                obj["trip_mode" + i] = $("#trip_mode" + i).val()
                obj["busi_starttime" + i] = $("#busi_starttime" + i).val()
                obj["busi_endtime" + i] = $("#busi_endtime" + i).val()
                obj["busi_time" + i] = $("#busi_time" + i).val()
                // for (var i in formlist) {
                //     obj[formlist[i].name] = formlist[i].value;
                // }
            }


            console.log("obj：" + obj)

            // $("#busi_project").val()
            // document.getElementsByName("reason")
            // $("#busi_startcity").val()
            // $("#busi_endcity").val()
            // $("#trip_mode").val()
            // $("#busi_starttime").val()
            // $("#busi_endtime").val()
            // $("#busi_time").val()


            console.log("trip_mode2：" + $("#trip_mode2").val());
            console.log("trip_mode1：" + $("#trip_mode1").val());
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
            location.href = "<%=basePath%>app_busi/busilog.do?submitter=" + encodeURI(encodeURI("<%=name%>"));
            bool1 = false;
        }
    }

    var reg = /(^[0-9]*$)/;

    function getday(starttime, endtime) {
        // var startyear   =   starttime.substring(0, 4);
        // var startmonth  =  starttime.substring(5, 7);
        // var startday    =    starttime.substring(8, 10);
        // var starthour   =   starttime.substring(12, 13);
        // var endyear     =     endtime.substring(0, 4);
        // var endmonth    =    endtime.substring(5, 7);
        // var endday      =      endtime.substring(8, 10);
        // var endhour     =     starttime.substring(12, 13);
        var start = new Date(starttime);
        var end = new Date(endtime);
        var startyear = start.getFullYear();
        var startmonth = start.getMonth();
        var startday = start.getDate();
        var starthour = start.getHours();
        var endyear = end.getFullYear();
        var endmonth = end.getMonth();
        var endday = end.getDate();
        var endhour = end.getHours();

        console.log(startyear);
        console.log(startmonth);
        console.log(startday);
        console.log(starthour);
        console.log(endyear);
        console.log(endmonth);
        console.log(endday);
        console.log(endhour);
        if (startyear == endyear && startmonth == endmonth && startday == endday) {
            if (starthour < 12 && endhour < 12) {
                return 0.5
            } else if (starthour < 12 && endhour > 12) {
                return 1
            } else if (starthour > 12 && endhour < 24) {
                return 0.5
            }
        } else if (startyear == endyear && startmonth == endmonth && startday != endday) {
            var day = datedifference(starttime, endtime);
            if (starthour < 12 && endhour < 12) {
                return day + 0.5;
            } else if (starthour < 12 && endhour > 12) {
                return day + 1;
            } else if (starthour > 12 && endhour < 12) {
                return day;
            } else if (starthour > 12 && endhour > 12) {
                return day + 0.5;
            }
        } else if (startyear == endyear && startmonth != endmonth) {

            var day = datedifference(starttime, endtime);
            if (starthour < 12 && endhour < 12) {
                return day + 0.5;
            } else if (starthour < 12 && endhour > 12) {
                return day + 1;
            } else if (starthour > 12 && endhour < 12) {
                return day;
            } else if (starthour > 12 && endhour > 12) {
                return day + 0.5;
            }
        } else if (startyear != endyear) {
            var day = datedifference(starttime, endtime);
            if (starthour < 12 && endhour < 12) {
                return day + 0.5;
            } else if (starthour < 12 && endhour > 12) {
                return day + 1;
            } else if (starthour > 12 && endhour < 12) {
                return day;
            } else if (starthour > 12 && endhour > 12) {
                return day + 0.5;
            }
        }
    }


    function datedifference(sDate1, sDate2) {
        //sDate1和sDate2是2006-12-18格式
        var dateSpan,
            tempDate,
            iDays;
        sDate1 = Date.parse(sDate1);
        sDate2 = Date.parse(sDate2);
        dateSpan = sDate2 - sDate1;
        dateSpan = Math.abs(dateSpan);
        iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
        return iDays
    };


</script>

</body>
</html>
