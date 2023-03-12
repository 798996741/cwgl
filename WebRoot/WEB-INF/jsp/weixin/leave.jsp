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
            content="width=device-width, initial-scale=1.0,maximum-scale=1, minimum-scale=1, user-scalable=no"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>我要请假</title>
    <script src="static/js/weixin/lib-flexible.js"></script>
    <link rel="stylesheet" href="static/css/weixin/weui.css" />
    <script src="https://cdn.bootcss.com/zepto/1.2.0/zepto.js"></script>
    <script src="http://39.106.15.227/js/fx.js"></script>
    <script src="http://39.106.15.227/js/fx_methods.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.2.1/weui.min.js"></script>
    <!-- 企业微信js-sdk -->
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<div class="page form_page js_show">
    <form id="form">
        <div class="weui-form__control-area">
            <div class="weui-cells__group weui-cells__group_form">
                <div class="weui-cells__title">我要请假</div>
                <div class="weui-cells weui-cells_form">
                    <div
                            class="weui-cell weui-cell_access weui-cell_select weui-cell_select-after"
                    >
                        <div class="weui-cell__hd">
                            <label class="weui-label" for="pickerProposer">申请人</label>
                        </div>
                        <div class="weui-cell__bd" id="pickerProposer">
                            &nbsp;&nbsp;
                        </div>
                        <input
                                type="hidden"
                                required
                                pattern="REG_proposer"
                                name="proposer"
                                emptyTips="请选择申请人"
                                value="xxx"
                                id="proposer"
                        />
                    </div>
                    <div
                            class="weui-cell weui-cell_access weui-cell_select weui-cell_select-after"
                    >
                        <div class="weui-cell__hd">
                            <label class="weui-label" for="showPicker">请假类型</label>
                        </div>
                        <div class="weui-cell__bd" id="showPicker">&nbsp;&nbsp;</div>
                        <input
                                type="hidden"
                                required
                                pattern="REG_leaveType"
                                name="leavetype"
                                emptyTips="请选择请假类型"
                                id="leaveType"
                        />
                    </div>
                    <div
                            class="weui-cell weui-cell_access weui-cell_select weui-cell_select-after"
                    >
                        <div class="weui-cell__hd">
                            <label class="weui-label">开始时间</label>
                        </div>
                        <div class="weui-cell__bd" id="showPickerStart">&nbsp;</div>
                        <input
                                type="hidden"
                                required
                                pattern="REG_startTime"
                                name="starttime"
                                emptyTips="请选择开始时间"
                                id="startTime"
                        />
                    </div>
                    <div
                            class="weui-cell weui-cell_access weui-cell_select weui-cell_select-after"
                    >
                        <div class="weui-cell__hd">
                            <label class="weui-label">结束时间</label>
                        </div>
                        <div class="weui-cell__bd" id="showPickerEnd">&nbsp;</div>
                        <input
                                type="hidden"
                                required
                                pattern="REG_endTime"
                                name="endtime"
                                emptyTips="请选择结束时间"
                                id="endTime"
                        />
                    </div>
                    <div class="weui-cell weui-cell_disabled">
                        <div class="weui-cell__hd">
                            <label class="weui-label">请假时长</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input
                                    type="text"
                                    class="weui-input"
                                    id="leaveDays"
                                    name="leavedays"
                                    value=""
                                    readonly
                            />
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">请假事由</label>
                        </div>
                        <div class="weui-cell__bd">
                  <textarea
                          class="weui-textarea"
                          placeholder="请输入请假事由"
                          required
                          name="leavereason"
                          pattern="REG_leaveReason"
                          emptyTips="请输入请假事由"
                          id="leaveReason"
                          rows="3"
                  ></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="weui-form__opr-area">
            <a class="weui-btn weui-btn_primary " href="javascript:" id="button">
                提交
            </a>
        </div>
    </form>
    <div id="loadingToast" style="opacity: 0; display: none;">
        <div class="weui-mask_transparent"></div>
        <div class="weui-toast">
            <p class="weui-toast__content">正在提交中...</p>
        </div>
    </div>
    <div id="js_toast" style="display: none;">
        <div class="weui-mask_transparent"></div>
        <div class="weui-toast">
            <i class="weui-icon-success-no-circle weui-icon_toast"></i>
            <p class="weui-toast__content">已提交</p>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(function() {
        $('#button').on('click', function() {
            weui.form.validate(
                '#form',
                function(error) {
                    if (!error) {
                        var formdata = $('form').serialize()
                        // var data = {}
                        // $(formdata).each(function(index, obj) {
                        //     data[obj.name] = obj.value
                        // })
                        // var content = JSON.stringify(data)
                        // console.log("content="+content)

                        var $loadingToast = $('#loadingToast')
                        console.log("formdata"+formdata);
                        $.ajax({
                            type: 'POST',
                            url: '<%=basePath%>app_leave.do',
                            dataType: 'json',
                            data: formdata,
                            success: function(res) {
                                var $toast = $('#js_toast')
                                console.log($toast)
                                if ($toast.css('display') != 'none') return
                                $loadingToast.fadeOut(100)
                                $toast.fadeIn(100)
                                setTimeout(function() {
                                    $toast.fadeOut(100)
                                    wx.closeWindow()
                                }, 200)
                                console.log(res)
                            },
                            error: function(xhr, type) {
                                console.log(type)
                            }
                        })

                        if ($loadingToast.css('display') != 'none') return
                        $loadingToast.fadeIn(100)
                    } else {
                        switch (error.ele.id) {
                            case 'leaveType':
                                weui.form.showErrorTips({
                                    ele: document.getElementById('leaveType'),
                                    msg: 'empty'
                                })
                                break
                            case 'startTime':
                                weui.form.showErrorTips({
                                    ele: document.getElementById('startTime'),
                                    msg: 'empty'
                                })
                                break
                            case 'endTime':
                                weui.form.showErrorTips({
                                    ele: document.getElementById('endTime'),
                                    msg: 'empty'
                                })
                                break
                            case 'leaveReason':
                                weui.form.showErrorTips({
                                    ele: document.getElementById('leaveReason'),
                                    msg: 'empty'
                                })
                                break
                        }
                    }
                    // return true; // 当return true时，不会显示错误
                },
                {
                    regexp: {
                        proposer: /^[\u4e00-\u9fa5]{0,}$/,
                        leaveType: /^[\u4e00-\u9fa5]{0,}$/,
                        startTime: /^[\u4E00-\u9FA50-9*\-+]+$/,
                        endTime: /^[\u4E00-\u9FA50-9*\-+]+$/,
                        leaveReason: /^[\u4E00-\u9FA5A-Za-z0-9_]+$/
                    }
                }
            )
        })
    })
   <%-- function approval() {
        //动态获取当前页面url
        var link = window.location.href;

        $.ajax({
            type:"GET",
            data:{"url":link},
            url:"<%=request.getContextPath()%>/approval/send_approval.do",
            dataType:"json",
            success:function (data) {

                console.log(data);
                wx.config({
                    beta: true,
                    debug: true,
                    appId: data.appId,
                    timestamp: data.config_timestamp,
                    nonceStr: data.config_nonceStr,
                    signature: data.config_signature,
                    jsApiList: ['agentConfig','openUserProfile','thirdPartyOpenPage','selectExternalContact']
                });

                wx.ready(function () {
                    alert("config");
                    wx.agentConfig({
                        corpid: data.appId,
                        agentid: data.agentid,
                        timestamp: data.agent_timestamp,
                        nonceStr: data.agent_nonceStr,
                        signature: data.agent_signature,
                        jsApiList: ['thirdPartyOpenPage','selectExternalContact'],
                        success: function(res) {
                            //审批流程js调用
                            alert("agentConfig");
                            wx.invoke('thirdPartyOpenPage', {
                                    "oaType": data.oaType,
                                    "templateId": data.templateId,
                                    "thirdNo": data.thirdNo,
                                    "extData": {
                                        'fieldList': [{
                                            'title': '采购类型',
                                            'type': 'text',
                                            'value': '市场活动',
                                        },
                                            {
                                                'title': '订单链接',
                                                'type': 'link',
                                                'value': 'https://work.weixin.qq.com',
                                            }],
                                    }
                                },
                                function(res) {
                                    // 输出接口的回调信息
                                    alert("thirdPartyOpenPage");
                                    alert(res);
                                }
                            );
                        },
                        fail: function(res) {
                            alert("approval提交不通过");
                            alert("agentConfig:"+res.errMsg);
                            if(res.errMsg.indexOf('function not exist') > -1){
                                alert('版本过低请升级')
                            }
                        }
                    });

                });

                wx.error(function(res){

                });
            }
        })
    }--%>

    var dateArray = [];
    var proposerData = [];
    <c:forEach items="${name}" var="name" varStatus="vs">
    proposerData.push("${name.name}");
    </c:forEach>

    var dateObj = {};
    var day = moment().format("YYYY-MM-DD");
    var comDate = {}; // 比较请假天数
    var day_diff = ""; // 请假0天
    var leaveDecimal = "";
    for (var i = 0; i <= 200; i++) {
        dateObj.label = moment()
            .add(i, "days")
            .format("YYYY-MM-DD");
        dateObj.value = moment()
            .add(i, "days")
            .format("YYYY-MM-DD");
        dateArray.push(dateObj);
        dateObj = {};
    }
    $("#showPickerStart").on("click", () => {
        var startTime = "";
    weui.picker(
        dateArray,
        [
            {
                label: "上午",
                value: 0
            },
            {
                label: "下午",
                value: 1
            }
        ],
        {
            defaultValue: [day, 0],
            onChange: function(result) {
                console.log(result);
            },
            onConfirm: function(result) {
                console.log(result);
                comDate.startTime = moment(result[0].value);
                comDate.startDecimal = result[1].value;
                $("#showPickerStart").text(result[0].label + result[1].label);
                $("#startTime").val(result[0].label + result[1].label);
                var diffDecimal = 0;
                console.log(comDate);
                if (comDate.endTime) {
                    if (comDate.endDecimal - comDate.startDecimal === 0) {
                        diffDecimal = 0.5;
                    } else if (comDate.endDecimal - comDate.startDecimal === 1) {
                        diffDecimal = 1;
                    } else {
                        diffDecimal = 0;
                    }
                    day_diff =
                        comDate.endTime.diff(comDate.startTime, "days") + diffDecimal;
                    console.log(day_diff);
                    $("#leaveDays").val(day_diff + "天");

                }
            },
            id: "showPickerStart",
            title: "开始时间"
        }
    );
    console.log("startTime" + startTime);
    });
    $("#showPickerEnd").on("click", function() {
        weui.picker(
            dateArray,
            [
                {
                    label: "上午",
                    value: 0
                },
                {
                    label: "下午",
                    value: 1
                }
            ],
            {
                defaultValue: [day, 0],
                onChange: function(result) {
                    console.log(result);
                },
                onConfirm: function(result) {
                    console.log(result);
                    comDate.endTime = moment(result[0].value);
                    comDate.endDecimal = result[1].value;
                    console.log(comDate);
                    $("#showPickerEnd").text(result[0].label + result[1].label);
                    $("#endTime").val(result[0].label + result[1].label);
                    if (comDate.startTime) {
                        var diffDecimal = 0;
                        if (comDate.endDecimal - comDate.startDecimal === 0) {
                            diffDecimal = 0.5;
                        } else if (comDate.endDecimal - comDate.startDecimal === 1) {
                            diffDecimal = 1;
                        } else {
                            diffDecimal = 0;
                        }
                        console.log(diffDecimal);
                        day_diff =
                            comDate.endTime.diff(comDate.startTime, "days") + diffDecimal;
                        $("#leaveDays").val(day_diff+"天");
                    }
                },
                id: "showPickerEnd",
                title: "结束时间"
            }
        );
    });
    $("#pickerProposer").on("click", function() {
        weui.picker(proposerData, {
            onChange: function(result) {
                console.log(result);
            },
            onConfirm: function(result) {
                console.log(result);
                $("#pickerProposer").text(result[0].label);
                $("#proposer").val(result[0].value);
            },
            title: "申请人"
        });
    });
    $("#showPicker").on("click", function() {
        weui.picker(
            [
                {
                    label: "病假",
                    value: 0
                },
                {
                    label: "事假",
                    value: 1
                },
                {
                    label: "调休假",
                    value: 2
                },
                {
                    label: "婚假",
                    value: 3
                },
                {
                    label: "产假",
                    value: 4
                },
                {
                    label: "其他",
                    value: 5
                }
            ],
            {
                onChange: function(result) {
                    console.log(result);
                },
                onConfirm: function(result) {
                    console.log(result[0].label);
                    $("#showPicker").text(result[0].label);
                    $("#leaveType").val(result[0].label);
                },
                title: "请假类型"
            }
        );
    });
</script>

</body>
</html>
