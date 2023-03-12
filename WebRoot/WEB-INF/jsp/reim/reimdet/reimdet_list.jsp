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

</head>
<body class="no-skin">


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="width:100%;margin-left:0px;">
    <section class="content container-fluid" id="TEdetail-content">
        <!--操作区-->
        <div class="content-top-1">
            <div class="flex-row-between">
                <div class="flex-row padding-5px" style="width:80%;margin-top: 3px;">
                    <div class="border-style width-165px">
                        <span class="border-size">公司</span>
                        <div class="border-line"></div>
                        <div>
                            <select class="seat-select" name="csname" id="csname" data-placeholder="公司"
                                    onchange="ntchange();">
                                <option value="" selected></option>
                                <c:forEach items="${getcsname}" var="csname" varStatus="vs">
                                    <option value="${csname.csname}"
                                            <c:if test="${csname.csname==pd.csname}">selected</c:if>
                                    > ${csname.csname}</option>

                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="border-style width-165px" style="margin-left: 20px;">

                        <span class="border-size">时间</span>
                        <div class="border-line"></div>
                        <input class="date-picker width-110px" name="time" id="time"
                               autoComplete="off" value="${pd.time}" onchange="ntchange();"
                               type="text" data-date-format="yyyy-mm"/>

                    </div>
                    <button type="button" class="btn btn-default-sm button-blue width-55px detail-look"
                            style="margin-left: 20px;" onclick="tosearch()">
                        <font>查&nbsp;询</font>
                    </button>
                    <button type="button" class="btn btn-default-sm button-blue width-55px detail-more"
                            style="margin-left: 20px;background-color:#FFCC33;">
                        <font>更&nbsp;多</font>
                    </button>
                    <div class="border-style width-165px" style="position: relative;margin-left: 20px;">
                        <input type="text" placeholder="搜索" style="padding-left: 10px;" name="keywords" id="keywords"
                               value="${pd.keywords }">
                        <div class="search" onclick="reimsearch()"
                             style="background: url('static/img/home/search_icon.png') no-repeat;position: absolute;right: 5%;background-size: 15px;width: 15px;height: 15px;cursor: pointer"></div>
                    </div>
                    <c:if test="${QX.edit == 1}">
                    <button type="button" class="btn btn-default-sm button-blue width-65px"
                            style="margin-left: 20px;" onclick="changeisreim('0');">
                        <font>确认报销</font>
                    </button>
                    <button type="button" class="btn btn-default-sm button-blue width-65px"
                            style="margin-left: 20px;" onclick="changeisreim('1');">
                        <font>后期报销</font>
                    </button>
                    </c:if>
                </div>
                <div class="content-top-right" style="width:20%;">
                    <%--<input type="file" id="excel" name="excel" onchange="fileType(this)"--%>
                    <%--class="mask-main-list-input-1"/>--%>
                    <%--<c:if test="${QX.edit == 1 }">--%>
                    <%--                    <img src="static/img/home/add.png"--%>
                    <%--                         data-toggle="modal" data-target="#add" onclick="add();"--%>
                    <%--                         style="cursor: pointer;width:61px;height: 21px;margin-left: 5px;">--%>
                    <%--                    <img src="static/img/home/import.png" onclick="load();"--%>
                    <%--                         style="cursor: pointer;width:61px;height: 21px;"/>--%>
                    <%--                    &lt;%&ndash;</c:if>&ndash;%&gt;--%>
                    <%--                    &lt;%&ndash;<c:if test="${QX.add == 1 }">&ndash;%&gt;--%>
                    <%--                    <img src="static/img/home/export.png" onclick="toExcelreim();"--%>
                    <%--                         style="cursor: pointer;width:61px;height: 21px;margin-left: 5px;"/>--%>
                    <div class="top-add top-img" onclick="add();">
                        <font class="top-img-size">新增</font>
                    </div>
                    <div class="top-import top-img" onclick="load();">
                        <font class="top-img-size">导入</font>
                    </div>
                    <div class="top-export top-img" onclick="toExcelreim();">
                        <font class="top-img-size">导出</font>
                    </div>
                    <%--</c:if>--%>
                </div>
            </div>
            <div class="flex-row-between padding-5px TE-top" style="display: none" id="ex-region3">

                <div class="border-style width-200px">
                    <span class="border-size">报销日期</span>
                    <div class="border-line"></div>
                    <input class="date-picker width-125px" name="reimtime" id="reimtime"
                           autoComplete="off" value="${pd.reimtime}"
                           type="text" data-date-format="yyyy-mm-dd"/>
                </div>


                <div class="border-style width-200px">
                    <span class="border-size">报销分类</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-125px selectpicker show-tick form-control"
                             name="oneclass" id="oneclass" data-live-search="true">
                        <option value="" selected></option>
                        <c:forEach items="${oneClass}" var="oneClass" varStatus="vs">
                            <option value="${oneClass.encode}"
                                    <c:if test="${oneClass.encode==pd.oneclass}">selected</c:if>
                            > ${oneClass.oneclass}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="border-style width-200px">
                    <span class="border-size">二级分类</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-125px selectpicker show-tick form-control" name="twoclass"
                            id="twoclass" style="display: flex;align-items: center" data-live-search="true">
                        <option value="" selected></option>
                        <c:forEach items="${twoClass}" var="twoClass" varStatus="vs">
                            <option value="${twoClass.encode}"
                                    <c:if test="${twoClass.encode==pd.twoclass}">selected</c:if>
                            > ${twoClass.twoclass}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="border-style width-200px">
                    <span class="border-size">三级分类</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-125px selectpicker show-tick form-control" name="threeclass"
                            id="threeclass" style="display: flex;align-items: center" data-live-search="true">
                        <option value="" selected></option>
                        <c:forEach items="${threeClass}" var="threeClass" varStatus="vs">
                            <option value="${threeClass.encode}"
                                    <c:if test="${threeClass.encode==pd.threeclass}">selected</c:if>
                            > ${threeClass.threeclass}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="border-style width-200px">
                    <span class="border-size">四级分类</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-125px selectpicker show-tick form-control" name="fourclass"
                            id="fourclass"
                            onchange="changeCategory()"
                            style="display: flex;align-items: center" data-live-search="true">
                        <option value="" selected></option>
                        <c:forEach items="${fourClass}" var="fourClass" varStatus="vs">
                            <option value="${fourClass.encode}"
                                    <c:if test="${fourClass.encode==pd.fourclass}">selected</c:if>
                            > ${fourClass.fourclass}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="border-style width-200px">
                    <span class="border-size">项目分类</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-125px selectpicker show-tick form-control" name="proclass"
                            id="proclass" style="display: flex;align-items: center" data-live-search="true">
                        <option value="" selected></option>
                        <c:forEach items="${pdec}" var="pdec" varStatus="vs">
                            <option value="${pdec.pdesc}"
                                    <c:if test="${pdec.pdesc==pd.proclass}">selected</c:if>
                            > ${pdec.pdesc}</option>
                        </c:forEach>
                    </select>
                </div>


            </div>
            <div class="flex-row-between padding-5px TE-top" style="display: none" id="ex-region4">
                <div class="border-style width-200px">
                    <span class="border-size">票据类型</span>
                    <div class="border-line"></div>
                    <div>
                        <select class="seat-select width-125px" name="billtype" id="billtype">
                            <option value=""
                                    <c:if test="${pd.billtype=='' or pd.billtype==null}">selected</c:if>></option>
                            <option value="0" <c:if test="${pd.billtype=='0'}">selected</c:if>>发票</option>
                            <option value="1" <c:if test="${pd.billtype=='1'}">selected</c:if>>收据</option>
                            <option value="2" <c:if test="${pd.billtype=='2'}">selected</c:if>>付款截图</option>

                        </select>
                    </div>
                </div>
                <div class="border-style width-200px">
                    <span class="border-size">是否有出差申请单</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-67px" id="isapply" name="isapply">
                        <option value=""
                                <c:if test="${pd.isapply=='' or pd.isapply==null}">selected</c:if>></option>
                        <option value="0" <c:if test="${pd.isapply=='0'}">selected</c:if>>是</option>
                        <option value="1" <c:if test="${pd.isapply=='1'}">selected</c:if>>否</option>

                    </select>
                </div>


                <div class="border-style width-200px">
                    <span class="border-size">是否有采购申请单</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-67px" name="ispur" id="ispur">
                        <option value=""
                                <c:if test="${pd.ispur=='' or pd.ispur==null}">selected</c:if>></option>
                        <option value="0" <c:if test="${pd.ispur=='0'}">selected</c:if>>是</option>
                        <option value="1" <c:if test="${pd.ispur=='1'}">selected</c:if>>否</option>

                    </select>
                </div>


                <div class="border-style width-200px">
                    <span class="border-size">是否报销</span>
                    <div class="border-line"></div>
                    <select class="seat-select width-111px" name="isreim" id="isreim">
                        <option value=""
                                <c:if test="${pd.isreim=='' or pd.isreim==null}">selected</c:if>></option>
                        <option value="0" <c:if test="${pd.isreim=='0'}">selected</c:if>>确认报销</option>
                        <option value="1" <c:if test="${pd.isreim=='1'}">selected</c:if>>后期报销</option>

                    </select>
                </div>


                <div class="border-style width-200px">
                    <span class="border-size">审核状态</span>
                    <div class="border-line"></div>
                    <div>
                        <select class="seat-select width-125px" name="isaudit" id="isaudit">
                            <option value=""
                                    <c:if test="${pd.isaudit=='' or pd.isaudit==null}">selected</c:if>></option>
                            <option value="0" <c:if test="${pd.isaudit=='0'}">selected</c:if>>审核通过</option>
                            <option value="3" <c:if test="${pd.isaudit=='3'}">selected</c:if>>审核通过，待补材料</option>
                            <option value="1" <c:if test="${pd.isaudit=='1'}">selected</c:if>>审核不通过</option>
                            <option value="2" <c:if test="${pd.isaudit=='2'}">selected</c:if>>暂未审核</option>

                        </select>
                    </div>
                </div>



                <div class="flex-row-between width-200px">
                    <button type="button" class="btn btn-default-sm button-blue width-95px"
                            onclick="reset()">
                        <font>重&nbsp;置</font>
                    </button>
                    <button type="button" class="btn btn-default-sm button-blue width-95px"
                            onclick="tosearch()">
                        <font>查&nbsp;询</font>
                    </button>
                </div>

            </div>
        </div>
        <!--表头-->
        <div class="TEtable-title">
            <font id="titlename"></font>
            <font id="titlemon"></font>月报销明细表
        </div>
        <div style="width: 40%;"></div>
        <!--表格内容-->
        <div class="seat-middle-none">
            <div class="seat-middle-r TEdetail" style="font-size: 12px">
                <!-- <div class="box-body" > -->
                <table id="example2" class="table-blue" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr>
                        <c:if test="${QX.edit == 1}">
                        <th class="center"><input id="checkAll" onclick="selectAll(this.checked)" value=""
                                                  type="checkbox"/></th>
                        </c:if>
                        <th class="center" style="border-bottom: #81bef5 solid 1px;
                                                color: #fff;
                                                font-size: 12px;
                                                background: #4b9dd7;
                                                padding: 5px">编号
                        </th>
                        <th class="center">报销<br/>日期</th>
                        <th class="center">报销人</th>
                        <th class="center">报销<br/>事由</th>
                        <th class="center">报销<br/>分类</th>
                        <th class="center">二级<br/>分类</th>
                        <th class="center">三级<br/>分类</th>
                        <th class="center">四级<br/>分类</th>
