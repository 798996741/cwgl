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
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/css/datepicker.css"/>
    <!--<link rel="stylesheet" href="static/css/main.css">-->
    <link rel="stylesheet" href="static/css/mask.css">
</head>

<body class="no-skin">

<!-- Horizontal Form -->
<!-- 弹框内容 -->
<div>
    <div class="mask">
        <div id="darkmask" class="darkmask">
            <div class="mask-top">
                <span class="mask-top-size" style="letter-spacing: 3px;"><b>新&nbsp;&nbsp;增</b></span>
                <img src="static/img/modal/delete_icon.png"
                     style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
                     data-dismiss="modal">
            </div>
            <div class="mask-main">

                <form name="form_add" id="form_add">
                    <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>


                    <c:if test="${fx == 'head'}">
                        <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
                               type="hidden"/>
                    </c:if>
                    <input type="hidden" name="auditor" id="auditor" value="${reimdet.auditor}"/>
                    <input type="hidden" name="reimdetid" id="reimdetid" value="${reimdet.reimdetid}"/>
                    <input type="hidden" name="uid" id="uid" value="${reimdet.uid}"/>

                    <input type="hidden" name="filname" id="filname" value="${reimdet.filname}"/>
                    <input type="hidden" name="csname" id="csname" value="
                    <c:if test="${msg == 'insertReimdet' }"> ${pd.csname}</c:if>
                    <c:if test="${msg == 'updateReimdet' }"> ${reimdet.csname}</c:if>
                    "/>
                    <input type="hidden" name="date" id="date" value="
                    <c:if test="${msg == 'insertReimdet' }"> ${pd.time}</c:if>
                    <c:if test="${msg == 'updateReimdet' }"> ${reimdet.date}</c:if>
                    "/>
                    <input type="hidden" name="isaudit" id="isaudit1" value="${reimdet.isaudit}"/>
                    <div class="between-center">
                        <div class="between-center padding-8px">
                            <span class="mask-size flex-row-between"
                                  style="display: flex;flex-direction:row;justify-content: space-between;">
                            <font style="color: red;">*</font>报销日期
                          </span>
                            <input class="date-picker" autocomplete="off" name="time" id="time"
                                   value="${reimdet.time}" type="text" data-date-format="yyyy-mm-dd" style="width: 136px;
                  height: 24px;
                  line-height: 24px;
                  border-radius: 5px;
                  border: rgba(0, 0, 0, 0);
                  background: url('static/login/img/home/date_icon.png') no-repeat scroll 90% center transparent;
                  background-size: 15px;
                  background-color: #fff;
                  cursor: pointer;
                  padding-left: 5px;"/>
                        </div>
                        <div class="between-center padding-8px">
                            <span class="mask-size flex-row-between"
                                  style="display: flex;flex-direction:row;justify-content: space-between;">
                            <font style="color: red;">*</font>报&nbsp;销&nbsp;人
                          </span>
                            <input type="text" name="name" id="name" autoComplete="off" class="mask-input"
                                   value="${reimdet.name}"/>
                        </div>
                        <div class="between-center padding-8px">
                          <span class="mask-size flex-row-between"
                                style="display: flex;flex-direction:row;justify-content: space-between;">
                            <font style="color: red;">*</font>报销事由
                          </span>
                            <input type="text" name="reason" id="reason" autoComplete="off" class="mask-input"
                                   value="${reimdet.reason}"/>
                        </div>
                    </div>
                    <div class="between-center">
                        <div class="between-center padding-8px">
                  <span class="mask-size  flex-row-between"
                        style="display: flex;flex-direction:row;justify-content: space-between;">
                    <font style="color: red;">*</font>报销分类
                  </span>
                            <select class="mask-select js-example-basic-single" name="oneclass"
                                    style="background: #ffffff!important;border-radius: 5px!important;" id="oneclass1"
                                    >
                                <option value="" selected></option>
                                <c:forEach items="${oneClass}" var="oneClass" varStatus="vs">
                                    <option value="${oneClass.encode}"
                                            <c:if test="${oneClass.encode==reimdet.oneclass}">selected</c:if>
                                    > ${oneClass.oneclass}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size  flex-row-between"
                        style="display: flex;flex-direction:row;justify-content: space-between;">
                     <font style="color: red;"></font>二级分类
                  </span>
                            <select class="mask-select js-example-basic-single"
                                    style="background: #ffffff!important;border-radius: 5px!important;" name="twoclass"
                                    id="twoclass1">
                                <option value=""></option>
