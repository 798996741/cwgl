package com.fh.controller.app.appuser;

import com.fh.controller.base.BaseController;
import com.fh.pojo.massage.send.Text;
import com.fh.pojo.massage.send.TextMessage;
import com.fh.pojo.massage.send.Textcard;
import com.fh.pojo.massage.send.TextcardMessage;
import com.fh.service.app.LeaveService;
import com.fh.service.app.MessageService;
import com.fh.service.app.SendMessageService;
import com.fh.util.PageData;
import com.fh.utils.WeiXinParamesUtil;
import com.fh.utils.WeiXinUtil;
import com.fh.utils.refreshToken;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class LeaveController extends BaseController {
    @Resource(name = "leaveServiceImpl")
    private LeaveService leaveService;
    private MessageService messageService;

    @RequestMapping(value = "/app_goleave.do")
    public ModelAndView goleave(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> name = leaveService.findName(pd);

        ModelAndView mv = new ModelAndView();
        mv.addObject("name", name);
        mv.addObject("pd", pd);
        mv.setViewName("/weixin/leave");
        return mv;

    }

    @RequestMapping(value = "/app_leave.do", method= RequestMethod.POST)
    @ResponseBody
    public JSONObject leave() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println("pd"+pd);
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
        pd.put("apptime",dateFormat.format(date));
        pd.put("auditype","2");
//        List<PageData> user = leaveService.findUser(pd);
//        for (PageData pageData : user) {
//            String is_leader_in_dept = pageData.getString("is_leader_in_dept");
//            String[] split = is_leader_in_dept.replace("]", "").replace("[", "").split(",");
//            for (String s : split) {
//                if ("1".equals(s)){
//                    user.add(pageData);
//                    break;
//                }
//            }
//        }

        leaveService.insertLeave(pd);
        PageData lastLeave = leaveService.findLastLeave(pd);
        String leaveid = lastLeave.get("leaveid").toString();
//        for (PageData pageData : user) {
//            String userid = pageData.getString("userid");
        String title="代办事宜";
        String description="<div class=\"gray\">"+dateFormat.format(date)+"</div> <div class=\"normal\">" +
                pd.getString("proposer")+"同学急需请假" +
                "请您点击此卡片速速前往审核</div>";
        String url="http://4py62v.natappfree.cc/app_goaudti.do?leaveid="+leaveid;

        //1.创建文本卡片消息对象
        TextcardMessage message=new TextcardMessage();
        //1.1非必需
        message.setTouser("AAAKunLin");  //不区分大小写
        //1.2必需
        message.setMsgtype("textcard");
        message.setAgentid(WeiXinParamesUtil.agentId);

        Textcard textcard=new Textcard();
        textcard.setTitle(title);
        textcard.setDescription(description);
        textcard.setUrl(url);
        message.setTextcard(textcard);

        //2.获取access_token:根据企业id和通讯录密钥获取access_token,并拼接请求url
        refreshToken refreshToken = new refreshToken();
        String accesstoken = refreshToken.IsExistAccess_Token();
        System.out.println("accessToken:"+accesstoken);

        //3.发送消息：调用业务类，发送消息
        SendMessageService sms=new SendMessageService();
        sms.sendMessage(accesstoken, message);
//        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",1);

        return jsonObject;
    }

    @RequestMapping(value = "/app_goaudti.do")
    public ModelAndView goaudti() throws Exception {

        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println("pd:"+pd);

        PageData leave = leaveService.findLeaveById(pd);
        System.out.println("leave"+leave);
        String proposer = leave.getString("proposer");
        pd.put("name",proposer);
        PageData user = leaveService.findUserByUserid(pd);
        System.out.println("user"+user);
        String department = user.getString("department");
        String[] depid = department.replace("]", "").replace("[", "").split(",");
        ModelAndView mv = new ModelAndView();
        for (String s : depid) {
            pd.put("id",s);
            PageData dep = leaveService.findDepartment(pd);
            mv.addObject("dep", dep);
        }

        mv.addObject("leave", leave);
        mv.addObject("user", user);

        mv.setViewName("/weixin/audti");
        return mv;
    }

    @RequestMapping(value = "/app_audit.do", method= RequestMethod.POST)
    @ResponseBody
    public JSONObject audit() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        leaveService.updateLeave(pd);
        PageData leave = leaveService.findLeaveById(pd);
        String proposer = leave.getString("proposer");
        PageData pageData = new PageData();
        pageData.put("name",proposer);
        PageData userByUserid = leaveService.findUserByUserid(pageData);
        String auditype = pd.getString("auditype");
        String remark = pd.getString("remark");
        String content="";
        if ("1".equals(auditype)) {
            content="很抱歉，您的请假申请被驳回。备注："+remark;
        }

        if ("0".equals(auditype)){
            content="恭喜您，您的请假申请通过，祝您有个美好的假期。备注："+remark;
        }

        //1.创建文本消息对象
        TextMessage message = new TextMessage();
        //1.1非必需
        message.setTouser(userByUserid.getString("userid"));  //不区分大小写
        //textMessage.setToparty("1");
        //txtMsg.setTotag(totag);
        //txtMsg.setSafe(0);
        //1.2必需
        message.setMsgtype("text");
        message.setAgentid(WeiXinParamesUtil.agentId);

        Text text = new Text();
        text.setContent(content);
        message.setText(text);

        //2.获取access_token:根据企业id和通讯录密钥获取access_token,并拼接请求url
        refreshToken refreshToken = new refreshToken();
        String accessToken = refreshToken.IsExistAccess_Token();
        System.out.println("accessToken:" + accessToken);

        //3.发送消息：调用业务类，发送消息
        SendMessageService sms = new SendMessageService();
        sms.sendMessage(accessToken, message);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",1);

        return jsonObject;
    }
}