<%--                        <th class="center">报销<br/>金额</th>--%>
<%--                        <th class="center">差旅<br/>补贴</th>--%>
                        <th class="center">票据<br/>数量</th>
                        <th class="center">交通<br/>金额</th>
                        <th class="center">住宿<br/>金额</th>
                        <th class="center">出差<br/>金额</th>
                        <th class="center">实报<br/>金额</th>
                        <th class="center">票据<br/>类型</th>
                        <th class="center">项目<br/>分类</th>
                        <th class="center">是否有出<br/>差申请单</th>
                        <th class="center">是否有采<br/>购申请单</th>
                        <th class="center">是否已报销</th>
                        <th class="center">审核<br/>状态</th>
                        <th class="center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty relist}">
                            <%--<c:if test="${QX.cha == 1 }">--%>
                            <c:forEach items="${relist}" var="relist" varStatus="vs">
                                <tr>
                                    <c:if test="${QX.edit == 1}">
                                    <td class="center">
                                        <input name="check" value='${relist.reimdetid}' onclick="checkboxSelect()" <c:if test="${relist.isaudit=='2' or relist.isaudit=='1'}">disabled="disabled"</c:if>
                                               type='checkbox'/>
                                    </td>
                                    </c:if>
                                    <td style="border-bottom: #81bef5 solid 1px;
        color: #fff;
        font-size: 12px;
        background: #4b9dd7;
        padding: 5px">${vs.count}</td>
                                    <td class="center">${relist.time}</td>
                                    <td class="center">${relist.name}</td>
                                    <td class="center">${relist.reason }</td>
                                    <td class="center">
                                    <c:forEach items="${oneClass}" var="oneClass" varStatus="vs">
                                        <c:if test="${oneClass.encode==relist.oneclass}">${oneClass.oneclass}</c:if>
                                    </c:forEach>
                                    </td>
                                    <td class="center">
                                    <c:forEach items="${twoClass}" var="twoClass" varStatus="vs">
                                        <c:if test="${twoClass.encode==relist.twoclass}">${twoClass.twoclass}</c:if>
                                    </c:forEach>

                                    </td>
                                    <td class="center">
                                    <c:forEach items="${threeClass}" var="threeClass" varStatus="vs">
                                        <c:if test="${threeClass.encode==relist.threeclass}">${threeClass.threeclass}</c:if>
                                    </c:forEach>
                                    </td>
                                    <td class="center">
                                    <c:forEach items="${fourClass}" var="fourClass" varStatus="vs">
                                        <c:if test="${fourClass.encode==relist.fourclass}">${fourClass.fourclass}</c:if>
                                    </c:forEach>
                                    </td>
