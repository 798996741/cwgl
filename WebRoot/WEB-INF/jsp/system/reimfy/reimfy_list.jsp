﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <!-- jsp文件头和头部 --><%--
<%@ include file="../index/top.jsp"%> --%>
    <%@ include file="../../system/include/incJs_mx.jsp" %>
    <link rel="stylesheet" href="static/css/tree.css">

    <!-- 日期框 -->
</head>

<body class="hold-transition skin-blue sidebar-mini">


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="width:100%;margin-left:0px;">


    <section class="content container-fluid">
        <div class="content-top">
            <div class="content-top-left" style="display: flex;flex-direction: row;align-items: center;width: 1200px;">
                <div class="seat-top">
                    <div class="seat-subtitle">报销分类管理</div>
                </div>
                <div class="seat-button">
                    <a href="javascript:void (0) " onclick="add('${pd.reimfyid}'+'');" style="color: #ffffff">新增</a>

                </div>
                <div style="display: flex;flex-direction: row;justify-content: space-around;width: 700px">
<%--                    <div class="border-style width-165px" style="position: relative;margin-left: 300px;">--%>
<%--                        <input type="text" placeholder="搜索" style="padding-left: 10px;" name="keywords" id="keywords"--%>
<%--                               value="${keywords}">--%>
<%--                        <div class="search" onclick="tosearch()"--%>
<%--                             style="background: url('static/img/home/search_icon.png') no-repeat;position: absolute;right: 5%;background-size: 15px;width: 15px;height: 15px;cursor: pointer"></div>--%>
<%--                    </div>--%>
<%--                    <div class="border-style width-185px">--%>
<%--                        <span class="border-size width-109px">二级分类</span>--%>
<%--                        <div class="border-line"></div>--%>
<%--                        <select class="seat-select" name="twoclass" id="twoClass" data-placeholder="乙方">--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <button type="button" class="btn btn-default-sm"--%>
<%--                            style="background-color: #4a9ed8;color:#fff;border-radius: 5px;width: 170px;height: 27px;text-align: center;padding: 0px"--%>
<%--                            onclick="tosearch()">--%>
<%--                        <font>查&nbsp;询</font>--%>
<%--                    </button>--%>
                </div>
            </div>


        </div>
        <div class="seat-middle">
            <div class="seat-middle-r" style="width: 100%;">
                <!-- <div class="box-body" > -->

                <table id="example2" class="table-blue" style="width: 100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr>
                        <th style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">编号</th>
                        <th class="center">分类名称</th>
                        <th class="center">分类编码</th>
                        <th class="center">分类说明</th>
                        <th class="center">数据来源</th>
                        <th class="center">操作人</th>
                        <th class="center">操作时间</th>
                        <th class="center">操作</th>

                    </tr>
                    </thead>
                    <tbody>

                    <c:choose>
                        <c:when test="${not empty rlist}">
                            <%--<c:if test="${QX.cha == 1 }">--%>
                            <c:forEach items="${rlist}" var="rlist" varStatus="vs">

                                <tr>


                                    <td class="center" style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">${vs.count}</td>
                                    <td class="center">${rlist.classname}</td>
                                    <td class="center">${rlist.encode}</td>

                                    <td class="center">${rlist.classdec}</td>
                                    <td class="center">${rlist.source}</td>
                                    <td class="center">${rlist.username}</td>
                                    <td class="center">${rlist.cztime}</td>

                                    <td align="center">
                                        <div class="flex-row-center">

                                                <%--<c:if test="${QX.edit == 1 }">--%>

<%--                                            <img class="cy_bj" title="编辑" src="static/img/home/edit.png"--%>
<%--                                                 style="width: 59px;height: 25px;"--%>
<%--                                                 onclick="editreim('${rlist.reimfyid}');">--%>
<%--                                            <i title="编辑"></i>--%>
<%--                                            </img>--%>
                                                    <div class="content-edit home-img cy_bj" title="编辑" style="margin-right: 10%"
                                                         onclick="editreim('${rlist.reimfyid}');" >
                                                        <font class="home-img-size">编辑</font>
                                                    </div>
                                                <%--</c:if>--%>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <%--<c:if test="${QX.del == 1 }">--%>
