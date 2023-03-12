package com.fh.controller.finance.adminreim;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.appstaff.WXbusiManager;
import com.fh.service.appstaff.WXreimManager;
import com.fh.service.finance.reim.ReimdetService;
import com.fh.service.manage.busipj.BusiPJService;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping(value = "/adminreim")
public class AdminReimController extends BaseController {
    @Resource(name = "WXreimService")
    private WXreimManager wXreimManager;
    @Resource(name = "reimdetServiceImpl")
    private ReimdetService reimdetService;
    @Resource(name = "busiPJService")
    private BusiPJService busiPJService;

    @RequestMapping(value = "/findadminreim.do")
    public ModelAndView FindAllList() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = wXreimManager.findAdminReimAudit(pd);
        mv.addObject("cList", list);
        mv.setViewName("reim/adminreim/adminreim_list");
        return mv;
    }
    @RequestMapping(value = "/findadminreimbyid.do")
    public ModelAndView findadminreimbyid() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData obj = wXreimManager.findAdminReimAuditById(pd);
        List<PageData> getcsname = reimdetService.getcsname(pd);
        mv.addObject("obj", obj);
        mv.addObject("getcsname", getcsname);
        mv.addObject("pd", pd);
        mv.addObject("msg", "updatereimaudit");
        mv.setViewName("reim/adminreim/adminreim_edit");
        return mv;
    }
    @RequestMapping(value = "/updatereimaudit.do")
    public ModelAndView updatereimaudit() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        wXreimManager.updateAdminReimAudit(pd);
        mv.setViewName("reim/adminreim/adminreim_list");
        return mv;
    }

    @RequestMapping(value = "/deletereimauditbyid.do")
    public String deletereimauditbyid() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        wXreimManager.deleteAdminReimAudit(pd);
        String s="redirect:/adminreim/findadminreim.do";
        return s;
    }
    @RequestMapping(value = "/findadminlog.do")
    public ModelAndView findadminlog() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = wXreimManager.findAdminReimLog(pd);
        mv.addObject("cList", list);
        mv.addObject("pd", pd);
        mv.setViewName("reim/adminreim/adminreimlog_list");
        return mv;
    }

    @RequestMapping(value = "/findadminreimlogbyid.do")
    public ModelAndView findadminreimlogbyid() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData obj = wXreimManager.findAdminReimLogById(pd);
        Page page = new Page();
        List<PageData> alllistPage = busiPJService.findAlllistPage(page);
        mv.addObject("pjname", alllistPage);
        mv.addObject("obj", obj);
        mv.addObject("pd", pd);
        mv.addObject("msg", "updatereimauditlog");
        mv.setViewName("reim/adminreim/adminreimlog_edit");
        return mv;
    }
    @RequestMapping(value = "/updatereimauditlog.do")
    public ModelAndView updatereimauditlog() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        wXreimManager.updateAdminReimLog(pd);
        mv.setViewName("reim/adminreim/adminreimlog_list");
        return mv;
    }

    @RequestMapping(value = "/deletereimauditlogbyid.do")
    public String deletereimauditlogbyid() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        wXreimManager.deleteAdminReimLog(pd);
        String s="redirect:/adminreim/findadminlog.do";
        return s;
    }
}
