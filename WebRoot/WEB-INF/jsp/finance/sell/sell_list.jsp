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
    <%--    <%@ include file="../../system/include/incCss.jsp" %>--%>
    <%@ include file="../../system/include/incJs_mx.jsp" %>
    <link rel="stylesheet" href="static/css/common.css">
    <link rel="stylesheet" href="static/css/main.css">
    <link rel="stylesheet" href="static/css/tree.css">
    <link rel="stylesheet" href="static/css/media.css">
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/css/datepicker.css"/>
</head>

<body class="no-skin">


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="width:100%;margin-left:0px;">
    <section class="content container-fluid" id="buy-content">
        <div class="content-top">
            <div class="content-top-left">
                <div class="flex-row-between padding-5px">
                    <div class="flex-row">
                        <div class="border-style width-185px">
                            <span class="border-size">签订时间</span>
                            <div class="border-line"></div>
                            <input class="date-picker" name="signtime" id="signtime1" autoComplete="off" title="开始时间"
                                   placeholder="开始时间" value="${pd.signtime1}" type="text"
                                   data-date-format="yyyy-mm-dd"/>
                        </div>
                        <div class="border-line-width"></div>
                        <div class="border-style width-185px">
                            <span class="border-size">签订时间</span>
                            <div class="border-line"></div>
                            <input class="date-picker" name="signtime" id="signtime2" autoComplete="off" title="结束时间"
                                   placeholder="结束时间" value="${pd.signtime2}" type="text"
                                   data-date-format="yyyy-mm-dd"/>
                        </div>
                    </div>


                    <button type="button" class="btn btn-default-sm button-blue width-55px" onclick="tosearch()">
                        <font>查&nbsp;询</font>
                    </button>
                    <button type="button" class="btn btn-default-sm button-blue width-55px more"
                            style="background-color: #FFCC33">
                        <font>更&nbsp;多</font>
                    </button>
                    <div class="border-style width-165px" style="position: relative">
                        <input type="text" placeholder="搜索" style="padding-left: 10px;"  name="keywords" id="keywords" value="${pd.keywords }">
                        <div class="search" style="background: url('static/img/home/search_icon.png') no-repeat;position: absolute;right: 5%;
    background-size: 15px;width: 15px;height: 15px;cursor: pointer" onclick="sellsearch()"></div>
                    </div>
                    <div class="width-63px"></div>
                </div>
                <div class="flex-row-between padding-5px" style="display: none" id="ex-region">
                    <div class="border-style width-278px">
                        <span class="border-size">存在未收款</span>
                        <div class="border-line"></div>
                        <div class="border-select">
                            <label>
                                <input type="radio" value="0" name="connmon"
                                       <c:if test="${pd.connmon==0}">checked</c:if>
                                ><span></span><span style="font-weight:normal;margin-left:2px;cursor: pointer;">是</span>
                            </label>
                            <label>
                                <input type="radio" value="1" name="connmon"
                                       <c:if test="${pd.connmon==1}">checked</c:if>
                                ><span></span><span style="font-weight:normal;margin-left:2px;cursor: pointer;">否</span>
                            </label>
                            <label>
                                <input type="radio" value="" name="connmon"
                                       <c:if test="${pd.connmon=='' or pd.connmon==null}">checked
                                </c:if>><span></span>
                                <span style="font-weight:normal;margin-left:2px;cursor: pointer;">全部</span>
                            </label>
                        </div>
                    </div>
                    <div class="border-style width-278px">
                        <span class="border-size">存在未收票</span>
                        <div class="border-line"></div>
                        <div class="border-select">

                            <label>
                                <input type="radio" value="0" name="invnmon"
                                       <c:if test="${pd.invnmon==0}">checked</c:if>
                                ><span></span><span style="font-weight:normal;margin-left:2px;cursor: pointer;">是</span>
                            </label>
                            <label>
                                <input type="radio" value="1" name="invnmon"
                                       <c:if test="${pd.invnmon==1}">checked</c:if>
                                ><span></span><span style="font-weight:normal;margin-left:2px;cursor: pointer;">否</span>
                            </label>
                            <label>
                                <input type="radio" value="" name="invnmon"
                                       <c:if test="${pd.invnmon=='' or pd.invnmon==null}">checked
                                </c:if>><span></span>
                                <span style="font-weight:normal;margin-left:2px;cursor: pointer;">全部</span>
                            </label>
                        </div>
                    </div>
                    <div class="border-style width-165px">
                        <span class="border-size">甲方</span>
                        <div class="border-line"></div>
                        <select class="selectpicker show-tick form-control seat-select" data-live-search="true" name="clino" id="clino1"style="display: flex;align-items: center;width: 118px"
                        >
                            <option value="" selected></option>
                            <c:forEach items="${clino}" var="cliname" varStatus="vs">
                                <option value="${cliname.clino}"
                                        <c:if test="${cliname.clino==pd.clino}">selected</c:if>
                                >${cliname.clisname}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="width-72px"></div>
                </div>
                <div class="flex-row-between padding-5px" style="display: none" id="ex-region0">
                    <div class="border-style width-185px">
                        <span class="border-size">合同状态</span>
                        <div class="border-line"></div>
                        <select class="seat-select width-109px" name="state" id="state" data-live-search="true"
                                style="display: flex;align-items: center"
                                data-placeholder="合同状态">
                            <option value=""  <c:if test="${pd.state=='' or pd.state==null}">selected</c:if>></option>
                            <option value="2"  <c:if test="${pd.state=='2'}">selected</c:if>>执行中</option>
                            <option value="0"  <c:if test="${pd.state=='0'}">selected</c:if>>完成</option>
                            <option value="1"  <c:if test="${pd.state=='1'}">selected</c:if>>作废</option>
                        </select>

                    </div>
                    <div class="border-style width-185px">
                        <span class="border-size">存档情况</span>
                        <div class="border-line"></div>
                        <select class="seat-select width-109px" name="isarc" id="isarc" data-live-search="true"
                                style="display: flex;align-items: center"
                                data-placeholder="存档情况">
                            <option value=""  <c:if test="${pd.isarc=='' or pd.isarc==null}">selected</c:if>></option>
                            <option value="0"  <c:if test="${pd.isarc=='0'}">selected</c:if>>是</option>
                            <option value="1"  <c:if test="${pd.isarc=='1'}">selected</c:if>>否</option>
                        </select>
                    </div>
                    <div class="border-style width-185px">
                        <span class="border-size">审核状态</span>
                        <div class="border-line"></div>
                        <select class="seat-select width-109px" name="isaudit" id="isaudit" data-live-search="true"
                                style="display: flex;align-items: center"
                                data-placeholder="审核状态">
                            <option value=""  <c:if test="${pd.isaudit=='' or pd.isaudit==null}">selected</c:if>></option>
                            <option value="0"  <c:if test="${pd.isaudit=='0'}">selected</c:if>>审核通过</option>
                            <option value="1"  <c:if test="${pd.isaudit=='1'}">selected</c:if>>审核不通过</option>
                            <option value="2"  <c:if test="${pd.isaudit=='2'}">selected</c:if>>暂未审核</option>
                        </select>
                    </div>
                    <div class="border-style width-165px">
                        <span class="border-size">乙方</span>
                        <div class="border-line"></div>
                        <select class="selectpicker show-tick form-control seat-select" name="cno" id="cno1"data-live-search="true"
                                style="display: flex;align-items: center"
                                data-placeholder="乙方">
                            <option value="" selected></option>
                            <c:forEach items="${cno}" var="csname" varStatus="vs">
                                <option value="${csname.cno}"
                                        <c:if test="${csname.cno==pd.cno}">selected</c:if>
                                > ${csname.csname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%--                    <button type="button" class="btn btn-default-sm btn btn-default-sm button-blue"--%>
                    <%--                            onclick="tosearch()">--%>
                    <%--                        <font>查&nbsp;询</font>--%>
                    <%--                    </button>--%>
                    <div class="width-80px"></div>
                </div>
            </div>
            <div class="flex-row">
                <%--                <img src="static/img/home/import.png" onclick="load();"--%>
                <%--                     class="top-img" style="width:61px;height:21px;"/>--%>
                <%--                <img src="static/img/home/export.png" onclick="toExcelsell();"--%>
                <%--                     class="top-img" style="width:61px;height:21px;"/>--%>
                <%--                <img src="static/img/home/add.png" class="top-img" style="width:61px;height:21px;" data-toggle="modal"--%>
                <%--                     data-target="#add" onclick="add();">--%>
                <div class="top-add top-img" onclick="add();">
                    <font class="top-img-size">新增</font>
                </div>
                <div class="top-import top-img" onclick="load();">
                    <font class="top-img-size">导入</font>
                </div>
                <div class="top-export top-img" onclick="toExcelsell();">
                    <font class="top-img-size">导出</font>
                </div>


            </div>
        </div>
        <div class="seat-middle" style="width: 100%;">
            <div class="seat-middle-r" style="width: 100%">
                <!-- <div class="box-body" > -->
                <table id="example2" class="table-blue" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr>
                        <th style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">编号
                        </th>
                        <th>合同签</br>订时间</th>
                        <th>合同编号</th>
                        <th>项目/</br>产品类型</th>
                        <th>甲方</th>
                        <th>乙方</th>
                        <th>合同</br>总金额</th>
                        <th>未回款</br>金额</th>
                        <th>未开票</br>金额</th>
                        <th>存档</br>情况</th>
                        <th>合同</br>状态</th>
                        <th>审核</br>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty clist}">
                            <%--<c:if test="${QX.cha == 1 }">--%>
                            <c:forEach items="${clist}" var="clist" varStatus="vs">
                                <tr>
                                    <td style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">${vs.count}</td>
                                    <td>${clist.signtime}</td>
                                    <td align="left">${clist.conno}</td>
                                    <td>${clist.pno }</td>
                                    <td>
                                        <c:forEach items="${clino}" var="cliname" varStatus="vs">
                                            <c:if test="${cliname.clino==clist.clino}">${cliname.clisname}</c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach items="${cno}" var="csname" varStatus="vs">
                                            <c:if test="${csname.cno==clist.cno}">${csname.csname}</c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${clist.consmon}</td>
                                    <td>
                                        <c:if test="${clist.connmon==null}">${clist.consmon}</c:if>
                                        <c:if test="${clist.connmon!=null}">
                                            ${clist.connmon}

                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${clist.invnmon==null}">${clist.consmon}</c:if>
                                        <c:if test="${clist.invnmon!=null}">
                                            ${clist.invnmon}

                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${clist.isarc==0}">是</c:if>
                                        <c:if test="${clist.isarc==1}">否</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${clist.state==2}">执行中</c:if>
                                        <c:if test="${clist.state==0}">完成</c:if>
                                        <c:if test="${clist.state==1}">作废</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${clist.isaudit=='0'}">审核通过</c:if>
                                        <c:if test="${clist.isaudit=='1'}">审核不通过</c:if>
                                        <c:if test="${clist.isaudit=='2'}">暂未审核</c:if></td>
                                    <td align="center">
                                        <div class="flex-row-around">
                                            <c:if test="${clist.isaudit != 0 or user.QX_SH == 1 or clist.state!=0}">
                                                <div class="content-edit home-img cy_bj" title="编辑"
                                                     onclick="editContract('${clist.conid}');">
                                                    <font class="home-img-size">编辑</font>
                                                </div>
                                            </c:if>
                                            <c:if test="${user.QX_SH == 1}">
                                                <div class="content-delete home-img cy_bj" title="删除"
                                                     onclick="delContract('${clist.conid}');"
                                                     style="margin-right: 10%">
                                                    <font class="home-img-size">删除</font>
                                                </div>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <%--</c:if>--%>
                            <%--<c:if test="${QX.cha == 0 }">--%>
                                <%--<tr>--%>
                                    <%--<td colspan="12">您无权查看</td>--%>
                                <%--</tr>--%>
                            <%--</c:if>--%>
                        </c:when>
                        <c:otherwise>
                            <tr class="main_info">
                                <td colspan="13">没有相关数据</td>
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


    <!-- Content Header (Page header) -->
    <%-- <section class="content-header">
      <h1>
        	系统管理
        <small>用户管理</small>
      </h1>
      <ol class="breadcrumb">
        <li>
			<a href="javascript:;" onclick="home()">
				<i class="fa fa-dashboard"></i> 主页
			</a>
		</li>
		<li class="active">用户管理</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              	<c:if test="${QX.add == 1 }">
					<a class="btn btn-mini btn-success" onclick="add();">新增</a>
				</c:if>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>

					<th >编号</th>
					<th >用户名</th>
					<th >姓名</th>
					<th >角色</th>
					<th ><i class="ace-icon fa fa-envelope-o"></i>邮箱</th>
					<th ><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>最近登录</th>
					<th >上次登录IP</th>
					<th >操作</th>
                </tr>
                </thead>
                <tbody>

               <c:choose>
					<c:when test="${not empty userList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${userList}" var="user" varStatus="vs">

							<tr>


								<td >${user.NUM }</td>
								<td ><a onclick="viewUser('${user.USERNAME}')" style="cursor:pointer;">${user.USERNAME }</a></td>
								<td >${user.NAME }</td>
								<td >${user.ROLE_NAME }</td>
								<td ><a title="发送电子邮件" style="text-decoration:none;cursor:pointer;" <c:if test="${QX.email == 1 }">onclick="sendEmail('${user.EMAIL }');"</c:if>>${user.EMAIL }&nbsp;<i class="ace-icon fa fa-envelope-o"></i></a></td>
								<td >${user.LAST_LOGIN}</td>
								<td >${user.IP}</td>
								<td >

									<div >

										<c:if test="${QX.edit == 1 }">
										<a class="btn btn-xs btn-success" title="编辑" onclick="editUser('${user.USER_ID}');">
											<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
										</a>
										</c:if>&nbsp;&nbsp;&nbsp;&nbsp;
										<c:if test="${QX.del == 1 }">
										<a class="btn btn-xs btn-danger"  style="margin-left:10px" onclick="delUser('${user.USER_ID }','${user.USERNAME }');">
											<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
										</a>
										</c:if>
									</div>

								</td>
							</tr>

						</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="10" >您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>

                </tbody>

              </table>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section> --%>
    <!-- /.content -->
