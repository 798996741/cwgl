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

</head>
<body class="no-skin">

<!-- Horizontal Form -->
<div>
    <div id="mask" class="mask">
        <div id="darkmask" class="darkmask">
            <div class="mask-top">
                <span class="mask-top-size" style="letter-spacing: 3px;"><b>出差明细</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;" data-dismiss="modal">
            </div>
            <div class="mask-main">
                <div class="seat-middle" style="height: 270px;width: 100%;">
                    <div class="seat-middle-r" style="width: 100%;">
                        <form name="form_add2" id="form_add2">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <thead>
                                <tr>

                                    <th style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">编号</th>
                                    <th>出差项目</th>
                                    <th>交通工具</th>
                                    <th>出发城市</th>
                                    <th>目的城市</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>时长（天）</th>
                                    <th>出差事由</th>

                                </tr>
                                </thead>
                                <tbody>

                                <c:choose>
                                    <c:when test="${not empty list}">
                                        <%--<c:if test="${QX.cha == 1 }">--%>
                                        <c:forEach items="${list}" var="var" varStatus="vs">

                                            <tr>


                                                <td style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">${vs.count}</td>
                                                <td>${var.busi_project}</td>
                                                <td>${var.trip_mode}</td>
                                                <td>${var.busi_startcity}</td>
                                                <td>${var.busi_endcity}</td>
                                                <td>${var.busi_starttime}</td>
                                                <td>${var.busi_endtime}</td>
                                                <td>${var.busi_time}</td>
                                                <td>${var.reason}</td>


                                            </tr>

                                        </c:forEach>
                                        <%--</c:if>--%>
                                        <c:if test="${QX.cha == 0 }">
                                            <tr>
                                                <td colspan="11" class="center">您无权查看</td>
                                            </tr>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="main_info">
                                            <td colspan="11" class="center">没有相关数据</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">





    $(function () {
        //下拉框
        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({allow_single_deselect: true});
            $(window)
                .off('resize.chosen')
                .on('resize.chosen', function () {
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({'width': $this.parent().width()});
                    });
                }).trigger('resize.chosen');
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({'width': $this.parent().width()});
                });
            });
            $('#chosen-multiple-style .btn').on('click', function (e) {
                var target = $(this).find('input[type=radio]');
                var which = parseInt(target.val());
                if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                else $('#form-field-select-4').removeClass('tag-input-style');
            });
        }
    });
</script>
</body>
</html>
