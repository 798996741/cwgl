package com.fh.controller.appstaff;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.pojo.massage.send.Text;
import com.fh.pojo.massage.send.TextMessage;
import com.fh.pojo.massage.send.Textcard;
import com.fh.pojo.massage.send.TextcardMessage;
import com.fh.service.app.Contacts_DepartmentService;
import com.fh.service.app.Contacts_UserService;
import com.fh.service.app.MTAuthorizationService;
import com.fh.service.app.SendMessageService;
import com.fh.service.appstaff.WXbusiManager;
import com.fh.service.manage.busipj.BusiPJService;
import com.fh.util.PageData;
import com.fh.utils.WeiXinParamesUtil;
import com.fh.utils.WeiXinUtil;
import com.fh.utils.refreshToken;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Array;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value = "/app_busi")
public class WXbusiController extends BaseController {

    @Resource(name = "WXbusiservice")
    private WXbusiManager wXbusiManager;
    @Resource(name = "busiPJService")
    private BusiPJService busiPJService;

    //上级审核详情信息
    @RequestMapping(value = "/findmanagerById.do")
    public ModelAndView findmanagerById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd + "pd");
        PageData busiaudit = wXbusiManager.findbusiauditById(pd);
        List<PageData> busilog = wXbusiManager.findbusilogById(pd);
        System.out.println(busiaudit + "busiaudit");
        System.out.println(busilog + "busilog");
        mv.setViewName("weixin/busiaudit");
        mv.addObject("busiaudit", busiaudit);
        mv.addObject("busilog", busilog);
        mv.addObject("pd", pd);
        mv.addObject("msg", "manager");
        return mv;
    }

    //总经理审核
    @RequestMapping(value = "/changemanagersche.do")
    public ModelAndView changemanagersche() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("cztime", getTime());
        pd.put("manageraudittime", getTime());
        wXbusiManager.updatemanagersche(pd);
        String subuserid = pd.getString("subuserid");
        String auditor = pd.getString("auditor");
        String busi_managersche = pd.getString("busi_managersche");
        String manageraudit = pd.getString("manageraudit");
        String reject1 = pd.getString("reject");
        URLDecoder urlDecoder = new URLDecoder();
        String reject = reject1 == null ? "无" : urlDecoder.decode(reject1, "utf-8");
        String content = "";
        if (busi_managersche.equals("1")) {
            content = "您的出差申请总经理已通过,祝您旅途愉快！";
            sendText(content, subuserid);
        }
        if (busi_managersche.equals("2")) {
            content = "您的出差申请总经理未通过,如需出差请继续提出申请！拒绝原因："+reject;
            sendText(content, subuserid);
        }
//        mv.setViewName("weixin/result");
        mv.setViewName("redirect:/app_busi/findBymanager.do?auditor=" + auditor + "&manageraudit=" + manageraudit);
        mv.addObject("pd", pd);
        return mv;
    }

    //总经理审核列表
    @RequestMapping(value = "/findBymanager.do")
    public ModelAndView findBymanager() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
//        pd.remove("auditor");
        List<PageData> getbusilogmanageraudity = wXbusiManager.getbusilogmanageraudity(pd);
        List<PageData> getbusilogmanagerauditn = wXbusiManager.getbusilogmanagerauditn(pd);

        mv.setViewName("weixin/busiauditlog");
        mv.addObject("pd", pd);
        mv.addObject("msg", "manager");
        mv.addObject("ylist", getbusilogmanageraudity);
        mv.addObject("nlist", getbusilogmanagerauditn);
        return mv;
    }

    //上级审核
    @RequestMapping(value = "/changesche.do")
    public ModelAndView changesche() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("cztime", getTime());
        pd.put("audittime", getTime());
        wXbusiManager.updatesche(pd);
        String subuserid = pd.getString("subuserid");
        String auditor = pd.getString("auditor");
        String busi_sche = pd.getString("busi_sche");
        String manageraudit = pd.getString("manageraudit");
        String reject1 = pd.getString("reject");
        URLDecoder urlDecoder = new URLDecoder();
        String reject = reject1 == null ? "" : urlDecoder.decode(reject1, "utf-8");
        String content = "";
        if (busi_sche.equals("1")) {
            content = "您的出差申请上级已通过，请等待总经理审批！";
            String title = "待办事宜";
            String description = "有一条出差申请待处理";
            String url = "http://luyin.ada-robotics.com:8449/cwgl/app_busi/findBymanager.do?manageraudit=" + manageraudit;
//            sendTextCard(title,description,url,manageraudit);
            sendTextCard(title, description, url, manageraudit);
        }
        if (busi_sche.equals("2")) {
            content = "您的出差申请上级未通过，如需出差请继续提出申请！拒绝原因："+reject;
            sendText(content, subuserid);
        }

