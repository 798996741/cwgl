<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fh.util.Jurisdiction" %>
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
<%@ include file="../system/include/incJs_mx.jsp" %>
<link rel="stylesheet" href="static/css/common.css">
<!--<link rel="stylesheet" href="static/css/main.css">-->
<link rel="stylesheet" href="static/css/tree.css">
<!--<link rel="stylesheet" href="static/css/media.css">-->
</head>
<style>
.seat-middle-top {
	margin-top: 0;
}
</style>
<body class="hold-transition skin-blue sidebar-mini">


	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper" style="width:100%;margin-left:0px;">
		<section class="content container-fluid">
			<div class="seat-middle-top-x"></div>
			<div class="seat-middle-top">
				<div class="seat-top">
					<div class="seat-subtitle">单位管理</div>
					<div class="seat-button">
						<%--<%if(jurisdiction.hasQx("990501")){ %>--%>
							<a class="" onclick="sync();">同步</a>
						<%--<%} %>--%>
					</div>
					<div class="seat-button">
						<%--<%if(jurisdiction.hasQx("990501")){ %>--%>
						<a class="" onclick="add('${AREA_ID}');">新增</a>
						<%--<%} %>--%>
					</div>
				</div>
				<%-- <div class="seat-middle-top-right">
					<input placeholder="搜  索" name="keywords" id="keywords" value="${keywords }"> 
					<a href="javascript:void(0)">
					<img src="static/login/images/icon-search.png" onclick="tosearch()"></a>
				</div> --%>
			</div>
			<div class="seat-middle">
				<!--  <div class="seat-middle-nr"> -->

				<div class="seat-middle-r" style="width: 100%;">
					<!-- <div class="box-body" > -->

					<table id="example_dic" class="table-blue" style="width: 100%" border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr>

								<th class="center" style="width:50px;">序号</th>
								<th class="center">名称</th>
								<th class="center">地区编码</th>
								<th class="center">地区级别</th>
								<th class="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
										<c:forEach items="${varList}" var="var" varStatus="vs">
											<tr id="tr${vs.index+1}">
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class='center'><a
													href="javascript:goSondict('${var.AREA_ID}')"><i
														class="ace-icon fa fa-share bigger-100"></i>&nbsp;${var.NAME}</a></td>
												<td class='center'>${var.AREA_CODE}</td>
												<td class='center'>${var.AREA_LEVEL}</td>
												<td class="center">
													<div class="flex-row-around">
														<%--<%if(jurisdiction.hasQx("990502")){ %>--%>
															<%--<a class="cy_bj" title="编辑"--%>
																<%--onclick="edit('${var.AREA_ID}');"> <i title="编辑"></i>--%>
															<%--</a>--%>
															<div class="content-edit home-img cy_bj" title="编辑"
																 onclick="edit('${var.AREA_ID}');" >
																<font class="home-img-size">编辑</font>
															</div>

														<%--<%} %>--%>
														<%--<%if(jurisdiction.hasQx("990503")){ %>--%>
															<%--<c:if test="${not empty var.PARENTID}">--%>
																<%--<a style="margin-left:10px;" class="cy_sc"--%>
																	<%--onclick="del('${var.AREA_ID}');"> <i title="删除"></i>--%>
																<%--</a>--%>
																<div class="content-delete home-img cy_sc" title="删除"
																	 onclick="del('${var.AREA_ID}');" >
																	<font class="home-img-size">删除</font>
																</div>
															<%--</c:if>--%>
														<%--<%} %>--%>
													</div>

												</td>

											</tr>

										</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>

						</tbody>

					</table>


				</div>

			</div>
		</section>

		<c:if test="${not empty action}">
			<div style="width:100%;text-align:center">
				<a class="btn btn-mini btn-danger" id="alink" data-btn-type="cancel"
					data-dismiss="modal">确认</a>
			</div>
		</c:if>
	</div>

	<!-- /.content-wrapper -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>


	<script type="text/javascript">
		//$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			var keywords=$("#keywords").val();
			location.href="<%=path%>/dictionaries/list.do?keywords="+encodeURI(encodeURI(keywords));
		}
		
		//去此ID下子级列表
		function goSondict(AREA_ID){
			//top.jzts();
			window.location.href="<%=basePath%>areamanage/list.do?AREA_ID="+AREA_ID;
		};
		
		//去此ID下子列表
		function goSondict(DICTIONARIES_ID){
			top.jzts();
			window.location.href="<%=basePath%>dictionaries/list.do?DICTIONARIES_ID="+DICTIONARIES_ID;
		};

		function sync(){
			window.location.href="<%=basePath%>areamanage/syncdept";
			parent.location.href="<%=basePath%>areamanage/listTree.do?AREA_ID=${AREA_ID}";
		}
		//新增
		function add(AREA_ID){
		
		 	var winId = "userWin";
		  	modals.openWin({
	          	winId: winId,
	          	title: '新增',
	          	width: '850px',
	          	height: '600px',
                backdrop: 'static',
                keyboard: false,
	          	url: '<%=basePath%>areamanage/goAdd.do?AREA_ID='+AREA_ID
	          	/*, hideFunc:function(){
	             	 modals.info("hide me");
	          	},
	          	showFunc:function(){
	              	modals.info("show me");
	          	} */
	      	});
			 
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					
					var url = "<%=basePath%>areamanage/delete.do?AREA_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						tosearch();
					});
				}
			});
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>areamanage/delete.do?AREA_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if("success" == data.result){
							parent.location.href="<%=basePath%>areamanage/listTree.do?AREA_ID=${AREA_ID}&dnowPage=${page.currentPage}";
						}else if("false" == data.result){
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败！请先删除子级.</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}
					});
				}
			});
		}
		
		
		//修改
		function edit(Id){
		
			var winId = "userWin";
			modals.openWin({
		         winId: winId,
		         title: '编辑',
		         width: '850px',
		         height:'600px',
                backdrop: 'static',
                keyboard: false,
		         url: '<%=basePath%>areamanage/goEdit.do?AREA_ID='+Id
		         /*, hideFunc:function(){
		             modals.info("hide me");
		         },
		         showFunc:function(){
		             modals.info("show me");
		         } */
		     });
			 
		}
	</script>
	<script>
		$(function() {

			$('#example_dic').DataTable({
				'paging' : true,
				'lengthChange' : false,
				'searching' : false,
				'ordering' : false,
				'info' : true,
				'autoWidth' : false
			})
		})
		$(function () {
			$(".row thead").find("th:first").addClass("cy_th");
			$(".row tbody").find("tr").find("td:first").addClass("cy_td");
			$(".row thead").find("th:first").after("<th id='cy_thk'></th>");
			$(".row tbody").find("tr").find("td:first").after("<td id='cy_thk'></td>");
			$('.seat-middle').find(".row:first").hide();
			
			$(".xtyh-middle-r").find(".row:last").addClass("row-zg");
			$(".xtyh-middle-r").find(".row:eq(1)").addClass("row-two");
		});
		function home() {
			parent.parent.document.getElementById("mainFrame").src = "<%=basePath%>login_default.do";
		}
		
		</script>