<%--                                <c:if test="${msg=='updateReimdet'}">--%>
                                    <c:forEach items="${twoClass}" var="twoClass" varStatus="vs">
                                        <option value="${twoClass.encode}"
                                                <c:if test="${twoClass.encode==reimdet.twoclass}">selected</c:if>
                                        > ${twoClass.twoclass}</option>

                                    </c:forEach>
<%--                                </c:if>--%>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size  flex-row-between"
                        style="display: flex;flex-direction:row;justify-content: space-between;">
                     <font style="color: red;"></font>三级分类
                  </span>
                            <select class="mask-select js-example-basic-single"
                                    style="background: #ffffff!important;border-radius: 5px!important;" name="threeclass"
                                    id="threeclass1">
                                <option value=""></option>
<%--                                <c:if test="${msg=='updateReimdet'}">--%>
                                    <c:forEach items="${threeClass}" var="threeClass" varStatus="vs">
                                        <option value="${threeClass.encode}"
                                                <c:if test="${threeClass.encode==reimdet.threeclass}">selected</c:if>
                                        > ${threeClass.threeclass}</option>

                                    </c:forEach>
<%--                                </c:if>--%>
                            </select>
                        </div>

                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                  <span class="mask-size  flex-row-between"
                        style="display: flex;flex-direction:row;justify-content: space-between;">
                    <font style="color: red;"></font>四级分类
                  </span>
                            <select class="mask-select js-example-basic-single"
                                    style="background: #ffffff!important;border-radius: 5px!important;" name="fourclass"  onchange="changeCategory()"
                                    id="fourclass1">
                                <option value=""></option>
<%--                                <c:if test="${msg=='updateReimdet'}">--%>
                                    <c:forEach items="${fourClass}" var="fourClass" varStatus="vs">
                                        <option value="${fourClass.encode}"
                                                <c:if test="${fourClass.encode==reimdet.fourclass}">selected</c:if>
                                        > ${fourClass.fourclass}</option>

                                    </c:forEach>