<%--                                    <td class="center">${relist.twoclass}</td>--%>
<%--                                    <td class="center">${relist.threeclass}</td>--%>
<%--                                    <td class="center">${relist.fourclass}</td>--%>
                                    <td class="center">${relist.billnum}</td>
                                    <td class="center">${relist.tripmon}</td>
                                    <td class="center">${relist.hostelmon}</td>
                                    <td class="center">${relist.mission}</td>
                                    <td class="center">${relist.realmon}</td>
                                    <td class="center">
                                        <c:if test="${relist.billtype=='' or relist.isapply==null}"> </c:if>
                                        <c:if test="${relist.billtype=='1'}">收据</c:if>
                                        <c:if test="${relist.billtype=='0'}">发票</c:if>
                                        <c:if test="${relist.billtype=='2'}">付款截图</c:if>

                                    </td>
                                    <td class="center">${relist.proclass }</td>
                                    <td class="center">
                                        <c:if test="${relist.isapply=='' or relist.isapply==null}"></c:if>
                                        <c:if test="${relist.isapply=='0'}">是</c:if>
                                        <c:if test="${relist.isapply=='1'}">否</c:if>
                                    </td>
                                    <td><c:if test="${relist.ispur=='' or relist.ispur==null}"></c:if>
                                        <c:if test="${relist.ispur=='0'}">是</c:if>
                                        <c:if test="${relist.ispur=='1'}">否</c:if></td>
                                    <td>
                                        <c:if test="${relist.isreim=='0'}">确认报销</c:if>
                                        <c:if test="${relist.isreim=='1'}">后期报销</c:if>
                                        <c:if test="${relist.isreim==null or relist.isreim==''}"></c:if></td>
                                    <td>
                                        <c:if test="${relist.isaudit=='0'}">审核通过</c:if>
                                        <c:if test="${relist.isaudit=='3'}">审核通过，待补材料</c:if>
                                        <c:if test="${relist.isaudit=='1'}">审核不通过</c:if>
                                        <c:if test="${relist.isaudit=='2'}">暂未审核</c:if></td>
                                    <td align="center">
                                        <div class="flex-row-around" style="width: 145px">

                                            <c:if test="${QX.edit == 1 or relist.isaudit == 2 or relist.isaudit == 1}">

                                                <%--                                                    <img class="cy_bj" title="编辑" src="static/img/home/edit.png"--%>
                                                <%--                                                         style="width: 59px;height: 25px;"--%>
                                                <%--                                                         onclick="editReimdet('${relist.reimdetid}');"/>--%>
                                                <%--                                                    <i title="编辑"></i>--%>
                                                <div class="content-edit home-img cy_bj" title="编辑"
                                                     onclick="editReimdet('${relist.reimdetid}');"
                                                     style="margin-left: 10%">
                                                    <font class="home-img-size">编辑</font>
                                                </div>
                                            </c:if>
                                            <c:if test="${relist.isaudit == 2 or relist.isaudit == 1 or user.QX_SH == 1}">
                                                <%--                                                    <img src="static/img/home/delete.png"--%>
                                                <%--                                                         onclick="delReimdet('${relist.reimdetid}');"--%>
                                                <%--                                                         style="width:59px;height:25px"/>--%>
                                                <%--                                                    <i title="删除"></i>--%>
                                                <div class="content-delete home-img cy_bj" title="删除"
                                                     onclick="delReimdet('${relist.reimdetid}');"
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
                            <%--<td colspan="17" class="center">您无权查看</td>--%>
                            <%--</tr>--%>
                            <%--</c:if>--%>
                        </c:when>
                        <c:otherwise>
                            <tr class="main_info">
                                <td colspan="21" class="center">没有相关数据</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <!-- /.box-body -->
                <!-- </div> -->
            </div>

        </div>
    </section>
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
<!--js部分内容-->
<script type="text/javascript">
    function reload() {
        var oTable = $("#example2").dataTable(); //table1为表格的id
        var tableSetings = oTable.fnSettings();
        var paging_length = tableSetings._iDisplayLength;//当前每页显示多少
        var page_start = tableSetings._iDisplayStart;//当前页开始
        var page = (page_start / paging_length); //得到页数值  比页码小1
        oTable.fnPageChange(page);//加载跳转
    }

    function checkboxSelect() {
        // $("#checkAll").checkbox
        // $("input[name='checkAll']")
        checkboxArray = [];
        $.each($('input:checkbox:checked'), function () {
            console.log($('input[type=checkbox]:checked').length);
            console.log($(this).val());
            checkboxArray.push($(this).val())
        });
        console.log(checkboxArray)
    }

    function selectAll(selectStatus) {//传入参数（全选框的选中状态）
        //根据name属性获取到单选框的input，使用each方法循环设置所有单选框的选中状态
        if (selectStatus) {
            $("input[name='check']").not(":disabled").each(function (i, n) {
                n.checked = true;
            });
            checkboxSelect();
        } else {
            $("input[name='check']").not(":disabled").each(function (i, n) {
                n.checked = false;
            });
            checkboxSelect();
        }
    }

    function changeisreim(isreim) {
        console.log('changeisreim获取选中数据')
        console.log(checkboxArray)
        if (checkboxArray[0] === '') {
            checkboxArray.shift()
            checkboxString = checkboxArray.toString()
            console.log(checkboxString)
        } else {
            checkboxString = checkboxArray.toString()
            console.log(checkboxString)
        }
        console.log(checkboxString)
        var time = $("#time").val().substring(0, 7);
        var csname = $("#csname").val();
        $.ajax({
            type: 'post',
            data: {isreim: isreim, checkboxArray: checkboxString},
            url: '<%=basePath%>reimdet/updateIsreim.do',
            cache: false,
            dataType: 'text',
            success: function (data) {
                if ("msg" != data) {
                    location.href = "<%=basePath%>reimdet/findReimdet.do?csname=" + encodeURI(encodeURI(csname)) + "&time=" + encodeURI(encodeURI(time))

                } else {
                    confirm("保存失败")
                }
            }
        })
    }


    function changeCategory() {
        var fourclass = $("#fourclass").val().substring(0,9);
        $.ajax({
            type: 'POST',
            dataType: 'text',//不写这个会提示下载或者改为json也是
            url: '<%=basePath%>reimdet/changefourclass.do',
            data: {
                encode: fourclass
            }, success: function (data) {
                var data = eval("(" + data + ")");
                console.log(data[0].encode+"data");
                if (data != null) {
                    $("#threeclass").empty();
                    $("#threeclass").append("<option value='" + data[0].encode + "' selected>" + data[0].classname + "</option>");
                    // for (var i = 0; i < data.length; i++)//遍历
                    // {
                    //     var categoryObj = data[i];
                    //     // document.getElementById("threeclass").innerHTML +="<option value='" + categoryObj.encode + "' selected>" + categoryObj.classname + "</option>";
                    //      $("#threeclass").append("<option value='" + categoryObj.encode + "' selected>" + categoryObj.classname + "</option>");
                    //     console.log(categoryObj.encode);
                    //     console.log(categoryObj.classname);
                    //
                    // }
                    $('#threeclass').selectpicker('refresh');
                    $('#threeclass').selectpicker('render');

                    var threeclass=data[0].encode.substring(0,7);
                    $.ajax({
                        type: 'POST',
                        dataType: 'text',//不写这个会提示下载或者改为json也是
                        url: '<%=basePath%>reimdet/changefourclass.do',
                        data: {
                            encode: threeclass
                        }, success: function (data) {
                            var data = eval("(" + data + ")");
                            console.log(data[0].encode+"data");
                            if (data != null) {
                                $("#twoclass").empty();
                                $("#twoclass").append("<option value='" + data[0].encode + "' selected>" + data[0].classname + "</option>");
                                $('#twoclass').selectpicker('refresh');
                                $('#twoclass').selectpicker('render');

                                var towclass=data[0].encode.substring(0,4);
                                $.ajax({
                                    type: 'POST',
                                    dataType: 'text',//不写这个会提示下载或者改为json也是
                                    url: '<%=basePath%>reimdet/changefourclass.do',
                                    data: {
                                        encode: towclass
                                    }, success: function (data) {
                                        var data = eval("(" + data + ")");
                                        console.log(data[0].encode+"data");
                                        if (data != null) {
                                            $("#oneclass").empty();
                                            $("#oneclass").append("<option value='" + data[0].encode + "' selected>" + data[0].classname + "</option>");
                                            $('#oneclass').selectpicker('refresh');
                                            $('#oneclass').selectpicker('render');
                                        }
                                    }

                                })
                            }
                        }

                    })
                }
            }

        })

    }

    $(document).ready(function () {

        $('.selectpicker show-tick form-control').select2();
    });

    $(".detail-more").click(function () {
        if (document.getElementsByClassName("content-top-1")[0].style.height === "40px") {
            $('.content-top-1').animate({
                height: '120px',
            })
            setTimeout(function () {
                $(".detail-more").html("<font>隐&nbsp;藏</font>")
                $('#ex-region3').delay("slow").show()
                $('#ex-region4').delay("slow").show()
                $('.detail-look').delay("slow").hide()
            }, 150);
        } else {
            $('.content-top-1').animate({
                height: '40px',
            })
            setTimeout(function () {
                $('#ex-region3').hide()
                $('#ex-region4').hide()
                $(".detail-more").html("<font>更&nbsp;多</font>")
                $('.detail-more').delay("slow").show()
                $('.detail-look').delay("slow").show()
            }, 150)
        }
    })

    function contentHide() {
        $('.content-top-1').animate({
            height: '40px',
        })
        setTimeout(function () {
            $('#ex-region3').hide()
            $('#ex-region4').hide()
            $(".detail-more").html("<font>更&nbsp;多</font>")
            $('.top-img').delay("slow").css("margin-bottom", "0px")
        }, 150)
    }

    //导出excel
    function toExcelreim() {
        var time = $("#time").val();
        var csname = $("#csname").val();
        var reimtime = $("#reimtime").val();
        var oneclass = $("#oneclass").val();
        var twoclass = $("#twoclass").val();
        var proclass = $("#proclass").val();
        var billtype = $("#billtype").val();
        var isapply = $("#isapply").val();
        var ispur = $("#ispur").val();
        var isaudit = $("#isaudit").val();
        var isreim = $("#isreim").val();

        window.location.href = "<%=basePath%>reimdet/excel.do?time=" + encodeURI(encodeURI(time)) +
            "&csname=" + encodeURI(encodeURI(csname)) +
            "&reimtime=" + encodeURI(encodeURI(reimtime)) +
            "&oneclass=" + encodeURI(encodeURI(oneclass)) +
            "&twoclass=" + encodeURI(encodeURI(twoclass)) +
            "&proclass=" + encodeURI(encodeURI(proclass)) +
            "&billtype=" + encodeURI(encodeURI(billtype)) +
            "&isapply=" + encodeURI(encodeURI(isapply)) +
            "&ispur=" + encodeURI(encodeURI(ispur)) +
            "&isaudit=" + encodeURI(encodeURI(isaudit)) +
            "&isreim=" + encodeURI(encodeURI(isreim));
    }

    function ntchange() {
        var csname = document.getElementById('csname').value;
        var time = document.getElementById('time').value;

        document.getElementById('titlename').innerHTML = csname;
        document.getElementById('titlemon').innerHTML = time.substring(5, 7);
        location.href = "reimdet/findReimdet.do?time=" + encodeURI(encodeURI(time)) +
            "&csname=" + encodeURI(encodeURI(csname))
    }

    // window.onload=function(){
    //     $(".info").hide();
    //
    // };
    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    window.onload = function () {


        contentHide();
        var t = new Date();
        var y = t.getFullYear();
        var m = t.getMonth() + 1;
        var d = t.getDate();
        var time = document.getElementById('time').value;
        if (time == '') {
            if (m < 10) {
                document.getElementById('time').value = y + '-0' + m;
            }
            if (m >= 10) {
                document.getElementById('time').value = y + '-' + m;
            }

        }
        var csname = document.getElementById('csname').value;

        if (csname == '') {
            document.getElementById('csname').value = '宇伦';
        }
        document.getElementById('titlemon').innerHTML = document.getElementById('time').value.substring(5, 7);
        document.getElementById('titlename').innerHTML = document.getElementById('csname').value;

    };

    function reimsearch() {
        var keywords = $("#keywords").val();
        var csname = document.getElementById('csname').value;
        var time = document.getElementById('time').value;
        location.href = "<%=path%>/reimdet/findReimdet.do?keywords=" + encodeURI(encodeURI(keywords)) +
            "&time=" + encodeURI(encodeURI(time)) +
            "&csname=" + encodeURI(encodeURI(csname));
    }

    function tosearch() {
        //top.jzts();

        var time = $("#time").val();
        var csname = $("#csname").val();
        var reimtime = $("#reimtime").val();
        var oneclass = $("#oneclass").val();
        var twoclass = $("#twoclass").val();
        var proclass = $("#proclass").val();
        var billtype = $("#billtype").val();
        var isapply = $("#isapply").val();
        var ispur = $("#ispur").val();
        var isaudit = $("#isaudit").val();
        var isreim = $("#isreim").val();

        // if ($('input[name="invnmon"]').is(':checked')) {
        //     var invnmon = $('input[name="invnmon"]:checked').val();
        // } else {
        //     var invnmon = "";
        // }
        location.href = "reimdet/findReimdet.do?time=" + encodeURI(encodeURI(time)) +
            "&csname=" + encodeURI(encodeURI(csname)) +
            "&reimtime=" + encodeURI(encodeURI(reimtime)) +
            "&oneclass=" + encodeURI(encodeURI(oneclass)) +
            "&twoclass=" + encodeURI(encodeURI(twoclass)) +
            "&proclass=" + encodeURI(encodeURI(proclass)) +
            "&billtype=" + encodeURI(encodeURI(billtype)) +
            "&ispur=" + encodeURI(encodeURI(ispur)) +
            "&isaudit=" + encodeURI(encodeURI(isaudit)) +
            "&isreim=" + encodeURI(encodeURI(isreim)) +
            "&isapply=" + encodeURI(encodeURI(isapply));
        //$("#Form_s").submit();
    }

    $(function () {
        if (screen.width > 1600) {
            $('#example2').DataTable({
                "stateSave":true,
                "stateDuration":-1,
                "bDestroy":true,
                'sScrollX': false,
                'sScrollY': false,
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 21,
                "pagingType": "full_numbers",
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
                'sScrollX': false,
                'sScrollY': false,
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 18,
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
                "aaSorting": [[1, "desc"]],
                "aoColumnDefs": [
                    //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                    {"orderable": true, "aTargets": [1, 5]}// 不参与排序的列
                ],
                'sScrollY': false,
                'sScrollX': false,
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                'iDisplayLength': 10,
                "pagingType": "full_numbers",
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
    function delReimdet(reimdetid) {
        var time = $("#time").val().substring(0, 7);
        var csname = $("#csname").val();
        if (confirm("确定要删除吗?")) {

            var url = "<%=basePath%>reimdet/deleteReimdetbyid.do?reimdetid=" + reimdetid + '&csname=' + encodeURI(encodeURI(csname)) + '&time=' + encodeURI(encodeURI(time));
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
            url: '<%=basePath%>reimdet/goload.do?'
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
        var time = $("#time").val().substring(0, 7);
        var csname = $("#csname").val();

        //top.jzts();
        var winId = "userWin";
        if (csname != null && csname != '' && time != null && time != '') {
            modals.openWin({
                winId: winId,
                title: '新增',
                width: '100px',
                backdrop: 'static',
                keyboard: false,
                url: '<%=basePath%>reimdet/goAddC.do?csname=' + encodeURI(encodeURI(csname)) + '&time=' + encodeURI(encodeURI(time))
                /*, hideFunc:function(){
                    modals.info("hide me");
                },
                showFunc:function(){
                    modals.info("show me");
                } */
            });
        }
    }

    //修改
    function editReimdet(reimdetid) {
        var time = $("#time").val().substring(0, 7);
        var csname = $("#csname").val();
        console.log(time);
        // top.jzts();
        var winId = "ReimdetWin";
        modals.openWin({
            winId: winId,
            title: '新增',
            width: '900px',
            backdrop: 'static',
            keyboard: false,
            url: '<%=basePath%>reimdet/findReimdetById.do?reimdetid=' + reimdetid + '&csname=' + encodeURI(encodeURI(csname)) + '&time=' + encodeURI(encodeURI(time))
            /*, hideFunc:function(){
                modals.info("hide me");
            },
            showFunc:function(){
                modals.info("show me");
            } */
        });

    }

    function reset() {

        $("#reimtime").val('');
        $("#oneclass").selectpicker('val', "");
        $("#twoclass").selectpicker('val', "");
        $("#threeclass").selectpicker('val', "");
        $("#fourclass").selectpicker('val', "");
        $("#proclass").selectpicker('val', "");
        $("#billtype").val('');
        $("#isapply").val('');
        $("#ispur").val('');
        $("#isaudit").val('');
        $("#isreim").val('');
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
                    nextPage(${page.currentPage});
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
                    {"button": {"label": "确定", "className": "btn-sm btn-success"}}
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