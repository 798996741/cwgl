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
  <%@ include file="../../system/include/incJs_mx.jsp" %>
    <link rel="stylesheet" href="static/css/common.css">
    <!--<link rel="stylesheet" href="static/css/main.css">-->
    <link rel="stylesheet" href="static/css/tree.css">
    <!--<link rel="stylesheet" href="static/css/media.css">-->
</head>

<body class="hold-transition skin-blue sidebar-mini">


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="width:100%;margin-left:0px;">
    <section class="content container-fluid">
      <div class="seat-top">
        <div class="seat-subtitle">坐席管理员</div>
        <div class="seat-button">
          <c:if test="${QX.add == 1 }">
            <a href="javascript:void (0)" onclick="add();">新增</a>
          </c:if>
        </div>
      </div>
      <div class="seat-middle">
        <div class="seat-middle-r" style="width: 100%;">
          <!-- <div class="box-body" > -->

          <table style="width: 100%" border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>

                <th class="center" style="width:50px;">序号</th>
                <th class="center">名称</th>
                <th class="center">
                  <c:if
                    test="${DICTIONARIES_ID=='6b272abc46a34105ac98bb03dd71a549' or pd.PARENT_ID=='6b272abc46a34105ac98bb03dd71a549'}">
                    字段</c:if>
                  <c:if
                    test="${DICTIONARIES_ID!='6b272abc46a34105ac98bb03dd71a549' and pd.PARENT_ID!='6b272abc46a34105ac98bb03dd71a549'}">
                    英文</c:if>

                </th>
                <th class="center">编码</th>
                <th class="center">排序</th>
                <th class="center">
                  <c:if
                    test="${DICTIONARIES_ID=='8270efe619c346768cc7aefdb9781757' or pd.PARENT_ID=='8270efe619c346768cc7aefdb9781757'}">
                    费用</c:if>
                  <c:if
                    test="${DICTIONARIES_ID!='8270efe619c346768cc7aefdb9781757' and pd.PARENT_ID!='8270efe619c346768cc7aefdb9781757'}">
                    备注</c:if>
                </th>
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
                        <td class='center'><a href="javascript:;"><i
                              class="ace-icon fa fa-share bigger-100"></i>&nbsp;${var.NAME}</a>
                        </td>
                        <td class='center'><a href="javascript:;">${var.NAME_EN}</a></td>
                        <td class='center'>${var.BIANMA}</td>
                        <td class='center'>${var.ORDER_BY}</td>
                        <td class='center'>${var.BZ}</td>
                        <%--<c:if test="${empty action}">--%>
                        <td align="center">


                            <div class="flex-row-around">
                              <div class="content-edit home-img cy_bj" title="编辑"
                                   onclick="edit('${var.DICTIONARIES_ID}');" >
                                <font class="home-img-size">编辑</font>
                              </div>

                              <div class="content-delete home-img cy_sc" title="删除"
                                   onclick="del('${var.DICTIONARIES_ID}');" >
                                <font class="home-img-size">删除</font>
                              </div>
                            <c:if test="${QX.edit != 1 && QX.del != 1 }">
                            <span class="label label-large label-grey arrowed-in-right arrowed-in"><i
                                    class="ace-icon fa fa-lock" title="无权限"></i></span>
                            </c:if>
                            </div>
                        </td>

                        <c:if test="${not empty action}">
                          <td class="center">
                            <a class="btn btn-xs btn-success" title="选择"
                              onclick="choice('${var.NAME_EN}','${var.NAME}','${vs.index+1}');">
                              <i class="ace-icon fa fa-pencil-square-o bigger-120" title="选择"></i>
                            </a>
                          </td>
                        </c:if>

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
    <!-- Content Header (Page header) -->
    <%-- <section class="content-header">
        <h1>
            系统设置 <small>字典管理</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="javascript:;" onclick="home()"> <i
                    class="fa fa-dashboard"></i> 主页
            </a></li>
            <li class="active">字典设置</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <c:if test="${QX.add == 1 and empty action}">
                            <a class="btn btn-sm btn-success" onclick="add('${DICTIONARIES_ID}');">新增</a>
                        </c:if>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example_dic" class="table table-bordered table-hover">
                            <thead>
                                <tr>

                                    <th class="center" style="width:50px;">序号</th>
                                    <th class="center">名称</th>
                                    <th class="center">
                                        <c:if test="${DICTIONARIES_ID=='6b272abc46a34105ac98bb03dd71a549' or pd.PARENT_ID=='6b272abc46a34105ac98bb03dd71a549'}">字段</c:if>
                                        <c:if test="${DICTIONARIES_ID!='6b272abc46a34105ac98bb03dd71a549' and pd.PARENT_ID!='6b272abc46a34105ac98bb03dd71a549'}">英文</c:if>

                                    </th>
                                    <th class="center">编码</th>
                                    <th class="center">排序</th>
                                    <th class="center">
                                        <c:if test="${DICTIONARIES_ID=='8270efe619c346768cc7aefdb9781757' or pd.PARENT_ID=='8270efe619c346768cc7aefdb9781757'}">费用</c:if>
                                        <c:if test="${DICTIONARIES_ID!='8270efe619c346768cc7aefdb9781757' and pd.PARENT_ID!='8270efe619c346768cc7aefdb9781757'}">备注</c:if>
                                    </th>
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
                                        <td class='center'><a href="javascript:;"><i class="ace-icon fa fa-share bigger-100"></i>&nbsp;${var.NAME}</a></td>
                                        <td class='center'><a href="javascript:;')">${var.NAME_EN}</a></td>
                                        <td class='center'>${var.BIANMA}</td>
                                        <td class='center'>${var.ORDER_BY}</td>
                                        <td class='center'>${var.BZ}</td>
                                        <c:if test="${empty action}">
                                            <td class="center">
                                                <c:if test="${QX.edit != 1 && QX.del != 1 }">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
                                                </c:if>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <c:if test="${QX.edit == 1 }">
                                                    <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.DICTIONARIES_ID}');">
                                                        <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
                                                    </a>
                                                    </c:if>
                                                    <c:if test="${QX.del == 1  and not empty var.PARENTID}">
                                                    <a class="btn btn-xs btn-danger" style="margin-left:10px" onclick="del('${var.DICTIONARIES_ID}');">
                                                        <i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
                                                    </a>
                                                    </c:if>
                                                </div>

                                            </td>
                                        </c:if>
                                        <c:if test="${not empty action}">
                                            <td class="center">
                                                <a class="btn btn-xs btn-success" title="选择" onclick="choice('${var.NAME_EN}','${var.NAME}','${vs.index+1}');">
                                                    <i class="ace-icon fa fa-pencil-square-o bigger-120" title="选择"></i>
                                                </a>
                                            </td>
                                        </c:if>

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
                                    <td colspan="100" class="center" >没有相关数据</td>
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
    <c:if test="${not empty action}">
      <div style="width:100%;text-align:center">
        <a class="btn btn-mini btn-danger" id="alink" data-btn-type="cancel" data-dismiss="modal">确认</a>
      </div>
    </c:if>
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

  <c:if test="${not empty action}">
    <script type="text/javascript">
      function choice(id, name, index) {
        //alert("FIELD${num}");
        var tblOne = document.getElementById("example_dic");
        for (var nowindex = 1; nowindex < tblOne.rows.length; nowindex++) {
          document.getElementById("tr" + nowindex + "").style.background = "#FFFFFF";
          //tblOne.rows[nowindex].bgColor = "#FFFFFF";
        }
        document.getElementById("tr" + index + "").style.background = "#ccc";
        //$("#tr"+index+"").style.background= "red";
        document.getElementById("FIELD${num}").value = id;
        document.getElementById("FIELDNAME${num}").value = name;
        //$("#alink").click();
      }
    </script>
  </c:if>
  <c:if test="${empty action}">
    <script type="text/javascript">
      //$(top.hangge());//关闭加载状态
      //检索
      function tosearch() {
        var keywords = $("#keywords").val();
        location.href = "<%=path%>/dictionaries/list.do?keywords=" + encodeURI(encodeURI(keywords));
      }

      $(function () {


      });

      //去此ID下子列表
      function goSondict(DICTIONARIES_ID) {
        top.jzts();
        window.location.href = "<%=basePath%>dictionaries/list.do?DICTIONARIES_ID=" + DICTIONARIES_ID;
      };

      //新增
      function add(DICTIONARIES_ID) {
        if (DICTIONARIES_ID == "") {
          DICTIONARIES_ID == "0";
        }
        var winId = "userWin";
        modals.openWin({
          winId: winId,
          title: '新增',
          width: '500px',
          height: '500px',
          url: '<%=basePath%>dictionaries/goAdd.do?DICTIONARIES_ID=' + DICTIONARIES_ID
          /*, hideFunc:function(){
              modals.info("hide me");
          },
          showFunc:function(){
              modals.info("show me");
          } */
        });
      }

        <%--top.jzts();--%>
      <%--var diag = new top.Dialog();--%>
      <%--diag.Drag = true;--%>
      <%--diag.Title = "新增";--%>
      <%--diag.URL = '<%=basePath%>dictionaries/goAdd.do?DICTIONARIES_ID=' + DICTIONARIES_ID;--%>
      <%--diag.Width = 500;--%>
      <%--diag.Height = 500;--%>
      <%--diag.CancelEvent = function () { //关闭事件--%>
        <%--if ('none' == diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display) {--%>
          <%--parent.location.href = "<%=basePath%>dictionaries/listAllDict.do?DICTIONARIES_ID=${DICTIONARIES_ID}&dnowPage=${page.currentPage}";--%>
        <%--}--%>
        <%--diag.close();--%>
      <%--};--%>
      <%--diag.show();--%>


        //删除
        function del(Id) {
          if (Id == "ce174640544549f1b31c8f66e01c111b") {
            alert("坐席分组不允许修改");
            return false;
          }
          bootbox.confirm("确定要删除吗?", function (result) {
            if (result) {
              top.jzts();
              var url = "<%=basePath%>dictionaries/delete.do?DICTIONARIES_ID=" + Id + "&tm=" + new Date().getTime();
              $.get(url, function (data) {

                if ("success" == data.result) {
                  parent.location.href = "<%=basePath%>dictionaries/listAllDict.do?DICTIONARIES_ID=${DICTIONARIES_ID}&dnowPage=${page.currentPage}";
                } else if ("false" == data.result) {
                  //top.hangge();
                  bootbox.dialog({
                    message: "<span class='bigger-110'>删除失败！请先删除子级或删除占用资源.</span>",
                    buttons:
                    {
                      "button":
                      {
                        "label": "确定",
                        "className": "btn-sm btn-success"
                      }
                    }
                  });
                } else if ("false2" == data.result) {
                  //top.hangge();
                  bootbox.dialog({
                    message: "<span class='bigger-110'>删除失败！排查表不存在或其表中没有BIANMA字段.</span>",
                    buttons:
                    {
                      "button":
                      {
                        "label": "确定",
                        "className": "btn-sm btn-success"
                      }
                    }
                  });
                }
              });
            }
          });
        }

      //修改
      function edit(Id) {
        var winId = "userWin";
        modals.openWin({
          winId: winId,
          title: '编辑',
          width: '500px',
          height: '500px',
          url: '<%=basePath%>dictionaries/goEdit.do?DICTIONARIES_ID=' + Id
          /*, hideFunc:function(){
              modals.info("hide me");
          },
          showFunc:function(){
              modals.info("show me");
          } */
        });
      }
    </script>
  </c:if>
  <script>
    $(function () {

      $('#example_dic').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': false,
        'ordering': false,
        'info': true,
        'autoWidth': false
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
</body>

</html>