<%--                                </c:if>--%>
                            </select>
                        </div>
                        <div class="between-center padding-8px">
                          <span class="mask-size flex-row-between"
                                style="display: flex;flex-direction:row;justify-content: space-between;">
                            <font style="color: red;">*</font>票据数量
                          </span>
                            <input type="text" class="mask-input" name="billnum" id="billnum" value="${reimdet.billnum}"
                                   onchange="calmon();"/>
                        </div>
                        <div class="between-center padding-8px">
                            <span class="mask-size"
                                                                      style="display: flex;flex-direction:row;justify-content: space-between;">
                                      <font style="color: red;">*</font>交通金额
                                    </span>
                            <input type="text" class="mask-input" name="tripmon" id="tripmon" value="${reimdet.tripmon}"
                                   onchange="calmon();"/>
                        </div>

                    </div>
                    <div class="between-start">
                        <div class="between-center padding-8px">
                            <span class="mask-size flex-row-between"
                                  style="display: flex;flex-direction:row;justify-content: space-between;">
                              <font style="color: red;">*</font>住宿金额
                            </span>
                            <input type="text" class="mask-input" name="hostelmon" id="hostelmon"
                                   value="${reimdet.hostelmon}" onchange="calmon();"/>

                        </div>
                        <div class="between-center padding-8px">
                            <span class="mask-size flex-row-between"
                                  style="display: flex;flex-direction:row;justify-content: space-between;">
                              <font style="color: red;">*</font>出差补贴
                            </span>
                            <input type="text" class="mask-input" name="mission" id="mission"
                                   value="${reimdet.mission}" onchange="calmon();"/>

                        </div>
                        <div class="between-center padding-8px">
                            <span class="mask-size flex-row-between"
                                  style="display: flex;flex-direction:row;justify-content: space-between;">
                              <font style="color: red;">*</font>实报金额
                            </span>
                            <input type="text" class="mask-input" name="realmon" id="realmon"
                                   value="${reimdet.realmon}" />

                        </div>
                    </div>
                    <div class="between-start">

                        <div class="between-center padding-8px">
                            <span class="mask-size flex-row-between"
                                  style="display: flex;flex-direction:row;justify-content: space-between;">
                              <font style="color: red;">*</font>项目分类
                            </span>
                            <select class="mask-select js-example-basic-single"
                                    style="background: #ffffff!important;border-radius: 5px!important;" name="proclass"
                                    id="proclass1">
                                <option value="" selected></option>
                                <c:forEach items="${pdec}" var="pdec" varStatus="vs">
                                    <option value="${pdec.pdesc}"
                                            <c:if test="${pdec.pdesc==reimdet.proclass}">selected</c:if>
                                    > ${pdec.pdesc}</option>

                                </c:forEach>
                            </select>

                        </div>
                        <div class="between-center padding-8px">
                  <span class="mask-size"
                        style="display: flex;flex-direction:row;justify-content: space-between;">
                     <font style="color: red;"></font>票据类型
                  </span>
                            <select class="mask-select" name="billtype" id="billtype">
                                <option value=""
                                        <c:if test="${reimdet.billtype=='' or reimdet.billtype==null}">selected</c:if>></option>
                                <option value="0" <c:if test="${reimdet.billtype=='0'}">selected</c:if>>发票</option>
                                <option value="1" <c:if test="${reimdet.billtype=='1'}">selected</c:if>>收据</option>
                                <option value="2" <c:if test="${reimdet.billtype=='2'}">selected</c:if>>付款截图</option>
                            </select>
                        </div>
                        <div class="flex-row between-start padding-8px">
                            <span class="mask-size">是否有出差<br>申请单</span>
                            <select class="mask-select" id="isapply" name="isapply">
                                <option value=""
                                        <c:if test="${reimdet.isapply=='' or reimdet.isapply==null}">selected</c:if>></option>
                                <option value="0" <c:if test="${reimdet.isapply=='0'}">selected</c:if>>是</option>
                                <option value="1" <c:if test="${reimdet.isapply=='1'}">selected</c:if>>否</option>
                            </select>
                        </div>
                    </div>

                    <div class="between-start">

                        <div class="between-center padding-8px">
                            <span class="mask-size">是否有采购<br>申请单</span>
                            <select class="mask-select" name="ispur" id="ispur">
                                <option value=""
                                        <c:if test="${reimdet.ispur=='' or reimdet.ispur==null}">selected</c:if>></option>
                                <option value="0" <c:if test="${reimdet.ispur=='0'}">selected</c:if>>是</option>
                                <option value="1" <c:if test="${reimdet.ispur=='1'}">selected</c:if>>否</option>
                            </select>
                        </div>

                        <%--                        <div class="between-center padding-8px">--%>
                        <%--                            <span class="mask-size">是否已报销</span>--%>
                        <%--                            <select class="mask-select" name="isreim" id="isreim">--%>
                        <%--                                <option value=""--%>
                        <%--                                        <c:if test="${reimdet.isreim=='' or reimdet.isreim==null}">selected</c:if>></option>--%>
                        <%--                                <option value="0" <c:if test="${reimdet.isreim=='0'}">selected</c:if>>确认报销</option>--%>
                        <%--                                <option value="1" <c:if test="${reimdet.isreim=='1'}">selected</c:if>>后期报销</option>--%>
                        <%--                            </select>--%>
                        <%--                        </div>--%>
                        <div class="between-start padding-8px" style="position:relative;">
                            <span class="mask-size mask-size-top">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
                            <textarea class="mask-textarea mask-textarea4" id="remark"
                                      name="remark">${reimdet.remark}</textarea>
                            <div class="mask-dropdown mask-textarea4-shrink"/>
                        </div>
                    </div>

                    <div class="mask-button">
                        <c:if test="${user.QX_SH != 1 }">
                            <div class="mask-save"><span class="mask-button-size" onclick="save('2');">保存</span>
                            </div>
                            <div class="mask-close" data-dismiss="modal"><span class="mask-button-size"
                                                                               data-dismiss="modal">取消</span></div>
                        </c:if>
                        <c:if test="${user.QX_SH == 1 }">
                            <div class="mask-save">
                                <span class="mask-button-size" onclick="save('0');">审核通过</span>
                            </div>
                            <div class="mask-lack">
                                <span class="mask-button-size" onclick="save('3');">审核通过，待补材料</span>
                            </div>
                            <div class="mask-close">
                                <span class="mask-button-size" onclick="save('1');">审核不通过</span>
                            </div>
                        </c:if>
                    </div>


                </form>
            </div>
        </div>
    </div>