<%--                                            <img class="cy_sc" src="static/img/home/delete.png"--%>
<%--                                                 style="width: 59px;height: 25px;"--%>
<%--                                                 onclick="delreim('${rlist.reimfyid}');">--%>
<%--                                                &lt;%&ndash;,'${user.USERNAME }'&ndash;%&gt;--%>
<%--                                            <i title="删除"></i>--%>
<%--                                            </img>--%>
                                                    <div class="content-delete home-img cy_sc" title="删除"
                                                         onclick="delreim('${rlist.reimfyid}');" >
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

                <!-- /.box-body -->
                <!-- </div> -->
            </div>
            <!--   </div> -->
            <!-- <div class="xtyh-page">
                    <div class="xtyh-page-l">
                        显示1页到10页 共40条记录
                    </div>
                    <div class="xtyh-page-r">
                        <a href="javascript:void(0)" class="xtyh-s"></a>
                        <ul class="xtyh-page-r-li">
                            <li class="xtyh-page-r-li-activ"><a href="javascript:void(0)">1</a></li>
                            <li><a href="javascript:void(0)">2</a></li>
                            <li><a href="javascript:void(0)">3</a></li>
                            <li><a href="javascript:void(0)">4</a></li>
                        </ul>
                        <a href="javascript:void(0)" class="xtyh-x"></a>
                    </div>
                </div> -->
        </div>
    </section>


</div>
<!-- /.content-wrapper -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<!-- 删除时确认窗口 -->
<script src="static/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/js/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">

    function tosearch() {
        //top.jzts();
        var keywords = $("#keywords").val();

        location.href = "<%=path%>/reimfy/findReimfy.do??keywords=" + encodeURI(encodeURI(keywords));
        //$("#Form_s").submit();
    }



    $(function () {
        if (screen.width > 1600) {
            $('#example2').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 21,
                'sScrollX': false,
                "oLanguage": {
                    "sSearch": "快速搜索:",
                    "bAutoWidth": true,
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "Nothing found - 没有记录",
                    "sInfo": "当前显示 _START_ 到 _END_ 条,共 _TOTAL_ 条",
                    "sInfoEmpty": "显示0条记录",
                    "sInfoFiltered": "(从 _MAX_ 条中过滤)",
                    // "sProcessing":"<div style=''><img src='../static/img/loader.gif'><span>加载中...</span></div>",
                    "oPaginate": {
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": ">>",
                        "sFirst": "<<"
                    }
                }
            })
        } else if (screen.width > 1366) {
            $('#example2').DataTable({
                "stateSave":true,
                "stateDuration":-1,
                "bDestroy":true,
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 18,
                'sScrollX': false,
                "oLanguage": {
                    "sSearch": "快速搜索:",
                    "bAutoWidth": true,
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "Nothing found - 没有记录",
                    "sInfo": "当前显示 _START_ 到 _END_ 条,共 _TOTAL_ 条",
                    "sInfoEmpty": "显示0条记录",
                    "sInfoFiltered": "(从 _MAX_ 条中过滤)",
                    // "sProcessing":"<div style=''><img src='../static/img/loader.gif'><span>加载中...</span></div>",
                    "oPaginate": {
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": ">>",
                        "sFirst": "<<"
                    }
                }
            })
        } else {
            $('#example2').DataTable({
                "stateSave":true,
                "stateDuration":-1,
                "bDestroy":true,
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 12,
                'sScrollX': false,
                "oLanguage": {
                    "sSearch": "快速搜索:",
                    "bAutoWidth": true,
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "Nothing found - 没有记录",
                    "sInfo": "当前显示 _START_ 到 _END_ 条,共 _TOTAL_ 条",
                    "sInfoEmpty": "显示0条记录",
                    "sInfoFiltered": "(从 _MAX_ 条中过滤)",
                    // "sProcessing":"<div style=''><img src='../static/img/loader.gif'><span>加载中...</span></div>",
                    "oPaginate": {
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": ">>",
                        "sFirst": "<<"
                    }
                }
            })
        }
    })


    //删除
    function delreim(reimfyid) {
        if (confirm("确定要删除吗?")) {

            var url = "<%=basePath%>reimfy/deleteReimfy.do?reimfyid=" + reimfyid;
            $.get(url, function (data) {
                //nextPage(${page.currentPage});
                setTimeout("self.location.reload()", 100);
            });
        }
    }

    //新增
    function add(reimfyid) {

        if (reimfyid=='') {
            reimfyid = '0';
        }
        console.log(reimfyid+"reimfyid")
        //top.jzts();
        var winId = "reimfyWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>reimfy/goAddC.do?reimfyid='+reimfyid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    //修改
    function editreim(reimfyid) {
        // top.jzts();
        var winId = "reimfyWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>reimfy/findReimfyById.do?reimfyid=' + reimfyid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }


    $(function () {
        $(".row thead").find("th:first").addClass("cy_th");
        $(".row tbody").find("tr").find("td:first").addClass("cy_td");
        // $(".row thead").find("th:first").after("<th id='cy_thk'></th>");
        // $(".row tbody").find("tr").find("td:first").after("<td id='cy_thk'></td>");
        $('.seat-middle').find(".row:first").hide();

        $(".xtyh-middle-r").find(".row:last").addClass("row-zg");
        $(".xtyh-middle-r").find(".row:eq(1)").addClass("row-two");
    });
</script>
</body>

</html>