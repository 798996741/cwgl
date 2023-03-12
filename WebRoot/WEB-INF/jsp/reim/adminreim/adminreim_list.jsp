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
          <div class="seat-subtitle">超级数据库</div>
<%--          <div class="seat-button">--%>
<%--            <a href="javascript:void (0) " onclick="add();" style="color: #fff">新增</a>--%>
<%--          </div>--%>
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
                <th>公司</th>
                <th>微信</th>
                <th>审核<br/>编号</th>
                <th>提交人</th>
                <th>提交<br/>时间</th>
                <th>上级</th>
                <th>审核<br/>时间</th>
<%--                <th>上级</br>审核状态</th>--%>
                <th>财务</th>
                <th>审核<br/>时间</th>
<%--                <th>财务</br>审核状态</th>--%>
                <th>总经理</th>
                <th>审核<br/>时间</th>
<%--                <th>总经理</br>审核状态</th>--%>
                <th>关联<br/>编号</th>
                <th>报销<br/>详情</th>
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
                      <td>${cList.company}</td>
                      <td>${cList.subuserid}</td>
                      <td>${cList.reim_code}</td>
                      <td>${cList.submitter}</td>
                      <td>${cList.submittime}</td>
                      <td>${cList.supauditor}</td>
                      <td>${cList.supauditime}</td>
<%--                      <td>--%>
<%--                        <c:if test="${cList.supsche == 0}">--%>
<%--                          暂未审核--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${cList.supsche == 1}">--%>
<%--                          审核通过--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${cList.supsche == 2}">--%>
<%--                          审核不通过--%>
<%--                        </c:if>--%>
<%--                      </td>--%>
                      <td>${cList.deptauditor}</td>
                      <td>${cList.depttime}</td>
<%--                      <td>--%>
<%--                        <c:if test="${cList.deptsche == 0}">--%>
<%--                          暂未审核--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${cList.deptsche == 1}">--%>
<%--                          审核通过--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${cList.deptsche == 2}">--%>
<%--                          审核不通过--%>
<%--                        </c:if>--%>
<%--                      </td>--%>
                      <td>${cList.managerauditor}</td>
                      <td>${cList.managertime}</td>
<%--                      <td>--%>
<%--                        <c:if test="${cList.managersche == 0}">--%>
<%--                        暂未审核--%>
<%--                      </c:if>--%>
<%--                        <c:if test="${cList.managersche == 1}">--%>
<%--                          审核通过--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${cList.managersche == 2}">--%>
<%--                          审核不通过--%>
<%--                        </c:if>--%>
<%--                      </td>--%>
                      <td>${cList.busi_code}</td>
                      <td align="center">
