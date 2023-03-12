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
    <title>报销审批</title>
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="yes" name="apple-touch-fullscreen"/>
    <meta content="telephone=no,email=no" name="format-detection"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="./static/weixin/js/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.poppicker.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/common.css"/>
</head>
<body>
<div class="detail-bg">
    <section>
        <div class="blue-block">
            <i></i>
            <p>报销申请</p>
        </div>
        <form acrtion="" method="post" id="form_main">
            <input type="hidden" name="subuserid" id="subuserid" value="${reimaudit.subuserid}"/>
            <input type="hidden" name="id" id="id" value="${reimaudit.id}"/>
            <input type="hidden" name="supauditor" id="supauditor" value="${reimaudit.supauditor}"/>
            <input type="hidden" name="deptauditor" id="deptauditor" value="${reimaudit.deptauditor}"/>
            <input type="hidden" name="managerauditor" id="managerauditor" value="${reimaudit.managerauditor}"/>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>关联出差申请单</label>
                <div class="form-content">
                    <div class="form-input" style="width: 86%;">
                        <input type="text" autocomplete="off" class="form-input__inner" id="busi_code" name="busi_code"
                               readonly="readonly"  value="${reimaudit.busi_code}"/>
                    </div>
                </div>
            </div>
            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>报销公司</label>
                <div class="form-content">
                    <div class="form-input" style="width: 86%;">
                        <input type="text" autocomplete="off" class="form-input__inner" id="company" name="company"
                               readonly="readonly"  value="${reimaudit.company}"/>
                    </div>
                </div>
            </div>

            <div class="form-item">
                <label class="form-label">
                    <span class="color-red">| </span>报销人</label>
                <div class="form-content">
                    <div class="form-input">
                        <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${reimaudit.submitter}"/>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <section>
        <div id="hidden">
            <c:forEach items="${reimlog}" var="var" varStatus="vs">
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
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="busi_project" name="busi_project"
                                       value="${var.busi_project}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>出差事由</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.reason}" id="reason" name="reason"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>交通工具</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="trip_mode" name="trip_mode"
                                       value="${var.trip_mode}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>开始城市</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="busi_startcity" name="busi_startcity"
                                       value="${var.busi_startcity}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>目的城市</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="busi_endcity" name="busi_endcity"
                                       value="${var.busi_endcity}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>开始时间</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off"  readonly="readonly" class="form-input__inner" id="busi_starttime" name="busi_starttime"
                                       value="${var.busi_starttime}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>结束时间</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="busi_endtime" name="busi_endtime"
                                       value="${var.busi_endtime}"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>时长（天）</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="busi_time" name="busi_time"
                                       value="${var.busi_time}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>票据数量</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="billnum" name="billnum"
                                       value="${var.billnum}"/>
                            </div>
                        </div>
<%--                        <div class="form-content mui-clearfix">--%>
<%--                            <div class="mui-numbox fr">--%>
<%--                                <button class="mui-btn mui-btn-numbox-minus" type="button">--%>
<%--                                    ---%>
<%--                                </button>--%>
<%--                                <input class="mui-input-numbox" type="number"  readonly="readonly" style="height: 100%!important;" id="billnum" name="billnum" value="${var.billnum}"/>--%>
<%--                                <button class="mui-btn mui-btn-numbox-plus" type="button">--%>
<%--                                    +--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>交通金额</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="tripmon" name="tripmon" value="${var.tripmon}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>住宿金额</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="hostelmon" name="hostelmon" value="${var.hostelmon}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>出差补贴</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="mission" name="mission" value="${var.mission}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label class="form-label">
                            <span class="color-red">| </span>实报金额</label>
                        <div class="form-content">
                            <div class="form-input">
                                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" id="realmon" name="realmon" value="${var.realmon}"/>
                            </div>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </div>
        <c:if test="${ msg=='supauditor' or msg=='deptauditor' or msg=='managerauditor'}">
            <c:if test="${reimaudit.supsche=='0' or reimaudit.managersche=='0'}">

                <div class="bottom-btn">
                    <div class="bottom-deal" onclick="audit('1');" style="width: 75px;text-align: center">
                        通过
                    </div>
                    <div class="bottom-cfts"  style="width: 75px;text-align: center" data-toggle="modal" data-target="#myModal">
                        拒绝
                    </div>
                </div>

            </c:if>
        </c:if>

    </section>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        请输入拒绝原因
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="text" id="reject" name="reject" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="audit('2');">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <div style="height: 50px"></div>
</div>

<script src="./static/weixin/js/mui.min.js"></script>
<script src="./static/weixin/js/mui.picker.min.js"></script>
<script src="./static/weixin/js/mui.poppicker.js"></script>
<script src="./static/weixin/js/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="./static/weixin/js/city.data-3.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    $('#myModal').modal(options);

    // window.onload = function () {
    //     var busiid = document.getElementById("busiid");
    //     if (busiid.value == '') {
    //         document.getElementById("hidden").style.display = 'none';
    //     }
    // }

    function audit(sche) {
        var reject=document.getElementById("reject").value;
        // var id=document.getElementById("id");
        // var deptauditor=document.getElementById("deptauditor");
        // var managerauditor=document.getElementById("managerauditor");
        // var supauditor=document.getElementById("supauditor");
        if ('${msg}'=="supauditor"){
            location.href ="<%=basePath%>app_reim/supaudit.do?sche="+sche+
                "&id="+"${reimaudit.id}"+
                "&supauditor="+"${pd.supauditor}"+
                "&company="+encodeURI(encodeURI("${reimaudit.company}"))+
                "&subuserid="+"${reimaudit.subuserid}"+
                "&reject="+encodeURI(encodeURI(reject));
            <%--+"&deptauditor="+"${reimaudit.deptauditor}"+"&managerauditor="+"${reimaudit.managerauditor}"--%>
        }else if ('${msg}'=="managerauditor"){
            location.href ="<%=basePath%>app_reim/manageraudit.do?sche="+sche+"&id="+"${reimaudit.id}"
                +"&deptauditor="+"${reimaudit.deptauditor}"
                +"&managerauditor="+"${reimaudit.managerauditor}"
                +"&supauditor="+"${reimaudit.supauditor}"
                +"&company="+encodeURI(encodeURI("${reimaudit.company}"))
                +"&subuserid="+"${reimaudit.subuserid}"
                + "&reject="+encodeURI(encodeURI(reject));
        }

    }


</script>

</body>
</html>
