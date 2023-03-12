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
  <%--<div class="box box-info">--%>
  <div id="mask" class="mask">
    <div id="darkmask" class="darkmask">
      <div class="mask-top">
        <span class="mask-top-size" style="letter-spacing: 3px;"><b>子公司信息</b></span>
        <img src="static/img/modal/delete_icon.png" style="width:22px;height:22px;margin-right: 25px;cursor: pointer;"
          data-dismiss="modal">
      </div>
      <div class="mask-main">
        <form action="company/${msg}.do" name="form_add" id="form_add" method="post">
          <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }" />
          <div id="zhongxin">
            <c:if test="${fx == 'head'}">
              <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden" />
            </c:if>
            <input type="hidden" name="subid" id="subid" value="${st.subid }" />
            <div class="between-center">
              <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>公司全称
                </span>
                <input type="text" name="cfname" id="cfname" autoComplete="off" value="${st.cfname}" maxlength="100"
                  placeholder="这里输入公司全称" title="用户名" class="mask-input width-250px" />
              </div>
              <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>公司简称
                </span>
                <input type="text" name="csname" id="csname" value="${st.csname }" autoComplete="off" maxlength="100"
                  placeholder="这里输入公司简称" title="公司简称" class="mask-input width-250px" />
              </div>
            </div>
            <div class="between-center">
              <div class="between-center padding-8px">
                <span class="mask-size flex-row-between">
                  <font style="color: red;">*</font>公司编号
                </span>
                <input type="text" name="cno" id="cno" value="${st.cno }" autoComplete="off" maxlength="100"
                  placeholder="这里输入公司编号" title="公司编号" title="用户名" class="mask-input width-250px" />
              </div>
            </div>

            <div>

              <div class="mask-subtitle-size"><b style="font-size: 15px;">开票信息</b></div>
            </div>
            <div class="between-center">
              <div class="between-center padding-8px">
                <span class="mask-size">公司名称</span>
                <input type="text" name="tname" id="tname" autoComplete="off" value="${st.tname }" maxlength="100"
                  placeholder="这里输入公司名称" title="公司名称" class="mask-input width-250px" />
              </div>
              <div class="between-center padding-8px">
                <span class="mask-size" style="letter-spacing: 2px;">纳税人<br/>识别号</span>
                <input type="text" name="taxno" id="taxno" autoComplete="off" value="${st.taxno }" maxlength="100"
                  placeholder="这里输入纳税人识别号" title="纳税人识别号" class="mask-input width-250px" />
              </div>
            </div>

            <div class="between-center">
              <div class="between-center padding-8px">
                <span class="mask-size">地&nbsp;&nbsp;&nbsp;&nbsp;址</span>
                <input type="text" name="address" id="address" autoComplete="off" value="${st.address }" maxlength="100"
                  placeholder="这里输入地址" title="地址" class="mask-input width-250px" />
              </div>
              <div class="between-center padding-8px">
                <span class="mask-size">电&nbsp;&nbsp;&nbsp;&nbsp;话</span>
                <input type="text" name="tel" id="tel" value="${st.tel }" maxlength="100" placeholder="这里输入电话"
                  maxlength="64" autoComplete="off" title="电话" class="mask-input width-250px" />
              </div>
            </div>
            <div class="between-center">
              <div class="between-center padding-8px">
                <span class="mask-size">开户行</span>
                <input type="text" type="text" name="bankname" id="bankname" autoComplete="off" value="${st.bankname }"
                  maxlength="100" placeholder="这里输入开户行" title="开户行" class="mask-input width-250px" />
              </div>
              <div class="between-center padding-8px">
                <span class="mask-size">账&nbsp;&nbsp;&nbsp;&nbsp;号</span>
                <input type="text" name="bankno" id="bankno" value="${st.bankno }" autoComplete="off"
                  placeholder="这里输入账号" maxlength="64" title="账号" class="mask-input width-250px" />
              </div>
            </div>
            <div class="mask-button">
              <div class="mask-save" onclick="save();"><span class="mask-button-size">保存</span></div>
              <div class="mask-close"><span class="mask-button-size" data-dismiss="modal">取消</span></div>
            </div>


          </div>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript">

    function addtr() {
      var trObj = document.createElement("tr");
      trObj.innerHTML = ""
      var list = document.getElementById("table_report");
      list.insertRow(6).appendChild(trObj)

    }

    //$(top.hangge());
    //保存
    $(document).ready(function () {

      if ($("#user_id").val() != "") {
        $("#loginname").attr("readonly", "readonly");
        $("#loginname").css("color", "gray");
      }
    });
    // function save() {
    //     $("#form_add").submit();
    // }

    //判断公司编号是否存在
    var flag = "";

    function hasCno() {

      var cno = $.trim($("#cno").val());

      $.ajax({
        type: "POST",
        url: 'company/hasCno.do',
        data: { cno: cno },
        dataType: 'json',
        cache: false,
        async: false,
        success: function (data) {
          if ("success" == data.result) {
            $("#cno").submit();
            flag = true;

            //$("#zhongxin").hide();
            //$("#zhongxin2").show();
          } else {
            // $("#cno").css("background-color", "#D16E6C");
            // setTimeout("$('#cno').val('此公司编号已存在!')", 500);
            if (confirm('此编号已存在，请确认！')) {
              flag = true;
            } else {
              flag = false;
            }

          }
        }
      });
    }

    //保存

    function save() {

      //alert($("#role_id1").val());
      if ($("#cfname").val() == "") {
        $("#cfname").tips({
          side: 3,
          msg: '不能为空',
          bg: '#AE81FF',
          time: 2
        });
        $("#cfname").focus();
        return false;
      }
      if ($("#csname").val() == "") {
        $("#csname").tips({
          side: 3,
          msg: '不能为空',
          bg: '#AE81FF',
          time: 2
        });
        $("#csname").focus();
        return false;
      }
      if ($("#cno").val() == "") {
        $("#cno").tips({
          side: 3,
          msg: '不能为空',
          bg: '#AE81FF',
          time: 2
        })
        $("#cno").focus();
        return false;
      } else if ($("#cno").val() != "") {
        hasCno();
        if (!flag) {
          return flag;
        }
      }

      $.ajax({
        type: 'post',
        data: $('#form_add').serialize(),
        url: 'company/${msg}.do?subid=${st.subid }',
        cache: false,
        dataType: 'text',
        success: function (data) {
          if ("msg" != data) {
            // confirm("保存成功")
            // window.location.href = "company/findBankById.do?subid="+data;
            location.reload();

          } else {
            confirm("保存失败")
          }
        }
      })

    }


    function isphone(phone) {
      return (new RegExp(/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/).test(phone));
    }


    $(function () {
      //下拉框
      if (!ace.vars['touch']) {
        $('.chosen-select').chosen({ allow_single_deselect: true });
        $(window)
          .off('resize.chosen')
          .on('resize.chosen', function () {
            $('.chosen-select').each(function () {
              var $this = $(this);
              $this.next().css({ 'width': $this.parent().width() });
            });
          }).trigger('resize.chosen');
        $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
          if (event_name != 'sidebar_collapsed') return;
          $('.chosen-select').each(function () {
            var $this = $(this);
            $this.next().css({ 'width': $this.parent().width() });
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