//        mv.setViewName("weixin/result");
        mv.setViewName("redirect:/app_busi/findByauditor.do?auditor=" + auditor + "&manageraudit=" + manageraudit);
        mv.addObject("pd", pd);
        return mv;
    }


    //上级审核列表
    @RequestMapping(value = "/findByauditor.do")
    public ModelAndView findByauditor() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.remove("manageraudit");
        List<PageData> nlist = wXbusiManager.getbusilogauditorn(pd);
        List<PageData> ylist = wXbusiManager.getbusilogauditory(pd);
        mv.setViewName("weixin/busiauditlog");
        mv.addObject("nlist", nlist);
        mv.addObject("ylist", ylist);
        mv.addObject("msg", "auditor");
        mv.addObject("pd", pd);
        return mv;
    }

    //提交后查看详情
    @RequestMapping(value = "/findById.do")
    public ModelAndView findById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd + "pd");
        PageData busiaudit = wXbusiManager.findbusiauditById(pd);
        List<PageData> busilog = wXbusiManager.findbusilogById(pd);
        System.out.println(busiaudit + "busiaudit");
        System.out.println(busilog + "busilog");
        mv.setViewName("weixin/busiaudit");
        mv.addObject("busiaudit", busiaudit);
        mv.addObject("busilog", busilog);
        mv.addObject("msg", "submitter");

        mv.addObject("pd", pd);
        return mv;
    }

    //上级审核详情信息
    @RequestMapping(value = "/findauditById.do")
    public ModelAndView findauditById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd + "pd");
        PageData busiaudit = wXbusiManager.findbusiauditById(pd);
        List<PageData> busilog = wXbusiManager.findbusilogById(pd);
        System.out.println(busiaudit + "busiaudit");
        System.out.println(busilog + "busilog");
        mv.setViewName("weixin/busiaudit");
        mv.addObject("busiaudit", busiaudit);
        mv.addObject("busilog", busilog);
        mv.addObject("pd", pd);
        mv.addObject("msg", "auditor");
        return mv;
    }

    @RequestMapping(value = "/getbusipj")
    @ResponseBody
    public JSONObject getbusipj() throws Exception {
        Page page = new Page();
        List<PageData> alllistPage = busiPJService.findAlllistPage(page);
        JSONObject json = new JSONObject();
        json.put("list", alllistPage);
        System.out.println(json);

        return json;
    }


    @RequestMapping(value = "/submit.do")
    public ModelAndView submit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        String userid = pd.getString("userid");
        String dept = pd.getString("department");
        String uuid = this.get32UUID();
        pd.put("id", uuid);
        pd.put("busiauditid", uuid);
        pd.put("busi_code", getauditno() + pd.getString("submitter"));
        pd.put("busi_sche", "0");
        pd.put("cztime", getTime());
        pd.put("subtime", getTime());

        System.out.println("pd+++++++++++++++:" + pd);
        ArrayList<String> senduserlist = new ArrayList<>();

        List<PageData> getisleader = wXbusiManager.getisleader(pd);
        for (PageData pageData : getisleader) {
            if (pageData.getString("department").contains("1")) {
                String manageraudit = pageData.getString("userid").trim();
                System.out.println(manageraudit);
                pd.put("manageraudit", manageraudit);
                pd.put("busi_managersche", "0");
            }
        }
        for (PageData pageData : getisleader) {
            if (pageData.getString("department").contains(dept)) {
                String senduserid = pageData.getString("userid").trim();
                senduserlist.add(senduserid);
                String manageraudit = pd.getString("manageraudit");
                //0.设置消息内容
                String title = "待办事宜";
                String description = "有一条出差申请待处理";
                String url = "http://luyin.ada-robotics.com:8449/cwgl/app_busi/findByauditor.do?auditor=" + senduserid + "&manageraudit=" + manageraudit;
                sendTextCard(title, description, url, senduserid);
            }
        }
        String s = senduserlist.toString().replace(" ", "");
        System.out.println(s.substring(1, s.length() - 1));
        pd.put("auditor", s.substring(1, s.length() - 1));
        System.out.println("pd+++++++++++++++:" + pd);
        wXbusiManager.insertbusiaudit(pd);
        int count = Integer.parseInt(pd.getString("count"));
        for (int i = 1; i <= count; i++) {
            PageData pageData = new PageData();
            pageData.put("busi_project", pd.getString("busi_project" + i));
            pageData.put("reason", pd.getString("reason" + i));
            pageData.put("busi_startcity", pd.getString("busi_startcity" + i));
            pageData.put("busi_endcity", pd.getString("busi_endcity" + i));
            pageData.put("trip_mode", pd.getString("trip_mode" + i));
            pageData.put("busi_starttime", pd.getString("busi_starttime" + i));
            pageData.put("busi_endtime", pd.getString("busi_endtime" + i));
            pageData.put("busi_time", pd.getString("busi_time" + i));
            pageData.put("busiauditid", uuid);
            wXbusiManager.insertbusilog(pageData);
        }
        PageData pageData = new PageData();
        pageData.put("submitter", pd.getString("submitter"));
        List<PageData> getbusilogn = wXbusiManager.getbusilogn(pageData);
        List<PageData> getbusilogy = wXbusiManager.getbusilogy(pageData);

        mv.addObject("nlist", getbusilogn);
        mv.addObject("ylist", getbusilogy);
        mv.addObject("pd", pd);
        mv.setViewName("weixin/busiauditlog");
        mv.addObject("msg", "submitter");
        return mv;
    }

    //7.获取部门成员详情
    @RequestMapping(value = "/saveuser.do")
    public void testGetDepartmentUserDetails() throws Exception {
        //1.获取部门ID以及是否获取子部门成员
        String departmentId = "1";
        String fetchChild = "1";

        //2.获取accessToken:根据企业id和通讯录密钥获取access_token,并拼接请求url
        refreshToken refreshToken = new refreshToken();
        String accesstoken = refreshToken.IsExistAccess_Token();
        System.out.println("accessToken:" + accesstoken);

        //3.获取部门成员
        Contacts_UserService cus = new Contacts_UserService();
        JSONObject departmentUserDetails = cus.getDepartmentUserDetails(accesstoken, departmentId, fetchChild);

        JSONArray userlist = departmentUserDetails.getJSONArray("userlist");
        for (int i = 0; i < userlist.size(); i++) {
            JSONObject jsonObject = userlist.getJSONObject(i);
            PageData pageData = new PageData();
            pageData.put("userid", jsonObject.getString("userid"));
            pageData.put("name", jsonObject.getString("name"));
            pageData.put("department", jsonObject.getString("department"));
            pageData.put("position", jsonObject.getString("position"));
            pageData.put("mobile", jsonObject.getString("mobile"));
            pageData.put("gender", jsonObject.getString("gender"));
            pageData.put("email", jsonObject.getString("email"));
            pageData.put("avatar", jsonObject.getString("avatar"));
            pageData.put("status", jsonObject.getString("status"));
            pageData.put("enable", jsonObject.getString("enable"));
            pageData.put("isleader", jsonObject.getString("isleader"));
            pageData.put("hide_mobile", jsonObject.getString("hide_mobile"));
            pageData.put("english_name", jsonObject.getString("english_name"));
            pageData.put("telephone", jsonObject.getString("telephone"));
            pageData.put("order", jsonObject.getString("order"));
            pageData.put("qr_code", jsonObject.getString("qr_code"));
            pageData.put("alias", jsonObject.getString("alias"));
            pageData.put("is_leader_in_dept", jsonObject.getString("is_leader_in_dept"));
            pageData.put("thumb_avatar", jsonObject.getString("thumb_avatar"));
            System.out.println(pageData);
            wXbusiManager.insertwxuser(pageData);
        }

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

    public String getauditno() throws Exception {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String day = dateFormat.format(date);
        PageData pd = new PageData();
        pd.put("keywords", day);
        PageData maxAuditno = wXbusiManager.getMaxAuditno(pd);
        String maxno = "";
        if (maxAuditno != null) {
            String maxauditno = maxAuditno.getString("maxauditno");
            int i = Integer.parseInt(maxauditno.substring(10, 13)) + 1;
            String code = i < 999 ? (i < 10 ? ("00" + i) : (i < 100 ? "0" + i : "" + i)) : "001";
            maxno = "CC" + day + code;
        } else {
            maxno = "CC" + day + "001";
        }
        return maxno;
    }

    //提交后查看列表
    @RequestMapping(value = "/busilog.do")
    public ModelAndView busilog() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        String submitter1 = pd.getString("submitter");
        URLDecoder urlDecoder = new URLDecoder();
        String submitter = submitter1 == null ? "" : urlDecoder.decode(submitter1, "utf-8");
        pd.put("submitter",submitter);
        List<PageData> getbusilogn = wXbusiManager.getbusilogn(pd);
        List<PageData> getbusilogy = wXbusiManager.getbusilogy(pd);

        mv.addObject("nlist", getbusilogn);
        mv.addObject("ylist", getbusilogy);
        mv.addObject("pd", pd);
        mv.addObject("msg", "submitter");
//        mv.setViewName("weixin/busilog");
        mv.setViewName("weixin/busiauditlog");
        return mv;
    }

    //菜单我的出差
    @RequestMapping(value = "/appbusilog.do")
    public ModelAndView appbusilog() throws Exception {
        System.out.println("执行了");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
//        String code = pd.getString("code");
//        String state = pd.getString("state");
//        MTAuthorizationService mts = new MTAuthorizationService();
//        String accessToken = WeiXinUtil.getAccessToken(WeiXinParamesUtil.corpId, WeiXinParamesUtil.agentSecret).getToken();
//        //获取成员信息
//        JSONObject userInfo = new JSONObject();
//        System.out.println(userInfo);
//
//        userInfo = mts.getUserInfo(accessToken, code);
//        if (userInfo.has("UserId")){
//            String userId = userInfo.getString("UserId");
//            Contacts_UserService cus = new Contacts_UserService();
//            JSONObject userDetail = cus.getUser(accessToken, userId);
//            String name = userDetail.getString("name");
//            PageData pageData = new PageData();
//            pageData.put("userid", userId);
//            PageData findwxuserbyid = wXbusiManager.findwxuserbyid(pageData);
//            pd.put("submitter", findwxuserbyid.getString("name"));
        String submitter1 = pd.getString("submitter");
        URLDecoder urlDecoder = new URLDecoder();
        String submitter = submitter1 == null ? "" : urlDecoder.decode(submitter1, "utf-8");
        pd.put("submitter",submitter);
        System.out.println(submitter);
        System.out.println(pd);
            List<PageData> getbusilogn = wXbusiManager.getbusilogn(pd);
            List<PageData> getbusilogy = wXbusiManager.getbusilogy(pd);
            mv.addObject("nlist", getbusilogn);
            mv.addObject("ylist", getbusilogy);
//        }

        mv.addObject("pd", pd);
        mv.addObject("msg", "submitter");
        mv.setViewName("weixin/busiauditlog");
//        mv.setViewName("weixin/busiauditlog");
        return mv;
    }

}
