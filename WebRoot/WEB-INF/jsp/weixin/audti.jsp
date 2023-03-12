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
    <meta charset="UTF-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0,user-scalable=no "
    />
    <title>微信审核页面</title>
    <script src="static/js/weixin/lib-flexible.js"></script>
    <link rel="stylesheet" href="static/css/weixin/main.css" />
    <style>
        .comment_input_wrap {
            display: flex;
            background-color: #f2f3f5;
            border-radius: 0.05405405405405406rem;
        }
        .comment_submit {
            color: #1e64c8;
            margin-right: 0.43243243243243246rem;
            font-size: 0.35135135135135137rem;
            line-height: 0.972972972972973rem;
            white-space: nowrap;
            cursor: pointer;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
        .comment_submit_disable {
            color: #bebec2;
        }
        .comment_input {
            height: 0.5405405405405406rem;
            font-size: 0.35135135135135137rem;
            padding: 0.1891891891891892rem 0.2972972972972973rem;
            margin: 0.02702702702702703rem;
            min-width: 0;
            flex: 1;
            border: none;
            background-color: #f2f3f5;
            outline: none;
            -webkit-appearance: none;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
        .comment_input::-webkit-outer-spin-button,
        .comment_input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .comment_list_item {
            display: flex;
            padding: 0 0 0.24324324324324326rem;
            background-color: #fff;
        }
        .comment_item_left {
            width: 0.6756756756756757rem;
            height: 0.6756756756756757rem;
            margin-top: 0.4864864864864865rem;
            margin-right: 0.1891891891891892rem;
        }
        .comment_item_avatar {
            width: 0.6756756756756757rem;
            height: 0.6756756756756757rem;
            border-radius: 0.05405405405405406rem;
        }
        .comment_item_right {
            flex: 1;
            display: flex;
            margin-top: 0.4594594594594595rem;
            line-height: 0.6756756756756757rem;
            margin-left: 0.13513513513513514rem;
            overflow: hidden;
        }
        .comment_item_name {
            font-size: 0.3783783783783784rem;
            font-weight: 500;
            color: #777e8a;
            flex: 1;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .comment_item_content {
            font-size: 0.35135135135135137rem;
            word-break: break-all;
        }
        .comment_item_time {
            font-size: 0.32432432432432434rem;
            color: #b2b2b2;
        }
        .comment_item_str {
            display: inline-block;
            vertical-align: middle;
        }
        .comment_item_opt {
            color: #1e64c8;
            display: inline-block;
            margin-right: 0.2702702702702703rem;
            cursor: pointer;
            vertical-align: middle;
        }
        .comment_prompt {
            margin-top: -0.4864864864864865rem;
        }
        .comment_input_info {
            color: #666;
            margin-bottom: 0.21621621621621623rem;
        }
        @media screen and (device-width: 8.64864864864865rem) and (-webkit-device-pixel-ratio: 2) {
            .comment_submit {
                margin-right: 0.21621621621621623rem;
            }
        }
        .comment_file_wrap {
            background-color: #f2f3f5;
        }
        .comment_input_filebtn {
            width: 0.43243243243243246rem;
            height: 0.43243243243243246rem;
            margin: 0.2702702702702703rem 0 0 0.2702702702702703rem;
            cursor: pointer;
        }
        .comment_file_list {
            margin: 0.2702702702702703rem 0.35135135135135137rem;
        }
        .comment_file_item {
            width: 0.6756756756756757rem;
            height: 0.6756756756756757rem;
            display: inline-block;
            margin-right: 0.2702702702702703rem;
            margin-top: 0.13513513513513514rem;
            cursor: pointer;
        }
        .comment_file_box {
            position: relative;
            display: inline-block;
        }
        .comment_file_delete {
            position: absolute;
            right: 0.05405405405405406rem;
            top: -0.05405405405405406rem;
        }
        .comment_item_filelist .comment_file_list {
            margin: 0.21621621621621623rem 0;
        }
    </style>
    <script src="https://cdn.bootcss.com/zepto/1.2.0/zepto.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
<div id="wework_admin.approval_desktop_layout_v2_$" rendered="true">
    <div id="wework_admin.approval_desktop_layout_v2$layout$">
        <div id="wework_admin.approval_desktop_detail_v2_$" rendered="true">
            <div class="approval_detail">
                <div style="padding:0 60px">
                    <input type="hidden" value="${leave.leaveid}" id="leaveid" name="leaveid">
                    <div class="approval_detail_person">
                        <div class="approval_detail_person_content">
                            <img
                                    class="approval_detail_person_avatar js_show_approval_profile"
                                    data-vid="1688850277375994"
                                    src="${user.avatar}"
                            />
                            <div class="approval_detail_person_title ml12">
                    <span class="approval_detial_person_title_content"
                    >${user.name}的请假</span
                    >
                                <c:if test="${leave.auditype=='2'}">
                                <span
                                    class="approval_detial_person_status approval_detial_status_1"
                            >审批中</span
                            ></c:if>
                                <c:if test="${leave.auditype=='0'}">
                                <span
                                        class="approval_detial_person_status approval_detial_status_2"
                                >已通过</span
                                ></c:if>
                                <c:if test="${leave.auditype=='1'}">
                                <span
                                        class="approval_detial_person_status approval_detial_status_3"
                                >已驳回</span
                                ></c:if>
                            </div>
                        </div>
                    </div>
                    <div
                            class="approval_detail_content panel-border-btm"
                            style="padding-bottom:10px"
                    >
                        <%--<div class="approval-item">--%>
                            <%--<label class="approval-item-title"--%>
                            <%--><span>审批编号</span></label--%>
                            <%-->--%>
                            <%--<div class="approval-item-desc">--%>
                                <%--<pre>201911110001</pre>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="approval-item">
                            <label class="approval-item-title"
                            ><span>所在部门</span></label
                            >
                            <div class="approval-item-desc">
                                <pre>${dep.name}</pre>
                            </div>
                        </div>
                        <div class="approval-item">
                            <label class="approval-item-title"
                            ><span>请假类型</span></label
                            >
                            <div class="approval-item-desc">
                                <pre>${leave.leavetype}</pre>
                            </div>
                        </div>
                        <div class="approval-item">
                            <label class="approval-item-title"
                            ><span>开始时间</span></label
                            >
                            <div class="approval-item-desc">
                                <pre>${leave.starttime}</pre>
                            </div>
                        </div>
                        <div class="approval-item">
                            <label class="approval-item-title"
                            ><span>结束时间</span></label
                            >
                            <div class="approval-item-desc">
                                <pre>${leave.endtime}</pre>
                            </div>
                        </div>
                        <div class="approval-item">
                            <label class="approval-item-title"
                            ><span>请假时长</span></label
                            >
                            <div class="approval-item-desc">
                                <pre>${leave.leavedays}</pre>
                            </div>
                        </div>
                        <div class="approval-item">
                            <label class="approval-item-title"
                            ><span>请假事由</span></label
                            >
                            <div class="approval-item-desc">
                                <pre>${leave.leavereason}</pre>
                            </div>
                        </div>
                    </div>
                    <div class="approval_detail_comment">
                        <div class="comment_input_info js_comment_info">备注</div>
                        <form action="" onsubmit="return false">
                            <div class="comment_file_wrap">
                                <div class="comment_input_wrap">
                                    <input
                                            class="comment_input js_comment_input"
                                            placeholder="添加备注..."
                                            id="remark"
                                            name="remark"
                                            type="text"
                                    />

                                </div>
                            </div>
                        </form>
                    </div>
                    <c:if test="${leave.auditype=='2'}">
                    <div id="action">
                        <div class="footer-container" style="height: 113px;">
                            <footer class="footer-wrap footer-wrap-detail">
                                <div
                                        class="approval_coomon_footer approval_detail_btn_leader button-bar"
                                        style="float: left;"
                                >
                                    <a
                                            class="button button-primary"
                                            onclick="postleaveresult('0')"
                                    >同意</a
                                    >
                                    <a class="button" onclick="postleaveresult('1')">驳回</a>
                                </div>
                            </footer>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<script>
    <%--wx.config({--%>
        <%--beta: true, // 必须这么写，否则wx.invoke调用形式的jsapi会有问题--%>
        <%--debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。--%>
        <%--appId: "<%=corpid%>", // 必填，企业微信的corpID--%>
        <%--timestamp: "<%=timestamp%>", // 必填，生成签名的时间戳--%>
        <%--nonceStr: "<%=noncestr%>", // 必填，生成签名的随机串--%>
        <%--signature: "<%=signature%>", // 必填，签名，见 附录-JS-SDK使用权限签名算法--%>
        <%--jsApiList: ["chooseImage"] // 必填，需要使用的JS接口列表，凡是要调用的接口都需要传进来--%>
    <%--});--%>
    function postleaveresult(auditstate) {
        $("#action").css({ display: "none" });

        // if (auditstate === 1) {
        //     $(".approval_detial_person_status")
        //         .text("已通过")
        //         .removeClass("approval_detial_status_1")
        //         .addClass("approval_detial_status_2");
        // } else {
        //     $(".approval_detial_person_status")
        //         .text("已驳回")
        //         .removeClass("approval_detial_status_1")
        //         .addClass("approval_detial_status_3");
        // }

        var leaveid=$("#leaveid").val();
        var remark=$("#remark").val();

        wx.closeWindow();
        $(function() {
            $.ajax({
                type: "POST",
                url: "<%=basePath%>app_audit.do",
                dataType: "json",
                data: {auditype:auditstate,leaveid:leaveid,remark:remark},
                success: function(res) {
                    console.log(res);
                },
                error: function(xhr, type) {
                    console.log(type);
                }
            });
        });
    }
    $(".js_comment_input").on({
        keyup: function() {
            if ($(".js_comment_input").val() == "") {
                console.log($(".js_comment_input").val());
                $(".js_comment_submit")
                    .removeClass("comment_submit")
                    .addClass("comment_submit_disable comment_submit");
                return;
            }
            $(".js_comment_submit")
                .removeClass("comment_submit_disable")
                .addClass("comment_submit");
        }
    });

</script>
</body>
</html>
