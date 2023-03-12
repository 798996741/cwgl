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
        <div id="darkmask" class="darkmask" style="margin-top:250px;width: 1200px">
            <div class="mask-top">
                <span class="mask-top-size"><b>详 情</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                     data-dismiss="modal">
            </div>
            <div class="mask-main">
                <table id="example2" class="table-blue" style="width: 100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr>

                        <th style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">编号</th>
                        <th>所属</br>项目</th>
                        <th>交通</br>工具</th>
                        <th>开始城市</th>
                        <th>目的城市</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>时长（天）</th>
                        <th>票据</br>数量</th>
                        <th>交通</br>金额</th>
                        <th>住宿</br>金额</th>
                        <th>出差</br>补贴</th>
                        <th>实报</br>金额</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:choose>
                        <c:when test="${not empty cList}">
                            <%--<c:if test="${QX.cha == 1 }">--%>
                            <c:forEach items="${cList}" var="cList" varStatus="vs">

                                <tr>


                                    <td style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">${vs.count}</td>
                                    <td>${cList.busi_project}</td>
                                    <td>${cList.trip_mode}</td>
                                    <td>${cList.busi_startcity}</td>
                                    <td>${cList.busi_endcity}</td>
                                    <td>${cList.busi_starttime}</td>
                                    <td>${cList.busi_endtime}</td>
                                    <td>${cList.busi_time}</td>
                                    <td>${cList.billnum}</td>
                                    <td>${cList.tripmon}</td>
                                    <td>${cList.hostelmon}</td>
                                    <td>${cList.mission}</td>
                                    <td>${cList.realmon}</td>
                                    <td align="center">
                                        <div class="flex-row-center">

                                            <div class="content-edit home-img cy_bj" title="编辑" style="margin-right: 10%"
                                                 onclick="editlog('${cList.uid}','${cList.id}');" >
                                                <font class="home-img-size">编辑</font>
                                            </div>
                                            <div class="content-delete home-img cy_sc" title="删除"
                                                 onclick="dellog('${cList.uid}','${cList.id}');" >
                                                <font class="home-img-size">删除</font>
                                            </div>
                                                <%--</c:if>--%>
                                        </div>

                                    </td>
                                </tr>

                            </c:forEach>
                            <%--</c:if>--%>
                            <c:if test="${QX.cha == 0 }">
                                <tr>
                                    <td colspan="14" class="center">您无权查看</td>
                                </tr>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <tr class="main_info">
                                <td colspan="14" class="center">没有相关数据</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>

                    </tbody>

                </table>
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
    var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;

    //删除
    function dellog(uid,id) {
        if (confirm("确定要删除吗?")) {

            var url = "<%=basePath%>adminreim/deletereimauditlogbyid.do?id=" + id;
            $.get(url, function (data) {
                //nextPage(${page.currentPage});
                setTimeout("self.location.reload()", 100);
            });
        }
    }





    function editlog(uid,id) {
// top.jzts();
        var winId = "ContmonWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>adminreim/findadminreimlogbyid.do?uid=' + uid +'&id='+id
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
