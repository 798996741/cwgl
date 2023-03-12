package com.fh.controller.manage.reimfy;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.pojo.tbreimfy;
import com.fh.service.manage.reimfy.ReimfyService;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/reimfy")
public class ReimfyController extends BaseController{

    @Resource
    private ReimfyService reimfyService;

    @RequestMapping(value = "/findReimfy.do")
    public ModelAndView findReimfy(Page page) throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");					//检索条件
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
            mv.addObject("keywords", keywords);
        }
        String reimfyid = null == pd.get("reimfyid")?"":pd.get("reimfyid").toString();
        if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
            reimfyid = pd.get("id").toString();
        }
        pd.put("reimfyid", reimfyid);					//上级ID
        page.setPd(pd);
        List<PageData> reimfy = reimfyService.list(page);
        System.out.println(keywords+"keywords");
        mv.addObject("rlist",reimfy);
        mv.addObject("pd",reimfyService.findReimfyById(pd));
        mv.addObject("reimfyid",reimfyid);
        mv.addObject("keywords",keywords);
        mv.setViewName("system/reimfy/reimfy_list");
        return mv;
    }

    /**
     * 显示列表ztree
     * @param model
     * @return
     */
    @RequestMapping(value="/listTree.do")
    public ModelAndView listTree(Model model, String reimfyid)throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
            JSONArray arr = JSONArray.fromObject(reimfyService.listTree("0",""));
            String json = arr.toString();
            json = json.replaceAll("reimfyid", "id").replaceAll("parentid", "pId").replaceAll("classname", "name").replaceAll("subtbreimfy", "nodes").replaceAll("hastbreimfy", "checked").replaceAll("treeurl", "url");
            System.out.println(json);
            model.addAttribute("zTreeNodes", json);
            mv.addObject("reimfyid",reimfyid);
            mv.addObject("pd", pd);
            mv.setViewName("system/reimfy/reimfy_tree");
        }catch (Exception e){
            logger.error(e.toString(), e);
        }

        return mv;
    }

    @RequestMapping(value = "/findReimfyById.do")
    public ModelAndView findReimfyById() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String reimfyid = pd.getString("reimfyid");
        pd = reimfyService.findReimfyById(pd);
        mv.addObject("pd", pd);
        pd.put("reimfyid",pd.get("parentid").toString());
        mv.addObject("pds", reimfyService.findReimfyById(pd));
        mv.addObject("reimfyid", pd.get("parentid").toString());
        pd.put("reimfyid",reimfyid);
        pd = reimfyService.findReimfyById(pd);
        mv.setViewName("system/reimfy/reimfy_edit");
        mv.addObject("msg","updateReimfy");
        return mv;
    }
    @RequestMapping(value = "/goAddC.do")
    public ModelAndView goAddC() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String reimfyid =pd.getString("reimfyid")==null?"0":pd.get("reimfyid").toString();
        System.out.println(reimfyid+"reimfyid");
        System.out.println(pd.get("reimfyid").toString()+"pd.get(\"reimfyid\").toString()");
        PageData pds = reimfyService.findReimfyById(pd);
        mv.addObject("pds", pds);
        mv.addObject("reimfyid", reimfyid);
        mv.setViewName("system/reimfy/reimfy_edit");
        mv.addObject("msg", "insertReimfy");
        return mv;
    }
    @RequestMapping(value = "/updateReimfy.do")
    public ModelAndView updateReimfy() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("username",Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("cztime",dateFormat.format(date));
        reimfyService.updateReimfy(pd);
        mv.addObject("msg","success");
        mv.setViewName("redirect:/reimfy/findReimfy.do");
        return mv;
    }

    @RequestMapping(value = "/insertReimfy.do")
    public ModelAndView insertReimfy() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("username", Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("cztime",dateFormat.format(date));
        pd.put("reimfyid", this.get32UUID());
        reimfyService.insertReimfy(pd);
        mv.addObject("msg","success");
        mv.setViewName("redirect:/reimfy/findReimfy.do");
        return mv;
    }

    @RequestMapping(value = "/deleteReimfy.do")
    @ResponseBody
    public Object deleteReimfy() throws Exception {
        Map<String,String> map = new HashMap<String,String>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String errInfo = "success";
        if (reimfyService.listByParentId(pd.getString("parentid")).size()>0){
            errInfo = "false";
        }else {
            reimfyService.deleteReimfy(pd);
        }
        map.put("result", errInfo);
        return AppUtil.returnObject(new PageData(), map);
    }

}
