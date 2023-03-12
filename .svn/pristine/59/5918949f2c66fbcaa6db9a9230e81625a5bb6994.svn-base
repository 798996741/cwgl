<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- jsp文件头和头部 -->
<%--
<%@ include file="../index/top.jsp"%> --%>
<%@ include file="../../system/include/incJs_mx.jsp"%>

<!-- 日期框 -->
</head>

<body class="hold-transition skin-blue sidebar-mini">


	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper" style="width:100%;margin-left:0px;">


		<section class="content container-fluid">
			<div class="seat-top">
				<div class="seat-subtitle">系统用户</div>
				<div class="seat-button">
					<c:if test="${QX.add == 1 }">
						<a href="javascript:void (0)" onclick="add();">新增</a>
					</c:if>
				</div>
				<div class="seat-button">
					<c:if test="${QX.add == 1 }">
						<a href="javascript:void (0)" onclick="wxuser();">同步</a>
					</c:if>
				</div>
			</div>
			<div class="seat-middle" style="width: 100%;">
				<div class="seat-middle-r" style="width: 100%;">
					<!-- <div class="box-body" > -->

					<table style="width: 100%" border="0" cellspacing="0"
						cellpadding="0">
						<thead>
							<tr>
								<th class="center">编号</th>
								<th class="center">所属单位</th>
								<th class="center">用户名</th>
								<th class="center">姓名</th>
								<th class="center">角色</th>
								<th class="center"><i class="ace-icon fa fa-envelope-o"></i>邮箱</th>
								<th class="center"><i
									class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>最近登录</th>
								<th class="center">上次登录IP</th>
								<th class="center">操作</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${not empty userList}">
									<c:if test="${QX.cha == 1 }">
										<c:forEach items="${userList}" var="user" varStatus="vs">

											<tr>


												<td class="center">${user.NUM }</td>
												<td class="center">${user.AREA_NAME }</td>
												<td class="center"><a
													onclick="viewUser('${user.USERNAME}')"
													style="cursor:pointer;">${user.USERNAME }</a></td>
												<td class="center">${user.NAME }</td>
												<td class="center">${user.ROLE_NAME }</td>
												<td class="center"><a title="发送电子邮件"
													style="text-decoration:none;cursor:pointer;"
													<c:if
                            test="${QX.email == 1 }">onclick="sendEmail('${user.EMAIL }');"
                  </c:if>>${user.EMAIL }&nbsp;<i
														class="ace-icon fa fa-envelope-o"></i></a></td>
												<td class="center">${user.LAST_LOGIN}</td>
												<td class="center">${user.IP}</td>
												<td align="center">

													<div class="flex-row-center">

														<c:if test="${QX.edit == 1 }">
<%--															<img class="cy_bj" title="编辑公司信息"--%>
<%--																src="static/img/home/edit.png"--%>
<%--																style="width: 59px;height: 25px;"--%>
<%--																onclick="editUser('${user.USER_ID}');">--%>
<%--															<i title="编辑"></i>--%>
<%--															</img>--%>
															<div class="content-edit home-img cy_bj" title="编辑公司信息"
																 onclick="editUser('${user.USER_ID}');" style="margin-right: 10%">
																<font class="home-img-size">编辑</font>
															</div>
														</c:if>
														&nbsp;&nbsp;&nbsp;&nbsp;
														<c:if test="${QX.del == 1 }">
<%--															<img class="cy_sc" src="static/img/home/delete.png"--%>
<%--																style="width: 59px;height: 25px;"--%>
<%--																onclick="delUser('${user.USER_ID }','${user.USERNAME }');">--%>
<%--															&lt;%&ndash;,'${user.USERNAME }'&ndash;%&gt;--%>
<%--															<i title="删除"></i>--%>
<%--															</img>--%>
															<div class="content-delete home-img cy_sc" title="删除"
																 onclick="delUser('${user.USER_ID }','${user.USERNAME }');">
																<font class="home-img-size">删除</font>
															</div>
														</c:if>
													</div>

												</td>
											</tr>

										</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="10" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
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


		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
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
    function tosearch() {
      	var keywords = $("#keywords").val();
      	location.href = "<%=path%>/user/listUsers.do?keywords=" + encodeURI(encodeURI(keywords));
    }

	function wxuser() {
		location.href = "<%=path%>/app_busi/saveuser.do";
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
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 18,
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
    function delUser(userId, msg) {
      if (confirm("确定要删除[" + msg + "]吗?")) {

        var url = "<%=basePath%>user/deleteU.do?USER_ID=" + userId + "&tm=" + new Date().getTime();
        $.get(url, function (data) {
          //nextPage(${page.currentPage});
          setTimeout("self.location.reload()", 100);
        });
      }
    }

    //新增
    function add() {
      //top.jzts();
      var winId = "userWin";
      modals.openWin({
        winId: winId,
        title: '新增',
        width: '900px',
        url: '<%=basePath%>user/goAddU.do'
        /*, hideFunc:function(){
            modals.info("hide me");
        },
        showFunc:function(){
            modals.info("show me");
        } */
      });

    }

    //修改
    function editUser(user_id) {
      // top.jzts();
      var winId = "userWin";
      modals.openWin({
        winId: winId,
        title: '新增',
        width: '900px',
        url: '<%=basePath%>user/goEditU.do?USER_ID=' + user_id
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
      $(".row thead").find("th:first").after("<th id='cy_thk'></th>");
      $(".row tbody").find("tr").find("td:first").after("<td id='cy_thk'></td>");
      $('.seat-middle').find(".row:first").hide();

      $(".xtyh-middle-r").find(".row:last").addClass("row-zg");
      $(".xtyh-middle-r").find(".row:eq(1)").addClass("row-two");
    });
  </script>
</body>

</html>