<%@ page language="java" contentType="text/html; charset=UTF-8"
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

  <link rel="stylesheet" href="static/css/common.css">
  <!--<link rel="stylesheet" href="static/css/main.css">-->
  <link rel="stylesheet" href="static/css/tree.css">
  <!--<link rel="stylesheet" href="static/css/media.css">-->

  <!-- 日期框 -->
</head>

<body class="hold-transition skin-blue sidebar-mini">


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="width:100%;margin-left:0px;">


    <section class="content container-fluid">
      <div class="seat-middle-top">
        <div class="seat-top">
          <div class="seat-subtitle">出差审核明细</div>
        </div>
      </div>
      <div class="seat-middle">
        <div class="seat-middle-r" style="width: 100%">
          <!-- <div class="box-body" > -->

          <table id="example2" class="table-blue" style="width: 100%" border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>

                <th style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">编号</th>
                <th>提交人</th>
                <th>部门</th>
                <th>审核单号</th>
                <th>出差时间</th>
                <th>审核人</th>
                <th>提交时间</th>
                <th>审核时间</th>
                <th>备用金金额</th>
                <th>收款账户</th>
                <th>归还时间</th>
                <th>备注</th>
                <th>操作</th>
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
                      <td>${var.submitter}</td>
                      <td>${var.dept}</td>
                      <td>${var.busi_code}</td>
                      <td>${var.busi_day}</td>
                      <td>${var.auditor}</td>
                      <td>${var.subtime}</td>
                      <td>${var.audittime}</td>
                      <td>${var.premoney}</td>
                      <td>${var.credit}</td>
                      <td>${var.backtime}</td>
                      <td>${var.remark}</td>
                      <td>
                        <div class="flex-row-center">
                            <div class="content-edit home-img cy_bj" title="编辑" style="margin-right: 10%"
                                 onclick="edit('${var.id}');" >
                              <font class="home-img-size">详情</font>
                            </div>
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
      </div>
    </section>


  </div>
  <!-- basic scripts -->
  <!-- 删除时确认窗口 -->
  <script src="static/js/bootbox.js"></script>
  <!-- ace scripts -->
  <script src="static/js/ace.js"></script>
  <!-- 下拉框 -->
  <script src="static/js/chosen.jquery.js"></script>
  <!-- 日期框 -->
  <script src="static/js/bootstrap-datepicker.js"></script>
  <!--提示框-->
  <script type="text/javascript" src="static/js/jquery.tips.js"></script>
  <script type="text/javascript">

    var example2=$('#example2').DataTable;
    $(function () {
        if (screen.width > 1600) {
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
                'sScrollX':false,
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
                'iDisplayLength': 10,
                'sScrollX':false,
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
                'iDisplayLength': 8,
                'sScrollX':false,
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

    function home() {
      parent.document.getElementById("mainFrame").src = "<%=basePath%>login_default.do";
    }


    //修改
    function edit(id) {
      // top.jzts();
      var winId = "clientWin";
      modals.openWin({
        winId: winId,
        title: '新增',
        width: '900px',
          backdrop: 'static',
          keyboard: false,
        url: '<%=basePath%>busiapply/findbusilogById.do?id=' + id
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