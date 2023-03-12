package com.fh.controller.finance.busiapply;

import com.fh.controller.base.BaseController;
import com.fh.service.finance.busi.BusiapplyService;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/busiapply")
public class BusiApplyController extends BaseController {
    @Resource(name = "busiapplyServiceImpl")
    private BusiapplyService busiapplyService;

    @RequestMapping(value = "/findAllbusiList.do")
    public ModelAndView findAllbusiList() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = busiapplyService.FindAllList(pd);
        mv.addObject("list", list);
        mv.setViewName("reim/busiapply/busiapply_list");
        return mv;
    }

    @RequestMapping(value = "/findbusilogById.do")
    public ModelAndView findbusilogById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> list = busiapplyService.findlogById(pd);
        mv.addObject("list", list);
        mv.setViewName("reim/busiapply/busiapply_edit");
        return mv;
    }
}
