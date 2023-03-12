

$(function() {
  $("#button").on("click", function() {
    weui.form.validate(
      "#form",
      function(error) {
        if (!error) {
          var formdata = $("form").serializeArray();
          var data = {};
          $(formdata).each(function(index, obj) {
            data[obj.name] = obj.value;
          });
          var content = JSON.stringify(data);
          console.log(content);

          var $loadingToast = $("#loadingToast");

          $.ajax({
            type: "POST",
            url: `${url}/leave`,
            dataType: "json",
            data: content,
            contentType: "application/json",
            success: function(res) {
              var $toast = $("#js_toast");
              console.log($toast);
              if ($toast.css("display") != "none") return;
              $loadingToast.fadeOut(100);
              $toast.fadeIn(100);
              setTimeout(function() {
                $toast.fadeOut(100);
                wx.closeWindow();
              }, 200);
              console.log(res);
            },
            error: function(xhr, type) {
              console.log(type);
            }
          });

          if ($loadingToast.css("display") != "none") return;
          $loadingToast.fadeIn(100);
        } else {
          switch (error.ele.id) {
            case "leaveType":
              weui.form.showErrorTips({
                ele: document.getElementById("leaveType"),
                msg: "empty"
              });
              break;
            case "startTime":
              weui.form.showErrorTips({
                ele: document.getElementById("startTime"),
                msg: "empty"
              });
              break;
            case "endTime":
              weui.form.showErrorTips({
                ele: document.getElementById("endTime"),
                msg: "empty"
              });
              break;
            case "leaveReason":
              weui.form.showErrorTips({
                ele: document.getElementById("leaveReason"),
                msg: "empty"
              });
              break;
          }
        }
        // return true; // 当return true时，不会显示错误
      },
      {
        regexp: {
          leaveType: /^[\u4e00-\u9fa5]{0,}$/,
          startTime: /^[\u4E00-\u9FA50-9*\-+]+$/,
          endTime: /^[\u4E00-\u9FA50-9*\-+]+$/,
          leaveReason: /^[\u4E00-\u9FA5A-Za-z0-9_]+$/
        }
      }
    );
  });
});
