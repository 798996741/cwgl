<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <!-- jsp文件头和头部 -->
    <jsp:include page="../include/incJs_old.jsp"></jsp:include>
    <style>
		.list-content{
			margin: 0;
			padding: 0;
			list-style: none;
			color: #333;
			width: 300px;
			margin: 20px;
		}
        .task-item {
            padding-right: 72px;
            border-radius: 4px;
            background-color: #fff;
            height: 36px;
            line-height: 36px;
            margin-bottom: 4px;
            padding-left: 12px;
            position: relative;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            cursor: pointer;
        }
    </style>
</head>
<body class="no-skin" style="background:rgb(236,240,245)">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">

    <section class="content" style="background:rgb(236,240,245)">

        <div class="row">

            <section class="content-header padbottom15">
                <h1 style="padding-left: 20px;padding-bottom: 5px"><font><font>关注任务 </font></font></h1>
                <ol class="breadcrumb">
                    <li class="active"><font><font></font></font></li>
                </ol>
            </section>
<%--            <div class="row card-row" style="padding-left:10px;">--%>
<%--                ${rwstr }--%>
<%--            </div>--%>
            <ul class="list-content" id="reimwarn">
                <li class="task-item">Tips</li>
            </ul>
        </div>
    </section>
</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../index/foot.jsp" %>
<!-- ace scripts -->
<script src="static/js/ace.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    //$(top.hangge());
    function zxrw(action, ID, CUSTOM_TEMPLATE_ID, NAIRE_TEMPLATE_ID, TABLENAME, WCJD, ZXMAN, FPTYPE) {
        //alert(TABLENAME);
        if (action == '1') {
            top.mainFrame.tabAddHandler("z2", "待回访任务", "<%=basePath%>exetask/list.do?action=1&ID=" + ID + "&CUSTOM_TEMPLATE_ID=" + CUSTOM_TEMPLATE_ID + "&NAIRE_TEMPLATE_ID=" + NAIRE_TEMPLATE_ID + "&TABLENAME=" + TABLENAME + "&WCJD=" + WCJD + "&ZXMAN=" + ZXMAN + "&FPTYPE=" + FPTYPE + "");
        }
        if (action == '2') {
            top.mainFrame.tabAddHandler("z326", "客户回访", "<%=basePath%>taskcustom/list.do");
        }
    }


    window.onload = function () {
        var text = "";
		var reimwarn=document.getElementById("reimwarn");
        $.ajax({
            type: 'post',
            url: '<%=basePath%>reimdet/reimWarn.do',
            dataType: 'json',
            success: function (data) {
                if ("msg" != data) {
                    var var1 = data.zwsh;
                    var var2 = data.cldb;
                    var var3 = data.hqbx;
                    console.log(var1);
                    console.log(var2);
                    console.log(var3);
                    if (var1 != null) {
                        for (var key in var1){
                            var li=document.createElement("li");
                            li.innerHTML='<li class="task-item">'+ var1[key] +key + '月存在<font color="red">暂未审核</font>情况</li>';
                            reimwarn.appendChild(li);
                        }
                    }
                    if (var2 != null) {
                        for (var key in var2){
                            var li=document.createElement("li")
                            li.innerHTML='<li class="task-item">'+ var2[key] +key + '月存在<font color="red">暂未审核，材料待补</font>情况</li>'
                            reimwarn.appendChild(li);
                        }
                    }
                    if (var3 != null) {
                        for (var key in var3){
                            var li=document.createElement("li")
                            li.innerHTML='<li class="task-item">'+ var3[key] +key + '月存在<font color="red">后期报销</font>情况</li>'
                            reimwarn.appendChild(li);
                        }
                    }
                } else {
                    confirm("失败")
                }
            }
        })


    }
</script>
<script type="text/javascript" src="static/js/jquery.js"></script>
</body>
</html>