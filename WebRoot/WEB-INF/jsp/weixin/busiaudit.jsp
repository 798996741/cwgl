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
    <title>出差申请</title>
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="yes" name="apple-touch-fullscreen"/>
    <meta content="telephone=no,email=no" name="format-detection"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="./static/weixin/js/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./static/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/mui.poppicker.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./static/weixin/css/common.css"/>
</head>
<body>
<div>
    <div class="record-item clearfix">
        <div class="record-man">
            ${busiaudit.submitter}
        </div>
        <div class="record-word">
            <div class="f16">
                ${busiaudit.submitter}
            </div>
            <div class="color-orange f12">
                <c:if test="${busiaudit.busi_sche==0}">
                    等待${busiaudit.auditor}审批
                </c:if>
                <c:if test="${busiaudit.busi_sche!=0}">
                    ${busiaudit.auditor}审批完成
                </c:if>
                <c:if test="${busiaudit.busi_managersche==0}">
                    等待${busiaudit.manageraudit}审批
                </c:if>
                <c:if test="${busiaudit.busi_managersche!=0}">
                    ${busiaudit.manageraudit}审批完成
                </c:if>
            </div>
        </div>
    </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>审批编号</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.busi_code}"/>
            </div>
        </div>
    </div>

    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>所在部门</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.dept}"/>
            </div>
        </div>
    </div>
    <c:forEach items="${busilog}" var="var" varStatus="vs">
    <div class="blue-block">
        <i></i>
        <p>行程明细${vs.count}</p>
    </div>
        <div class="form-item">
            <label class="form-label">
                <span class="color-red">| </span>所属项目</label>
            <div class="form-content">
                <div class="form-input">
                    <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.busi_project}"/>
                </div>
            </div>
        </div>
        <div class="form-item">
            <label class="form-label">
                <span class="color-red">| </span>开始城市</label>
            <div class="form-content">
                <div class="form-input">
                    <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.busi_startcity}"/>
                </div>
            </div>
        </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>目的城市</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.busi_endcity}"/>
            </div>
        </div>
    </div>
        <div class="form-item">
            <label class="form-label">
                <span class="color-red">| </span>交通工具</label>
            <div class="form-content">
                <div class="form-input">
                    <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.trip_mode}"/>
                </div>
            </div>
        </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>开始时间</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.busi_starttime}"/>
            </div>
        </div>
    </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>结束时间</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.busi_endtime}"/>
            </div>
        </div>
    </div>
        <div class="form-item">
            <label class="form-label">
                <span class="color-red">| </span>时长（天）</label>
            <div class="form-content">
                <div class="form-input">
                    <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${var.busi_time}"/>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>出差天数</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.busi_day}"/>
            </div>
        </div>
    </div>
    <div class="blue-block">
        <i></i>
        <p>申请备用金</p>
    </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>备用金总额</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.premoney}"/>
            </div>
        </div>
    </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>收款账户</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.credit}"/>
            </div>
        </div>
    </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>归还时间</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.backtime}"/>
            </div>
        </div>
    </div>
    <div class="form-item">
        <label class="form-label">
            <span class="color-red">| </span>备注</label>
        <div class="form-content">
            <div class="form-input">
                <input type="text" autocomplete="off" readonly="readonly" class="form-input__inner" value="${busiaudit.remark}"/>
            </div>
        </div>
    </div>

    <div class="form-process">
        <div class="process-item">
            <div class="process-line"></div>
            <div class="process-man">
                ${busiaudit.submitter}
                <div class="process-icon">
                    <img src="./static/weixin/images/success.png" />
                </div>
            </div>
            <div class="process-content">
                <div class="f15">
                    发起申请
                    <span class="color-gray fr">${busiaudit.subtime}</span>
                </div>
                <div class="color-gray">我的出差</div>
            </div>
        </div>

        <div class="process-item">
            <div class="process-line"></div>
            <c:if test="${busiaudit.busi_sche==0}">
                <div class="process-man">
                        ${busiaudit.auditor}
                    <div class="process-icon">
                        <img src="./static/weixin/images/wait.png" />
                    </div>
                </div>
                <div class="process-content">
                    <div class="f15">
                        审批通过
                        <span class="color-gray fr">${busiaudit.audittime}</span>
                    </div>
                    <div class="color-gray">我的出差(审批中)</div>
                </div>
            </c:if>
            <c:if test="${busiaudit.busi_sche==1}">
                <div class="process-man">
                        ${busiaudit.auditor}
                    <div class="process-icon">
                        <img src="./static/weixin/images/success.png" />
                    </div>
                </div>
                <div class="process-content">
                    <div class="f15">
                        审批通过
                        <span class="color-gray fr">${busiaudit.audittime}</span>
                    </div>
                    <div class="color-gray">我的出差(审批通过)</div>
                </div>
            </c:if>
            <c:if test="${busiaudit.busi_sche==2}">
                <div class="process-man">
                        ${busiaudit.auditor}
                    <div class="process-icon">
                        <img src="./static/weixin/images/fail.png" />
                    </div>
                </div>
                <div class="process-content">
                    <div class="f15">
                        拒绝
                        <span class="color-gray fr">${busiaudit.audittime}</span>
                    </div>
                    <div class="color-gray">我的出差(拒绝)</div>
                </div>
            </c:if>
        </div>

        <div class="process-item">
            <div class="process-line"></div>
            <c:if test="${busiaudit.busi_managersche==0}">
                <div class="process-man">
                        ${busiaudit.manageraudit}
                    <div class="process-icon">
                        <img src="./static/weixin/images/wait.png" />
                    </div>
                </div>
                <div class="process-content">
                    <div class="f15">
                        审批通过
                        <span class="color-gray fr">${busiaudit.manageraudittime}</span>
                    </div>
                    <div class="color-gray">我的出差(审批中)</div>
                </div>
            </c:if>
            <c:if test="${busiaudit.busi_managersche==1}">
                <div class="process-man">
                        ${busiaudit.manageraudit}
                    <div class="process-icon">
                        <img src="./static/weixin/images/success.png" />
                    </div>
                </div>
                <div class="process-content">
                    <div class="f15">
                        审批通过
                        <span class="color-gray fr">${busiaudit.manageraudittime}</span>
                    </div>
                    <div class="color-gray">我的出差(审批通过)</div>
                </div>
            </c:if>
            <c:if test="${busiaudit.busi_managersche==2}">
                <div class="process-man">
                        ${busiaudit.manageraudit}
                    <div class="process-icon">
                        <img src="./static/weixin/images/fail.png" />
                    </div>
                </div>
                <div class="process-content">
                    <div class="f15">
                        拒绝
                        <span class="color-gray fr">${busiaudit.manageraudittime}</span>
                    </div>
                    <div class="color-gray">我的出差(拒绝)</div>
                </div>
            </c:if>
        </div>
    </div>
    <c:if test="${msg=='auditor' or msg=='manager'}">
    <c:if test="${busiaudit.busi_sche=='0' or busiaudit.busi_managersche=='0'}">

                <div class="bottom-btn">
                    <div class="bottom-deal" onclick="audit('1');" style="width: 75px;text-align: center">
                        通过
                    </div>
                    <div class="bottom-cfts"  style="width: 75px;text-align: center" data-toggle="modal" data-target="#myModal"   >
                        拒绝
                    </div>

                </div>


    </c:if>
    </c:if>
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
</div>
<div style="height: 50px"></div>


<script src="./static/weixin/js/mui.min.js"></script>
<script src="./static/weixin/js/mui.picker.min.js"></script>
<script src="./static/weixin/js/mui.poppicker.js"></script>
<script type="text/javascript">

    $('#myModal').modal(options);

    function audit(busi_sche) {
        console.log('${msg}');
        var reject=document.getElementById("reject").value;
        if ('${msg}'=='manager'){
            location.href = "<%=basePath%>app_busi/changemanagersche.do?id="+"${busiaudit.id}"+
                "&auditor="+"${pd.auditor}"+
                "&busi_managersche="+busi_sche+
                "&subuserid="+"${busiaudit.subuserid}"+
                "&manageraudit="+'${busiaudit.manageraudit}'+
                "&reject="+encodeURI(encodeURI(reject));
        }else  if ('${msg}'=='auditor'){
            location.href = "<%=basePath%>app_busi/changesche.do?id="+"${busiaudit.id}"+
                "&auditor="+"${pd.auditor}"+
                "&busi_sche="+busi_sche+
                "&subuserid="+"${busiaudit.subuserid}"+
                "&manageraudit="+'${busiaudit.manageraudit}'+
                "&reject="+encodeURI(encodeURI(reject));
        }


    }

</script>

</body>
</html>