</div>
<script src="static/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    window.onload = function () {
        var proclass = document.getElementById("realmon");
        proclass.style.background = 'green';
    }

    function changeCategory() {
        var fourclass = $("#fourclass1").val().substring(0,9);
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
                    $("#threeclass1").empty();
                    $("#threeclass1").append("<option value='" + data[0].encode + "' selected>" + data[0].classname + "</option>");
                    // for (var i = 0; i < data.length; i++)//遍历
                    // {
                    //     var categoryObj = data[i];
                    //     // document.getElementById("threeclass").innerHTML +="<option value='" + categoryObj.encode + "' selected>" + categoryObj.classname + "</option>";
                    //      $("#threeclass").append("<option value='" + categoryObj.encode + "' selected>" + categoryObj.classname + "</option>");
                    //     console.log(categoryObj.encode);
                    //     console.log(categoryObj.classname);
                    //
                    // }
                    $('#threeclass1').selectpicker('refresh');
                    $('#threeclass1').selectpicker('render');
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
                                $("#twoclass1").empty();
                                $("#twoclass1").append("<option value='" + data[0].encode + "' selected>" + data[0].classname + "</option>");
                                $('#twoclass1').selectpicker('refresh');
                                $('#twoclass1').selectpicker('render');
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
                                            $("#oneclass1").empty();
                                            $("#oneclass1").append("<option value='" + data[0].encode + "' selected>" + data[0].classname + "</option>");
                                            $('#oneclass1').selectpicker('refresh');
                                            $('#oneclass1').selectpicker('render');
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
        $('.js-example-basic-single').select2();
    });

    $(document).ready(function () {

        if ($("#user_id").val() != "") {
            $("#loginname").attr("readonly", "readonly");
            $("#loginname").css("color", "gray");
        }
    });
    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    function ismon(paymon) {
        return (new RegExp(/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test(paymon));
    }

    function save(isaudit) {


        document.getElementById("isaudit1").value = isaudit;


        if ($("#time").val() == "") {
            $("#time").tips({
                side: 3,
                msg: '时间不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#time").focus();
            return false;
        }
        if ($("#name").val() == "") {
            $("#name").tips({
                side: 3,
                msg: '报销人不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#name").focus();
            return false;
        }

        if ($("#oneclass1").val() == "") {
            $("#oneclass1").tips({
                side: 3,
                msg: '报销分类不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#oneclass1").focus();
            return false;
        }

        if ($("#billnum").val() == "" && !ismon($("#billnum").val())) {
            $("#billnum").tips({
                side: 3,
                msg: '票据数量不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#billnum").focus();
            return false;
        }
        if (!ismon($("#billnum").val())) {
            $("#billnum").tips({
                side: 3,
                msg: '票据数量格式不正确',
                bg: '#AE81FF',
                time: 2
            });
            $("#billnum").focus();
            return false;
        }

        if (!ismon($("#tripmon").val()) || $("#tripmon").val()=="") {
            $("#tripmon").tips({
                side: 3,
                msg: '格式不正确或为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#tripmon").focus();
            return false;
        }

        if (!ismon($("#hostelmon").val()) || $("#hostelmon").val()=="") {
            $("#hostelmon").tips({
                side: 3,
                msg: '格式不正确或为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#hostelmon").focus();
            return false;
        }

        if (!ismon($("#mission").val()) || $("#mission").val()=="") {
            $("#mission").tips({
                side: 3,
                msg: '格式不正确或为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#mission").focus();
            return false;
        }

        if (!ismon($("#realmon").val()) || $("#realmon").val() == "") {
            $("#realmon").tips({
                side: 3,
                msg: '格式不正确或为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#realmon").focus();
            return false;
        }
        if ($("#proclass1").val() == "") {
            $("#proclass1").tips({
                side: 3,
                msg: '项目分类不能为空',
                bg: '#AE81FF',
                time: 2
            });
            $("#proclass1").focus();
            return false;
        }

        $.ajax({
            type: 'post',
            data: $('#form_add').serialize(),
            url: '<%=basePath%>reimdet/${msg}.do',
            cache: false,
            dataType: 'text',
            success: function (data) {
                if ("msg" != data) {
                    location.href = "<%=basePath%>reimdet/findReimdet.do?csname=" + encodeURI(encodeURI('${pd.csname}')) + '&time=${pd.time}'

                } else {
                    confirm("保存失败")
                }
            }
        })
        $(".mask-button-size").attr("onclick", "null");
    }


    function calmon() {
        var mission = $("#mission").val();
        var tripmon = $("#tripmon").val();
        var hostelmon = $("#hostelmon").val();
        var realmon = $("#realmon").val();
        if (mission != null && tripmon != null && hostelmon != null) {
            $("#realmon").val(Number(mission) + Number(tripmon) + Number(hostelmon));
        }

    }


    function isphone(phone) {
        return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
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
    $('.mask-textarea1').click(function () {
        $(".mask-textarea1-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea1').animate({
            height: '135px',
        })

    });
    $(".mask-textarea1-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea1')[0].style.height === "24px") {
            $(".mask-textarea1-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea1').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea1-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea1').animate({
                height: '24px',
            })
        }
    })

    $('.mask-textarea2').click(function () {
        $(".mask-textarea2-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea2').animate({
            height: '135px',
        })
    });

    $(".mask-textarea2-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea2')[0].style.height === "24px") {
            $(".mask-textarea2-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea2').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea2-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea2').animate({
                height: '24px',
            })
        }
    })

    $('.mask-textarea3').click(function () {
        $(".mask-textarea3-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea3').animate({
            height: '135px',
        })
    });

    $(".mask-textarea3-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea3')[0].style.height === "24px") {
            $(".mask-textarea3-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea3').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea3-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea3').animate({
                height: '24px',
            })
        }
    })

    $('.mask-textarea4').click(function () {
        $(".mask-textarea4-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
        $('.mask-textarea4').animate({
            height: '135px',
        })
    });

    $(".mask-textarea4-shrink").click(function () {
        if (document.getElementsByClassName('mask-textarea4')[0].style.height === "24px") {
            $(".mask-textarea4-shrink").removeClass("mask-dropdown").addClass("mask-dropdown-toggle")
            $('.mask-textarea4').animate({
                height: '135px',
            })
        } else {
            $(".mask-textarea4-shrink").removeClass("mask-dropdown-toggle").addClass("mask-dropdown")
            $('.mask-textarea4').animate({
                height: '24px',
            })
        }
    })

</script>
</body>
</html>