</div>
<%--<%@ include file="../../system/include/incJs.jsp" %>--%>
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

    $(document).ready(function () {
        $('.selectpicker').selectpicker('refresh')
        // {'theme':"classic"}
    });

    window.onload = function () {
        $('.content-wrapper').css("margin-left", "0px")
        initialize()
    }

    function initialize() {
        $(".more").delay("slow").html("<font>更&nbsp;多</font>")
        $('.content-top').delay("slow").animate({
            height: '40px',
        })
        $('#ex-region').delay("slow").hide()
        $('#ex-region0').delay("slow").hide()
        $('#ex-region1').delay("slow").hide()
        $('#ex-region2').delay("slow").hide()
        $('.top-img').delay("slow").css("margin-bottom", "0px")
    }

    $(".more").click(function () {
        if (document.getElementsByClassName("content-top")[0].style.height === "120px") {
            $('.content-top').animate({
                height: '40px',
            })
            setTimeout(function () {
                $('#ex-region').hide()
                $('#ex-region0').hide()
                $('#ex-region1').hide()
                $('#ex-region2').hide()
                $(".more").html("<font>更&nbsp;多</font>")
                $('.top-img').delay("slow").css("margin-bottom", "0px")
            }, 150);
        } else {
            $('.content-top').animate({
                height: '120px',
            })
            setTimeout(function () {
                $(".more").html("<font>隐&nbsp;藏</font>")
                $('.top-img').delay("slow").css("margin-bottom", "70px")
                $('#ex-region').delay("slow").show()
                $('#ex-region0').delay("slow").show()
                $('#ex-region1').delay("slow").show()
                $('#ex-region2').delay("slow").show()
            }, 150);
        }
    })
    $(".sidebar-toggle").click(function () {
        $('.content-wrapper').css("margin-left", "162px")
    })


    function toExcelsell() {
        var clino1 = $("#clino1").val();
        var cno1 = $("#cno1").val();
        var signtime1 = $("#signtime1").val();
        var signtime2 = $("#signtime2").val();
        var isaudit = $("#isaudit").val();
        var state = $("#state").val();
        var isarc = $("#isarc").val();
        if ($('input[name="connmon"]').is(':checked')) {
            var connmon = $('input[name="connmon"]:checked').val();
        } else {
            var connmon = "";
        }
        if ($('input[name="invnmon"]').is(':checked')) {
            var invnmon = $('input[name="invnmon"]:checked').val();
        } else {
            var invnmon = "";
        }

        window.location.href = "<%=basePath%>sell/excel.do?clino1=" + encodeURI(encodeURI(clino1)) +
            "&cno1=" + encodeURI(encodeURI(cno1)) +
            "&signtime1=" + encodeURI(encodeURI(signtime1)) +
            "&signtime2=" + encodeURI(encodeURI(signtime2)) +
            "&connmon=" + encodeURI(encodeURI(connmon)) +
            "&invnmon=" + encodeURI(encodeURI(invnmon)) +
            "&state=" + encodeURI(encodeURI(state)) +
            "&isarc=" + encodeURI(encodeURI(isarc))+
            "&isaudit=" + encodeURI(encodeURI(isaudit));
    }

    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    // window.onload = function () {
    //     var t = new Date();
    //     var y = t.getFullYear();
    //     var m = t.getMonth() + 1;
    //     var d = t.getDate();
    //     var signtime1 = document.getElementById('signtime1').value;
    //     if (signtime1 == '') {
    //         document.getElementById('signtime1').value = y + '-' + m + '-01';
    //     }
    //     var signtime2 = document.getElementById('signtime2').value;
    //
    //     if (signtime2 == '') {
    //         document.getElementById('signtime2').value = y + '-' + m + '-' + d;
    //     }
    //
    // };
    function sellsearch() {
        var keywords = $("#keywords").val();
        location.href = "<%=path%>/sell/findContract.do?keywords=" + encodeURI(encodeURI(keywords));
    }
    function tosearch() {
        //top.jzts();

        var clino1 = $("#clino1").val();
        var cno1 = $("#cno1").val();
        var signtime1 = $("#signtime1").val();
        var signtime2 = $("#signtime2").val();
        var isaudit = $("#isaudit").val();
        var state = $("#state").val();
        var isarc = $("#isarc").val();

        if ($('input[name="connmon"]').is(':checked')) {
            var connmon = $('input[name="connmon"]:checked').val();
        } else {
            var connmon = "";
        }
        if ($('input[name="invnmon"]').is(':checked')) {
            var invnmon = $('input[name="invnmon"]:checked').val();
        } else {
            var invnmon = "";
        }

        location.href = "<%=basePath%>sell/findContract.do?clino1=" + encodeURI(encodeURI(clino1)) +
            "&cno1=" + encodeURI(encodeURI(cno1)) +
            "&signtime1=" + encodeURI(encodeURI(signtime1)) +
            "&signtime2=" + encodeURI(encodeURI(signtime2)) +
            "&connmon=" + encodeURI(encodeURI(connmon)) +
            "&invnmon=" + encodeURI(encodeURI(invnmon)) +
            "&state=" + encodeURI(encodeURI(state)) +
            "&isarc=" + encodeURI(encodeURI(isarc))+
            "&isaudit=" + encodeURI(encodeURI(isaudit));
        //$("#Form_s").submit();
    }


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
                'iDisplayLength': 23,
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
                'pagingType': "",
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
                'iDisplayLength': 10,
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
    function delContract(conid) {
        if (confirm("确定要删除吗?")) {

            var url = "<%=basePath%>sell/deleteContract.do?conid=" + conid;
            $.get(url, function (data) {
                //nextPage(${page.currentPage});
                setTimeout("self.location.reload()", 100);
            });
        }
    }

    function load() {
        //top.jzts();
        var winId = "loadWin";
        modals.openWin({
            winId: winId,
            title: '导入导出',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>sell/goload.do'
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    //新增
    function add() {
        //top.jzts();
        var winId = "userWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>sell/goAddC.do'
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    //修改
    function editContract(conid) {
        // top.jzts();
        var winId = "ContractWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>sell/findContractById.do?conid=' + conid
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }


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