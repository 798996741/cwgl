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
    <!-- 下拉框 -->
    <style>
        ul li {
            line-height: 30px;
            list-style-type: none
        }
    </style>
</head>
<body class="no-skin">

<!-- Horizontal Form -->
<div>
<div class="mask">
        <div id="darkmask" class="darkmask">
            <div class="mask-top">
                <span class="mask-top-size" style="letter-spacing: 3px;"><b>报销分类信息</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;" data-dismiss="modal">
            </div>
            <div class="mask-main">
    <!-- /.box-header -->
    <!-- form start -->

    <form action="reimfy/${msg}.do" name="form_add" id="form_add"
          method="post">


        <input type="hidden" name="reimfyid" id="reimfyid" value="${pd.reimfyid}" />
        <input type="hidden" name="parentid" id="parentid" value="${null == pd.parentid ? reimfyid:pd.parentid}" />

                <c:if test="${fx == 'head'}">
                    <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
                           type="hidden"/>
                </c:if>

                    <div class="new-block">
                        上级:<b>${null == pds.classname ?'(无) 此为顶级':pds.classname}（${pds.encode}）</b>
                    </div>

                    <div class="between-center padding-8px">
                        <span class="mask-size flex-row-between">分类名称:</span>
                        <input type="text" name="classname" id="classname" value="${pd.classname }" autoComplete="off"
                               maxlength="64" class="mask-input width-250px" />

                        <span class="mask-size flex-row-between">分类说明:</span>
                        <input type="text"name="classdec" id="classdec" autoComplete="off"
                               value="${pd.classdec }" maxlength="32" class="mask-input width-250px" />
                    </div>


                    <div class="between-center padding-8px">
                        <span class="mask-size flex-row-between">分类编码:</span>
                        <c:if test="${msg=='insertReimfy'}">
                        <input type="text"  name="encode" id="encode" value="${pds.encode }" autoComplete="off"
                               maxlength="64" class="mask-input width-250px" />
                        </c:if>
                        <c:if test="${msg!='insertReimfy'}">
                            <input type="text"  name="encode" id="encode" value="${pd.encode }" autoComplete="off"
                                   maxlength="64" class="mask-input width-250px" />
                        </c:if>
                        <span class="mask-size flex-row-between">数据来源:</span>
                        <input type="text" name="source" id="source" value="${pd.source }" autoComplete="off"
                               maxlength="100" class="mask-input width-250px" />
                    </div>
                

                <div class="mask-button">
                    <div class="mask-save" onclick="savereimfy();"><span class="mask-button-size" >保存</span></div>
                    <div class="mask-close"><span class="mask-button-size" data-dismiss="modal">取消</span></div>
                </div>


        </div>

    </form>
            </div>
        </div>
</div>
</div>

<script type="text/javascript">


    //$(top.hangge());
    //保存
    $(document).ready(function () {

        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });

    function savereimfy() {
        if ($("#oneclass").val() == "") {
            $("#oneclass").tips({
                side: 3,
                msg: '不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#oneclass").focus();
            return false;
        }

        $("#form_add").submit();
    }








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
