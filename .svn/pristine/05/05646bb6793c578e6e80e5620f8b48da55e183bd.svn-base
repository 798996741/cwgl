package com.fh.controller.manage.pm;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.pojo.tbpm;
import com.fh.service.manage.pm.PMService;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/pm")
public class PMController extends BaseController {
    @Resource
    private PMService pmService;
    String redirect="redirect:/pm/findAllList.do";

    @RequestMapping(value = "/findAllList.do")
    public ModelAndView findAllList(){
        ModelAndView mv = this.getModelAndView();
        List<tbpm> pmList = pmService.findAllList();
        System.out.println(pmList);
        Page page = this.getPage();

        mv.setViewName("system/pm/pm_list");
        mv.addObject("pmList",pmList);
        return mv;
    }

    @RequestMapping(value = "/findPM.do")
    public ModelAndView findPM(tbpm pm){
        ModelAndView mv = this.getModelAndView();
        tbpm tbpm = pmService.findPM(pm);
        System.out.println(tbpm);
        mv.setViewName("system/pm/pm_edit");
        mv.addObject("tbpm",tbpm);
        mv.addObject("msg", "updatePM");
        return mv;
    }
    @RequestMapping(value = "/goAddC.do")
    public ModelAndView goAddC() throws Exception {

        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/pm/pm_edit");
        mv.addObject("msg", "insertPM");
        return mv;
    }

    @RequestMapping(value = "/deletePMById.do")
    public String deletePMById(tbpm tbpm){
        pmService.deletePMById(tbpm);
        return redirect;
    }

    @RequestMapping(value = "/updatePM.do")
    public String updatePM(tbpm tbpm){

        tbpm.setUsername(Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        tbpm.setCztime(dateFormat.format(date));
        pmService.updatePM(tbpm);
        System.out.println(tbpm);
        return redirect;
    }

    @RequestMapping(value = "/insertPM.do")
    public String insertPM(tbpm tbpm){

        tbpm.setUsername(Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        tbpm.setCztime(dateFormat.format(date));
        pmService.insertPM(tbpm);

        return redirect;
    }
    @RequestMapping(value = "/findPno")
    @ResponseBody
    public Object findPno(String pno) {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd.put("pno",pno);
        List<PageData> list = pmService.findPno(pd);
        System.out.println(pd);
        System.out.println(list);
        try {
            pd = this.getPageData();
            if (!list.isEmpty()) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }
}
