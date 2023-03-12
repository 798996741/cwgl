package com.fh.controller.appstaff;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.pojo.massage.send.Text;
import com.fh.pojo.massage.send.TextMessage;
import com.fh.pojo.massage.send.Textcard;
import com.fh.pojo.massage.send.TextcardMessage;
import com.fh.service.app.SendMessageService;
import com.fh.service.appstaff.WXbusiManager;
import com.fh.service.appstaff.WXreimManager;
import com.fh.service.appstaff.impl.WXreimService;
import com.fh.service.finance.reim.ReimdetService;
import com.fh.service.manage.busipj.BusiPJService;
import com.fh.util.PageData;
import com.fh.utils.WeiXinParamesUtil;
import com.fh.utils.WeiXinUtil;
import com.fh.utils.refreshToken;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/app_reim")
public class WXReimController extends BaseController {
    @Resource(name = "WXbusiservice")
    private WXbusiManager wXbusiManager;
    @Resource(name = "WXreimService")
    private WXreimManager wXreimManager;
    @Resource(name = "reimdetServiceImpl")
    private ReimdetService reimdetService;
    //关联出差申请信息
    @RequestMapping(value = "/relevanbusi.do")
    public ModelAndView relevanbusi() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String submitter1 = pd.getString("submitter");
        URLDecoder urlDecoder = new URLDecoder();
        String submitter = submitter1 == null ? "" : urlDecoder.decode(submitter1, "utf-8");
        pd.put("submitter",submitter);
        System.out.println(pd);
        List<PageData> getbusilogy = wXbusiManager.getbusilogy(pd);
        List<PageData> lastmonthbusi = wXreimManager.lastmonthbusi(pd);
        List<PageData> thismonthbusi = wXreimManager.thismonthbusi(pd);
        mv.setViewName("weixin/relelog");
        mv.addObject("msg", "submitter");
        mv.addObject("pd", pd);
        mv.addObject("alist", getbusilogy);
        mv.addObject("llist", lastmonthbusi);
        mv.addObject("tlist", thismonthbusi);
        return mv;
    }
    //关联出差申请
    @RequestMapping(value = "/putrelevanbusi.do")
    public ModelAndView putrelevanbusi() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = wXbusiManager.findbusilogById(pd);
        URLDecoder urlDecoder = new URLDecoder();
        String submitter1 = pd.getString("submitter");
        String submitter = submitter1 == null ? "" : urlDecoder.decode(submitter1, "utf-8");
        pd.put("submitter",submitter);
        String busi_code1 = pd.getString("busi_code");
        String busi_code = busi_code1 == null ? "" : urlDecoder.decode(busi_code1, "utf-8");
        pd.put("busi_code",busi_code);
        System.out.println(pd);
        pd.put("count",list.size());
        mv.setViewName("weixin/reimapply");
        mv.addObject("msg", "submitter");
        mv.addObject("list", list);
        mv.addObject("pd", pd);
        return mv;
    }
    //获取公司名称
    @RequestMapping(value = "/getcompany")
    @ResponseBody
    public JSONObject getcompany() throws Exception {
        PageData pd = new PageData();
        List<PageData> getcompany = wXreimManager.getcompany(pd);
        JSONObject json = new JSONObject();
        json.put("list", getcompany);
        System.out.println(json);
        return json;
    }
    //发起
    @RequestMapping(value = "/submit.do")
    public ModelAndView submit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);

        String uuid = this.get32UUID();
        pd.put("uid",uuid);
        String submitter = pd.getString("submitter");
        pd.put("reim_code",getauditno()+submitter);
        pd.put("submittime",getTime());
        String dept = pd.getString("dept");
        List<PageData> getisleader = wXbusiManager.getisleader(pd);
        ArrayList<String> senduserlist = new ArrayList<>();
        System.out.println("pd"+pd);
        for (PageData pageData : getisleader) {
            if (pageData.getString("department").contains("1")) {
                String manageraudit = pageData.getString("userid").trim();
                System.out.println(manageraudit);
                pd.put("managerauditor", manageraudit);
                pd.put("managersche", "0");
            }
        }
        for (PageData pageData : getisleader) {
            if (pageData.getString("department").contains("4")) {
                String manageraudit = pageData.getString("userid").trim();
                pd.put("deptauditor", manageraudit);
                pd.put("deptsche", "0");
            }
        }
        for (PageData pageData : getisleader) {
            if (pageData.getString("department").contains(dept)) {
                String supauditor = pageData.getString("userid").trim();
                pd.put("supauditor", supauditor);
                pd.put("supsche", "0");
                senduserlist.add(supauditor);
                //0.设置消息内容
                String title = "待办事宜";
                String description = "有一条报销申请待处理";
                String url = "http://luyin.ada-robotics.com:8449/cwgl/app_reim/supauditlist.do?supauditor="+supauditor+"&uid="+uuid;
                sendTextCard(title, description, url, supauditor);
            }
        }
        System.out.println("senduserlist:"+senduserlist);
        String s = senduserlist.toString().replace(" ", "");
        pd.put("supauditor", s.substring(1, s.length() - 1));
        wXreimManager.insertreimaudit(pd);
        int count = Integer.parseInt(pd.getString("count"));
        for (int i = 1; i <= count; i++) {
            PageData pageData = new PageData();
            pageData.put("busi_project", pd.getString("busi_project" + i));
            pageData.put("reason", pd.getString("reason" + i));
            pageData.put("trip_mode", pd.getString("trip_mode" + i));
            pageData.put("busi_startcity", pd.getString("busi_startcity" + i));
            pageData.put("busi_endcity", pd.getString("busi_endcity" + i));
            pageData.put("busi_starttime", pd.getString("busi_starttime" + i));
            pageData.put("busi_endtime", pd.getString("busi_endtime" + i));
            pageData.put("busi_time", pd.getString("busi_time" + i));
            pageData.put("billnum", pd.getString("billnum" + i));
            pageData.put("tripmon", pd.getString("tripmon" + i));
            pageData.put("hostelmon", pd.getString("hostelmon" + i));
            pageData.put("mission", pd.getString("mission" + i));
            pageData.put("realmon", pd.getString("realmon" + i));
            pageData.put("uid", uuid);
            wXreimManager.insertreimlog(pageData);
        }
        for (int i = 1; i <= count; i++) {
            PageData pageData = new PageData();
            pageData.put("date", getTime());
            pageData.put("time", getthisday());
            pageData.put("csname", pd.getString("company"));
            pageData.put("name", pd.getString("submitter"));
            pageData.put("filname", pd.getString("submitter"));
            pageData.put("reason", pd.getString("reason"+i));
            pageData.put("realmon", pd.getString("realmon"+i));
            pageData.put("billnum", pd.getString("billnum"+i));
            pageData.put("tripmon", pd.getString("tripmon"+i));
            pageData.put("hostelmon", pd.getString("hostelmon"+i));
            pageData.put("mission", pd.getString("mission"+i));
            pageData.put("uid", uuid);
            pageData.put("isaudit", "2");
            reimdetService.insertReimdet(pageData);

        }
        PageData pageData = new PageData();
        pageData.put("submitter",pd.getString("submitter"));
        pageData.put("uid",uuid);
        List<PageData> list = wXreimManager.subrecord(pageData);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("msg", "submitter");
        mv.addObject("list", list);


        return mv;
    }
    //提交后查看列表
    @RequestMapping(value = "/reimlog.do")
    public ModelAndView reimlog() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData pageData = new PageData();
        URLDecoder urlDecoder = new URLDecoder();
        String submitter1 = pd.getString("submitter");
        String submitter = submitter1 == null ? "" : urlDecoder.decode(submitter1, "utf-8");
        pageData.put("submitter",submitter);

        List<PageData> list = wXreimManager.subrecord(pageData);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("msg", "submitter");
        mv.addObject("list", list);
        return mv;
    }

    //发起提交跳转列表后的详细信息
    @RequestMapping(value = "/subdetails.do")
    public ModelAndView subdetails() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData reimaudit= wXreimManager.reimauditdetails(pd);
        List<PageData> reimlog = wXreimManager.reimlogdetails(pd);
        mv.setViewName("weixin/reimaudit");
        System.out.println(pd);
        System.out.println("执行了");
        mv.addObject("msg", "submitter");
        mv.addObject("reimaudit", reimaudit);
        mv.addObject("reimlog", reimlog);
       return mv;
    }
    //上级审核列表
    @RequestMapping(value = "/supauditlist.do")
    public ModelAndView supauditlist() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = wXreimManager.subrecord(pd);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("msg", "supauditor");
        mv.addObject("list", list);
        mv.addObject("pd", pd);
        return mv;
    }

    //上级审核详情
    @RequestMapping(value = "/supauditdetails.do")
    public ModelAndView supauditdetails() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData reimaudit= wXreimManager.reimauditdetails(pd);
        List<PageData> reimlog = wXreimManager.reimlogdetails(pd);
        System.out.println(reimaudit);
        System.out.println(reimlog);
        mv.setViewName("weixin/reimaudit");
        mv.addObject("msg", "supauditor");
        mv.addObject("reimaudit", reimaudit);
        mv.addObject("reimlog", reimlog);
        mv.addObject("pd", pd);
        return mv;
    }

    //上级审核是否通过
    @RequestMapping(value = "/supaudit.do")
    public ModelAndView supaudit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String sche = pd.getString("sche");
        pd.put("supauditime",getTime());
        pd.put("supsche",sche);

        String company1 = pd.getString("company");
        URLDecoder urlDecoder = new URLDecoder();
        String company = company1 == null ? "" : urlDecoder.decode(company1, "utf-8");
        String reject1 = pd.getString("reject");
        String reject = reject1 == null ? "" : urlDecoder.decode(reject1, "utf-8");
        wXreimManager.updatesupsche(pd);
        String deptauditor = pd.getString("deptauditor");
        String submitter = pd.getString("submitter");

        if (sche.equals("1")){
            String description = "有一条"+company+"的报销申请待处理";
            sendText(description,deptauditor);
        }else if (sche.equals("2")){
            String subuserid = pd.getString("subuserid");
            String description = "您的报销申请上级未通过，如需报销请继续提出申请！拒绝原因："+reject;
            sendText(description,subuserid);
        }
        PageData pageData = new PageData();
        pageData.put("supauditor",pd.getString("supauditor"));
        List<PageData> list = wXreimManager.subrecord(pageData);
        mv.addObject("msg", "supauditor");
        mv.addObject("list", list);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("pd", pd);
        return mv;
    }
    //总经理审核列表
    @RequestMapping(value = "/managerauditlist.do")
    public ModelAndView managerauditlist() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = wXreimManager.subrecord(pd);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("msg", "managerauditor");
        mv.addObject("list", list);
        mv.addObject("pd", pd);
        return mv;
    }
    //总经理审核详情
    @RequestMapping(value = "/managerdetails.do")
    public ModelAndView managerdetails() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData reimaudit= wXreimManager.reimauditdetails(pd);
        List<PageData> reimlog = wXreimManager.reimlogdetails(pd);
        mv.setViewName("weixin/reimaudit");
        mv.addObject("msg", "managerauditor");
        mv.addObject("reimaudit", reimaudit);
        mv.addObject("reimlog", reimlog);
        mv.addObject("pd", pd);
        return mv;
    }
    //总经理审核是否通过
    @RequestMapping(value = "/manageraudit.do")
    public ModelAndView manageraudit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String sche = pd.getString("sche");
        pd.put("managertime",getTime());
        pd.put("managersche",sche);
        String reject1 = pd.getString("reject");
        URLDecoder urlDecoder = new URLDecoder();
        String reject = reject1 == null ? "无" : urlDecoder.decode(reject1, "utf-8");
        wXreimManager.updatemanagersche(pd);
        String submitter = pd.getString("submitter");
        String subuserid = pd.getString("subuserid");
        if (sche.equals("1")){
            String description = "您的报销已通过！";
            sendText(description,subuserid);
            String id = pd.getString("id");
            PageData pd1 = new PageData();
            pd1.put("id",id);
            PageData findreimaudit = wXreimManager.findreimaudit(pd);
            PageData pd2 = new PageData();
            pd2.put("uid",findreimaudit.getString("uid"));
            List<PageData> findreimlog = wXreimManager.findreimlog(pd2);
            wXreimManager.insertAdminReimAudit(findreimaudit);
            for (PageData pageData : findreimlog) {
                wXreimManager.insertAdminReimLog(pageData);
            }
        }else if (sche.equals("2")){
            String description = "您的报销申请总经理未通过，如需报销请继续提出申请！拒绝原因："+reject;
            sendText(description,subuserid);
        }

        PageData pageData = new PageData();
        pageData.put("supauditor",pd.getString("supauditor"));
        List<PageData> list = wXreimManager.subrecord(pageData);
        mv.addObject("msg", "managerauditor");
        mv.addObject("list", list);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("pd", pd);
        return mv;
    }

    //菜单我的报销
    @RequestMapping(value = "/appreimlog.do")
    public ModelAndView appreimlog() throws Exception {
        System.out.println("执行了");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String submitter1 = pd.getString("submitter");
        URLDecoder urlDecoder = new URLDecoder();
        String submitter = submitter1 == null ? "" : urlDecoder.decode(submitter1, "utf-8");
        pd.put("submitter",submitter);
        System.out.println(submitter);
        System.out.println(pd);
        List<PageData> list = wXreimManager.subrecord(pd);
        mv.setViewName("weixin/myrelelog");
        mv.addObject("msg", "submitter");
        mv.addObject("list", list);

        return mv;
    }

    public void sendText(String content, String Touser) {
        //1.创建文本消息对象
        TextMessage message = new TextMessage();
        //1.1非必需
        message.setTouser(Touser);  //不区分大小写
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
    }

    public void sendTextCard(String title, String description, String url, String Touser) {

        //1.创建文本卡片消息对象
        TextcardMessage message = new TextcardMessage();
        //1.1非必需
        message.setTouser(Touser);  //不区分大小写
//                message.setTouser(senduserid);  //不区分大小写
        //message.setToparty("1");
        //message.setTotag(totag);
        //message.setSafe(0);

        //1.2必需
        message.setMsgtype("textcard");
        message.setAgentid(WeiXinParamesUtil.agentId);

        Textcard textcard = new Textcard();
        textcard.setTitle(title);
        textcard.setDescription(description);
        textcard.setUrl(url);
        message.setTextcard(textcard);

        //2.获取access_token:根据企业id和通讯录密钥获取access_token,并拼接请求url
        refreshToken refreshToken = new refreshToken();
        String accessToken = refreshToken.IsExistAccess_Token();
        System.out.println("accessToken:" + accessToken);

        //3.发送消息：调用业务类，发送消息
        SendMessageService sms = new SendMessageService();
        sms.sendMessage(accessToken, message);
    }

    public String getTime() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(date);
    }
    public String getthisday() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }


    public String getauditno() throws Exception {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String day = dateFormat.format(date);
        PageData pd = new PageData();
        pd.put("keywords", day);
        PageData maxAuditno = wXreimManager.getMaxAuditno(pd);
        String maxno = "";
        if (maxAuditno != null) {
            String maxauditno = maxAuditno.getString("maxauditno");
            int i = Integer.parseInt(maxauditno.substring(10, 13)) + 1;
            String code = i < 999 ? (i < 10 ? ("00" + i) : (i < 100 ? "0" + i : "" + i)) : "001";
            maxno = "BX" + day + code;
        } else {
            maxno = "BX" + day + "001";
        }
        return maxno;
    }
}
