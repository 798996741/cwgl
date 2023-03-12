package com.fh.controller.manage.busipj;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.manage.busipj.BusiPJService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/busiPJ")
public class BusiPJController extends BaseController {
    @Resource(name = "busiPJService")
    private BusiPJService busiPJService;

    @RequestMapping("/findAllList.do")
    public ModelAndView findAllList() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        Page page = new Page();
        page.setPd(pd);
        List<PageData> alllistPage = busiPJService.findAlllistPage(page);
        mv.addObject("pd",pd);
        mv.addObject("blist",alllistPage);
        mv.setViewName("system/busipj/busipj_list");
        return mv;
    }

    @RequestMapping(value = "/goAdd.do")
    public ModelAndView goAdd() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = this.getPageData();
        pd = this.getPageData();
        mv.setViewName("system/busipj/busipj_edit");
        mv.addObject("msg", "insertbusipj");
        return mv;
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = this.getPageData();
        pd = this.getPageData();
        PageData byId = busiPJService.findById(pd);
        mv.setViewName("system/busipj/busipj_edit");
        mv.addObject("msg", "updatebusipj");
        mv.addObject("list",byId);
        mv.addObject("pd",pd);
        return mv;
    }
    @RequestMapping("/deleteById.do")
    public ModelAndView deleteById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        busiPJService.deleteById(pd);
        mv.setViewName("redirect:/busiPJ/findAllList.do");
        return mv;
    }
    @RequestMapping(value = "/insertbusipj.do")
    public ModelAndView insertbusipj() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("czman",Jurisdiction.getUsername());
        pd.put("cztime",getTime());
        busiPJService.insertbusipj(pd);
        mv.setViewName("redirect:/busiPJ/findAllList.do");
        return mv;
    }
    @RequestMapping(value = "/updatebusipj.do")
    public ModelAndView updatebusipj() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("czman",Jurisdiction.getUsername());
        pd.put("cztime",getTime());
        busiPJService.updatebusipj(pd);
        mv.setViewName("redirect:/busiPJ/findAllList.do");
        return mv;
    }
    public String getTime(){
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return dateFormat.format(date);
    }
}