<%--                        <img src="static/img/home/edit.png" style="width: 59px;height: 25px;" class="cy_bj"--%>
<%--                          title="编辑新增开户行" onclick="editSellp('${cList.cliid}');">--%>
<%--                        <i title="编辑"></i>--%>
<%--                        </img>--%>
                        <div class="content-edit home-img cy_bj" title="编辑"
                             onclick="editlog1('${cList.uid}','${cList.id}');" >
                          <font class="home-img-size">编辑</font>
                        </div>
                      </td>
                      <td align="center">
                        <div class="flex-row-center">

                            <div class="content-edit home-img cy_bj" title="编辑" style="margin-right: 10%"
                                 onclick="editreim('${cList.uid}','${cList.id}');" >
                              <font class="home-img-size">编辑</font>
                            </div>
                            <div class="content-delete home-img cy_sc" title="删除"
                                 onclick="del('${cList.uid}','${cList.id}');" >
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
                      <td colspan="16" class="center">您无权查看</td>
                    </tr>
                  </c:if>
                </c:when>
                <c:otherwise>
                  <tr class="main_info">
                    <td colspan="16" class="center">没有相关数据</td>
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
                'iDisplayLength': 6,
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

    //$(top.hangge());

    //检索
    function searchs() {
      //top.jzts();
      //alert($("#lastLoginStart").val());
      $("#userForm").submit();
    }


    //删除
    function del(uid,id) {
      if (confirm("确定要删除吗?")) {

        var url = "<%=basePath%>adminreim/deletereimauditbyid.do?id=" + id;
        $.get(url, function (data) {
          //nextPage(${page.currentPage});
          setTimeout("self.location.reload()", 100);
        });
      }
    }

    //新增
    function add() {
      //top.jzts();
      var winId = "clientWin";
      modals.openWin({
        winId: winId,
        title: '新增',
        width: '900px',
          backdrop: 'static',
          keyboard: false,
        url: '<%=basePath%>client/goAddC.do'
        /*, hideFunc:function(){
            modals.info("hide me");
        },
        showFunc:function(){
            modals.info("show me");
        } */
      });

    }

    //修改
    function editreim(uid,id) {
      // top.jzts();
      var winId = "editreimWin";
      modals.openWin({
        winId: winId,
        title: '修改',
        width: '900px',
          backdrop: 'static',
          keyboard: false,
        url: '<%=basePath%>adminreim/findadminreimbyid.do?id=' + id +'&uid='+ uid
        /*, hideFunc:function(){
            modals.info("hide me");
        },
        showFunc:function(){
            modals.info("show me");
        } */
      });

    }

    function editlog1(uid,id) {
      // top.jzts();
      var winId = "editlogWin";
      modals.openWin({
        winId: winId,
        title: '列表',
        width: '900px',
          backdrop: 'static',
          keyboard: false,
        url: '<%=basePath%>adminreim/findadminlog.do?uid=' + uid+'&id='+id
        /*, hideFunc:function(){
            modals.info("hide me");
        },
        showFunc:function(){
            modals.info("show me");
        } */
      });

    }


    //去发送短信页面
    function sendSms(phone) {
      //top.jzts();
      var diag = new top.Dialog();
      diag.Drag = true;
      diag.Title = "发送短信";
      diag.URL = '<%=basePath%>head/goSendSms.do?PHONE=' + phone + '&msg=appuser';
      diag.Width = 600;
      diag.Height = 265;
      diag.CancelEvent = function () { //关闭事件
        diag.close();
      };
      diag.show();
    }

    //去发送电子邮件页面
    function sendEmail(EMAIL) {
      // top.jzts();
      var diag = new top.Dialog();
      diag.Drag = true;
      diag.Title = "发送电子邮件";
      diag.URL = '<%=basePath%>head/goSendEmail.do?EMAIL=' + EMAIL;
      diag.Width = 660;
      diag.Height = 486;
      diag.CancelEvent = function () { //关闭事件
        diag.close();
      };
      diag.show();
    }

    //发站内信
    function sendFhsms(username) {
      //top.jzts();
      var diag = new top.Dialog();
      diag.Drag = true;
      diag.Title = "站内信";
      diag.URL = '<%=basePath%>fhsms/goAdd.do?username=' + username;
      diag.Width = 660;
      diag.Height = 444;
      diag.CancelEvent = function () { //关闭事件
        diag.close();
      };
      diag.show();
    }

    $(function () {

    });

    //导出excel
    function toExcel() {
      var keywords = $("#nav-search-input").val();
      var lastLoginStart = $("#lastLoginStart").val();
      var lastLoginEnd = $("#lastLoginEnd").val();
      var ROLE_ID = $("#role_id").val();
      window.location.href = '<%=basePath%>user/excel.do?keywords=' + keywords + '&lastLoginStart=' + lastLoginStart + '&lastLoginEnd=' + lastLoginEnd + '&ROLE_ID=' + ROLE_ID;
    }

    //打开上传excel页面
    function fromExcel() {
      //top.jzts();
      var diag = new top.Dialog();
      diag.Drag = true;
      diag.Title = "EXCEL 导入到数据库";
      diag.URL = '<%=basePath%>user/goUploadExcel.do';
      diag.Width = 300;
      diag.Height = 150;
      diag.CancelEvent = function () { //关闭事件
        if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
          if ('${page.currentPage}' == '0') {
            // top.jzts();
            setTimeout("self.location.reload()", 100);
          } else {
            nextPage(${ page.currentPage });
          }
        }
        diag.close();
      };
      diag.show();
    }

    //查看用户
    function viewUser(USERNAME) {
      if ('admin' == USERNAME) {
        bootbox.dialog({
          message: "<span class='bigger-110'>不能查看admin用户!</span>",
          buttons:
            { "button": { "label": "确定", "className": "btn-sm btn-success" } }
        });
        return;
      }
      // top.jzts();
      var diag = new top.Dialog();
      diag.Drag = true;
      diag.Title = "资料";
      diag.URL = '<%=basePath%>user/view.do?USERNAME=' + USERNAME;
      diag.Width = 469;
      diag.Height = 380;
      diag.CancelEvent = function () { //关闭事件
        diag.close();
      };
      diag.show();
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